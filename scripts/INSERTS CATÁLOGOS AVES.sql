INSERT INTO `wingwatch`.`tipo_usuario` (`TIPO`) VALUES ('Aficionado');
INSERT INTO `wingwatch`.`tipo_usuario` (`TIPO`) VALUES ('Ornitólogo');

INSERT INTO `wingwatch`.`catalogo_clase` (`DESCRIPCION`) VALUES ('AVE');

INSERT INTO `wingwatch`.`catalogo_orden` (`DESCRIPCION`, `catalogo_clase_ID`) VALUES ('Passeriformes', 1);

INSERT INTO `wingwatch`.`catalogo_suborden` (`DESCRIPCION`, `NOMBRE_ORDEN`, `catalogo_orden_ID`) VALUES ('No Indica', 'Passeriformes', 1);
INSERT INTO `wingwatch`.`catalogo_suborden` (`DESCRIPCION`, `NOMBRE_ORDEN`, `catalogo_orden_ID`) VALUES ('Tyranni', 'Passeriformes', 1);

INSERT INTO `wingwatch`.`catalogo_familia` (`DESCRIPCION`, `NOMBRE_SUBORDEN`, `catalogo_suborden_ID`) VALUES ('Furnariidae/Dendrocolaptidae', 'No Indica', 1);
INSERT INTO `wingwatch`.`catalogo_familia` (`DESCRIPCION`, `NOMBRE_SUBORDEN`, `catalogo_suborden_ID`) VALUES ('Troglodytidae', 'No Indica', 1);
INSERT INTO `wingwatch`.`catalogo_familia` (`DESCRIPCION`, `NOMBRE_SUBORDEN`, `catalogo_suborden_ID`) VALUES ('Cardinalidae', 'No Indica', 1);
INSERT INTO `wingwatch`.`catalogo_familia` (`DESCRIPCION`, `NOMBRE_SUBORDEN`, `catalogo_suborden_ID`) VALUES ('Incertae Sedis', 'No Indica', 1);

INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Glyphorynchus', 'Furnariidae/Dendrocolaptidae', 1);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Dendrocolaptes', 'Furnariidae/Dendrocolaptidae', 1);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Lepidocolaptes', 'Furnariidae/Dendrocolaptidae', 1);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Cantorchilus', 'Troglodytidae', 2);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Pheugopedius', 'Troglodytidae', 2);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Henicorhina', 'Troglodytidae', 2);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Cyanocompsa', 'Cardinalidae', 3);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Tityra', 'Incertae Sedis', 4);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Coereba', 'Incertae Sedis', 4);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Piprites', 'Incertae Sedis', 4);
INSERT INTO `wingwatch`.`catalogo_genero` (`DESCRIPCION`, `NOMBRE_FAMILIA`, `catalogo_familia_ID`) VALUES ('Insertae Sedis', 'Incertae Sedis', 4);

INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Glyphorhynchus spirurus', 'Glyphorhynchus', 1,'Trepadorcito Pico de Cuña','Wedge-billed Woodcreeper');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Dendrocolaptes Certhia', 'Dendrocolaptes', 2,'Trepador Barreteado','Barred Woodcreeper');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Lepidocolaptes souleyetii', 'Lepidocolaptes', 3,'Trepador Cabecirrayado','Streaked-headed Woodcreeper');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Cantorchilus modestus', 'Cantorchilus', 4, 'Soterré Chinchirigüí','Chinchirigüí, Plain Wren');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Pheugopedius rutilus', 'Pheugopedius', 5, 'Soterré Carimoteado','Rufous-breated Wren');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Henicorhina leucosticta', 'Henicorhina', 6,'Soterré Selvático Pechiblanco','White-breasted Wood-Wren');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Henicorhina leucophrys', 'Henicorhina', 6,'Soterré Selvático´Pechinegris','Gray-breasted Wood-Wren');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Cyanocompsa cyanoides', 'Cyanocompsa', 7,'Piquigrueso Negro Azulado','Blue-black Grosbeak');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Tityra inquisitor', 'Tityra', 8,'Titira Coroninegra','Black-crowned Tiryra');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Coereba flaveola', 'Coereba', 9,'Pinchaflor, Reinita Mielera','Coereba flaveola bananaquit');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Piprites griseiceps', 'Piprites', 10,'Saltarín Cabecigris','Gray-headed Piprites');
INSERT INTO `wingwatch`.`catalogo_especie` (`DESCRIPCION`, `NOMBRE_GENERO`, `catalogo_genero_ID`,`NOMBRE_COMUN`,`NOMBRE_INGLES`)
 VALUES ('Incertae Sedis', 'Incertae Sedis', 11,'Incertae Sedis','Incertae Sedis');

INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES ('Café');
INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES ('Gris');
INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES ('Blanco');
INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES ('Negro');
INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES ('Oliva');
INSERT INTO `wingwatch`.`catalogo_color` (`DESCRIPCION`) VALUES ('Amarillo');

INSERT INTO `wingwatch`.`catalogo_tipo_pico` (`DESCRIPCION`) VALUES ('Corto');
INSERT INTO `wingwatch`.`catalogo_tipo_pico` (`DESCRIPCION`) VALUES ('Largo');
INSERT INTO `wingwatch`.`catalogo_tipo_pico` (`DESCRIPCION`) VALUES ('Grueso');
INSERT INTO `wingwatch`.`catalogo_tipo_pico` (`DESCRIPCION`) VALUES ('Delgado');

INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (0,0);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (1,1);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (2,2);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (3,3);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (4,4);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (5,5);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (6,6);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (7,7);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (8,8);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (9,9);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (10,10);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (11,11);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (12,12);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (13,13);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (14,14);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (15,15);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (16,16);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (17,17);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (18,18);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (19,19);
INSERT INTO `wingwatch`.`catalogo_cantidad_huevos` (`ID`,`CANTIDAD`) VALUES (20,20);

INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Seco Tropical');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Húmedo Tropical');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Muy Húmedo Tropical');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Húmedo Premontano');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Muy Húmedo Premontano');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Pluvial Premontano');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Húmedo Montano Bajo');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Muy Húmedo Montano Bajo');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Pluvial Montano Bajo');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Muy Húmedo Montano');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Bosque Pluvial Montano');
INSERT INTO `wingwatch`.`catalogo_zona_vida` (`DESCRIPCION`) VALUES ('Páramo Pluvial Subalpino');
