<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$q = $conn->query("SELECT id, question_en, question_hi, options_en, correct_options, solution_en FROM pyp_questions WHERE paper_id = 3 LIMIT 2");
while ($r = $q->fetch_assoc()) {
    echo "ID: {$r['id']}\n";
    echo "Q_EN: " . mb_substr(strip_tags($r['question_en']), 0, 150) . "...\n";
    echo "Options: {$r['options_en']}\n";
    echo "Correct: {$r['correct_options']}\n";
    echo "Solution: {$r['solution_en']}\n---\n";
}
