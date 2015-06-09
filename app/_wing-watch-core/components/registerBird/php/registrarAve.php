<?php
    $nuevaAve = json_decode(file_get_contents('php://input'));
    $connection = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $Id_Usuario = $nuevaAve->Id_Usuario;
    $cedula = $nuevaAve->cedula;
    $especie=$nuevaAve->especie;
    $cantHuevosMin= $nuevaAve->cantHuevosMin;
    $cantHuevosMax = $nuevaAve->cantHuevosMax;
    $colorA=$nuevaAve->colorA;
    $pico=$nuevaAve->pico;
    $zona=$nuevaAve->zona;

    $stmt = $connection->prepare("SELECT insertar_ave(?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param('iiiiiiii', $Id_Usuario, $cedula, $especie, $cantHuevosMin, $cantHuevosMax, $colorA, $pico, $zona);

    $stmt->execute();

    $stmt->bind_result($nick);
    $stmt->fetch();
    echo $nick;
    
    $stmt->close();

    //echo("Insertado");
    $connection->close();

?>