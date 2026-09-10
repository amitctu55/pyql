<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 557 LIMIT 3");
while ($r = $res->fetch_assoc()) {
    echo "========================================\n";
    echo "QUESTION ID: {$r['id']}\n";
    echo "========================================\n";
    echo "RAW HTML:\n" . $r['title'] . "\n\n";
    echo "DECODED HTML:\n" . html_entity_decode($r['title']) . "\n\n";
}
