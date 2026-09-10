<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$res = $conn->query("
    SELECT paper_id, count(*) as total,
           SUM(CASE WHEN options_en LIKE '%\"(a)\"%' THEN 1 ELSE 0 END) as bare_options
    FROM pyp_questions 
    WHERE paper_id BETWEEN 3 AND 13
    GROUP BY paper_id
");
while ($r = $res->fetch_assoc()) {
    echo "Paper #{$r['paper_id']}: Total {$r['total']}, Bare (a)-(d) Options: {$r['bare_options']}\n";
}
