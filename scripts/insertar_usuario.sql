DELIMITER //
CREATE DEFINER=`WingWatch`@`localhost` PROCEDURE `insertar_usuario`(IN `NICKNAME` TINYTEXT, IN `HASH` TINYTEXT, IN `PASSWORD` TINYTEXT, IN `CEDULA` INT, IN `ES_ADMIN` INT, IN `FOTO_PERFIL` MEDIUMTEXT, IN `CORREO` TINYTEXT, IN `TELEFONO` INT, IN `NOMBRE` TINYTEXT, IN `P_APELLIDO` TINYTEXT, IN `S_APELLIDO` TINYTEXT, IN `TIPO` INT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN
	SELECT 'SQLException invoked';
	ROLLBACK;
END;
START TRANSACTION;
<<<<<<< HEAD
	INSERT INTO wingwatch.persona (persona.NOMBRE,persona.PRIMER_APELLIDO,persona.SEGUNDO_APELLIDO,persona.CEDULA) VALUES (`NOMBRE`,`P_APELLIDO`,`S_APELLIDO`,`CEDULA`);
	SET @last_id = LAST_INSERT_ID(); 
	INSERT INTO wingwatch.telefono (telefono.TELEFONO,telefono.persona_ID) VALUES (`TELEFONO`,@last_id);
	INSERT INTO wingwatch.correo (correo.CORREO,correo.persona_ID) VALUES (`CORREO`,@last_id);
	INSERT INTO wingwatch.usuario (usuario.NICKNAME,usuario.PASSWORD,usuario.CEDULA,usuario.ES_ADMIN,usuario.FOTO_PERFIL,usuario.tipo_usuario_ID,usuario.persona_ID) VALUES (`NICKNAME`,`PASSWORD`,`CEDULA`,`ES_ADMIN`,`FOTO_PERFIL`,`TIPO`,@last_id);
	COMMIT;
=======
INSERT INTO wingwatch.persona (persona.NOMBRE,persona.PRIMER_APELLIDO,persona.SEGUNDO_APELLIDO,persona.CEDULA) VALUES (`NOMBRE`,`P_APELLIDO`,`S_APELLIDO`,`CEDULA`);
SET @last_id = LAST_INSERT_ID(); 
INSERT INTO wingwatch.telefono (telefono.TELEFONO,telefono.persona_ID) VALUES (`TELEFONO`,@last_id);
INSERT INTO wingwatch.correo (correo.CORREO,correo.persona_ID) VALUES (`CORREO`,@last_id);
INSERT INTO wingwatch.usuario (usuario.NICKNAME, usuario.HASH, usuario.PASSWORD,usuario.CEDULA,usuario.ES_ADMIN,usuario.FOTO_PERFIL,usuario.tipo_usuario_ID,usuario.persona_ID) VALUES (`NICKNAME`,`HASH`,`PASSWORD`,`CEDULA`,`ES_ADMIN`,`FOTO_PERFIL`,`TIPO`,@last_id);
COMMIT;
>>>>>>> fdc345cf7881866ff36349535f48e8387afa1a3b
END //