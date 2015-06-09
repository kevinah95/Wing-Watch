<?php
    $entrada = json_decode(file_get_contents('php://input'));
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT C.ID,C.DESCRIPCION FROM CATALOGO_COLOR C JOIN COLORES_X_PAJARO N ON N.CATALOGO_COLOR_ID = C.ID 
                JOIN PAJARO_X_PERSONA P ON P.ID = N.PAJARO_X_PERSONA_ID WHERE P.ID = $entrada->ID";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
    {
        if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_COLOR":"'  . $row["ID"] . '",';
        $outp .= '"COLOR":"'   . $row["DESCRIPCION"]        . '"}';
    }
    $outp .="]";
    echo(utf8_encode($outp));


    /* free result set */
    $result->close();

    /* close connection */
    $mysqli->close();
       
?>