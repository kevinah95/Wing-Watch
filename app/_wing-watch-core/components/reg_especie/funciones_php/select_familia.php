<?php
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
    $id_familia = json_decode(file_get_contents('php://input'));
	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT ID,DESCRIPCION,catalogo_suborden_ID FROM catalogo_familia where ID = ".$id_familia."";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
    {
        if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_FAMILIA":"'  . $row["ID"] . '",';
        $outp .= '"FAMILIA":"'   . $row["DESCRIPCION"]        . '",';
        $outp .= '"FK_SUBORDEN":"'   . $row["catalogo_suborden_ID"]        . '"}';
    }
    $outp .="]";
    echo(utf8_encode($outp));


    /* free result set */
    $result->close();

    /* close connection */
    $mysqli->close();
       
?>