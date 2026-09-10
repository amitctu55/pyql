<?php
$conn = new mysqli('127.0.0.1', 'root', '', 'pyql', 3307);
$res = $conn->query("DESCRIBE pyp_papers");
while ($r = $res->fetch_assoc()) {
    echo "{$r['Field']} - {$r['Type']}\n";
}
