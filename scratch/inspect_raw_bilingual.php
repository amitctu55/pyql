<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$conn->set_charset('utf8mb4');

$q = $conn->query("SELECT id, title FROM question WHERE id = 2531")->fetch_assoc();
echo "--- Q 2531 RAW DECODED ---\n";
echo html_entity_decode($q['title']) . "\n\n";

$q2 = $conn->query("SELECT id, title FROM question WHERE id = 2406")->fetch_assoc();
echo "--- Q 2406 RAW DECODED ---\n";
echo html_entity_decode($q2['title']) . "\n\n";
