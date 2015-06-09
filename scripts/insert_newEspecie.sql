CREATE PROCEDURE `insert_newEspecie`(IN `Orden` TINYTEXT, IN `Orden_FK` INT, IN `Suborden` TINYTEXT, IN `Suborden_FK` INT, IN `Familia` TINYTEXT, IN `Familia_FK` INT, IN `Genero` TINYTEXT, IN `Genero_FK` INT, IN `Especie` TINYTEXT, IN `Nombre_Comun` TINYTEXT, IN `Nombre_Ingles` TINYTEXT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	INSERT INTO `wingwatch`.`catalogo_orden` (`DESCRIPCION`, `catalogo_clase_ID`) VALUES (Orden, 1);
	INSERT INTO `wingwatch`.`catalogo_suborden` (`DESCRIPCION`, `NOMBRE_ORDEN`, `catalogo_orden_ID`) VALUES (Suborden, Orden, Orden_FK);
	INSERT INTO `wingwatch`.`catalogo_familia` (`DESCRIPCION`, `NOMBRE_SUBORDEN`, `catalogo_suborden_ID`) VALUES (Familia, Suborden, Suborden_FK);
	INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES (Genero, Familia, Familia_FK);
	INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 	VALUES (Especie, Genero, Genero_FK,Nombre_Comun,Nombre_Ingles);
END