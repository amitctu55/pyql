<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

function test_parse_c15($clean) {
    $opts_en = [];
    $opts_hi = [];

    // Find all <ol type="a"> or <ol type='a'> or <ol style="..." type="a">
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
    }

    return [
        'en' => $opts_en,
        'hi' => $opts_hi
    ];
}

// Check first 10 questions of Quiz 557
$res = $conn->query("SELECT id, title FROM question WHERE quiz_id = 557 LIMIT 10");
while ($r = $res->fetch_assoc()) {
    $t = html_entity_decode($r['title']);
    $res_opts = test_parse_c15($t);
    echo "Q ID {$r['id']}:\n";
    echo "EN: " . implode(' | ', $res_opts['en']) . "\n";
    echo "HI: " . implode(' | ', $res_opts['hi']) . "\n";
    echo "-----------------------------------------\n";
}
