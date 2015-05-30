CREATE TABLE `CATALOGO_ORDEN` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_CLASE` decimal NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_SUBORDEN` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_ORDEN` decimal NOT NULL,

`NOMBRE_ORDEN` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_FAMILIA` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_SUBORDEN` decimal NOT NULL,

`NOMBRE_SUBORDEN` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_GENERO` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_FAMILIA` decimal NOT NULL,

`NOMBRE_FAMILIA` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_ESPECIE` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_GENERO` decimal NOT NULL,

`NOMBRE_GENERO` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_TIPO_PICO` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_ESPECIE` decimal NOT NULL,

`NOMBRE_ESPECIE` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_CANTIDAD_HUEVOS` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`ID_ESPECIE` varchar(255) NOT NULL,

`NOMBRE_ESPECIE` decimal NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_ZONA_VIDA` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CATALOGO_COLOR` (

`ID` decimal NOT NULL,

`DESCRIPCION` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `PAJARO_X_PERSONA` (

`ID` decimal NOT NULL,

`ID_PERSONA` decimal NOT NULL,

`ESPECIE` decimal NOT NULL,

`CEDULA` decimal NOT NULL,

`ID_COLOR` decimal NOT NULL,

`ZONA_VIDA` decimal NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `PERSONA` (

`ID` decimal NOT NULL,

`NOMBRE` varchar(255) NOT NULL,

`PRIMER_APELLIDO` varchar(255) NOT NULL,

`SEGUNDO_APELLIDO` varchar(255) NOT NULL,

`CEDULA` decimal NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `USUARIO` (

`ID` decimal NOT NULL,

`NICKNAME` varchar(255) NOT NULL,

`PASSWORD` varchar(255) NOT NULL,

`CEDULA` decimal NOT NULL,

`ID_PERSONA` decimal NOT NULL,

`TIPO_USUARIO` decimal NOT NULL,

`ES_ADMIN` decimal NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` varchar(255) NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `TELEFONO` (

`ID` decimal NOT NULL,

`ID_PERSONA` decimal NOT NULL,

`TELEFONO` decimal NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `CORREO` (

`ID` decimal NOT NULL,

`ID_PERSONA` decimal NOT NULL,

`CORREO` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);



CREATE TABLE `TIPO_USUARIO` (

`ID` decimal NOT NULL,

`TIPO` varchar(255) NOT NULL

);



CREATE TABLE `TIPO` (

`ID` decimal NOT NULL,

`TIPO` varchar(255) NOT NULL,

`USUARIO_CREACION` varchar(255) NOT NULL,

`USUARIO_MODIFICACION` varchar(255) NOT NULL,

`FECHA_CREACION` date NOT NULL,

`FECHA_MODIFICACION` date NOT NULL,

PRIMARY KEY (`ID`) 

);





ALTER TABLE `CATALOGO_ORDEN` ADD CONSTRAINT `fk_CATALOGO_ORDEN_CATALOGO_SUBORDEN_1` FOREIGN KEY (`ID`) REFERENCES `CATALOGO_SUBORDEN` (`ID_ORDEN`);

ALTER TABLE `CATALOGO_SUBORDEN` ADD CONSTRAINT `fk_CATALOGO_SUBORDEN_CATALOGO_FAMILIA_1` FOREIGN KEY (`ID`) REFERENCES `CATALOGO_FAMILIA` (`ID_SUBORDEN`);

ALTER TABLE `CATALOGO_FAMILIA` ADD CONSTRAINT `fk_CATALOGO_FAMILIA_CATALOGO_GENERO_1` FOREIGN KEY (`ID`) REFERENCES `CATALOGO_GENERO` (`ID_FAMILIA`);

ALTER TABLE `CATALOGO_GENERO` ADD CONSTRAINT `fk_CATALOGO_GENERO_CATALOGO_ESPECIE_1` FOREIGN KEY (`ID`) REFERENCES `CATALOGO_ESPECIE` (`ID_GENERO`);

ALTER TABLE `CATALOGO_ESPECIE` ADD CONSTRAINT `fk_CATALOGO_ESPECIE_CATALOGO_TIPO_PICO_1` FOREIGN KEY (`ID`) REFERENCES `CATALOGO_TIPO_PICO` (`ID_ESPECIE`);

ALTER TABLE `CATALOGO_ESPECIE` ADD CONSTRAINT `fk_CATALOGO_ESPECIE_CATALOGO_CANTIDAD_HUEVOS_1` FOREIGN KEY (`ID`) REFERENCES `CATALOGO_CANTIDAD_HUEVOS` (`ID_ESPECIE`);

ALTER TABLE `PERSONA` ADD CONSTRAINT `fk_PERSONA_USUARIO_1` FOREIGN KEY (`ID`) REFERENCES `USUARIO` (`ID_PERSONA`);

ALTER TABLE `PERSONA` ADD CONSTRAINT `fk_PERSONA_TELEFONO_1` FOREIGN KEY (`ID`) REFERENCES `TELEFONO` (`ID_PERSONA`);

ALTER TABLE `PERSONA` ADD CONSTRAINT `fk_PERSONA_CORREO_1` FOREIGN KEY (`ID`) REFERENCES `CORREO` (`ID_PERSONA`);

ALTER TABLE `PERSONA` ADD CONSTRAINT `fk_PERSONA_PAJARO_X_PERSONA_1` FOREIGN KEY (`ID`) REFERENCES `PAJARO_X_PERSONA` (`ID_PERSONA`);

ALTER TABLE `CATALOGO_ESPECIE` ADD CONSTRAINT `fk_CATALOGO_ESPECIE_PAJARO_X_PERSONA_1` FOREIGN KEY (`ID`) REFERENCES `PAJARO_X_PERSONA` (`ESPECIE`);

ALTER TABLE `CATALOGO_COLOR` ADD CONSTRAINT `fk_CATALOGO_COLOR_PAJARO_X_PERSONA_1` FOREIGN KEY (`ID`) REFERENCES `PAJARO_X_PERSONA` (`ID_COLOR`);

ALTER TABLE `CATALOGO_ZONA_VIDA` ADD CONSTRAINT `fk_CATALOGO_ZONA_VIDA_PAJARO_X_PERSONA_1` FOREIGN KEY (`ID`) REFERENCES `PAJARO_X_PERSONA` (`ZONA_VIDA`);

ALTER TABLE `TIPO` ADD CONSTRAINT `fk_TIPO_USUARIO_1` FOREIGN KEY (`ID`) REFERENCES `USUARIO` (`TIPO_USUARIO`);


