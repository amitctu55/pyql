<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');
$r = $conn->query('SELECT title, options, correct_answers FROM question WHERE id = 3498')->fetch_assoc();
echo "HTML Decoded:\n" . html_entity_decode($r['title']) . "\n";
echo "Options: " . $r['options'] . "\n";
echo "Correct: " . $r['correct_answers'] . "\n";
