<?php
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
    $id_orden = json_decode(file_get_contents('php://input'));
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT ID,DESCRIPCION,catalogo_clase_ID FROM catalogo_orden where ID = ".$id_orden."";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
    {
        if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_ORDEN":"'  . $row["ID"] . '",';
        $outp .= '"ORDEN":"'   . $row["DESCRIPCION"]        . '",';
        $outp .= '"FK_CLASE":"'   . $row["catalogo_clase_ID"]        . '"}';
    }
    $outp .="]";
    echo(utf8_encode($outp));


    /* free result set */
    $result->close();

    /* close connection */
    $mysqli->close();
       
?>