<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$quizzes = [625, 626, 627, 629, 581, 606, 607, 608, 630];
foreach ($quizzes as $qid) {
    $q_res = $conn->query("SELECT l.title as quiz_title, q.id, q.title, q.options, q.correct_answers FROM question q JOIN lesson l ON q.quiz_id = l.id WHERE q.quiz_id = {$qid} LIMIT 2");
    while ($row = $q_res->fetch_assoc()) {
        echo "Quiz {$row['quiz_title']} (ID: {$qid}) - Question ID {$row['id']}:\n";
        echo "Options: {$row['options']}\n";
        echo "Correct: {$row['correct_answers']}\n";
        $dec = html_entity_decode($row['title'], ENT_QUOTES | ENT_HTML5, 'UTF-8');
        echo "Clean snippet: " . mb_substr(strip_tags($dec), 0, 250) . "\n";
        echo "Raw snippet: " . mb_substr($dec, 0, 250) . "\n";
        echo "----------------------------------------------------\n";
    }
}
