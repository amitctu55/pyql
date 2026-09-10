<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

function clean_raw_html($html) {
    $text = html_entity_decode($html, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    // Remove Office conditional comments
    $text = preg_replace('/<!--\[if.*?\]>.*?<!\[endif\]-->/s', '', $text);
    $text = preg_replace('/<!--.*?-->/s', '', $text);
    // Remove mso styles
    $text = preg_replace('/style="[^"]*"/i', '', $text);
    $text = preg_replace('/class="[^"]*"/i', '', $text);
    $text = preg_replace('/lang="[^"]*"/i', '', $text);
    $text = preg_replace('/<font[^>]*>/i', '', $text);
    $text = str_replace('</font>', '', $text);
    $text = preg_replace('/<span[^>]*>/i', '', $text);
    $text = str_replace('</span>', '', $text);
    $text = preg_replace('/<o:p>.*?<\/o:p>/i', '', $text);
    $text = preg_replace('/&nbsp;/i', ' ', $text);
    $text = preg_replace('/<p>\s*<br\s*\/?>\s*<\/p>/i', '', $text);
    $text = preg_replace('/(<br\s*\/?>\s*)+/i', '<br>', $text);
    $text = trim($text);
    return $text;
}

function parse_quiz_question($row) {
    $clean = clean_raw_html($row['title']);
    $opts_db = json_decode($row['options'], true);

    // 1. Check if DB options has real content (not generic ["A","B","C","D"] or ["a","b","c","d"])
    $has_real_opts_in_db = false;
    if (is_array($opts_db) && count($opts_db) >= 2) {
        $has_real_opts_in_db = true;
        foreach ($opts_db as $o) {
            $t = trim(strtolower($o));
            if (in_array($t, ['a', 'b', 'c', 'd', '1', '2', '3', '4', ''])) {
                $has_real_opts_in_db = false;
                break;
            }
        }
    }

    $opt_a = ""; $opt_b = ""; $opt_c = ""; $opt_d = "";
    $question_body = $clean;

    if ($has_real_opts_in_db) {
        $opt_a = $opts_db[0] ?? "";
        $opt_b = $opts_db[1] ?? "";
        $opt_c = $opts_db[2] ?? "";
        $opt_d = $opts_db[3] ?? "";
        // Strip options marker from body if present
        $clean_stripped = preg_replace('/\(a\)\s*\(b\)\s*\(c\)\s*\(d\)/i', '', $clean);
        $question_body = trim($clean_stripped);
    } else {
        // Try regex match on options (a), (b), (c), (d)
        // Pattern 1: (a) ... (b) ... (c) ... (d) ...
        if (preg_match('/^(.*?)(?:\(a\)|(?:^|\s)a\.\s+)\s*(.*?)(?:\(b\)|(?:^|\s)b\.\s+)\s*(.*?)(?:\(c\)|(?:^|\s)c\.\s+)\s*(.*?)(?:\(d\)|(?:^|\s)d\.\s+)\s*(.*)$/si', $clean, $m)) {
            $question_body = trim($m[1]);
            $opt_a = trim($m[2]);
            $opt_b = trim($m[3]);
            $opt_c = trim($m[4]);
            // opt_d might have trailing text or second language
            $rem_d = trim($m[5]);
            // If rem_d has another (a) or Hindi section or question number
            if (preg_match('/^(.*?)(?:<p>|<br>|\n)(?:Question|\d+\.|\(a\)|[\x{0900}-\x{097F}])/su', $rem_d, $dm)) {
                $opt_d = trim($dm[1]);
            } else {
                $opt_d = $rem_d;
            }
        }
    }

    // Clean options: strip remaining html tags
    $opt_a = trim(strip_tags($opt_a));
    $opt_b = trim(strip_tags($opt_b));
    $opt_c = trim(strip_tags($opt_c));
    $opt_d = trim(strip_tags($opt_d));

    // If options still empty, default from DB or letters
    if (empty($opt_a)) $opt_a = "Option A";
    if (empty($opt_b)) $opt_b = "Option B";
    if (empty($opt_c)) $opt_c = "Option C";
    if (empty($opt_d)) $opt_d = "Option D";

    // Clean question_body
    // If question_body is empty, fallback to clean text without options
    if (empty(strip_tags($question_body))) {
        $question_body = $clean;
    }

    // Split English and Hindi if bilingual
    $q_en = $question_body;
    $q_hi = null;

    // Check for Hindi separator pattern (e.g. Hindi: or Question 1: ... Question 1: Hindi...)
    if (preg_match('/^(.*?)English:\s*(.*)$/si', $question_body, $bm)) {
        // Hindi is first, English is second
        $q_hi = trim($bm[1]);
        $q_hi = preg_replace('/^.*?Hindi:\s*/si', '', $q_hi);
        $q_en = trim($bm[2]);
    } elseif (preg_match('/^(.*?)Hindi:\s*(.*)$/si', $question_body, $bm)) {
        // English is first, Hindi is second
        $q_en = trim($bm[1]);
        $q_hi = trim($bm[2]);
    } elseif (preg_match('/^(.*?)(<p>\s*(?:<br\s*\/?>)?\s*\d+\.\s*[\x{0900}-\x{097F}].*)$/su', $question_body, $bm)) {
        $q_en = trim($bm[1]);
        $q_hi = trim($bm[2]);
    }

    // Ensure q_en is NEVER empty!
    if (empty(trim(strip_tags($q_en)))) {
        $q_en = !empty($q_hi) ? $q_hi : $question_body;
    }

    // Determine correct option
    $corr_arr = json_decode($row['correct_answers'], true);
    $c = is_array($corr_arr) && !empty($corr_arr) ? strtolower(trim($corr_arr[0])) : '1';
    $corr_opt = 'opt_1';
    if ($c === '1' || $c === 'a') $corr_opt = 'opt_1';
    elseif ($c === '2' || $c === 'b') $corr_opt = 'opt_2';
    elseif ($c === '3' || $c === 'c') $corr_opt = 'opt_3';
    elseif ($c === '4' || $c === 'd') $corr_opt = 'opt_4';

    $options_json = json_encode([
        ['id' => 'opt_1', 'text' => "(a) " . $opt_a],
        ['id' => 'opt_2', 'text' => "(b) " . $opt_b],
        ['id' => 'opt_3', 'text' => "(c) " . $opt_c],
        ['id' => 'opt_4', 'text' => "(d) " . $opt_d]
    ], JSON_UNESCAPED_UNICODE);

    return [
        'q_en' => $q_en,
        'q_hi' => $q_hi,
        'options' => $options_json,
        'correct' => $corr_opt
    ];
}

$quizzes = [595, 596, 599, 601, 602, 603, 604, 605];
foreach ($quizzes as $qid) {
    echo "Testing Quiz {$qid} sample:\n";
    $q = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = {$qid} LIMIT 1")->fetch_assoc();
    $res = parse_quiz_question($q);
    echo "ID: {$q['id']}\n";
    echo "Q_EN len: " . strlen($res['q_en']) . " | snippet: " . substr(strip_tags($res['q_en']), 0, 100) . "...\n";
    echo "Q_HI len: " . ($res['q_hi'] ? strlen($res['q_hi']) : 0) . "\n";
    echo "Correct: {$res['correct']}\n";
    echo "Options: {$res['options']}\n";
    echo "--------------------------------------------------------\n";
}
