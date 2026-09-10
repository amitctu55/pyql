<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$quizzes = [
    595 => '2014',
    596 => '2015',
    599 => '2018',
    601 => '2020',
    602 => '2021',
    603 => '2022',
    604 => '2023',
    605 => '2024'
];

foreach ($quizzes as $qid => $year) {
    echo "\n===============================\n";
    echo "QUIZ {$qid} (Year {$year})\n";
    echo "===============================\n";
    $q = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE quiz_id = {$qid} LIMIT 2");
    while ($row = $q->fetch_assoc()) {
        echo "ID: {$row['id']}\n";
        echo "Options: {$row['options']}\n";
        echo "Correct: {$row['correct_answers']}\n";
        $decoded = html_entity_decode($row['title'], ENT_QUOTES | ENT_HTML5, 'UTF-8');
        echo "Title (first 300 chars):\n" . substr(strip_tags($decoded), 0, 300) . "\n";
        echo "Raw HTML (first 300 chars):\n" . substr($decoded, 0, 300) . "\n---\n";
    }
}
