<?php
    
    $newUser = json_decode(file_get_contents('php://input'));
    print_r($newUser);
	/*
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL update_usuario(?,?,?,?,?,?,?,?,?,?,?)");

    $stmt->bind_param('issississsi', $id_usuario, $apodo, $password, $cedula, $foto, $correo, $telefono, $nombre, $pApellido, $sApellido,
                      $tipo);
    $id_usuario = newUser->id; //NO  sé si está bien
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
    echo('actualizado');
    $stmt->close();
    
    $mysqli->close();*/

?>