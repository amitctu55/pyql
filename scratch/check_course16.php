<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$res = $conn->query("
    SELECT p.id as paper_id, p.title as paper_title, count(q.id) as q_count 
    FROM pyp_papers p 
    LEFT JOIN pyp_questions q ON q.paper_id = p.id 
    WHERE p.exam_id = 6 
    GROUP BY p.id
");
echo "--- CAPF Papers & Questions Count ---\n";
while ($row = $res->fetch_assoc()) {
    echo "Paper #{$row['paper_id']}: {$row['paper_title']} -> {$row['q_count']} questions\n";
}

$sample_q = $conn->query("
    SELECT q.id, q.paper_id, q.question_en, q.options_en, q.correct_options 
    FROM pyp_questions q 
    WHERE q.paper_id = 14 
    LIMIT 3
");
echo "\n--- Sample Questions in Paper #14 ---\n";
while ($row = $sample_q->fetch_assoc()) {
    echo "Question #{$row['id']}:\n";
    echo "Text: " . mb_substr(strip_tags($row['question_en']), 0, 120) . "...\n";
    echo "Options: {$row['options_en']}\n";
    echo "Correct: {$row['correct_options']}\n\n";
}
