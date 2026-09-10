<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$q = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = 557 LIMIT 1")->fetch_assoc();
echo "Quiz 557 Q1:\n";
echo "Title: " . html_entity_decode($q['title']) . "\n\n";
echo "Options: " . $q['options'] . "\n";
echo "Correct: " . $q['correct_answers'] . "\n";
