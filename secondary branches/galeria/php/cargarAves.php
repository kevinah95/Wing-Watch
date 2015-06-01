<?php
$mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "WingWatch");

/* check connection */
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

$query = "SELECT * FROM pajaro_x_persona";
$result = $mysqli->query($query);

while($row = $result->fetch_array())
{
$rows[] = $row;
}

foreach($rows as $row)
{
print_r($row);
echo '<br/>';
}

/* free result set */
$result->close();

/* close connection */
$mysqli->close();
?>