-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema consultorioDH
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema consultorioDH
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `consultorioDH` DEFAULT CHARACTER SET utf8 ;
USE `consultorioDH` ;

-- -----------------------------------------------------
-- Table `consultorioDH`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorioDH`.`pacientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `identificador_salud` BIGINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorioDH`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorioDH`.`especialidades` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorioDH`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorioDH`.`medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `matricula` CHAR(20) NULL,
  `especialidades_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medicos_especialidades_idx` (`especialidades_id` ASC) VISIBLE,
  CONSTRAINT `fk_medicos_especialidades`
    FOREIGN KEY (`especialidades_id`)
    REFERENCES `consultorioDH`.`especialidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `consultorioDH`.`turnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `consultorioDH`.`turnos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pacientes_id` INT NOT NULL,
  `medicos_id` INT NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_turnos_pacientes1_idx` (`pacientes_id` ASC) VISIBLE,
  INDEX `fk_turnos_medicos1_idx` (`medicos_id` ASC) VISIBLE,
  CONSTRAINT `fk_turnos_pacientes1`
    FOREIGN KEY (`pacientes_id`)
    REFERENCES `consultorioDH`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turnos_medicos1`
    FOREIGN KEY (`medicos_id`)
    REFERENCES `consultorioDH`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
