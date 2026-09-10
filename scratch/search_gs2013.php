<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

echo "--- Search for GS2013 in lesson table ---\n";
$res = $conn->query("SELECT l.id, l.title, l.course_id, c.title as course_title, count(q.id) as q_cnt 
                     FROM lesson l 
                     JOIN course c ON c.id = l.course_id 
                     LEFT JOIN question q ON q.quiz_id = l.id 
                     WHERE l.title LIKE '%GS2013%' OR l.title LIKE '%2013%'
                     GROUP BY l.id");
while ($r = $res->fetch_assoc()) {
    echo "Lesson #{$r['id']}: '{$r['title']}' (Course #{$r['course_id']}: {$r['course_title']}) -> {$r['q_cnt']} questions\n";
}
