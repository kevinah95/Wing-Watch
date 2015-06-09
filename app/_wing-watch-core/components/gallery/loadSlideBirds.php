<?php
    
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

	if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}

    $query = "SELECT fotos.url FROM fotos;";
    $result = $mysqli->query($query);
    $outp = "[";
    while($row = $result->fetch_array())
	{
		if ($outp != "[") {$outp .= ",";}
        $outp .= '{"slideFoto":"'  . $row["url"] . '"}';   
	}
    $outp .="]";
    echo($outp);

    
    $result->close();
    $mysqli->close();
       
?>