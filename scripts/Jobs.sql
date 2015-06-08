CREATE EVENT insertarCorreos ON SCHEDULE EVERY 1 DAY STARTS '2015-06-08 23:55:00' DO
INSERT INTO email (CORREO)
  SELECT correo.CORREO
    FROM correo
      JOIN (usuario)
        ON (usuario.persona_ID = correo.persona_ID)
    WHERE usuario.tipo_usuario_ID = 2

-- Luego corren el otro

CREATE EVENT limpiarCorreos ON SCHEDULE EVERY 1 DAY STARTS '2015-06-08 23:54:00' DO
TRUNCATE TABLE email;