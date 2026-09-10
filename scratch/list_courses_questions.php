<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

echo "--- All Courses & Questions Count in DB ---\n";
$res = $conn->query("
    SELECT c.id, c.title, count(q.id) as q_count, count(distinct l.id) as lesson_count
    FROM course c 
    LEFT JOIN lesson l ON l.course_id = c.id 
    LEFT JOIN question q ON q.quiz_id = l.id 
    GROUP BY c.id 
    ORDER BY c.id ASC
");
while ($r = $res->fetch_assoc()) {
    echo "Course #{$r['id']}: '{$r['title']}' -> {$r['lesson_count']} lessons, {$r['q_count']} questions\n";
}
