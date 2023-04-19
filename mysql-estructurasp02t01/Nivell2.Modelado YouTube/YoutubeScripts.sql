-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ModeloYoutube
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ModeloYoutube` ;

-- -----------------------------------------------------
-- Schema ModeloYoutube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ModeloYoutube` DEFAULT CHARACTER SET utf8 ;
USE `ModeloYoutube` ;

-- -----------------------------------------------------
-- Table `ModeloYoutube`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`Usuario` (
  `idUsuario` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `nombreusuario` VARCHAR(45) NOT NULL,
  `fechanacimiento` DATE NULL,
  `sexo` VARCHAR(1) NULL,
  `pais` VARCHAR(45) NULL,
  `codigopostal` INT NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`video` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`video` (
  `idvideo` INT NOT NULL,
  `idusuario` INT NULL,
  `titulo` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `tamano` INT NULL,
  `nombrearchivo` VARCHAR(100) NULL,
  `duracion` TIME NULL,
  `thumbnail` BLOB NULL,
  `reproducciones` INT NULL,
  `likes` INT NULL,
  `dislikes` INT NULL,
  `estado` VARCHAR(15) NULL,
  `fechapublicacion` DATETIME NULL,
  PRIMARY KEY (`idvideo`),
  UNIQUE INDEX `idvideo_UNIQUE` (`idvideo` ASC) VISIBLE,
  INDEX `usuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`Etiquetas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`Etiquetas` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`Etiquetas` (
  `idEtiqueta` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEtiqueta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`listaetiquetas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`listaetiquetas` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`listaetiquetas` (
  `idvideo` INT NOT NULL,
  `idetiqueta` INT NOT NULL,
  PRIMARY KEY (`idvideo`, `idetiqueta`),
  INDEX `etiquetas_idx` (`idetiqueta` ASC) VISIBLE,
  CONSTRAINT `etiquetas`
    FOREIGN KEY (`idetiqueta`)
    REFERENCES `ModeloYoutube`.`Etiquetas` (`idEtiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `videos`
    FOREIGN KEY (`idvideo`)
    REFERENCES `ModeloYoutube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`canal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`canal` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`canal` (
  `idcanal` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(150) NULL,
  `fechacreacion` DATETIME NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idcanal`),
  UNIQUE INDEX `idcanal_UNIQUE` (`idcanal` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `fk_usuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk1_usuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`suscripciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`suscripciones` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`suscripciones` (
  `idcanal` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idcanal`, `idusuario`),
  INDEX `usuarios_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `canal`
    FOREIGN KEY (`idcanal`)
    REFERENCES `ModeloYoutube`.`canal` (`idcanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuarios`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`opiniciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`opiniciones` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`opiniciones` (
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha` DATETIME NULL,
  `LIKE` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idvideo`, `idusuario`),
  INDEX `fk_ideusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idvideo`
    FOREIGN KEY (`idvideo`)
    REFERENCES `ModeloYoutube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ideusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`playlist` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`playlist` (
  `idplaylist` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `estado` VARCHAR(15) NULL,
  UNIQUE INDEX `idplaylist_UNIQUE` (`idplaylist` ASC) VISIBLE,
  PRIMARY KEY (`idplaylist`),
  INDEX `usuarios_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `FKusuarios`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`listavideos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`listavideos` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`listavideos` (
  `idplaylist` INT NOT NULL,
  `idvideo` INT NOT NULL,
  PRIMARY KEY (`idplaylist`, `idvideo`),
  INDEX `videos_idx` (`idvideo` ASC) VISIBLE,
  CONSTRAINT `FK_playlist`
    FOREIGN KEY (`idplaylist`)
    REFERENCES `ModeloYoutube`.`playlist` (`idplaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fK_videos`
    FOREIGN KEY (`idvideo`)
    REFERENCES `ModeloYoutube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`comentarios` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`comentarios` (
  `idcomentario` INT NOT NULL,
  `comentario` VARCHAR(100) NULL,
  `fecha` DATETIME NOT NULL,
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idcomentario`),
  INDEX `video_idx` (`idvideo` ASC) VISIBLE,
  INDEX `usuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `FK_video`
    FOREIGN KEY (`idvideo`)
    REFERENCES `ModeloYoutube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario2`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ModeloYoutube`.`comentariosopinion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModeloYoutube`.`comentariosopinion` ;

CREATE TABLE IF NOT EXISTS `ModeloYoutube`.`comentariosopinion` (
  `idcomentario` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `megusta` VARCHAR(1) NOT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`idcomentario`, `idusuario`),
  INDEX `usuarios_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fK_comentarios`
    FOREIGN KEY (`idcomentario`)
    REFERENCES `ModeloYoutube`.`comentarios` (`idcomentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios`
    FOREIGN KEY (`idusuario`)
    REFERENCES `ModeloYoutube`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
