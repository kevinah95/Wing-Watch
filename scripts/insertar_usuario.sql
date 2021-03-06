DELIMITER //
CREATE DEFINER=`WingWatch`@`localhost` PROCEDURE `insertar_usuario`(IN `NICKNAME` TINYTEXT, IN `HASH` TINYTEXT, IN `PASSWORD` TINYTEXT, IN `CEDULA` INT, IN `ES_ADMIN` INT, IN `FOTO_PERFIL` MEDIUMTEXT, IN `CORREO` TINYTEXT, IN `TELEFONO` INT, IN `NOMBRE` TINYTEXT, IN `P_APELLIDO` TINYTEXT, IN `S_APELLIDO` TINYTEXT, IN `TIPO` INT)
	LANGUAGE SQL
	DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT 'Funci�n que inserta los datos de los usuarios en las diferentes tablas'
BEGIN
DECLARE EXIT HANDLER FOR 1062 
	BEGIN
		SELECT 'SQLException Valor Duplicado';
	ROLLBACK;
END;
START TRANSACTION;
	INSERT INTO wingwatch.persona (persona.NOMBRE,persona.PRIMER_APELLIDO,persona.SEGUNDO_APELLIDO,persona.CEDULA) VALUES (`NOMBRE`,`P_APELLIDO`,`S_APELLIDO`,`CEDULA`);
	SET @last_id = LAST_INSERT_ID(); 
	INSERT INTO wingwatch.telefono (telefono.TELEFONO,telefono.persona_ID) VALUES (`TELEFONO`,@last_id);
	INSERT INTO wingwatch.correo (correo.CORREO,correo.persona_ID) VALUES (`CORREO`,@last_id);
	INSERT INTO wingwatch.usuario (usuario.NICKNAME,usuario.PASSWORD,usuario.HASH,usuario.CEDULA,usuario.ES_ADMIN,usuario.FOTO_PERFIL,usuario.tipo_usuario_ID,usuario.persona_ID) VALUES (`NICKNAME`,`PASSWORD`,`HASH`,`CEDULA`,`ES_ADMIN`,`FOTO_PERFIL`,`TIPO`,@last_id);
	COMMIT;
END //