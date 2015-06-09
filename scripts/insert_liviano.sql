CREATE DEFINER=`WingWatch`@`localhost` PROCEDURE `insert_liviano`(IN `Pico` TINYTEXT, IN `Color` TINYTEXT, IN `Zona` TINYTEXT)
	LANGUAGE SQL
	DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES (Color);
	INSERT INTO `wingwatch`.`catalogo_tipo_pico` (`DESCRIPCION`) VALUES (Pico);
	INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES (Zona);
END