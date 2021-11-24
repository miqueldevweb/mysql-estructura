SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`proveidors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidors` (
  `id_proveidor` CHAR(9) NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NOT NULL,
  PRIMARY KEY (`id_proveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `id_ulleres` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `graduacio1` VARCHAR(45) NOT NULL,
  `graduacio2` VARCHAR(45) NOT NULL,
  `muntura` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `color_vidre1` VARCHAR(45) NOT NULL,
  `color_vidre2` VARCHAR(45) NOT NULL,
  `preu` DECIMAL NOT NULL,
  PRIMARY KEY (`id_ulleres`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`proveidor_ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveidor_ulleres` (
  `proveidor_id_proveidor` CHAR(9) NOT NULL,
  `ulleres_id_ulleres` INT NOT NULL,
  PRIMARY KEY (`proveidor_id_proveidor`, `ulleres_id_ulleres`),
  INDEX `fk_proveidor_has_ulleres_ulleres1_idx` (`ulleres_id_ulleres` ASC) VISIBLE,
  INDEX `fk_proveidor_has_ulleres_proveidor_idx` (`proveidor_id_proveidor` ASC) VISIBLE,
  CONSTRAINT `fk_proveidor_has_ulleres_proveidor`
    FOREIGN KEY (`proveidor_id_proveidor`)
    REFERENCES `optica`.`proveidors` (`id_proveidor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_proveidor_has_ulleres_ulleres1`
    FOREIGN KEY (`ulleres_id_ulleres`)
    REFERENCES `optica`.`ulleres` (`id_ulleres`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clients` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `telefon` INT(13) NULL,
  `email` VARCHAR(45) NULL,
  `data` DATE NULL,
  `clients_id_client` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_client`, `clients_id_client`),
  INDEX `fk_clients_clients1_idx` (`clients_id_client` ASC) VISIBLE,
  CONSTRAINT `fk_clients_clients1`
    FOREIGN KEY (`clients_id_client`)
    REFERENCES `optica`.`clients` (`id_client`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `optica`.`ulleres_clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ulleres_clients` (
  `ulleres_id_ulleres` INT NOT NULL,
  `client_id_client` INT NOT NULL,
  `nom_empleat` VARCHAR(45) NOT NULL,
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_ulleres_has_client_client1_idx` (`client_id_client` ASC) VISIBLE,
  INDEX `fk_ulleres_has_client_ulleres1_idx` (`ulleres_id_ulleres` ASC) VISIBLE,
  CONSTRAINT `fk_ulleres_has_client_ulleres1`
    FOREIGN KEY (`ulleres_id_ulleres`)
    REFERENCES `optica`.`ulleres` (`id_ulleres`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ulleres_has_client_client1`
    FOREIGN KEY (`client_id_client`)
    REFERENCES `optica`.`clients` (`id_client`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
