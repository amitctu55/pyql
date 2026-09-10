<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

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

        // Split question body before first <ol type="a">
        $parts = preg_split('/<ol[^>]*type=["\']?a["\']?[^>]*>.*?<\/ol>/si', $clean);
        $body_en = trim($parts[0] ?? '');
        $body_hi = trim($parts[1] ?? '');
    }

    // Pattern 2: (a) ... (b) ... (c) ... (d)
    if (empty($opts_en) || count($opts_en) < 4) {
        $plain = strip_tags($clean);
        if (preg_match('/^(.*?)(?:\(a\)|\ba\.\s+)\s*(.*?)(?:\(b\)|\bb\.\s+)\s*(.*?)(?:\(c\)|\bc\.\s+)\s*(.*?)(?:\(d\)|\bd\.\s+)\s*(.*)$/si', $plain, $m)) {
            $body_en = trim($m[1]);
            $opts_en = [
                '(a) ' . trim(preg_replace('/\s+/', ' ', $m[2])),
                '(b) ' . trim(preg_replace('/\s+/', ' ', $m[3])),
                '(c) ' . trim(preg_replace('/\s+/', ' ', $m[4])),
                '(d) ' . trim(preg_replace('/\s+/', ' ', $m[5]))
            ];
            // If body also has HTML
            if (preg_match('/^(.*?)(?:\(a\)|\ba\.\s+)/si', $clean, $bm)) {
                $body_en = trim($bm[1]);
            }
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

$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 557");
$total = 0;
$bare_opts = 0;
$empty_en = 0;

while ($r = $res->fetch_assoc()) {
    $total++;
    $p = parse_c15_robust($r);
    if (empty(trim(strip_tags($p['q_en'])))) {
        $empty_en++;
    }
    $o = json_decode($p['options_en'], true);
    if (trim($o[0]['text']) === '(a)' || trim($o[0]['text']) === '(a) Option A') {
        $bare_opts++;
    }
}

echo "=== QUIZ 557 TEST RESULTS ===\n";
echo "Total Questions: {$total}\n";
echo "Empty Questions: {$empty_en}\n";
echo "Bare / Default Options: {$bare_opts}\n";
echo "Successfully Parsed Questions with Real Option Texts: " . ($total - $bare_opts) . " / {$total}\n";
