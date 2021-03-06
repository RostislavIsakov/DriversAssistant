-- MySQL Script generated by MySQL Workbench
-- Fri Apr 16 00:56:52 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema driversAssistant
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema driversAssistant
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `driversAssistant` DEFAULT CHARACTER SET utf8 ;
USE `driversAssistant` ;

-- -----------------------------------------------------
-- Table `driversAssistant`.`fuelType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`fuelType` (
  `ID_FuelType` INT NOT NULL AUTO_INCREMENT,
  `fuelGrade` NVARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID_FuelType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driversAssistant`.`gasStations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`gasStations` (
  `ID_GasStation` INT NOT NULL AUTO_INCREMENT,
  `ID_FuelType` INT NOT NULL,
  `name` NVARCHAR(50) NOT NULL,
  `address` NVARCHAR(50) NOT NULL,
  `number` NVARCHAR(15) NOT NULL,
  `image` VARBINARY(200) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_GasStation`),
  INDEX `fuelType_idx` (`ID_FuelType` ASC) VISIBLE,
  CONSTRAINT `fuelType`
    FOREIGN KEY (`ID_FuelType`)
    REFERENCES `driversAssistant`.`fuelType` (`ID_FuelType`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driversAssistant`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`users` (
  `ID_User` INT NOT NULL AUTO_INCREMENT,
  `ID_FuelType` INT NOT NULL,
  `name` NVARCHAR(50) NOT NULL,
  `login` NVARCHAR(50) NOT NULL,
  `password` NVARCHAR(50) NOT NULL,
  `gender` NVARCHAR(3) NOT NULL,
  `accountType` NVARCHAR(5) NOT NULL,
  PRIMARY KEY (`ID_User`),
  INDEX `fuelType_idx` (`ID_FuelType` ASC) VISIBLE,
  CONSTRAINT `fuelType`
    FOREIGN KEY (`ID_FuelType`)
    REFERENCES `driversAssistant`.`fuelType` (`ID_FuelType`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driversAssistant`.`workshops`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`workshops` (
  `ID_Workshops` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(50) NOT NULL,
  `address` NVARCHAR(50) NOT NULL,
  `number` NVARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_Workshops`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driversAssistant`.`carWashes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`carWashes` (
  `ID_CarWashes` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(50) NOT NULL,
  `address` NVARCHAR(50) NOT NULL,
  `number` NVARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_CarWashes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driversAssistant`.`notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`notes` (
  `ID_Note` INT NOT NULL AUTO_INCREMENT,
  `ID_User` INT NOT NULL,
  `odometr` NVARCHAR(45) NULL DEFAULT NULL,
  `fuel` NVARCHAR(45) NULL DEFAULT NULL,
  `totalCost` NVARCHAR(45) NULL DEFAULT NULL,
  `date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Note`),
  INDEX `user_idx` (`ID_User` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`ID_User`)
    REFERENCES `driversAssistant`.`users` (`ID_User`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `driversAssistant`.`towTrucks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `driversAssistant`.`towTrucks` (
  `ID_TowTrucks` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(50) NOT NULL,
  `address` NVARCHAR(50) NOT NULL,
  `number` NVARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID_TowTrucks`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
