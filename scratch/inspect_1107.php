<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$r = $conn->query("SELECT id, title FROM question WHERE id = 1107")->fetch_assoc();
$t = html_entity_decode($r['title']);
$t = preg_replace('/<font[^>]*>/i', '', $t);
$t = str_replace('</font>', '', $t);
$t = preg_replace('/<span[^>]*>/i', '', $t);
$t = str_replace('</span>', '', $t);
echo $t;
