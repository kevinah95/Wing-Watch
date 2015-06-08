<?php
	$especie = json_decode(file_get_contents('php://input'));
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT E.ID,E.NOMBRE_COMUN,E.NOMBRE_INGLES,E.DESCRIPCION AS ESPECIE,G.DESCRIPCION AS GENERO,F.DESCRIPCION AS FAMILIA,S.DESCRIPCION AS SUBORDEN,O.DESCRIPCION AS ORDEN,C.DESCRIPCION AS CLASE FROM 
                CATALOGO_ESPECIE E JOIN CATALOGO_GENERO G ON E.CATALOGO_GENERO_ID = G.ID JOIN CATALOGO_FAMILIA F ON 
                G.CATALOGO_FAMILIA_ID = F.ID JOIN CATALOGO_SUBORDEN S ON F.CATALOGO_SUBORDEN_ID = S.ID JOIN CATALOGO_ORDEN O ON 
                S.CATALOGO_ORDEN_ID = O.ID JOIN CATALOGO_CLASE C ON O.CATALOGO_CLASE_ID = C.ID";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_ESPECIE":"'  . $row["ID"] . '",';
        $outp .= '"ESPECIE":"'   . $row["ESPECIE"]        . '",';
        $outp .= '"NOMBRE_COMUN":"'   . $row["NOMBRE_COMUN"]        . '",';
        $outp .= '"NOMBRE_INGLES":"'   . $row["NOMBRE_INGLES"]        . '",';
        $outp .= '"GENERO":"'   . $row["GENERO"]        . '",';
        $outp .= '"FAMILIA":"'   . $row["FAMILIA"]        . '",';
        $outp .= '"SUBORDEN":"'   . $row["SUBORDEN"]        . '",';
        $outp .= '"ORDEN":"'   . $row["ORDEN"]        . '",';
        $outp .= '"CLASE":"'   . $row["CLASE"] . '"}';     
	}
    $outp .="]";
    echo($outp);

    /* free result set */
$result->close();

/* close connection */
$mysqli->close();
       

       ?>