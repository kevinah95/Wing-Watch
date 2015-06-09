<?php

    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    $query = "SELECT pajaro_x_persona.ID, usuario.NICKNAME, fotos.url, catalogo_especie.DESCRIPCION
                FROM pajaro_x_persona
                    JOIN (usuario)
                        ON (pajaro_x_persona.persona_ID = usuario.persona_ID)
                    JOIN (fotos)
                        ON (pajaro_x_persona.ID = fotos.pajaro_x_persona_ID)
                    JOIN (catalogo_especie)
                        ON (pajaro_x_persona.catalogo_especie_ID = catalogo_especie.ID)";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    //WHILE ($rows = mysql_fetch_array($query)):
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"NICKNAME":"'  . $row["NICKNAME"] . '",';
        $outp .= '"URL":"'   . $row["url"]        . '",';
        $outp .= '"DESCRIPCION":"'   . $row["DESCRIPCION"]        . '"}';
       // $rows[] = $row;
	}
    //endwhile;
    $outp .="]";
    echo($outp);

    /* free result set */
$result->close();

/* close connection */
$mysqli->close();
       
?>