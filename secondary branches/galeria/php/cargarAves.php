<?php
	//$user = json_decode(file_get_contents('php://input'));
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	/* check connection */
	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    // query the database 

    $query = "SELECT * FROM usuario WHERE NICKNAME = 'Huevomon'";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    //WHILE ($rows = mysql_fetch_array($query)):
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"NICKNAME":"'  . $row["NICKNAME"] . '",';
        $outp .= '"PASSWORD":"'   . $row["PASSWORD"]        . '",';
        $outp .= '"CEDULA:"'   . $row["CEDULA"]        . '",';
        $outp .= '"ES_ADMIN":"'   . $row["ES_ADMIN"] . '"}';     
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