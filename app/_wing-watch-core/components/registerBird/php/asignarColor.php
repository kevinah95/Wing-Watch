<?php
    
    $nuevoColor = json_decode(file_get_contents('php://input'));
	
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL insertar_color(?,?)");

    $stmt->bind_param('ii', $idPajaro, $idColor);
    
    $idPajaro = $nuevoColor->idPajaro;
    $idColor = $nuevoColor->idColor;

    $stmt->execute();
    echo('color listo');
    $stmt->close();
    
    //echo("Insertado");
    $mysqli->close();

?>