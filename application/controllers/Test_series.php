<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Test_series extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
        $this->load->model('pyp_model');
        $this->load->helper('url');
    }

    private function get_current_user_id()
    {
        $user_id = $this->session->userdata('user_id');
        if (!$user_id) {
            // Default to guest / admin user for seamless testing
            $user_id = 2;
        }
        return $user_id;
    }

    // 1. Test Series Portal Homepage
    public function index()
    {
        $data['categories'] = $this->pyp_model->get_categories();
        $data['exams'] = $this->pyp_model->get_exams();
        
        $selected_cat = $this->input->get('category');
        if ($selected_cat) {
            $cat_row = $this->db->get_where('pyp_categories', array('slug' => $selected_cat))->row_array();
            if ($cat_row) {
                $data['exams'] = $this->pyp_model->get_exams($cat_row['id']);
            }
        }

        // Fetch featured papers
        $this->db->select('p.*, e.title as exam_title, e.slug as exam_slug');
        $this->db->from('pyp_papers p');
        $this->db->join('pyp_exams e', 'e.id = p.exam_id');
        $this->db->where('p.status', 1);
        $this->db->order_by('p.id', 'ASC');
        $data['papers'] = $this->db->get()->result_array();

        $data['passes'] = $this->pyp_model->get_passes();
        $data['user_has_pass'] = $this->pyp_model->check_user_pass($this->get_current_user_id());
        $data['page_title'] = "Previous Year Papers (PYP) & CBT Mock Test Series | pyql.in";

        $this->load->view('frontend/default-new/pyp_portal', $data);
    }

    // 2. Exam Specific Papers List
    public function exam($slug)
    {
        $exam = $this->pyp_model->get_exam_by_slug($slug);
        if (!$exam) {
            redirect(site_url('test-series'));
        }

        $data['exam'] = $exam;
        $data['papers'] = $this->pyp_model->get_papers_by_exam($exam['id']);
        $data['user_has_pass'] = $this->pyp_model->check_user_pass($this->get_current_user_id());
        $data['page_title'] = $exam['title'] . " Previous Year Papers & Mock Tests | pyql.in";

        $this->load->view('frontend/default-new/pyp_exam_papers', $data);
    }

    // 3. Test Instructions Page
    public function instructions($paper_id)
    {
        $paper = $this->pyp_model->get_paper($paper_id);
        if (!$paper) {
            redirect(site_url('test-series'));
        }

        $exam = $this->db->get_where('pyp_exams', array('id' => $paper['exam_id']))->row_array();
        $user_id = $this->get_current_user_id();
        $user_has_pass = $this->pyp_model->check_user_pass($user_id);

        if (!$paper['is_free'] && !$user_has_pass) {
            $this->session->set_flashdata('error_message', 'This paper requires an active PYQL Pass.');
            redirect(site_url('pass'));
        }

        $data['paper'] = $paper;
        $data['exam'] = $exam;
        $data['sections'] = json_decode($paper['sections_json'], true) ?: array();
        $data['page_title'] = "Instructions - " . $paper['title'];

        $this->load->view('frontend/default-new/pyp_instructions', $data);
    }

    // 4. Start / Resume Exam Attempt
    public function start($paper_id)
    {
        $paper = $this->pyp_model->get_paper($paper_id);
        if (!$paper) {
            redirect(site_url('test-series'));
        }

        $user_id = $this->get_current_user_id();
        $user_has_pass = $this->pyp_model->check_user_pass($user_id);

        if (!$paper['is_free'] && !$user_has_pass) {
            redirect(site_url('pass'));
        }

        $attempt_id = $this->pyp_model->start_or_resume_attempt($paper['id'], $user_id);
        redirect(site_url('test-series/engine/' . $attempt_id));
    }

    // 5. Testbook CBT Exam Engine Interface
    public function engine($attempt_id)
    {
        $attempt = $this->pyp_model->get_attempt($attempt_id);
        if (!$attempt) {
            redirect(site_url('test-series'));
        }

        if ($attempt['status'] === 'SUBMITTED' || $attempt['status'] === 'EVALUATED') {
            redirect(site_url('test-series/scorecard/' . $attempt_id));
        }

        $paper_id = $attempt['paper_id'];
        $questions = $this->pyp_model->get_attempt_questions_and_responses($attempt_id, $paper_id);
        $sections = json_decode($attempt['sections_json'], true) ?: array();

        // Calculate elapsed time from attempt started_at
        $started_timestamp = strtotime($attempt['started_at']);
        $total_duration_sec = ((int)$attempt['duration_minutes']) * 60;
        $elapsed_sec = max(0, time() - $started_timestamp);
        $remaining_seconds = max(10, $total_duration_sec - $elapsed_sec);

        $data['attempt'] = $attempt;
        $data['sections'] = $sections;
        $data['questions'] = $questions;
        $data['remaining_seconds'] = $remaining_seconds;
        $data['page_title'] = "Exam: " . $attempt['paper_title'];

        $this->load->view('frontend/default-new/pyp_exam_engine', $data);
    }

    // 6. Live Autosave Response API (AJAX)
    public function save_response()
    {
        header('Content-Type: application/json');
        $attempt_id = (int)$this->input->post('attempt_id');
        $question_id = (int)$this->input->post('question_id');
        $status = $this->input->post('status') ?: 'ANSWERED';
        $time_spent = (int)$this->input->post('time_spent');

        $selected_options = $this->input->post('selected_options');
        if (is_string($selected_options)) {
            $decoded = json_decode($selected_options, true);
            if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                $selected_options = $decoded;
            } elseif (!empty($selected_options) && $selected_options !== '[]') {
                $selected_options = array($selected_options);
            } else {
                $selected_options = array();
            }
        } elseif (!is_array($selected_options)) {
            $selected_options = array();
        }

        $this->pyp_model->save_response($attempt_id, $question_id, $selected_options, $status, $time_spent);

        echo json_encode(array('success' => true));
        exit;
    }

    // 7. Submit Exam API (AJAX)
    public function submit_exam()
    {
        header('Content-Type: application/json');
        $attempt_id = (int)$this->input->post('attempt_id');
        if (!$attempt_id) {
            echo json_encode(array('success' => false, 'message' => 'Invalid attempt ID'));
            exit;
        }

        $success = $this->pyp_model->submit_and_evaluate_attempt($attempt_id);

        if ($success) {
            echo json_encode(array(
                'success' => true,
                'redirect_url' => site_url('test-series/scorecard/' . $attempt_id)
            ));
        } else {
            echo json_encode(array('success' => false, 'message' => 'Submission failed'));
        }
        exit;
    }

    // 8. Performance Scorecard & Analytics
    public function scorecard($attempt_id)
    {
        $attempt = $this->pyp_model->get_attempt($attempt_id);
        if (!$attempt) {
            redirect(site_url('test-series'));
        }

        // If still in progress, evaluate now
        if ($attempt['status'] === 'IN_PROGRESS') {
            $this->pyp_model->submit_and_evaluate_attempt($attempt_id);
            $attempt = $this->pyp_model->get_attempt($attempt_id);
        }

        $data['attempt'] = $attempt;
        $data['sectional_scores'] = json_decode($attempt['sectional_scores'], true) ?: array();
        
        // Total attempts for this paper
        $data['total_candidates'] = max(1, $this->db->where('paper_id', $attempt['paper_id'])->count_all_results('pyp_attempts'));
        $data['page_title'] = "Scorecard: " . $attempt['paper_title'];

        $this->load->view('frontend/default-new/pyp_scorecard', $data);
    }

    // 9. Step-by-Step Solutions View
    public function solutions($attempt_id)
    {
        $sol_data = $this->pyp_model->get_solutions_data($attempt_id);
        if (!$sol_data) {
            redirect(site_url('test-series'));
        }

        $data['attempt'] = $sol_data['attempt'];
        $data['questions'] = $sol_data['questions'];
        $data['sections'] = json_decode($sol_data['attempt']['sections_json'], true) ?: array();
        $data['page_title'] = "Detailed Solutions: " . $sol_data['attempt']['paper_title'];

        $this->load->view('frontend/default-new/pyp_solutions', $data);
    }

    // 10. PYQL Pass Monetization Page
    public function pass()
    {
        $data['passes'] = $this->pyp_model->get_passes();
        $data['user_has_pass'] = $this->pyp_model->check_user_pass($this->get_current_user_id());
        $data['page_title'] = "PYQL Pass - Unlock All Previous Year Papers & Mock Tests";

        $this->load->view('frontend/default-new/pyp_pass', $data);
    }

    // 11. 1-Click Trial Pass Activation for testing
    public function activate_trial($pass_id = 1)
    {
        $user_id = $this->get_current_user_id();
        $this->pyp_model->activate_pass($user_id, $pass_id, 'TRIAL_' . time(), 'FREE_PROMO');
        $this->session->set_flashdata('flash_message', 'PYQL Pass activated successfully!');
        redirect(site_url('test-series'));
    }
}
