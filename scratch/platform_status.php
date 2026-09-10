<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$res = $conn->query('SELECT count(*) as c FROM pyp_questions');
echo 'Total questions in pyp_questions: ' . $res->fetch_assoc()['c'] . "\n";
$res2 = $conn->query('SELECT count(*) as c FROM pyp_papers');
echo 'Total papers in pyp_papers: ' . $res2->fetch_assoc()['c'] . "\n\n";

echo "--- EXAMS SUMMARY ---\n";
$res3 = $conn->query('SELECT id, category_id, title, slug, total_tests FROM pyp_exams ORDER BY id ASC');
while ($r = $res3->fetch_assoc()) {
    echo "Exam #{$r['id']} (Cat {$r['category_id']}): {$r['title']} [slug: {$r['slug']}] -> {$r['total_tests']} tests\n";
}

echo "\n--- SAMPLE QUESTION FROM PAPER 22 (CDS 2013-1) ---\n";
$sq = $conn->query("SELECT id, question_en, options_en, correct_options, solution_en FROM pyp_questions WHERE paper_id = 22 LIMIT 1")->fetch_assoc();
echo "Question #{$sq['id']}:\n";
echo "Text: " . substr(strip_tags($sq['question_en']), 0, 150) . "...\n";
echo "Options: {$sq['options_en']}\n";
echo "Correct: {$sq['correct_options']}\n";
echo "Solution: {$sq['solution_en']}\n";
