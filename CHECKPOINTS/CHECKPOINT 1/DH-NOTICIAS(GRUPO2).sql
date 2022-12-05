-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DH-Noticias(Grupo2)
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DH-Noticias(Grupo2)
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DH-Noticias(Grupo2)` DEFAULT CHARACTER SET utf8 ;
USE `DH-Noticias(Grupo2)` ;

-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`autores` (
  `id_autores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `cuenta` VARCHAR(45) NULL,
  `contrasenia` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(75) NULL,
  `telefono_mobil` VARCHAR(45) NULL,
  `ciudad_nacimiento` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id_autores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`categorias` (
  `id_categorias` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `estado_on_off` BIT NULL,
  PRIMARY KEY (`id_categorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`subcategoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`subcategoria` (
  `id_subcategorias` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `estado_on_off` BIT NULL,
  `categorias_id_categorias` INT NOT NULL,
  PRIMARY KEY (`id_subcategorias`),
  INDEX `fk_subcategoria_categorias1_idx` (`categorias_id_categorias` ASC) VISIBLE,
  CONSTRAINT `fk_subcategoria_categorias1`
    FOREIGN KEY (`categorias_id_categorias`)
    REFERENCES `DH-Noticias(Grupo2)`.`categorias` (`id_categorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`articulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`articulos` (
  `id_articulos` INT NOT NULL AUTO_INCREMENT,
  `fecha_creacion` DATE NULL,
  `fecha_publicacion` DATE NULL,
  `titulo` VARCHAR(45) NULL,
  `contenido` TEXT NULL,
  `estado` BIT NULL,
  `autores_id_autores` INT NOT NULL,
  `subcategoria_id_subcategorias` INT NOT NULL,
  PRIMARY KEY (`id_articulos`),
  INDEX `fk_articulos_autores1_idx` (`autores_id_autores` ASC) VISIBLE,
  INDEX `fk_articulos_subcategoria1_idx` (`subcategoria_id_subcategorias` ASC) VISIBLE,
  CONSTRAINT `fk_articulos_autores1`
    FOREIGN KEY (`autores_id_autores`)
    REFERENCES `DH-Noticias(Grupo2)`.`autores` (`id_autores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_articulos_subcategoria1`
    FOREIGN KEY (`subcategoria_id_subcategorias`)
    REFERENCES `DH-Noticias(Grupo2)`.`subcategoria` (`id_subcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`recursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`recursos` (
  `id_recursos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `archivos_adjuntos` VARCHAR(900) NULL,
  `articulos_id_articulos` INT NOT NULL,
  PRIMARY KEY (`id_recursos`),
  INDEX `fk_recursos_articulos1_idx` (`articulos_id_articulos` ASC) VISIBLE,
  CONSTRAINT `fk_recursos_articulos1`
    FOREIGN KEY (`articulos_id_articulos`)
    REFERENCES `DH-Noticias(Grupo2)`.`articulos` (`id_articulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`especialidades` (
  `id_especialidades` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NULL,
  `autores_id_autores` INT NOT NULL,
  PRIMARY KEY (`id_especialidades`),
  INDEX `fk_especialidades_autores1_idx` (`autores_id_autores` ASC) VISIBLE,
  CONSTRAINT `fk_especialidades_autores1`
    FOREIGN KEY (`autores_id_autores`)
    REFERENCES `DH-Noticias(Grupo2)`.`autores` (`id_autores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`usuarios` (
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `contrasenia` VARCHAR(45) NULL,
  `correo` VARCHAR(75) NULL,
  `ciudad_nacimiento` VARCHAR(45) NULL,
  `pais_nacimiento` VARCHAR(45) NULL,
  `usuario` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuarios`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `DH-Noticias(Grupo2)`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DH-Noticias(Grupo2)`.`comentarios` (
  `id_comentarios` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NULL,
  `contenido` VARCHAR(500) NULL,
  `articulos_id_articulos` INT NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  `autores_id_autores` INT NOT NULL,
  PRIMARY KEY (`id_comentarios`),
  INDEX `fk_comentarios_articulos1_idx` (`articulos_id_articulos` ASC) VISIBLE,
  INDEX `fk_comentarios_usuarios1_idx` (`usuarios_id_usuarios` ASC) VISIBLE,
  INDEX `fk_comentarios_autores1_idx` (`autores_id_autores` ASC) VISIBLE,
  CONSTRAINT `fk_comentarios_articulos1`
    FOREIGN KEY (`articulos_id_articulos`)
    REFERENCES `DH-Noticias(Grupo2)`.`articulos` (`id_articulos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `DH-Noticias(Grupo2)`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_autores1`
    FOREIGN KEY (`autores_id_autores`)
    REFERENCES `DH-Noticias(Grupo2)`.`autores` (`id_autores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
