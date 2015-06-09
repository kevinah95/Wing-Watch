<?php
    $entrada = json_decode(file_get_contents('php://input'));
    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");
    /* check connection */
    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    }

    // query the database 

    $query = "SELECT URL FROM FOTOS WHERE PAJARO_X_PERSONA_ID = $entrada->ID";
    $result = $mysqli->query($query);
    // fetch the result / convert resulte in to array 
    $outp = "[";
    while($row = $result->fetch_array())
    {
        if ($outp != "[") {$outp .= ",";}
        $outp .= '{"ID_PIC":"'  . $row["ID"] . '",';
        $outp .= '"PIC":"'   . $row["URL"]    . '"}';
    }
    $outp .="]";
    echo(utf8_encode($outp));


    /* free result set */
    $result->close();

    /* close connection */
    $mysqli->close();
       
?>