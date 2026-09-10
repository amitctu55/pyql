<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

echo "Checking if any questions mention 'UPPSC' or are in quiz 583-594:\n";
$res = $conn->query("SELECT count(*) as c FROM question WHERE quiz_id BETWEEN 583 AND 594");
echo "Questions in quizzes 583-594: " . $res->fetch_assoc()['c'] . "\n";

$res2 = $conn->query("SELECT count(*) as c FROM question WHERE title LIKE '%UPPSC%' OR title LIKE '%उत्तर प्रदेश लोक सेवा आयोग%'");
echo "Questions matching UPPSC in title: " . $res2->fetch_assoc()['c'] . "\n";

$cat_res = $conn->query("SELECT * FROM category WHERE id IN (19, 27, 28, 30, 32)");
echo "\nCategory details:\n";
while ($cat = $cat_res->fetch_assoc()) {
    echo "Cat {$cat['id']}: {$cat['name']} (parent: {$cat['parent']})\n";
}
