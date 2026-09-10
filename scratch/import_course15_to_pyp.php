<?php
// Production script to re-import all Question Sets from Course 15 into PYP Platform with full options extraction
// Course 15: UPSC CSE PYQ

$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}
$conn->set_charset('utf8mb4');

echo "====================================================\n";
echo " RE-IMPORTING COURSE 15 QUESTIONS WITH FULL OPTIONS \n";
echo "====================================================\n\n";

function clean_c15_html($html) {
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
    $html = str_ireplace('<pre>', '', $html);
    $html = str_ireplace('</pre>', '', $html);
    return trim($html);
}

function parse_c15_robust($row) {
    $clean = clean_c15_html($row['title']);

    $opts_en = [];
    $opts_hi = [];
    $body_en = "";
    $body_hi = "";

    // Pattern 1: <ol type="a">
    if (preg_match_all('/<ol[^>]*type=["\']?a["\']?[^>]*>(.*?)<\/ol>/si', $clean, $ol_type_a)) {
        if (isset($ol_type_a[1][0])) {
            preg_match_all('/<li[^>]*>(.*?)<\/li>/si', $ol_type_a[1][0], $li1);
            if (count($li1[1]) >= 4) {
                $opts_en = [
                    '(a) ' . trim(strip_tags($li1[1][0])),
                    '(b) ' . trim(strip_tags($li1[1][1])),
                    '(c) ' . trim(strip_tags($li1[1][2])),
                    '(d) ' . trim(strip_tags($li1[1][3]))
                ];
            }
        }
        if (isset($ol_type_a[1][1])) {
            preg_match_all('/<li[^>]*>(.*?)<\/li>/si', $ol_type_a[1][1], $li2);
            if (count($li2[1]) >= 4) {
                $opts_hi = [
                    '(a) ' . trim(strip_tags($li2[1][0])),
                    '(b) ' . trim(strip_tags($li2[1][1])),
                    '(c) ' . trim(strip_tags($li2[1][2])),
                    '(d) ' . trim(strip_tags($li2[1][3]))
                ];
            }
        }

        $parts = preg_split('/<ol[^>]*type=["\']?a["\']?[^>]*>.*?<\/ol>/si', $clean);
        $body_en = trim($parts[0] ?? '');
        $body_hi = trim($parts[1] ?? '');
    }

    // Pattern 2: (a) or a) or a. ... (b) or b) or b. ...
    if (empty($opts_en) || count($opts_en) < 4) {
        $plain = strip_tags($clean);
        if (preg_match('/^(.*?)(?:\(a\)|(?:\b|>)a\s*[\)\.]\s*)\s*(.*?)(?:\(b\)|(?:\b|>)b\s*[\)\.]\s*)\s*(.*?)(?:\(c\)|(?:\b|>)c\s*[\)\.]\s*)\s*(.*?)(?:\(d\)|(?:\b|>)d\s*[\)\.]\s*)\s*(.*)$/si', $plain, $m)) {
            $body_en = trim($m[1]);
            $opts_en = [
                '(a) ' . trim(preg_replace('/\s+/', ' ', $m[2])),
                '(b) ' . trim(preg_replace('/\s+/', ' ', $m[3])),
                '(c) ' . trim(preg_replace('/\s+/', ' ', $m[4])),
                '(d) ' . trim(preg_replace('/\s+/', ' ', $m[5]))
            ];
            if (preg_match('/^(.*?)(?:\(a\)|(?:\b|>)a\s*[\)\.]\s*)/si', $clean, $bm)) {
                $body_en = trim($bm[1]);
            }
        }
    }

    // Check if Hindi part exists in clean text
    if (empty($body_hi)) {
        if (preg_match('/^(.*?)(<p>[^<]*?\d+\.\s*[\x{0900}-\x{097F}].*)$/su', $body_en, $hm)) {
            $body_en = trim($hm[1]);
            $body_hi = trim($hm[2]);
        }
    }

    if (empty(strip_tags($body_en))) {
        $body_en = $clean;
    }
    if (empty($opts_en) || count($opts_en) < 4) {
        $opts_en = ['(a) Option A', '(b) Option B', '(c) Option C', '(d) Option D'];
    }
    if (empty($opts_hi) || count($opts_hi) < 4) {
        $opts_hi = $opts_en;
    }

    $opts_en_json = json_encode([
        ['id' => 'opt_1', 'text' => $opts_en[0]],
        ['id' => 'opt_2', 'text' => $opts_en[1]],
        ['id' => 'opt_3', 'text' => $opts_en[2]],
        ['id' => 'opt_4', 'text' => $opts_en[3]]
    ], JSON_UNESCAPED_UNICODE);

    $opts_hi_json = json_encode([
        ['id' => 'opt_1', 'text' => $opts_hi[0]],
        ['id' => 'opt_2', 'text' => $opts_hi[1]],
        ['id' => 'opt_3', 'text' => $opts_hi[2]],
        ['id' => 'opt_4', 'text' => $opts_hi[3]]
    ], JSON_UNESCAPED_UNICODE);

    $corr_arr = json_decode($row['correct_answers'], true);
    $c = is_array($corr_arr) && !empty($corr_arr) ? strtolower(trim($corr_arr[0])) : '1';
    $corr_opt = 'opt_1';
    if ($c === '1' || $c === 'a') $corr_opt = 'opt_1';
    elseif ($c === '2' || $c === 'b') $corr_opt = 'opt_2';
    elseif ($c === '3' || $c === 'c') $corr_opt = 'opt_3';
    elseif ($c === '4' || $c === 'd') $corr_opt = 'opt_4';

    return [
        'q_en' => $body_en,
        'q_hi' => !empty(strip_tags($body_hi)) ? $body_hi : null,
        'options_en' => $opts_en_json,
        'options_hi' => $opts_hi_json,
        'correct' => $corr_opt
    ];
}

// 1. Ensure UPSC CSE Exam exists in pyp_exams
$exam_slug = 'upsc-cse-prelims';
$check_exam = $conn->query("SELECT id FROM pyp_exams WHERE slug = '{$exam_slug}'");
if ($check_exam->num_rows > 0) {
    $exam_id = $check_exam->fetch_assoc()['id'];
} else {
    $ins = $conn->prepare("INSERT INTO pyp_exams (category_id, title, slug, description, thumbnail, total_tests, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $cat_id = 4; // Civil Services (UPSC)
    $title = 'UPSC CSE Prelims';
    $desc = 'Union Public Service Commission Civil Services Examination GS Paper 1 Previous Year Official Papers with bilingual solutions.';
    $thumb = 'uploads/exams/upsc.png';
    $total_t = 0;
    $status = 1;
    $ins->bind_param('issssii', $cat_id, $title, $exam_slug, $desc, $thumb, $total_t, $status);
    $ins->execute();
    $exam_id = $ins->insert_id;
    echo "[+] Created Exam 'UPSC CSE Prelims' with ID: {$exam_id}\n";
}

// 2. Fetch all quizzes for Course 15 that have questions
$quizzes_res = $conn->query("
    SELECT l.id, l.title, count(q.id) as q_count 
    FROM lesson l 
    JOIN question q ON q.quiz_id = l.id 
    WHERE l.course_id = 15 
    GROUP BY l.id 
    ORDER BY l.title ASC
");

$total_imported_papers = 0;
$total_imported_questions = 0;

while ($quiz = $quizzes_res->fetch_assoc()) {
    $quiz_id = $quiz['id'];
    $quiz_title = trim($quiz['title']);
    $q_count = (int)$quiz['q_count'];

    preg_match('/(20\d{2})/', $quiz_title, $year_match);
    $year = !empty($year_match[1]) ? (int)$year_match[1] : 2023;

    $paper_title = "UPSC CSE Prelims {$year} (GS Paper 1)";
    $paper_slug = "upsc-cse-prelims-gs-{$year}";
    $is_free = ($year >= 2022) ? 1 : 0;

    echo "\n----------------------------------------------------\n";
    echo "Processing Quiz #{$quiz_id}: {$quiz_title} ({$q_count} questions, Year {$year})\n";

    $check_paper = $conn->query("SELECT id FROM pyp_papers WHERE slug = '{$paper_slug}'");
    if ($check_paper->num_rows > 0) {
        $paper_id = $check_paper->fetch_assoc()['id'];
        echo " - Paper already exists (ID: {$paper_id}). Re-importing questions with complete options...\n";
        $conn->query("DELETE FROM pyp_questions WHERE paper_id = {$paper_id}");
    } else {
        $sec_json = json_encode(array(
            array('id' => 'sec_gs', 'name' => 'General Studies Paper 1', 'order' => 1)
        ));
        $paper_ins = $conn->prepare("
            INSERT INTO pyp_papers (exam_id, title, slug, paper_type, year, shift, duration_minutes, total_marks, positive_marks, negative_marks, total_questions, is_free, sections_json, status)
            VALUES (?, ?, ?, 'PREVIOUS_YEAR', ?, 'Morning Session (9:30 AM - 11:30 AM)', 120, 200.00, 2.00, 0.66, ?, ?, ?, 1)
        ");
        $paper_ins->bind_param('issiiis', $exam_id, $paper_title, $paper_slug, $year, $q_count, $is_free, $sec_json);
        $paper_ins->execute();
        $paper_id = $paper_ins->insert_id;
        echo " - Created Paper: '{$paper_title}' (ID: {$paper_id})\n";
    }

    $q_res = $conn->query("SELECT id, title, options, correct_answers, `order` FROM question WHERE quiz_id = {$quiz_id} ORDER BY `order` ASC, id ASC");
    if (!$q_res) {
        echo " [!] Query error: " . $conn->error . "\n";
        continue;
    }

    $q_index = 1;
    $q_ins = $conn->prepare("
        INSERT INTO pyp_questions 
        (paper_id, section_id, question_type, question_en, question_hi, options_en, options_hi, correct_options, solution_en, solution_hi, positive_marks, negative_marks, difficulty, order_index)
        VALUES (?, 'sec_gs', 'MCQ', ?, ?, ?, ?, ?, ?, NULL, 2.00, 0.66, 'MEDIUM', ?)
    ");

    while ($q_row = $q_res->fetch_assoc()) {
        $p = parse_c15_robust($q_row);
        $opt_char = strtoupper(substr($p['correct'], -1));
        $letter_map = ['1' => 'A', '2' => 'B', '3' => 'C', '4' => 'D'];
        $ans_letter = $letter_map[$opt_char] ?? $opt_char;

        $sol_en = "<p>Official UPSC Answer Key: Option <b>(" . $ans_letter . ")</b>.</p>";

        $q_ins->bind_param(
            'issssssi',
            $paper_id,
            $p['q_en'],
            $p['q_hi'],
            $p['options_en'],
            $p['options_hi'],
            $p['correct'],
            $sol_en,
            $q_index
        );
        $q_ins->execute();

        $q_index++;
        $total_imported_questions++;
    }

    $conn->query("UPDATE pyp_papers SET total_questions = {$q_count}, total_marks = " . ($q_count * 2) . " WHERE id = {$paper_id}");
    $total_imported_papers++;
    echo " -> Successfully imported {$q_count} questions into Paper #{$paper_id}.\n";
}

$conn->query("UPDATE pyp_exams SET total_tests = (SELECT count(*) FROM pyp_papers WHERE exam_id = {$exam_id}) WHERE id = {$exam_id}");

echo "\n====================================================\n";
echo " RE-IMPORT COMPLETE FOR COURSE 15:\n";
echo " Total Papers Updated: {$total_imported_papers}\n";
echo " Total Questions Successfully Imported: {$total_imported_questions}\n";
echo " Target Exam: UPSC CSE Prelims (slug: {$exam_slug})\n";
echo "====================================================\n";
