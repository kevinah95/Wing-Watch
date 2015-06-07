DELIMITER //
CREATE DEFINER=`WingWatch`@`localhost` PROCEDURE `update_usuario`(IN `ID_USUARIO` INT, IN `NICKNAME` TINYTEXT, IN `PASSWORD` TINYTEXT, IN `CEDULA` INT, IN `FOTO_PERFIL` MEDIUMTEXT, IN `CORREO` TINYTEXT, IN `TELEFONO` INT, IN `NOMBRE` TINYTEXT, IN `P_APELLIDO` TINYTEXT, IN `S_APELLIDO` TINYTEXT, IN `TIPO` INT, IN `Hash` TINYTEXT)
	LANGUAGE SQL
	DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
START TRANSACTION;
	UPDATE wingwatch.persona SET persona.NOMBRE = `NOMBRE`, persona.PRIMER_APELLIDO = `P_APELLIDO`,persona.SEGUNDO_APELLIDO = `S_APELLIDO`, persona.CEDULA = `CEDULA` WHERE persona.ID = `ID_USUARIO`;
	UPDATE wingwatch.telefono SET telefono.TELEFONO = `TELEFONO` WHERE telefono.persona_ID = `ID_USUARIO`;
	UPDATE wingwatch.correo SET correo.CORREO = `CORREO` WHERE correo.persona_ID = `ID_USUARIO`;
	UPDATE wingwatch.usuario SET usuario.NICKNAME = `NICKNAME`,usuario.PASSWORD = `PASSWORD`,usuario.CEDULA = `CEDULA`, usuario.FOTO_PERFIL = `FOTO_PERFIL`,usuario.tipo_usuario_ID = `TIPO`, usuario.HASH = `Hash` WHERE usuario.ID = `ID_USUARIO`;
COMMIT;
END //

-- Prueba
-- CALL `update_usuario`('2', 'K', 'K', '1234', '1', 'djaskldjalksd', 'kevin', '1234', 'Kevin', 'Kevin', 'Kevin', '2');