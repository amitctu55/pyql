<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

// Quiz 595 is 2014, let's see its questions
$res = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 595 LIMIT 3");
while ($row = $res->fetch_assoc()) {
    echo "ID: {$row['id']}\n";
    echo "Raw Title (length " . strlen($row['title']) . "):\n";
    echo html_entity_decode($row['title']) . "\n";
    echo "Options: {$row['options']}\n";
    echo "Correct: {$row['correct_answers']}\n";
    echo "----------------------------------------\n";
}
