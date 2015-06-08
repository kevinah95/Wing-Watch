<?php
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
    $id_suborden = json_decode(file_get_contents('php://input'));
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT ID,DESCRIPCION,catalogo_orden_ID FROM catalogo_suborden where ID = ".$id_suborden."";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
    {
        if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_SUBORDEN":"'  . $row["ID"] . '",';
        $outp .= '"SUBORDEN":"'   . $row["DESCRIPCION"]        . '",';
        $outp .= '"FK_ORDEN":"'   . $row["catalogo_orden_ID"]        . '"}';
    }
    $outp .="]";
    echo(utf8_encode($outp));


    /* free result set */
    $result->close();

    /* close connection */
    $mysqli->close();
       
?>