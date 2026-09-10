<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

echo "=== EXAM 6 DETAILS ===\n";
$exam = $conn->query("SELECT * FROM pyp_exams WHERE id = 6")->fetch_assoc();
print_r($exam);

echo "\n=== PAPERS FOR EXAM 6 ===\n";
$res = $conn->query("SELECT id, title, slug, paper_type, year, shift, duration_minutes, total_marks, positive_marks, negative_marks, total_questions, is_free, sections_json, status FROM pyp_papers WHERE exam_id = 6 ORDER BY id ASC");
while ($p = $res->fetch_assoc()) {
    echo "ID: {$p['id']} | {$p['title']} | Year: {$p['year']} | Qs: {$p['total_questions']} | Marks: {$p['total_marks']} (+{$p['positive_marks']}, -{$p['negative_marks']}) | Free: {$p['is_free']} | Status: {$p['status']}\n";
    echo "Sections: {$p['sections_json']}\n";
}

echo "\n=== QUESTION DETAILS SAMPLE FOR PAPER 14, 15, 20, 21 ===\n";
foreach ([14, 15, 20, 21] as $pid) {
    $q = $conn->query("SELECT id, paper_id, section_id, question_type, question_en, options_en, correct_options, solution_en FROM pyp_questions WHERE paper_id = {$pid} LIMIT 1")->fetch_assoc();
    echo "\nPaper {$pid} sample question (ID: {$q['id']}):\n";
    echo "Section: {$q['section_id']} | Type: {$q['question_type']} | Correct: {$q['correct_options']}\n";
    echo "Question EN: " . mb_substr(strip_tags($q['question_en']), 0, 150) . "...\n";
    echo "Options: {$q['options_en']}\n";
    echo "Solution: {$q['solution_en']}\n";
}
