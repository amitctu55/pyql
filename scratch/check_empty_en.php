<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$res = $conn->query("
    SELECT paper_id, count(*) as total, 
           SUM(CASE WHEN question_en IS NULL OR question_en = '' THEN 1 ELSE 0 END) as empty_en
    FROM pyp_questions 
    GROUP BY paper_id 
    ORDER BY paper_id ASC
");
while ($r = $res->fetch_assoc()) {
    echo "Paper #{$r['paper_id']}: Total {$r['total']}, Empty EN: {$r['empty_en']}\n";
}
