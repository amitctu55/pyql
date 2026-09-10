<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$q = $conn->query("SELECT id, question_en FROM pyp_questions WHERE id = 1111")->fetch_assoc();
echo "Question 1111 raw question_en (first 500 chars):\n";
echo substr($q['question_en'], 0, 500) . "\n";
echo "Length: " . strlen($q['question_en']) . "\n";
