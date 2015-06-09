<?php

    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    $query = "SELECT DISTINCT pajaro_x_persona.ID, usuario.NICKNAME, fotos.url, catalogo_especie.DESCRIPCION AS ESPECIE,
     catalogo_especie.ID, catalogo_especie.NOMBRE_COMUN, 
         catalogo_especie.NOMBRE_INGLES,G.DESCRIPCION AS GENERO,F.DESCRIPCION AS FAMILIA,
         S.DESCRIPCION AS SUBORDEN,O.DESCRIPCION AS ORDEN,C.DESCRIPCION AS CLASE, catalogo_color.DESCRIPCION AS COLOR, catalogo_zona_vida.DESCRIPCION AS ZONA, catalogo_tipo_pico.DESCRIPCION AS PICO
                FROM pajaro_x_persona
                    JOIN (usuario)
                        ON (pajaro_x_persona.persona_ID = usuario.persona_ID)
                    JOIN (fotos)
                        ON (pajaro_x_persona.ID = fotos.pajaro_x_persona_ID)
                    JOIN (catalogo_especie)
                        ON (pajaro_x_persona.catalogo_especie_ID = catalogo_especie.ID)
                     JOIN CATALOGO_GENERO G ON catalogo_especie.CATALOGO_GENERO_ID = G.ID JOIN CATALOGO_FAMILIA F ON 
                G.CATALOGO_FAMILIA_ID = F.ID JOIN CATALOGO_SUBORDEN S ON F.CATALOGO_SUBORDEN_ID = S.ID 
                     JOIN CATALOGO_ORDEN O ON 
                S.CATALOGO_ORDEN_ID = O.ID JOIN CATALOGO_CLASE C ON O.CATALOGO_CLASE_ID = C.ID
                JOIN colores_x_pajaro ON colores_x_pajaro.pajaro_x_persona_ID = pajaro_x_persona.ID
                     JOIN catalogo_color ON catalogo_color.ID = colores_x_pajaro.catalogo_color_ID
                     JOIN zonas_x_pajaro ON zonas_x_pajaro.pajaro_x_persona_ID = pajaro_x_persona.ID
                     JOIN catalogo_zona_vida ON catalogo_zona_vida.ID = zonas_x_pajaro.catalogo_zona_vida_ID
                     JOIN picos_x_pajaro ON picos_x_pajaro.pajaro_x_persona_ID = pajaro_x_persona.ID
                     JOIN catalogo_tipo_pico ON catalogo_tipo_pico.ID = picos_x_pajaro.catalogo_tipo_pico_ID";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    //WHILE ($rows = mysql_fetch_array($query)):
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"NICKNAME":"'  . $row["NICKNAME"] . '",';
        $outp .= '"NOMBRE_INGLES":"'   . $row["NOMBRE_INGLES"]        . '",';
        $outp .= '"GENERO":"'   . $row["GENERO"]        . '",';
        $outp .= '"NOMBRE_COMUN":"'   . $row["NOMBRE_COMUN"]        . '",';
        $outp .= '"FAMILIA":"'   . $row["FAMILIA"]        . '",';
        $outp .= '"SUBORDEN":"'   . $row["SUBORDEN"]        . '",';
        $outp .= '"ORDEN":"'   . $row["ORDEN"]        . '",';
        $outp .= '"CLASE":"'   . $row["CLASE"]        . '",';
        $outp .= '"URL":"'   . $row["url"]        . '",';
        $outp .= '"COLOR":"'   . $row["COLOR"]        . '",';
        $outp .= '"ZONA":"'   . $row["ZONA"]        . '",';
        $outp .= '"PICO":"'   . $row["PICO"]        . '",';
        $outp .= '"DESCRIPCION":"'   . $row["ESPECIE"]. '"}';
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