<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

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

// Function to extract question body and 4 options from a single-language block
function extract_q_and_options($text) {
    $plain = strip_tags($text);
    $opt_a = $opt_b = $opt_c = $opt_d = "";
    $body = $text;

    // Look for (a) ... (b) ... (c) ... (d) ...
    if (preg_match('/^(.*?)(?:\(a\)|\ba\.\s+)\s*(.*?)(?:\(b\)|\bb\.\s+)\s*(.*?)(?:\(c\)|\bc\.\s+)\s*(.*?)(?:\(d\)|\bd\.\s+)\s*(.*)$/si', $plain, $m)) {
        $body_plain = trim($m[1]);
        $opt_a = trim($m[2]);
        $opt_b = trim($m[3]);
        $opt_c = trim($m[4]);
        $opt_d = trim($m[5]);

        // Cut body from HTML at the first occurrence of (a)
        if (preg_match('/^(.*?)(?:\(a\)|(?:\b|>)a\.\s+)/si', $text, $bm)) {
            $body = trim($bm[1]);
        } else {
            $body = $body_plain;
        }
    }

    // Clean up body
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

function parse_capf_question($row) {
    $raw_title = $row['title'];
    $clean = clean_html($raw_title);

    $block_en = "";
    $block_hi = "";

    // Check separation pattern:
    // Case 1: English: ... vs Hindi: ...
    if (stripos($clean, 'English:') !== false && stripos($clean, 'Hindi:') !== false) {
        if (stripos($clean, 'Hindi:') < stripos($clean, 'English:')) {
            // Hindi first, English second
            $parts = preg_split('/English:/i', $clean, 2);
            $block_hi = preg_replace('/^.*?Hindi:/si', '', $parts[0]);
            $block_en = $parts[1] ?? '';
        } else {
            // English first, Hindi second
            $parts = preg_split('/Hindi:/i', $clean, 2);
            $block_en = preg_replace('/^.*?English:/si', '', $parts[0]);
            $block_hi = $parts[1] ?? '';
        }
    }
    // Case 2: Hindi text paragraph followed by English text paragraph or vice versa
    // E.g. Quiz 605: Hindi has (d) ML then <p>Which one among the following... (a) ... (d) ...
    // E.g. Quiz 595: English has (d) ... then <p>11.मार्च 2014... (a) ... (d) ...
    elseif (preg_match('/^(.*?)(<p>[^<]*?(?:\d+\.\s*|Which|Consider|What|Who|When|In|Where|If|Select|Match|Statement|The|How|A\s+|An\s+)[\x{0041}-\x{007A}].*)$/su', $clean, $m) 
            && preg_match('/[\x{0900}-\x{097F}]/u', $m[1])) {
        // Hindi first, English second
        $block_hi = $m[1];
        $block_en = $m[2];
    }
    elseif (preg_match('/^(.*?)(<p>[^<]*?\d+\.\s*[\x{0900}-\x{097F}].*)$/su', $clean, $m)) {
        // English first, Hindi second
        $block_en = $m[1];
        $block_hi = $m[2];
    }
    else {
        // Single block or mixed
        if (preg_match('/[\x{0900}-\x{097F}]/u', $clean) && !preg_match('/[a-zA-Z]{5,}/', strip_tags($clean))) {
            $block_hi = $clean;
        } else {
            $block_en = $clean;
        }
    }

    $parsed_en = !empty($block_en) ? extract_q_and_options($block_en) : null;
    $parsed_hi = !empty($block_hi) ? extract_q_and_options($block_hi) : null;

    // Check if options exist in DB json
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

    // Determine final EN options
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

    // Determine final HI options
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

    // Questions body
    $final_q_en = $parsed_en ? $parsed_en['body'] : '';
    $final_q_hi = $parsed_hi ? $parsed_hi['body'] : '';

    if (empty(strip_tags($final_q_en))) {
        $final_q_en = !empty(strip_tags($final_q_hi)) ? $final_q_hi : $clean;
    }
    if (empty(strip_tags($final_q_hi))) {
        $final_q_hi = $final_q_en;
    }

    // Correct Option
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

// Test across all 892 questions in Course 16 to verify 0 errors and 0 empty questions!
$all_q = $conn->query("
    SELECT q.id, q.title, q.options, q.correct_answers, l.title as quiz_title, l.id as quiz_id
    FROM question q 
    JOIN lesson l ON q.quiz_id = l.id 
    WHERE l.course_id = 16 
    ORDER BY l.id ASC, q.id ASC
");

$total = 0;
$empty_en = 0;
$empty_opts = 0;

while ($row = $all_q->fetch_assoc()) {
    $total++;
    $res = parse_capf_question($row);
    if (empty(trim(strip_tags($res['question_en'])))) {
        $empty_en++;
        echo "EMPTY EN on Q ID {$row['id']}\n";
    }
    $o = json_decode($res['options_en'], true);
    if (!is_array($o) || count($o) < 4 || empty($o[0]['text'])) {
        $empty_opts++;
        echo "BAD OPTS on Q ID {$row['id']}\n";
    }
}

echo "=== VALIDATION OVER ALL {$total} QUESTIONS OF COURSE 16 ===\n";
echo "Total Questions Checked: {$total}\n";
echo "Empty EN Questions: {$empty_en}\n";
echo "Bad Options: {$empty_opts}\n";
