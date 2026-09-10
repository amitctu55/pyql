<?php
function test_url($url) {
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 10);
    $response = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return ['code' => $http_code, 'len' => strlen($response)];
}

$urls = [
    'Portal' => 'http://localhost/pyql/test-series',
    'GS 2013 Instructions' => 'http://localhost/pyql/test-series/paper/upsc-cse-prelims-gs-2013/instructions',
    'UPSC CSE Exam Page' => 'http://localhost/pyql/test-series/exam/upsc-cse-prelims',
];

foreach ($urls as $name => $url) {
    $res = test_url($url);
    echo "{$name}: HTTP {$res['code']}, Response Length: {$res['len']} bytes\n";
}
