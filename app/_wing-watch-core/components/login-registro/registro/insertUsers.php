<?php
    
    $newUser = json_decode(file_get_contents('php://input'));
	
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL insertar_usuario(?,?,?,?,?,?,?,?,?,?,?)");

    $stmt->bind_param('ssiississsi', $apodo, $password, $cedula, $admin, $foto, $correo, $telefono, $nombre, $pApellido, $sApellido,
                      $tipo);
    
    $apodo = $newUser->apodo;
    $password = $newUser->password;
    $cedula = $newUser->cedula;
    $admin = 0;
    $foto = $newUser->foto;
    $correo = $newUser->email;
    $telefono = $newUser->telefono;
    $nombre = $newUser->cedula;
    $pApellido = $newUser->pApellido;
    $sApellido = $newUser->sApellido;
    $tipo = $newUser->tipo == 'aficionado' ? 1 : 2;

    $stmt->execute();
    echo('registrado');
    $stmt->close();
    
    //echo("Insertado");
    $mysqli->close();

?>