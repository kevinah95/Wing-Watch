DELIMITER //
CREATE FUNCTION `insertar_ave`(`ID_PERSONA` INT, `CEDULA` INT, `ESPECIE_ID` INT)
	RETURNS INT
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	INSERT INTO pajaro_x_persona (pajaro_x_persona.CEDULA, pajaro_x_persona.persona_ID, pajaro_x_persona.catalogo_especie_ID) VALUES (`CEDULA`,`ID_PERSONA`,`ESPECIE_ID`);
	SET @last_id = LAST_INSERT_ID(); 
	RETURN @last_id;
END //