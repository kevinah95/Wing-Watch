-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema wingwatch
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wingwatch
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wingwatch` DEFAULT CHARACTER SET utf8 ;
USE `wingwatch` ;

-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_clase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_clase` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_orden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_orden` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `catalogo_clase_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_catalogo_orden_catalogo_clase1_idx` (`catalogo_clase_ID` ASC),
  CONSTRAINT `fk_catalogo_orden_catalogo_clase1`
    FOREIGN KEY (`catalogo_clase_ID`)
    REFERENCES `wingwatch`.`catalogo_clase` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_suborden`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_suborden` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `NOMBRE_ORDEN` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `catalogo_orden_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_catalogo_suborden_catalogo_orden1_idx` (`catalogo_orden_ID` ASC),
  CONSTRAINT `fk_catalogo_suborden_catalogo_orden1`
    FOREIGN KEY (`catalogo_orden_ID`)
    REFERENCES `wingwatch`.`catalogo_orden` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_familia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_familia` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `NOMBRE_SUBORDEN` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `catalogo_suborden_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_catalogo_familia_catalogo_suborden1_idx` (`catalogo_suborden_ID` ASC),
  CONSTRAINT `fk_catalogo_familia_catalogo_suborden1`
    FOREIGN KEY (`catalogo_suborden_ID`)
    REFERENCES `wingwatch`.`catalogo_suborden` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_genero` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `NOMBRE_FAMILIA` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `catalogo_familia_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_catalogo_genero_catalogo_familia1_idx` (`catalogo_familia_ID` ASC),
  CONSTRAINT `fk_catalogo_genero_catalogo_familia1`
    FOREIGN KEY (`catalogo_familia_ID`)
    REFERENCES `wingwatch`.`catalogo_familia` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_especie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_especie` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `NOMBRE_GENERO` VARCHAR(255) NOT NULL,
  `NOMBRE_COMUN` VARCHAR(255) NULL,
  `NOMBRE_INGLES` VARCHAR(45) NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `catalogo_genero_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_catalogo_especie_catalogo_genero1_idx` (`catalogo_genero_ID` ASC),
  CONSTRAINT `fk_catalogo_especie_catalogo_genero1`
    FOREIGN KEY (`catalogo_genero_ID`)
    REFERENCES `wingwatch`.`catalogo_genero` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_cantidad_huevos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_cantidad_huevos` (
  `ID` INT NOT NULL,
  `CANTIDAD` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_color` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_tipo_pico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_tipo_pico` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_zona_vida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_zona_vida` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`persona` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(255) NOT NULL,
  `PRIMER_APELLIDO` VARCHAR(255) NOT NULL,
  `SEGUNDO_APELLIDO` VARCHAR(255) NOT NULL,
  `CEDULA` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`correo` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CORREO` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `persona_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_correo_persona1_idx` (`persona_ID` ASC),
  UNIQUE INDEX `CORREO_UNIQUE` (`CORREO` ASC),
  CONSTRAINT `fk_correo_persona1`
    FOREIGN KEY (`persona_ID`)
    REFERENCES `wingwatch`.`persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_cantidad_huevos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_cantidad_huevos` (
  `ID` INT NOT NULL,
  `CANTIDAD` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`pajaro_x_persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`pajaro_x_persona` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CEDULA` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `persona_ID` INT NOT NULL,
  `catalogo_especie_ID` INT NOT NULL,
  `catalogo_cantidad_huevos_ID_menor` INT NOT NULL,
  `catalogo_cantidad_huevos_ID_mayor` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_pajaro_x_persona_persona1_idx` (`persona_ID` ASC),
  INDEX `fk_pajaro_x_persona_catalogo_especie1_idx` (`catalogo_especie_ID` ASC),
  INDEX `fk_pajaro_x_persona_catalogo_cantidad_huevos1_idx` (`catalogo_cantidad_huevos_ID_menor` ASC),
  INDEX `fk_pajaro_x_persona_catalogo_cantidad_huevos2_idx` (`catalogo_cantidad_huevos_ID_mayor` ASC),
  CONSTRAINT `fk_pajaro_x_persona_persona1`
    FOREIGN KEY (`persona_ID`)
    REFERENCES `wingwatch`.`persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pajaro_x_persona_catalogo_especie1`
    FOREIGN KEY (`catalogo_especie_ID`)
    REFERENCES `wingwatch`.`catalogo_especie` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pajaro_x_persona_catalogo_cantidad_huevos1`
    FOREIGN KEY (`catalogo_cantidad_huevos_ID_menor`)
    REFERENCES `wingwatch`.`catalogo_cantidad_huevos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pajaro_x_persona_catalogo_cantidad_huevos2`
    FOREIGN KEY (`catalogo_cantidad_huevos_ID_mayor`)
    REFERENCES `wingwatch`.`catalogo_cantidad_huevos` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`telefono` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TELEFONO` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `persona_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_telefono_persona1_idx` (`persona_ID` ASC),
  CONSTRAINT `fk_telefono_persona1`
    FOREIGN KEY (`persona_ID`)
    REFERENCES `wingwatch`.`persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`tipo_usuario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `TIPO` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`usuario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NICKNAME` VARCHAR(255) NOT NULL,
  `HASH` VARCHAR(255) NOT NULL,
  `PASSWORD` VARCHAR(255) NOT NULL,
  `CEDULA` INT NOT NULL,
  `ES_ADMIN` INT NOT NULL DEFAULT 0,
  `FOTO_PERFIL` MEDIUMTEXT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  `tipo_usuario_ID` INT NOT NULL,
  `persona_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_ID` ASC),
  INDEX `fk_usuario_persona1_idx` (`persona_ID` ASC),
  UNIQUE INDEX `NICKNAME_UNIQUE` (`NICKNAME` ASC),
  UNIQUE INDEX `CEDULA_UNIQUE` (`CEDULA` ASC),
  CONSTRAINT `fk_usuario_tipo_usuario1`
    FOREIGN KEY (`tipo_usuario_ID`)
    REFERENCES `wingwatch`.`tipo_usuario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_persona1`
    FOREIGN KEY (`persona_ID`)
    REFERENCES `wingwatch`.`persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`fotos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_foto` VARCHAR(255) NULL,
  `url` LONGTEXT NULL,
  `pajaro_x_persona_ID` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NULL,
  `FECHA_CREACION` DATE NULL,
  `FECHA_MODIFICACION` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_fotos_pajaro_x_persona1_idx` (`pajaro_x_persona_ID` ASC),
  CONSTRAINT `fk_fotos_pajaro_x_persona1`
    FOREIGN KEY (`pajaro_x_persona_ID`)
    REFERENCES `wingwatch`.`pajaro_x_persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`colores_x_pajaro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`colores_x_pajaro` (
  `pajaro_x_persona_ID` INT NOT NULL,
  `catalogo_color_ID` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`pajaro_x_persona_ID`, `catalogo_color_ID`),
  INDEX `fk_colores_x_pajaro_pajaro_x_persona1_idx` (`pajaro_x_persona_ID` ASC),
  INDEX `fk_colores_x_pajaro_catalogo_color1_idx` (`catalogo_color_ID` ASC),
  CONSTRAINT `fk_colores_x_pajaro_pajaro_x_persona1`
    FOREIGN KEY (`pajaro_x_persona_ID`)
    REFERENCES `wingwatch`.`pajaro_x_persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_colores_x_pajaro_catalogo_color1`
    FOREIGN KEY (`catalogo_color_ID`)
    REFERENCES `wingwatch`.`catalogo_color` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`zonas_x_pajaro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`zonas_x_pajaro` (
  `catalogo_zona_vida_ID` INT NOT NULL,
  `pajaro_x_persona_ID` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`catalogo_zona_vida_ID`, `pajaro_x_persona_ID`),
  INDEX `fk_catalogo_zona_vida_has_pajaro_x_persona_pajaro_x_persona_idx` (`pajaro_x_persona_ID` ASC),
  INDEX `fk_catalogo_zona_vida_has_pajaro_x_persona_catalogo_zona_vi_idx` (`catalogo_zona_vida_ID` ASC),
  CONSTRAINT `fk_catalogo_zona_vida_has_pajaro_x_persona_catalogo_zona_vida1`
    FOREIGN KEY (`catalogo_zona_vida_ID`)
    REFERENCES `wingwatch`.`catalogo_zona_vida` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_zona_vida_has_pajaro_x_persona_pajaro_x_persona1`
    FOREIGN KEY (`pajaro_x_persona_ID`)
    REFERENCES `wingwatch`.`pajaro_x_persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `wingwatch`.`catalogo_tipo_pico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`catalogo_tipo_pico` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(45) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`picos_x_pajaro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`picos_x_pajaro` (
  `catalogo_tipo_pico_ID` INT NOT NULL,
  `pajaro_x_persona_ID` INT NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`catalogo_tipo_pico_ID`, `pajaro_x_persona_ID`),
  INDEX `fk_catalogo_tipo_pico_has_pajaro_x_persona_pajaro_x_persona_idx` (`pajaro_x_persona_ID` ASC),
  INDEX `fk_catalogo_tipo_pico_has_pajaro_x_persona_catalogo_tipo_pi_idx` (`catalogo_tipo_pico_ID` ASC),
  CONSTRAINT `fk_catalogo_tipo_pico_has_pajaro_x_persona_catalogo_tipo_pico1`
    FOREIGN KEY (`catalogo_tipo_pico_ID`)
    REFERENCES `wingwatch`.`catalogo_tipo_pico` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catalogo_tipo_pico_has_pajaro_x_persona_pajaro_x_persona1`
    FOREIGN KEY (`pajaro_x_persona_ID`)
    REFERENCES `wingwatch`.`pajaro_x_persona` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`email` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CORREO` VARCHAR(255) NOT NULL,
  `USUARIO_CREACION` VARCHAR(255) NOT NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NOT NULL,
  `FECHA_CREACION` DATE NOT NULL,
  `FECHA_MODIFICACION` DATE NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wingwatch`.`bitacora_passwords`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wingwatch`.`bitacora_passwords` (
  `OLD_PASS` VARCHAR(255) NULL,
  `NEW_PASS` VARCHAR(255) NULL,
  `USUARIO_CREACION` VARCHAR(255) NULL,
  `USUARIO_MODIFICACION` VARCHAR(255) NULL,
  `FECHA_CREACION` DATE NULL,
  `FECHA_MODIFICACION` DATE NULL)
ENGINE = InnoDB;

USE `wingwatch` ;

-- -----------------------------------------------------
-- function crearCuenta
-- -----------------------------------------------------

DELIMITER $$
USE `wingwatch`$$
CREATE DEFINER=`WingWatch`@`localhost` FUNCTION `crearCuenta`(`Correo` TINYTEXT, `Encriptacion` TINYTEXT, `Nombre` TINYTEXT, `P_Apellido` TINYTEXT, `S_Apellido` TINYTEXT, `Contrasenia` TINYTEXT, `Tipo_Usuario` BIT) RETURNS tinytext CHARSET utf8
    DETERMINISTIC
BEGIN

	DECLARE EXIT HANDLER FOR 1062 return 'El id ya exite';

	INSERT into usuarios(usuarios.CORREO,usuarios.ENCRIPTACION,usuarios.NOMBRE,usuarios.P_APELLIDO,usuarios.S_APELLIDO,usuarios.CONTRASENIA,usuarios.TIPO_USUARIO) 

	values (Correo,Encriptacion,Nombre,P_Apellido,S_Apellido,Contrasenia,Tipo_Usuario);

	return 'Insertado';

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
