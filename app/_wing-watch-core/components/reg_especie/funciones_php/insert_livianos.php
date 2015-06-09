<?php
    
    $objeto = json_decode(file_get_contents('php://input'));
	
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL insert_liviano(?, ?, ?)");
    

    $stmt->bind_param('sss', $pico, $color, $zona);
    
    $pico = $objeto->pico;
    $color = $objeto->color;
    $zona = $objeto->zona_vida;
    
    $stmt->execute();
    echo('registrado');
    $stmt->close();
    
    // echo("Insertado");
    $mysqli->close();

?>