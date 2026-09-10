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

function parse_c15_question($row) {
    $clean = clean_c15_html($row['title']);

    // Check if question has <ol> ... </ol>
    $opts_en = [];
    $opts_hi = [];
    $body_en = "";
    $body_hi = "";

    // If <ol> tags exist
    if (preg_match_all('/<ol[^>]*>(.*?)<\/ol>/si', $clean, $ol_matches)) {
        // Extract <li> items from first <ol>
        preg_match_all('/<li[^>]*>(.*?)<\/li>/si', $ol_matches[1][0], $li1);
        if (count($li1[1]) >= 4) {
            $opts_en = [
                '(a) ' . trim(strip_tags($li1[1][0])),
                '(b) ' . trim(strip_tags($li1[1][1])),
                '(c) ' . trim(strip_tags($li1[1][2])),
                '(d) ' . trim(strip_tags($li1[1][3]))
            ];
        }

        // Extract <li> items from second <ol> if present
        if (isset($ol_matches[1][1])) {
            preg_match_all('/<li[^>]*>(.*?)<\/li>/si', $ol_matches[1][1], $li2);
            if (count($li2[1]) >= 4) {
                $opts_hi = [
                    '(a) ' . trim(strip_tags($li2[1][0])),
                    '(b) ' . trim(strip_tags($li2[1][1])),
                    '(c) ' . trim(strip_tags($li2[1][2])),
                    '(d) ' . trim(strip_tags($li2[1][3]))
                ];
            }
        }

        // Split question body before first <ol> and between first and second <ol>
        $parts = preg_split('/<ol[^>]*>.*?<\/ol>/si', $clean);
        $body_en = trim(preg_replace('/<p>\s*<\/p>/i', '', $parts[0] ?? ''));
        $body_hi = trim(preg_replace('/<p>\s*<\/p>/i', '', $parts[1] ?? ''));
    }

    // If options not found via <ol>, try (a) ... (b) ... (c) ... (d)
    if (empty($opts_en) || count($opts_en) < 4) {
        // Look for (a) ... (b) ... (c) ... (d)
        $plain = strip_tags($clean);
        if (preg_match('/^(.*?)(?:\(a\)|(?:\b|>)a\.\s+)\s*(.*?)(?:\(b\)|(?:\b|>)b\.\s+)\s*(.*?)(?:\(c\)|(?:\b|>)c\.\s+)\s*(.*?)(?:\(d\)|(?:\b|>)d\.\s+)\s*(.*)$/si', $plain, $m)) {
            $body_en = trim($m[1]);
            $opts_en = [
                '(a) ' . trim(preg_replace('/\s+/', ' ', $m[2])),
                '(b) ' . trim(preg_replace('/\s+/', ' ', $m[3])),
                '(c) ' . trim(preg_replace('/\s+/', ' ', $m[4])),
                '(d) ' . trim(preg_replace('/\s+/', ' ', $m[5]))
            ];
        }
    }

    // If body_en is empty, fallback to clean
    if (empty(strip_tags($body_en))) {
        $body_en = $clean;
    }

    // Default options if still empty
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
        'q_hi' => !empty($body_hi) ? $body_hi : null,
        'options_en' => $opts_en_json,
        'options_hi' => $opts_hi_json,
        'correct' => $corr_opt
    ];
}

// Test on first 5 questions of Quiz 557 (GS2013)
$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 557 LIMIT 5");
while ($r = $res->fetch_assoc()) {
    $p = parse_c15_question($r);
    echo "ID: {$r['id']}\n";
    echo "Q_EN: " . substr(strip_tags($p['q_en']), 0, 100) . "...\n";
    echo "Q_HI: " . ($p['q_hi'] ? substr(strip_tags($p['q_hi']), 0, 100) . "..." : "NONE") . "\n";
    echo "Options EN:\n" . $p['options_en'] . "\n";
    echo "Options HI:\n" . $p['options_hi'] . "\n";
    echo "--------------------------------------------------------\n";
}
