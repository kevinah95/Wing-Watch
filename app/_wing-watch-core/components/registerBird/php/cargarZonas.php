<?php
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT ID, DESCRIPCION FROM CATALOGO_ZONA_VIDA";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_ZONA":"'  . $row["ID"] . '",';
        $outp .= '"DESCRIPCION":"'   . $row["DESCRIPCION"] . '"}';     
	}
    $outp .="]";
    echo($outp);

    /* free result set */
$result->close();

/* close connection */
$mysqli->close();
       

       ?>