<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$quizzes = $conn->query("
    SELECT l.id, l.title, count(q.id) as q_cnt 
    FROM lesson l 
    JOIN question q ON q.quiz_id = l.id 
    WHERE l.course_id = 15 
    GROUP BY l.id 
    ORDER BY l.title ASC
");

echo "=== COURSE 15 QUIZ HTML PATTERNS ===\n";
while ($qz = $quizzes->fetch_assoc()) {
    $has_ol = 0;
    $has_paren_a = 0;
    $res = $conn->query("SELECT title FROM question WHERE quiz_id = {$qz['id']}");
    while ($r = $res->fetch_assoc()) {
        $dec = html_entity_decode($r['title']);
        if (stripos($dec, '<ol') !== false || stripos($dec, '<li') !== false) {
            $has_ol++;
        }
        if (preg_match('/\(a\)/i', $dec)) {
            $has_paren_a++;
        }
    }
    echo "Quiz #{$qz['id']}: '{$qz['title']}' ({$qz['q_cnt']} questions) -> with <ol>/<li>: {$has_ol}, with (a): {$has_paren_a}\n";
}
