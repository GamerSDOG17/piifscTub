-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `senha` VARBINARY(20) NULL,
  `email` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `escola` VARCHAR(45) NULL,
  `professor` INT NULL DEFAULT 0,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `senha` VARBINARY(20) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdministrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sessao` (
  `idSessao` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `imagem` VARCHAR(100) NULL,
  `codigoDeAcesso` VARCHAR(45) NULL,
  `dataDeEncerramento` DATETIME NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idSessao`),
  INDEX `fk_Sessao_Usuario1_idx` (`Usuario_idUsuario` ASC),
  CONSTRAINT `fk_Sessao_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `mydb`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Personagem` (
  `idPersonagem` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(200) NULL,
  `imagem` VARCHAR(45) NULL,
  `Sessao_idSessao` INT NOT NULL,
  PRIMARY KEY (`idPersonagem`, `Sessao_idSessao`),
  INDEX `fk_Personagem_Sessao1_idx` (`Sessao_idSessao` ASC),
  CONSTRAINT `fk_Personagem_Sessao1`
    FOREIGN KEY (`Sessao_idSessao`)
    REFERENCES `mydb`.`Sessao` (`idSessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PersonagemExclusivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PersonagemExclusivo` (
  `idPersonagemExclusivo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(200) NULL,
  `imagem` VARCHAR(45) NULL,
  `codigo` VARCHAR(45) NULL,
  `Sessao_idSessao` INT NOT NULL,
  PRIMARY KEY (`idPersonagemExclusivo`, `Sessao_idSessao`),
  INDEX `fk_PersonagemExclusivo_Sessao1_idx` (`Sessao_idSessao` ASC),
  CONSTRAINT `fk_PersonagemExclusivo_Sessao1`
    FOREIGN KEY (`Sessao_idSessao`)
    REFERENCES `mydb`.`Sessao` (`idSessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Postagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Postagem` (
  `idPostagem` INT NOT NULL AUTO_INCREMENT,
  `mensagem` VARCHAR(280) NULL,
  `reacao` VARCHAR(45) NULL,
  `Sessao_idSessao` INT NOT NULL,
  PRIMARY KEY (`idPostagem`, `Sessao_idSessao`),
  INDEX `fk_Postagem_Sessao_idx` (`Sessao_idSessao` ASC),
  CONSTRAINT `fk_Postagem_Sessao`
    FOREIGN KEY (`Sessao_idSessao`)
    REFERENCES `mydb`.`Sessao` (`idSessao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
