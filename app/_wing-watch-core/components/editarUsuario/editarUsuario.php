<?php
    
    $User = json_decode(file_get_contents('php://input'));
    // print_r($User);
	
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	} 

    $stmt = $mysqli->prepare("CALL update_usuario(?,?,?,?,?,?,?,?,?,?,?,?)");

    $stmt->bind_param('issississsis', $id_usuario, $apodo, $password, $cedula, $foto, $correo, $telefono, $nombre, $pApellido, $sApellido,
                      $tipo, $hash);
    $id_usuario =$User->Id; //NO  sé si está bien
    $apodo = $User->Apodo;
    $password = $User->Password_new;
    $cedula = $User->Cedula;
    $foto = $User->Foto;
    $correo = $User->Correo;
    $telefono = $User->Telefono;
    $nombre = $User->Nombre;
    $pApellido = $User->P_Apellido;
    $sApellido = $User->S_Apellido;
    $tipo = $User->TipoUsuario == 'aficionado' ? 1 : 2;
    $hash = $User->Hash;
    $stmt->execute();
    echo('actualizado');
    $stmt->close();
    
    $mysqli->close();

?>