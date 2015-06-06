<?php 
    
    $user=json_decode(file_get_contents('php://input'));  

    $mysqli = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    } 

    $apodo = $user->apodo;
    $hashpass = $user->hashpass;
    
    $stmt = $mysqli->prepare("SELECT log_in(?,?)");
    $stmt->bind_param('ss', $apodo, $hashpass);
    $stmt->execute();

    $stmt->bind_result($nick);
    $stmt->fetch();
    echo $nick;
    
    $stmt->close();
    
    $mysqli->close();
?>