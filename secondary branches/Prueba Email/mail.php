<?php
	$destino = $_POST['Para'];
	$asunto = $_POST['Asunto'];
	$mensaje = $_POST['Correo'];
	$headers = 'From:'.$_POST['Para']."\r\n".
			   'Reply-To:'.$_POST['Para']."\r\n".
			   'X-Mailer:PHP/'.phpversion();

	mail($destino,$asunto,$mensaje,$headers);

	echo $destino;
	echo $asunto;
	echo $mensaje;
	echo "Mensaje enviado"; 
?>