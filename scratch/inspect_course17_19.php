<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$conn->set_charset('utf8mb4');

foreach ([17, 19] as $cid) {
    echo "====================================================\n";
    echo " COURSE {$cid} DETAILS\n";
    echo "====================================================\n";
    $c_res = $conn->query("SELECT id, title, category_id, sub_category_id, short_description FROM course WHERE id = {$cid}");
    print_r($c_res->fetch_assoc());

    echo "\n--- Lessons / Quizzes in Course {$cid} ---\n";
    $lessons = $conn->query("
        SELECT l.id, l.title, l.lesson_type, count(q.id) as q_count 
        FROM lesson l 
        LEFT JOIN question q ON q.quiz_id = l.id 
        WHERE l.course_id = {$cid} 
        GROUP BY l.id 
        ORDER BY l.order ASC, l.id ASC
    ");
    $total_q = 0;
    while ($row = $lessons->fetch_assoc()) {
        echo "Lesson #{$row['id']}: '{$row['title']}' [type: {$row['lesson_type']}] -> {$row['q_count']} questions\n";
        $total_q += (int)$row['q_count'];
    }
    echo "Total questions in Course {$cid}: {$total_q}\n";

    echo "\n--- Sample question from Course {$cid} ---\n";
    $sample_q = $conn->query("
        SELECT q.id, q.title, q.options, q.correct_answers, q.quiz_id 
        FROM question q 
        JOIN lesson l ON q.quiz_id = l.id 
        WHERE l.course_id = {$cid} 
        LIMIT 2
    ");
    while ($sq = $sample_q->fetch_assoc()) {
        echo "Question ID: {$sq['id']} (Quiz {$sq['quiz_id']})\n";
        $dec = html_entity_decode($sq['title'], ENT_QUOTES | ENT_HTML5, 'UTF-8');
        echo "Title (first 250 chars):\n" . mb_substr(strip_tags($dec), 0, 250) . "...\n";
        echo "Raw HTML (first 250 chars):\n" . mb_substr($dec, 0, 250) . "...\n";
        echo "Options: {$sq['options']}\n";
        echo "Correct: {$sq['correct_answers']}\n\n";
    }
}
