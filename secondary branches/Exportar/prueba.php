<?php

$db = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    } 

$query = "SELECT * FROM catalogo_genero";
$result = $db->query($query);
if (!$result) die('Couldn\'t fetch records');
$headers = $result->fetch_fields();
foreach($headers as $header) {
    $head[] = $header->name;
}
$fp = fopen('php://output', 'w');

if ($fp && $result) {
    header('Content-Type: text/csv');
    header('Content-Disposition: attachment; filename="catalogo_genero.csv"');
    header('Pragma: no-cache');
    header('Expires: 0');
    fputcsv($fp, array_values($head)); 
    while ($row = $result->fetch_array(MYSQLI_NUM)) {
        fputcsv($fp, array_values($row));
    }
    die;
}

?>