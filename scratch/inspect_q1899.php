<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$r = $conn->query("SELECT id, title, options, correct_answers FROM question WHERE id = 1899")->fetch_assoc();
echo "ID: {$r['id']}\n";
echo "Options: {$r['options']}\n";
echo "Correct: {$r['correct_answers']}\n";
$t = html_entity_decode($r['title']);
$t = preg_replace('/<font[^>]*>/i', '', $t);
$t = str_replace('</font>', '', $t);
$t = preg_replace('/<span[^>]*>/i', '', $t);
$t = str_replace('</span>', '', $t);
echo "Clean:\n" . $t . "\n";
