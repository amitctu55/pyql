<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');
require_once __DIR__ . '/test_quiz557_full.php';

$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 562");
$bare_cnt = 0;
while ($r = $res->fetch_assoc()) {
    $p = parse_c15_robust($r);
    $o = json_decode($p['options_en'], true);
    if (trim($o[0]['text']) === '(a)' || trim($o[0]['text']) === '(a) Option A') {
        $bare_cnt++;
        if ($bare_cnt <= 3) {
            echo "Bare Q ID {$r['id']}:\n";
            echo "Raw title: " . substr(html_entity_decode($r['title']), 0, 300) . "\n---\n";
        }
    }
}
