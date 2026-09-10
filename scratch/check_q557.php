<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 557 LIMIT 2");
while ($r = $res->fetch_assoc()) {
    echo "ID: {$r['id']}\n";
    echo "Title: " . html_entity_decode($r['title']) . "\n";
    echo "Options: {$r['options']}\n";
    echo "Correct: {$r['correct_answers']}\n---\n";
}
