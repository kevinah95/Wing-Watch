DELIMITER //
CREATE DEFINER=`WingWatch`@`localhost` FUNCTION `insertar_ave`(`ID_PERSONA` INT, `CEDULA` INT, `ESPECIE_ID` INT, `CANT_HUEVOS_MENOR` INT, `CANT_HUEVOS_MAYOR` INT, `ID_COLOR` INT, `ID_PICO` INT, `ID_ZONA` INT)
	RETURNS int(11)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	INSERT INTO pajaro_x_persona (CEDULA, persona_ID, catalogo_especie_ID,catalogo_cantidad_huevos_ID_menor,catalogo_cantidad_huevos_ID_mayor) VALUES (`CEDULA`,`ID_PERSONA`,`ESPECIE_ID`, `CANT_HUEVOS_MENOR`, `CANT_HUEVOS_MAYOR`);
	SET @last_id = LAST_INSERT_ID(); 
	INSERT INTO COLORES_X_PAJARO (pajaro_x_persona_ID, catalogo_color_ID) values (@last_id,`ID_COLOR`);
	INSERT INTO PICOS_X_PAJARO (pajaro_x_persona_ID, catalogo_tipo_pico_ID) values (@last_id,`ID_PICO`);
	INSERT INTO ZONAS_X_PAJARO (pajaro_x_persona_ID, catalogo_zona_vida_ID) values (@last_id,`ID_ZONA`);
	RETURN @last_id;
END //