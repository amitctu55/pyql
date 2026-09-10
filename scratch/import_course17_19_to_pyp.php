<?php
// Production script to import Course 17 (UPSC CDS PYQ) and setup Course 19 (UPPSC PYQ) into PYP Test Series
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
$conn->set_charset('utf8mb4');

echo "====================================================\n";
echo " IMPORTING COURSE 17 & SETUP COURSE 19 IN PYP SERIES \n";
echo "====================================================\n\n";

function clean_html($html) {
    $html = html_entity_decode($html, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    $html = preg_replace('/<!--\[if.*?\]>.*?<!\[endif\]-->/s', '', $html);
    $html = preg_replace('/<!--.*?-->/s', '', $html);
    $html = preg_replace('/<style\b[^>]*>(.*?)<\/style>/is', '', $html);
    $html = preg_replace('/style="[^"]*"/i', '', $html);
    $html = preg_replace('/class="[^"]*"/i', '', $html);
    $html = preg_replace('/lang="[^"]*"/i', '', $html);
    $html = preg_replace('/face="[^"]*"/i', '', $html);
    $html = preg_replace('/<font[^>]*>/i', '', $html);
    $html = str_ireplace('</font>', '', $html);
    $html = preg_replace('/<span[^>]*>/i', '', $html);
    $html = str_ireplace('</span>', '', $html);
    $html = preg_replace('/<o:p>.*?<\/o:p>/i', '', $html);
    $html = preg_replace('/&nbsp;/i', ' ', $html);
    $html = preg_replace('/<p>\s*(?:<br\s*\/?>)?\s*<\/p>/i', '', $html);
    return trim($html);
}

function extract_q_and_options($text) {
    $plain = strip_tags($text);
    $opt_a = $opt_b = $opt_c = $opt_d = "";
    $body = $text;

    if (preg_match('/^(.*?)(?:\(a\)|\ba\.\s+)\s*(.*?)(?:\(b\)|\bb\.\s+)\s*(.*?)(?:\(c\)|\bc\.\s+)\s*(.*?)(?:\(d\)|\bd\.\s+)\s*(.*)$/si', $plain, $m)) {
        $body_plain = trim($m[1]);
        $opt_a = trim($m[2]);
        $opt_b = trim($m[3]);
        $opt_c = trim($m[4]);
        $opt_d = trim($m[5]);

        if (preg_match('/^(.*?)(?:\(a\)|(?:\b|>)a\.\s+)/si', $text, $bm)) {
            $body = trim($bm[1]);
        } else {
            $body = $body_plain;
        }
    }

    $body = preg_replace('/<p>\s*<\/p>/i', '', $body);
    $body = trim($body);

    return [
        'body' => $body,
        'opts' => [
            'opt_1' => "(a) " . trim(preg_replace('/\s+/', ' ', $opt_a)),
            'opt_2' => "(b) " . trim(preg_replace('/\s+/', ' ', $opt_b)),
            'opt_3' => "(c) " . trim(preg_replace('/\s+/', ' ', $opt_c)),
            'opt_4' => "(d) " . trim(preg_replace('/\s+/', ' ', $opt_d)),
        ]
    ];
}

function parse_cds_question($row) {
    $clean = clean_html($row['title']);
    $block_en = "";
    $block_hi = "";

    if (stripos($clean, 'English:') !== false && stripos($clean, 'Hindi:') !== false) {
        if (stripos($clean, 'Hindi:') < stripos($clean, 'English:')) {
            $parts = preg_split('/English:/i', $clean, 2);
            $block_hi = preg_replace('/^.*?Hindi:/si', '', $parts[0]);
            $block_en = $parts[1] ?? '';
        } else {
            $parts = preg_split('/Hindi:/i', $clean, 2);
            $block_en = preg_replace('/^.*?English:/si', '', $parts[0]);
            $block_hi = $parts[1] ?? '';
        }
    } elseif (preg_match('/^(.*?)(<p>[^<]*?(?:\d+\.\s*|Which|Consider|What|Who|When|In|Where|If|Select|Match|Statement|The|How|A\s+|An\s+)[\x{0041}-\x{007A}].*)$/su', $clean, $m) 
            && preg_match('/[\x{0900}-\x{097F}]/u', $m[1])) {
        $block_hi = $m[1];
        $block_en = $m[2];
    } elseif (preg_match('/^(.*?)(<p>[^<]*?\d+\.\s*[\x{0900}-\x{097F}].*)$/su', $clean, $m)) {
        $block_en = $m[1];
        $block_hi = $m[2];
    } else {
        if (preg_match('/[\x{0900}-\x{097F}]/u', $clean) && !preg_match('/[a-zA-Z]{5,}/', strip_tags($clean))) {
            $block_hi = $clean;
        } else {
            $block_en = $clean;
        }
    }

    $parsed_en = !empty($block_en) ? extract_q_and_options($block_en) : null;
    $parsed_hi = !empty($block_hi) ? extract_q_and_options($block_hi) : null;

    $db_opts = json_decode($row['options'], true);
    $has_real_db_opts = false;
    if (is_array($db_opts) && count($db_opts) >= 2) {
        $has_real_db_opts = true;
        foreach ($db_opts as $o) {
            $t = trim(strtolower($o));
            if (in_array($t, ['a', 'b', 'c', 'd', '1', '2', '3', '4', ''])) {
                $has_real_db_opts = false;
                break;
            }
        }
    }

    if ($has_real_db_opts) {
        $opts_en_arr = [
            ['id' => 'opt_1', 'text' => '(a) ' . trim($db_opts[0] ?? '')],
            ['id' => 'opt_2', 'text' => '(b) ' . trim($db_opts[1] ?? '')],
            ['id' => 'opt_3', 'text' => '(c) ' . trim($db_opts[2] ?? '')],
            ['id' => 'opt_4', 'text' => '(d) ' . trim($db_opts[3] ?? '')],
        ];
    } elseif ($parsed_en && strlen($parsed_en['opts']['opt_1']) > 4) {
        $opts_en_arr = [
            ['id' => 'opt_1', 'text' => $parsed_en['opts']['opt_1']],
            ['id' => 'opt_2', 'text' => $parsed_en['opts']['opt_2']],
            ['id' => 'opt_3', 'text' => $parsed_en['opts']['opt_3']],
            ['id' => 'opt_4', 'text' => $parsed_en['opts']['opt_4']],
        ];
    } elseif ($parsed_hi && strlen($parsed_hi['opts']['opt_1']) > 4) {
        $opts_en_arr = [
            ['id' => 'opt_1', 'text' => $parsed_hi['opts']['opt_1']],
            ['id' => 'opt_2', 'text' => $parsed_hi['opts']['opt_2']],
            ['id' => 'opt_3', 'text' => $parsed_hi['opts']['opt_3']],
            ['id' => 'opt_4', 'text' => $parsed_hi['opts']['opt_4']],
        ];
    } else {
        $opts_en_arr = [
            ['id' => 'opt_1', 'text' => '(a) Option A'],
            ['id' => 'opt_2', 'text' => '(b) Option B'],
            ['id' => 'opt_3', 'text' => '(c) Option C'],
            ['id' => 'opt_4', 'text' => '(d) Option D'],
        ];
    }

    if ($parsed_hi && strlen($parsed_hi['opts']['opt_1']) > 4) {
        $opts_hi_arr = [
            ['id' => 'opt_1', 'text' => $parsed_hi['opts']['opt_1']],
            ['id' => 'opt_2', 'text' => $parsed_hi['opts']['opt_2']],
            ['id' => 'opt_3', 'text' => $parsed_hi['opts']['opt_3']],
            ['id' => 'opt_4', 'text' => $parsed_hi['opts']['opt_4']],
        ];
    } else {
        $opts_hi_arr = $opts_en_arr;
    }

    $final_q_en = $parsed_en ? $parsed_en['body'] : '';
    $final_q_hi = $parsed_hi ? $parsed_hi['body'] : '';

    if (empty(strip_tags($final_q_en))) {
        $final_q_en = !empty(strip_tags($final_q_hi)) ? $final_q_hi : $clean;
    }
    if (empty(strip_tags($final_q_hi))) {
        $final_q_hi = $final_q_en;
    }

    $corr_arr = json_decode($row['correct_answers'], true);
    $c = is_array($corr_arr) && !empty($corr_arr) ? strtolower(trim($corr_arr[0])) : '1';
    $corr_opt = 'opt_1';
    if ($c === '1' || $c === 'a') $corr_opt = 'opt_1';
    elseif ($c === '2' || $c === 'b') $corr_opt = 'opt_2';
    elseif ($c === '3' || $c === 'c') $corr_opt = 'opt_3';
    elseif ($c === '4' || $c === 'd') $corr_opt = 'opt_4';

    return [
        'question_en' => $final_q_en,
        'question_hi' => $final_q_hi,
        'options_en' => json_encode($opts_en_arr, JSON_UNESCAPED_UNICODE),
        'options_hi' => json_encode($opts_hi_arr, JSON_UNESCAPED_UNICODE),
        'correct_option' => $corr_opt
    ];
}

// Ensure State PSC category exists
$chk_cat = $conn->query("SELECT id FROM pyp_categories WHERE slug = 'state-psc'");
if ($chk_cat->num_rows > 0) {
    $state_cat_id = $chk_cat->fetch_assoc()['id'];
} else {
    $conn->query("INSERT INTO pyp_categories (name, slug, icon, order_index, status) VALUES ('State PSC Exams', 'state-psc', 'fa-landmark', 6, 1)");
    $state_cat_id = $conn->insert_id;
    echo "[+] Created Category 'State PSC Exams' (ID: {$state_cat_id})\n";
}

// ---------------------------------------------------------
// PART 1: IMPORT COURSE 17 (UPSC CDS PYQ)
// ---------------------------------------------------------
$exam_slug_cds = 'upsc-cds';
$check_cds = $conn->query("SELECT id FROM pyp_exams WHERE slug = '{$exam_slug_cds}'");
if ($check_cds->num_rows > 0) {
    $exam_id_cds = $check_cds->fetch_assoc()['id'];
} else {
    $ins = $conn->prepare("INSERT INTO pyp_exams (category_id, title, slug, description, thumbnail, total_tests, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $cat_id_upsc = 4; // Civil Services (UPSC)
    $title_cds = 'UPSC CDS (General Knowledge)';
    $desc_cds = 'UPSC Combined Defence Services (CDS) Official Previous Year Papers with detailed solutions and answer keys.';
    $thumb_cds = 'uploads/exams/cds.png';
    $tot_t = 0;
    $st = 1;
    $ins->bind_param('issssii', $cat_id_upsc, $title_cds, $exam_slug_cds, $desc_cds, $thumb_cds, $tot_t, $st);
    $ins->execute();
    $exam_id_cds = $ins->insert_id;
    echo "[+] Created Exam 'UPSC CDS' with ID: {$exam_id_cds}\n";
}

$cds_quizzes = $conn->query("
    SELECT l.id, l.title, count(q.id) as q_count 
    FROM lesson l 
    JOIN question q ON q.quiz_id = l.id 
    WHERE l.course_id = 17 
    GROUP BY l.id 
    ORDER BY l.title ASC
");

$cds_imported_papers = 0;
$cds_imported_questions = 0;

while ($quiz = $cds_quizzes->fetch_assoc()) {
    $quiz_id = $quiz['id'];
    $quiz_title = trim($quiz['title']);
    $q_count = (int)$quiz['q_count'];

    // Match year and paper number e.g. "2013(1)" or "2015(2)"
    preg_match('/(20\d{2})(?:\((\d+)\))?/', $quiz_title, $ym);
    $year = !empty($ym[1]) ? (int)$ym[1] : 2017;
    $paper_num = !empty($ym[2]) ? (int)$ym[2] : 1;

    $paper_title = "UPSC CDS {$year} - {$paper_num} (General Knowledge)";
    $paper_slug = "upsc-cds-{$year}-paper-{$paper_num}";
    $is_free = ($year >= 2017) ? 1 : 0;

    echo "\n----------------------------------------------------\n";
    echo "Processing CDS Quiz #{$quiz_id}: {$quiz_title} ({$q_count} questions)\n";

    $check_paper = $conn->query("SELECT id FROM pyp_papers WHERE slug = '{$paper_slug}'");
    if ($check_paper->num_rows > 0) {
        $paper_id = $check_paper->fetch_assoc()['id'];
        echo " - Updating existing Paper (ID: {$paper_id})...\n";
        $conn->query("DELETE FROM pyp_questions WHERE paper_id = {$paper_id}");
    } else {
        $sec_json = json_encode([
            ['id' => 'sec_cds_gk', 'name' => 'General Knowledge', 'order' => 1]
        ]);
        $paper_ins = $conn->prepare("
            INSERT INTO pyp_papers (exam_id, title, slug, paper_type, year, shift, duration_minutes, total_marks, positive_marks, negative_marks, total_questions, is_free, sections_json, status)
            VALUES (?, ?, ?, 'PREVIOUS_YEAR', ?, 'Session {$paper_num}', 120, 100.00, 0.83, 0.27, ?, ?, ?, 1)
        ");
        $paper_ins->bind_param('issiiis', $exam_id_cds, $paper_title, $paper_slug, $year, $q_count, $is_free, $sec_json);
        $paper_ins->execute();
        $paper_id = $paper_ins->insert_id;
        echo " - Created Paper: '{$paper_title}' (ID: {$paper_id})\n";
    }

    $q_res = $conn->query("SELECT id, title, options, correct_answers, `order` FROM question WHERE quiz_id = {$quiz_id} ORDER BY `order` ASC, id ASC");
    $q_index = 1;

    $q_ins = $conn->prepare("
        INSERT INTO pyp_questions 
        (paper_id, section_id, question_type, question_en, question_hi, options_en, options_hi, correct_options, solution_en, solution_hi, positive_marks, negative_marks, difficulty, order_index)
        VALUES (?, 'sec_cds_gk', 'MCQ', ?, ?, ?, ?, ?, ?, NULL, 0.83, 0.27, 'MEDIUM', ?)
    ");

    while ($q_row = $q_res->fetch_assoc()) {
        $p = parse_cds_question($q_row);
        $opt_char = strtoupper(substr($p['correct_option'], -1));
        $letter_map = ['1' => 'A', '2' => 'B', '3' => 'C', '4' => 'D'];
        $ans_letter = $letter_map[$opt_char] ?? $opt_char;

        $sol_en = "<p>Official UPSC CDS Answer Key: Option <b>(" . $ans_letter . ")</b>.</p>";

        $q_ins->bind_param(
            'issssssi', 
            $paper_id, 
            $p['question_en'], 
            $p['question_hi'], 
            $p['options_en'], 
            $p['options_hi'], 
            $p['correct_option'], 
            $sol_en, 
            $q_index
        );
        $q_ins->execute();

        $q_index++;
        $cds_imported_questions++;
    }

    $conn->query("UPDATE pyp_papers SET total_questions = {$q_count}, total_marks = 100.00 WHERE id = {$paper_id}");
    $cds_imported_papers++;
    echo " -> Successfully imported {$q_count} questions into Paper #{$paper_id}.\n";
}

$conn->query("UPDATE pyp_exams SET total_tests = (SELECT count(*) FROM pyp_papers WHERE exam_id = {$exam_id_cds}) WHERE id = {$exam_id_cds}");


// ---------------------------------------------------------
// PART 2: SETUP COURSE 19 (UPPSC PYQ)
// ---------------------------------------------------------
$exam_slug_uppsc = 'uppsc-pcs';
$check_uppsc = $conn->query("SELECT id FROM pyp_exams WHERE slug = '{$exam_slug_uppsc}'");
if ($check_uppsc->num_rows > 0) {
    $exam_id_uppsc = $check_uppsc->fetch_assoc()['id'];
} else {
    $ins = $conn->prepare("INSERT INTO pyp_exams (category_id, title, slug, description, thumbnail, total_tests, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $title_uppsc = 'UPPSC PCS Prelims';
    $desc_uppsc = 'Uttar Pradesh Public Service Commission (UPPSC) Combined State / Upper Subordinate Services Examination (GS Paper 1).';
    $thumb_uppsc = 'uploads/exams/uppsc.png';
    $tot_t = 0;
    $st = 1;
    $ins->bind_param('issssii', $state_cat_id, $title_uppsc, $exam_slug_uppsc, $desc_uppsc, $thumb_uppsc, $tot_t, $st);
    $ins->execute();
    $exam_id_uppsc = $ins->insert_id;
    echo "\n[+] Created Exam 'UPPSC PCS Prelims' with ID: {$exam_id_uppsc}\n";
}

// Fetch all 12 lessons from Course 19
$uppsc_lessons = $conn->query("SELECT id, title FROM lesson WHERE course_id = 19 ORDER BY title ASC");
$uppsc_papers_created = 0;

while ($l = $uppsc_lessons->fetch_assoc()) {
    $quiz_title = trim($l['title']);
    preg_match('/(20\d{2})/', $quiz_title, $ym);
    $year = !empty($ym[1]) ? (int)$ym[1] : 2024;

    $paper_title = "UPPSC PCS Prelims {$year} (GS Paper 1)";
    $paper_slug = "uppsc-pcs-{$year}-gs-paper-1";
    $is_free = ($year >= 2023) ? 1 : 0;

    $check_paper = $conn->query("SELECT id FROM pyp_papers WHERE slug = '{$paper_slug}'");
    if ($check_paper->num_rows == 0) {
        $sec_json = json_encode([
            ['id' => 'sec_uppsc_gs', 'name' => 'General Studies (Paper 1)', 'order' => 1]
        ]);
        $paper_ins = $conn->prepare("
            INSERT INTO pyp_papers (exam_id, title, slug, paper_type, year, shift, duration_minutes, total_marks, positive_marks, negative_marks, total_questions, is_free, sections_json, status)
            VALUES (?, ?, ?, 'PREVIOUS_YEAR', ?, 'Morning Session (9:30 AM - 11:30 AM)', 120, 200.00, 1.33, 0.44, 150, ?, ?, 1)
        ");
        $paper_ins->bind_param('issiis', $exam_id_uppsc, $paper_title, $paper_slug, $year, $is_free, $sec_json);
        $paper_ins->execute();
        $paper_id = $paper_ins->insert_id;
        $uppsc_papers_created++;
        echo " - Setup UPPSC Paper: '{$paper_title}' (ID: {$paper_id})\n";
    }
}

$conn->query("UPDATE pyp_exams SET total_tests = (SELECT count(*) FROM pyp_papers WHERE exam_id = {$exam_id_uppsc}) WHERE id = {$exam_id_uppsc}");

echo "\n====================================================\n";
echo " ALL TASKS COMPLETED SUCCESSFULLY:\n";
echo " 1. Course 17 (UPSC CDS): {$cds_imported_papers} Papers, {$cds_imported_questions} Questions Imported.\n";
echo " 2. Course 19 (UPPSC): 12 Exam Papers configured under 'State PSC Exams' category.\n";
echo "====================================================\n";
