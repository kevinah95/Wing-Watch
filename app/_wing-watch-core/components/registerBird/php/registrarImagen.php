<?php
    $nueva = json_decode(file_get_contents('php://input'));
    $connection = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
    /* check connection */
    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    } 

    $NOMBRE = $nueva->NOMBRE;
    $URL = $nueva->URL; 
    $NUM = $nueva->ID;
    $ID = intval($NUM);
    echo gettype($ID);

    $stmt = $connection->prepare("CALL insertar_imagenes(?,?,?)");
    $stmt->bind_param('ssi', $NOMBRE, $URL, $ID);
    $stmt->execute();
    
    $stmt->close();

    //echo("Insertado");
    $connection->close();

?>