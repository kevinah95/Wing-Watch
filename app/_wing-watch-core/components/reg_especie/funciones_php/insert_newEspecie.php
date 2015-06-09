<?php
    
    $objeto = json_decode(file_get_contents('php://input'));
	
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL insert_newEspecie(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    

    $stmt->bind_param('sisisisisss', $orden, $orden_fk, $suborden, $suborden_fk, $familia, $familia_fk, $genero, $genero_fk, $especie, $nombre_comun, $nombre_ingles);
    
    $orden = $objeto->orden->ORDEN;
    $orden_fk = $objeto->orden->FK_CLASE;
    $suborden = $objeto->suborden->SUBORDEN;
    $suborden_fk = $objeto->suborden->FK_ORDEN;
    $familia = $objeto->familia->FAMILIA;
    $familia_fk = $objeto->familia->FK_SUBORDEN;
    $genero = $objeto->genero->GENERO;
    $genero_fk = $objeto->genero->FK_FAMILIA;
    $especie = $objeto->especie;
    $nombre_comun = $objeto->nombre_comun;
    $nombre_ingles = $objeto->nombre_ingles;
    
    $stmt->execute();
    echo('registrado');
    $stmt->close();
    
    // echo("Insertado");
    $mysqli->close();

?>