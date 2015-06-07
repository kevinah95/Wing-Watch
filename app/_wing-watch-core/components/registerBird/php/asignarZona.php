<?php
    
    $nuevaZona = json_decode(file_get_contents('php://input'));
	
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL insertar_zona(?,?)");

    $stmt->bind_param('ii', $idPajaro, $idZona);
    
    $idPajaro = $nuevaZona->idPajaro;
    $idColor = $nuevaZona->idZona;

    $stmt->execute();
    echo('zona lista');
    $stmt->close();
    
    //echo("Insertado");
    $mysqli->close();

?>