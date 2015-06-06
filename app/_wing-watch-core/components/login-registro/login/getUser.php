<?php
    $dataBaseConnection = new mysqli("localhost", "WingWatch", "WingWatch", "wingwatch");

    if (mysqli_connect_errno()) {
        printf("Connect failed: %s\n", mysqli_connect_error());
        exit();
    } 

    $user = json_decode(file_get_contents('php://input'));  
    $sql = "SELECT 
                usuario.CEDULA, usuario.NICKNAME, usuario.ES_ADMIN, usuario.tipo_usuario_ID, usuario.FOTO_PERFIL,
                persona.NOMBRE, persona.PRIMER_APELLIDO, persona.SEGUNDO_APELLIDO,
                telefono.TELEFONO,
                correo.CORREO
            FROM 
                usuario 
                    INNER JOIN (persona)
                        ON (usuario.persona_ID = persona.ID)
                    INNER JOIN (telefono)
                        ON (usuario.persona_ID = telefono.persona_ID)
                    INNER JOIN (correo)
                        ON (usuario.persona_ID = correo.persona_ID)

            WHERE usuario.NICKNAME = '" .$user->apodo . "';"
            ;
            
    $result = $dataBaseConnection->query($sql);

    if ($result->num_rows > 0) {
        $outp = "[";
    
        while($row = $result->fetch_assoc()) {
            if ($outp != "[") {$outp .= ",";}
            $outp .= '{"Cedula":"'  . $row["CEDULA"] . '",';
            $outp .= '"Nombre":"'   . $row["NOMBRE"]        . '",';
            $outp .= '"Apodo":"'   . $row["NICKNAME"]        . '",';
            $outp .= '"P_Apellido":"'   . $row["PRIMER_APELLIDO"] . '",';
            $outp .= '"S_Apellido":"'   . $row["SEGUNDO_APELLIDO"] . '",';
            $outp .= '"Telefono":"'   . $row["TELEFONO"]   . '",';
            $outp .= '"Es_Admin":"'   . $row["ES_ADMIN"]   . '",';
            $outp .= '"Correo":"'   . $row["CORREO"]   . '",';
            $outp .= '"Foto":"'   . $row["FOTO_PERFIL"]   . '",';
            $outp .= '"TipoUsuario":"'   . $row["tipo_usuario_ID"]   . '"}';
        }

        $outp .="]";

        echo(utf8_decode ($outp));
    } else {
        echo "La base no tiene datos";
    }

    $dataBaseConnection->close();

?>
