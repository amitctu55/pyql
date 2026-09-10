<?php
$lines = file('c:/xampp/htdocs/pyql/application/controllers/Admin.php');
foreach ($lines as $i => $l) {
    if (stripos($l, 'course_form') !== false) {
        echo ($i + 1) . ': ' . trim($l) . "\n";
    }
}
