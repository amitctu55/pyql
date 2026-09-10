<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

function clean_text($html) {
    $text = html_entity_decode($html, ENT_QUOTES | ENT_HTML5, 'UTF-8');
    // Remove Office conditional comments
    $text = preg_replace('/<!--\[if.*?\]>.*?<!\[endif\]-->/s', '', $text);
    $text = preg_replace('/<!--.*?-->/s', '', $text);
    // Remove style attributes and mso-*
    $text = preg_replace('/style="[^"]*"/i', '', $text);
    $text = preg_replace('/class="[^"]*"/i', '', $text);
    $text = preg_replace('/lang="[^"]*"/i', '', $text);
    $text = preg_replace('/<font[^>]*>/i', '', $text);
    $text = str_replace('</font>', '', $text);
    $text = preg_replace('/<span[^>]*>/i', '', $text);
    $text = str_replace('</span>', '', $text);
    $text = preg_replace('/<o:p>.*?<\/o:p>/i', '', $text);
    $text = preg_replace('/&nbsp;/i', ' ', $text);
    return trim($text);
}

$quizzes = [595, 596, 599, 601, 602, 603, 604, 605];
$stats = [];

foreach ($quizzes as $qid) {
    $q_res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = {$qid}");
    $count = 0;
    $has_custom_opts = 0;
    $matched_opt_regex = 0;
    
    while ($r = $q_res->fetch_assoc()) {
        $count++;
        $opts = json_decode($r['options'], true);
        $is_generic = true;
        if (is_array($opts) && count($opts) >= 2) {
            $is_generic = false;
            foreach ($opts as $o) {
                $trimmed = trim(strtolower($o));
                if ($trimmed == 'a' || $trimmed == 'b' || $trimmed == 'c' || $trimmed == 'd' || $trimmed == '1' || $trimmed == '2' || $trimmed == '3' || $trimmed == '4') {
                    $is_generic = true;
                    break;
                }
            }
        }
        if (!$is_generic) {
            $has_custom_opts++;
        }

        $clean = clean_text($r['title']);
        if (preg_match('/\(a\)\s*(.*?)\s*\(b\)\s*(.*?)\s*\(c\)\s*(.*?)\s*\(d\)\s*(.*)/si', strip_tags($clean), $m)) {
            $matched_opt_regex++;
        }
    }
    $stats[$qid] = [
        'total' => $count,
        'custom_opts' => $has_custom_opts,
        'matched_opt_regex' => $matched_opt_regex
    ];
}

echo "Quiz stats:\n";
print_r($stats);
