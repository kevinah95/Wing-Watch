<?php
    $nuevaAve = json_decode(file_get_contents('php://input'));
    $connection = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $sql ="SELECT insertar_usuario($nuevaAve->idPersona, $nuevaAve->cedula, $nuevaAve->idEspecie)";
    $result = $connection->query($sql);

    echo($result);

    //echo("Insertado");
    $connection->close();

?>