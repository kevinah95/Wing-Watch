<?php

	$dataBaseConnection = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

	$firstSQL = "SELECT usuario.tipo_usuario_ID, correo.CORREO 
					FROM 
						usuario 
							INNER JOIN (correo)
								ON (correo.persona_ID = usuario.persona_ID)
					WHERE
						usuario.tipo_usuario_ID = 2;";
	$secondSQL = "SELECT pajaro_x_persona.catalogo_especie_ID, catalogo_especie.DESCRIPCION, usuario.NICKNAME, correo.CORREO, persona.NOMBRE
					FROM
						pajaro_x_persona
							INNER JOIN (correo)
								ON (pajaro_x_persona.persona_ID = correo.persona_ID)
							INNER JOIN (usuario)
								ON (pajaro_x_persona.persona_ID = usuario.persona_ID)
							INNER JOIN (catalogo_especie)
								ON (pajaro_x_persona.catalogo_especie_ID = catalogo_especie.ID)
							INNER JOIN (persona)
								ON (pajaro_x_persona.persona_ID = persona.ID)
					WHERE	
						pajaro_x_persona.catalogo_especie_ID = 12;";

    $result = $dataBaseConnection->query($firstSQL);
    $Correos = "";
    if ($result->num_rows > 0) {    
	    while($row = $result->fetch_assoc()) {
	    	if($Correos != "") {
	        	$Correos .= ', ' . $row["CORREO"];
	        }
	        else {
	        	$Correos .= $row["CORREO"];
	        }
	    }
    } else {
    	echo "La base no tiene datos";
    }

    $result = $dataBaseConnection->query($secondSQL);
    $Mensaje = "";
	if ($result->num_rows > 0) {    
	    while($row = $result->fetch_assoc()) {
	        $Mensaje .= 'Un ' . $row["DESCRIPCION"] . ' subido por ' . $row["NICKNAME"] . ' (' . $row["NOMBRE"] .')' . ' con el correo ' . $row["CORREO"] . ' necesita ser clasificado.' . "\r\n";
	    }
    } else {
    	echo "La base no tiene datos";
    }

    $dataBaseConnection->close();

	mail($Correos,'WingWatch te necesita',$Mensaje);		   

	echo "Mensaje enviado"; 
?>