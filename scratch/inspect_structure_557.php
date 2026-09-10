<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 557 LIMIT 2");
while ($r = $res->fetch_assoc()) {
    echo "========================================\n";
    echo "QUESTION ID: {$r['id']}\n";
    echo "========================================\n";
    $text = html_entity_decode($r['title']);
    // Remove style and class
    $text = preg_replace('/<font[^>]*>/i', '', $text);
    $text = str_replace('</font>', '', $text);
    $text = preg_replace('/<span[^>]*>/i', '', $text);
    $text = str_replace('</span>', '', $text);
    echo $text . "\n\n";
}
