<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pyp_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    // Categories
    public function get_categories()
    {
        $this->db->where('status', 1);
        $this->db->order_by('order_index', 'ASC');
        return $this->db->get('pyp_categories')->result_array();
    }

    // Exams
    public function get_exams($category_id = null)
    {
        $this->db->where('status', 1);
        if ($category_id) {
            $this->db->where('category_id', $category_id);
        }
        $this->db->order_by('id', 'ASC');
        return $this->db->get('pyp_exams')->result_array();
    }

    public function get_exam_by_slug($slug)
    {
        return $this->db->get_where('pyp_exams', array('slug' => $slug, 'status' => 1))->row_array();
    }

    // Papers
    public function get_papers_by_exam($exam_id)
    {
        $this->db->where('exam_id', $exam_id);
        $this->db->where('status', 1);
        $this->db->order_by('year', 'DESC');
        $this->db->order_by('id', 'DESC');
        return $this->db->get('pyp_papers')->result_array();
    }

    public function get_paper($paper_id)
    {
        return $this->db->get_where('pyp_papers', array('id' => $paper_id, 'status' => 1))->row_array();
    }

    public function get_paper_by_slug($slug)
    {
        return $this->db->get_where('pyp_papers', array('slug' => $slug, 'status' => 1))->row_array();
    }

    // Pass verification
    public function check_user_pass($user_id)
    {
        if (!$user_id) return false;
        $this->db->where('user_id', $user_id);
        $this->db->where('status', 'ACTIVE');
        $this->db->where('expires_at >=', date('Y-m-d H:i:s'));
        $query = $this->db->get('pyp_user_passes');
        return ($query->num_rows() > 0);
    }

    public function get_passes()
    {
        $this->db->where('status', 1);
        $this->db->order_by('selling_price_inr', 'ASC');
        return $this->db->get('pyp_passes')->result_array();
    }

    public function get_pass_by_id($pass_id)
    {
        return $this->db->get_where('pyp_passes', array('id' => $pass_id, 'status' => 1))->row_array();
    }

    public function activate_pass($user_id, $pass_id, $payment_id = 'FREE_TRIAL', $gateway = 'RAZORPAY')
    {
        $pass = $this->get_pass_by_id($pass_id);
        if (!$pass) return false;

        $duration_days = (int) $pass['duration_days'];
        $starts_at = date('Y-m-d H:i:s');
        $expires_at = date('Y-m-d H:i:s', strtotime("+{$duration_days} days"));

        $data = array(
            'user_id' => $user_id,
            'pass_id' => $pass_id,
            'payment_id' => $payment_id,
            'gateway' => $gateway,
            'starts_at' => $starts_at,
            'expires_at' => $expires_at,
            'status' => 'ACTIVE'
        );

        $this->db->insert('pyp_user_passes', $data);
        return $this->db->insert_id();
    }

    // Attempt Management
    public function start_or_resume_attempt($paper_id, $user_id)
    {
        // Check for existing in-progress attempt
        $this->db->where('user_id', $user_id);
        $this->db->where('paper_id', $paper_id);
        $this->db->where('status', 'IN_PROGRESS');
        $existing = $this->db->get('pyp_attempts')->row_array();

        if ($existing) {
            return $existing['id'];
        }

        // Create new attempt
        $attempt_data = array(
            'user_id' => $user_id,
            'paper_id' => $paper_id,
            'started_at' => date('Y-m-d H:i:s'),
            'status' => 'IN_PROGRESS'
        );
        $this->db->insert('pyp_attempts', $attempt_data);
        $attempt_id = $this->db->insert_id();

        // Initialize question responses
        $questions = $this->db->get_where('pyp_questions', array('paper_id' => $paper_id))->result_array();
        $is_first = true;
        foreach ($questions as $q) {
            $resp_data = array(
                'attempt_id' => $attempt_id,
                'question_id' => $q['id'],
                'selected_options' => '[]',
                'status' => $is_first ? 'UNANSWERED' : 'NOT_VISITED',
                'time_spent_seconds' => 0
            );
            $this->db->insert('pyp_attempt_responses', $resp_data);
            $is_first = false;
        }

        return $attempt_id;
    }

    public function get_attempt($attempt_id)
    {
        $this->db->select('a.*, p.title as paper_title, p.duration_minutes, p.total_marks, p.positive_marks, p.negative_marks, p.sections_json, e.title as exam_title');
        $this->db->from('pyp_attempts a');
        $this->db->join('pyp_papers p', 'p.id = a.paper_id');
        $this->db->join('pyp_exams e', 'e.id = p.exam_id');
        $this->db->where('a.id', $attempt_id);
        return $this->db->get()->row_array();
    }

    public function get_attempt_questions_and_responses($attempt_id, $paper_id)
    {
        $this->db->select('q.*, r.selected_options, r.status as response_status, r.time_spent_seconds');
        $this->db->from('pyp_questions q');
        $this->db->join('pyp_attempt_responses r', "r.question_id = q.id AND r.attempt_id = {$attempt_id}", 'left');
        $this->db->where('q.paper_id', $paper_id);
        $this->db->order_by('q.order_index', 'ASC');
        $rows = $this->db->get()->result_array();

        // Format options and parse JSON
        foreach ($rows as &$r) {
            $r['options_en'] = json_decode($r['options_en'], true) ?: array();
            $r['options_hi'] = json_decode($r['options_hi'], true) ?: $r['options_en'];
            $r['selected_options'] = json_decode($r['selected_options'], true) ?: array();
            if (empty($r['response_status'])) {
                $r['response_status'] = 'NOT_VISITED';
            }
        }
        return $rows;
    }

    // Save Live Question Response
    public function save_response($attempt_id, $question_id, $selected_options = array(), $status = 'ANSWERED', $time_spent = 0)
    {
        $json_selected = json_encode(array_values((array)$selected_options));

        $this->db->where('attempt_id', $attempt_id);
        $this->db->where('question_id', $question_id);
        $exists = $this->db->get('pyp_attempt_responses')->row_array();

        if ($exists) {
            $this->db->where('id', $exists['id']);
            $this->db->update('pyp_attempt_responses', array(
                'selected_options' => $json_selected,
                'status' => $status,
                'time_spent_seconds' => $time_spent
            ));
        } else {
            $this->db->insert('pyp_attempt_responses', array(
                'attempt_id' => $attempt_id,
                'question_id' => $question_id,
                'selected_options' => $json_selected,
                'status' => $status,
                'time_spent_seconds' => $time_spent
            ));
        }
        return true;
    }

    // Final Submission & Evaluation Engine
    public function submit_and_evaluate_attempt($attempt_id)
    {
        $attempt = $this->get_attempt($attempt_id);
        if (!$attempt) return false;

        $paper_id = $attempt['paper_id'];
        $sections = json_decode($attempt['sections_json'], true) ?: array();

        // Fetch all questions and responses
        $this->db->select('q.*, r.id as resp_id, r.selected_options, r.time_spent_seconds');
        $this->db->from('pyp_questions q');
        $this->db->join('pyp_attempt_responses r', "r.question_id = q.id AND r.attempt_id = {$attempt_id}", 'inner');
        $this->db->where('q.paper_id', $paper_id);
        $questions = $this->db->get()->result_array();

        $total_score = 0.00;
        $correct_count = 0;
        $incorrect_count = 0;
        $unattempted_count = 0;
        $total_time = 0;

        $sectional_breakdown = array();
        foreach ($sections as $s) {
            $sectional_breakdown[$s['id']] = array(
                'section_id' => $s['id'],
                'section_name' => $s['name'],
                'total_questions' => 0,
                'attempted' => 0,
                'correct' => 0,
                'incorrect' => 0,
                'unattempted' => 0,
                'score' => 0.00,
                'max_score' => 0.00,
                'accuracy' => 0.00
            );
        }

        foreach ($questions as $q) {
            $sec_id = $q['section_id'];
            if (!isset($sectional_breakdown[$sec_id])) {
                $sectional_breakdown[$sec_id] = array(
                    'section_id' => $sec_id,
                    'section_name' => $sec_id,
                    'total_questions' => 0,
                    'attempted' => 0,
                    'correct' => 0,
                    'incorrect' => 0,
                    'unattempted' => 0,
                    'score' => 0.00,
                    'max_score' => 0.00,
                    'accuracy' => 0.00
                );
            }

            $sectional_breakdown[$sec_id]['total_questions']++;
            $sectional_breakdown[$sec_id]['max_score'] += (float)$q['positive_marks'];

            $user_sel = json_decode($q['selected_options'], true) ?: array();
            $time_spent = (int)$q['time_spent_seconds'];
            $total_time += $time_spent;

            $correct_opts = array_filter(array_map('trim', explode(',', $q['correct_options'])));

            if (empty($user_sel)) {
                // Unattempted
                $unattempted_count++;
                $sectional_breakdown[$sec_id]['unattempted']++;
                $this->db->where('id', $q['resp_id'])->update('pyp_attempt_responses', array(
                    'is_correct' => null,
                    'marks_awarded' => 0.00
                ));
            } else {
                $sectional_breakdown[$sec_id]['attempted']++;
                // Check if user answer matches correct
                sort($user_sel);
                sort($correct_opts);
                if ($user_sel == $correct_opts) {
                    // Correct
                    $correct_count++;
                    $marks = (float)$q['positive_marks'];
                    $total_score += $marks;

                    $sectional_breakdown[$sec_id]['correct']++;
                    $sectional_breakdown[$sec_id]['score'] += $marks;

                    $this->db->where('id', $q['resp_id'])->update('pyp_attempt_responses', array(
                        'is_correct' => 1,
                        'marks_awarded' => $marks
                    ));
                } else {
                    // Incorrect
                    $incorrect_count++;
                    $penalty = (float)$q['negative_marks'];
                    $total_score -= $penalty;

                    $sectional_breakdown[$sec_id]['incorrect']++;
                    $sectional_breakdown[$sec_id]['score'] -= $penalty;

                    $this->db->where('id', $q['resp_id'])->update('pyp_attempt_responses', array(
                        'is_correct' => 0,
                        'marks_awarded' => -$penalty
                    ));
                }
            }
        }

        // Calculate overall accuracy
        $attempted_total = $correct_count + $incorrect_count;
        $accuracy = ($attempted_total > 0) ? round(($correct_count / $attempted_total) * 100, 2) : 0.00;

        // Calculate sectional accuracy
        foreach ($sectional_breakdown as &$sec) {
            $sec_attempted = $sec['correct'] + $sec['incorrect'];
            $sec['accuracy'] = ($sec_attempted > 0) ? round(($sec['correct'] / $sec_attempted) * 100, 2) : 0.00;
        }

        // Compute Rank and Percentile across all completed attempts for this paper
        $all_attempts_count = $this->db->where('paper_id', $paper_id)->where('status !=', 'IN_PROGRESS')->count_all_results('pyp_attempts');
        $higher_scores = $this->db->where('paper_id', $paper_id)
                                  ->where('status !=', 'IN_PROGRESS')
                                  ->where('score_obtained >', $total_score)
                                  ->count_all_results('pyp_attempts');

        $rank = $higher_scores + 1;
        $total_pool = max($all_attempts_count + 1, 1);
        $percentile = round((($total_pool - $rank + 1) / $total_pool) * 100, 2);

        // Update attempt record
        $update_data = array(
            'submitted_at' => date('Y-m-d H:i:s'),
            'time_taken_seconds' => $total_time,
            'score_obtained' => $total_score,
            'correct_count' => $correct_count,
            'incorrect_count' => $incorrect_count,
            'unattempted_count' => $unattempted_count,
            'accuracy_percentage' => $accuracy,
            'all_india_rank' => $rank,
            'percentile' => $percentile,
            'sectional_scores' => json_encode(array_values($sectional_breakdown)),
            'status' => 'SUBMITTED'
        );

        $this->db->where('id', $attempt_id)->update('pyp_attempts', $update_data);
        return true;
    }

    // Solutions View Data
    public function get_solutions_data($attempt_id)
    {
        $attempt = $this->get_attempt($attempt_id);
        if (!$attempt) return null;

        $paper_id = $attempt['paper_id'];
        $this->db->select('q.*, r.selected_options, r.is_correct, r.marks_awarded, r.time_spent_seconds, r.status as response_status');
        $this->db->from('pyp_questions q');
        $this->db->join('pyp_attempt_responses r', "r.question_id = q.id AND r.attempt_id = {$attempt_id}", 'left');
        $this->db->where('q.paper_id', $paper_id);
        $this->db->order_by('q.order_index', 'ASC');
        $questions = $this->db->get()->result_array();

        foreach ($questions as &$q) {
            $q['options_en'] = json_decode($q['options_en'], true) ?: array();
            $q['options_hi'] = json_decode($q['options_hi'], true) ?: $q['options_en'];
            $q['selected_options'] = json_decode($q['selected_options'], true) ?: array();
            $q['correct_options_arr'] = array_filter(array_map('trim', explode(',', $q['correct_options'])));
        }

        return array(
            'attempt' => $attempt,
            'questions' => $questions
        );
    }

    // ==========================================
    // ADMIN MANAGEMENT & BULK IMPORTER METHODS
    // ==========================================

    public function get_all_papers()
    {
        $this->db->select('p.*, e.title as exam_title');
        $this->db->from('pyp_papers p');
        $this->db->join('pyp_exams e', 'e.id = p.exam_id', 'left');
        $this->db->order_by('p.id', 'DESC');
        return $this->db->get()->result_array();
    }

    public function create_paper($data)
    {
        $this->db->insert('pyp_papers', $data);
        return $this->db->insert_id();
    }

    public function update_paper($id, $data)
    {
        $this->db->where('id', $id);
        return $this->db->update('pyp_papers', $data);
    }

    public function delete_paper($id)
    {
        // Delete related questions and attempts
        $this->db->where('paper_id', $id)->delete('pyp_questions');
        $this->db->where('paper_id', $id)->delete('pyp_attempts');
        $this->db->where('id', $id)->delete('pyp_papers');
        return true;
    }

    public function get_question($id)
    {
        $q = $this->db->get_where('pyp_questions', array('id' => $id))->row_array();
        if ($q) {
            $q['options_en'] = json_decode($q['options_en'], true) ?: array();
            $q['options_hi'] = json_decode($q['options_hi'], true) ?: array();
        }
        return $q;
    }

    public function create_question($data)
    {
        $this->db->insert('pyp_questions', $data);
        $insert_id = $this->db->insert_id();
        $this->sync_paper_meta($data['paper_id']);
        return $insert_id;
    }

    public function update_question($id, $data)
    {
        $this->db->where('id', $id)->update('pyp_questions', $data);
        if (isset($data['paper_id'])) {
            $this->sync_paper_meta($data['paper_id']);
        }
        return true;
    }

    public function delete_question($id)
    {
        $q = $this->db->get_where('pyp_questions', array('id' => $id))->row_array();
        if ($q) {
            $this->db->where('id', $id)->delete('pyp_questions');
            $this->sync_paper_meta($q['paper_id']);
        }
        return true;
    }

    public function sync_paper_meta($paper_id)
    {
        $total_q = $this->db->where('paper_id', $paper_id)->count_all_results('pyp_questions');
        $sum_marks = $this->db->select_sum('positive_marks')->where('paper_id', $paper_id)->get('pyp_questions')->row()->positive_marks;
        $this->db->where('id', $paper_id)->update('pyp_papers', array(
            'total_questions' => $total_q,
            'total_marks' => $sum_marks ?: 0.00
        ));
    }

    public function batch_import_questions($paper_id, $questions)
    {
        if (empty($questions) || !is_array($questions)) return 0;

        $inserted_count = 0;
        $current_order = $this->db->where('paper_id', $paper_id)->count_all_results('pyp_questions');

        foreach ($questions as $q) {
            $current_order++;

            // Format Options En
            $options_en = $q['options_en'] ?? array();
            if (is_string($options_en)) {
                $decoded = json_decode($options_en, true);
                $options_en = (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) ? $decoded : array();
            }

            // Format Options Hi
            $options_hi = $q['options_hi'] ?? array();
            if (is_string($options_hi)) {
                $decoded = json_decode($options_hi, true);
                $options_hi = (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) ? $decoded : $options_en;
            }

            $insert_data = array(
                'paper_id' => $paper_id,
                'section_id' => $q['section_id'] ?? 'sec_reasoning',
                'question_type' => $q['question_type'] ?? 'MCQ',
                'question_en' => $q['question_en'] ?? '',
                'question_hi' => $q['question_hi'] ?? null,
                'options_en' => json_encode($options_en),
                'options_hi' => !empty($options_hi) ? json_encode($options_hi) : null,
                'correct_options' => $q['correct_options'] ?? 'opt_1',
                'solution_en' => $q['solution_en'] ?? null,
                'solution_hi' => $q['solution_hi'] ?? null,
                'positive_marks' => isset($q['positive_marks']) ? (float)$q['positive_marks'] : 2.00,
                'negative_marks' => isset($q['negative_marks']) ? (float)$q['negative_marks'] : 0.50,
                'difficulty' => $q['difficulty'] ?? 'MEDIUM',
                'order_index' => $current_order
            );

            if (!empty($insert_data['question_en'])) {
                $this->db->insert('pyp_questions', $insert_data);
                $inserted_count++;
            }
        }

        $this->sync_paper_meta($paper_id);
        return $inserted_count;
    }
}

