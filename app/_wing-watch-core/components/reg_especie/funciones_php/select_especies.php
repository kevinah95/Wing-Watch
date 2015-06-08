<?php
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT id, descripcion,catalogo_genero_ID from catalogo_especie";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_ESPECIE":"'  . $row["id"] . '",';
        $outp .= '"ESPECIE":"'   . $row["descripcion"]        . '",';
        $outp .= '"FK_GENERO":"'   . $row["catalogo_genero_ID"]        . '"}';
	}
    $outp .="]";
    echo(utf8_encode($outp));


    /* free result set */
    $result->close();

    /* close connection */
    $mysqli->close();
       
?>