SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Frequencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Frequencia` (
  `idFrequencia` INT NOT NULL AUTO_INCREMENT,
  `presenca` TINYINT(1) NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`idFrequencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Conteudo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Conteudo` (
  `idConteudo` INT NOT NULL AUTO_INCREMENT,
  `assunto` VARCHAR(30) NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`idConteudo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `nomeAluno` VARCHAR(30) NOT NULL,
  `cpf` INT NOT NULL,
  `matricula` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `nomeProfessor` VARCHAR(30) NOT NULL,
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `cpf` INT NOT NULL,
  `senha` INT NOT NULL,
  PRIMARY KEY (`idProfessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Diario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Diario` (
  `idDiario` INT NOT NULL AUTO_INCREMENT,
  `nomeDiario` VARCHAR(30) NOT NULL,
  `codFrequencia` INT NOT NULL,
  `codConteudo` INT NOT NULL,
  `Aluno_matricula` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  PRIMARY KEY (`idDiario`),
  INDEX `fk_Diario_Frequencia_idx` (`codFrequencia` ASC),
  INDEX `fk_Diario_Conteudo1_idx` (`codConteudo` ASC),
  INDEX `fk_Diario_Aluno1_idx` (`Aluno_matricula` ASC),
  INDEX `fk_Diario_Professor1_idx` (`Professor_idProfessor` ASC),
  CONSTRAINT `fk_Diario_Frequencia`
    FOREIGN KEY (`codFrequencia`)
    REFERENCES `mydb`.`Frequencia` (`idFrequencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diario_Conteudo1`
    FOREIGN KEY (`codConteudo`)
    REFERENCES `mydb`.`Conteudo` (`idConteudo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diario_Aluno1`
    FOREIGN KEY (`Aluno_matricula`)
    REFERENCES `mydb`.`Aluno` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Diario_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Turma` (
  `idTurma` INT NOT NULL AUTO_INCREMENT,
  `nomeTurma` VARCHAR(30) NOT NULL,
  `curso` VARCHAR(30) NOT NULL,
  `Diario_idDiario` INT NOT NULL,
  PRIMARY KEY (`idTurma`),
  INDEX `fk_Turma_Diario1_idx` (`Diario_idDiario` ASC),
  CONSTRAINT `fk_Turma_Diario1`
    FOREIGN KEY (`Diario_idDiario`)
    REFERENCES `mydb`.`Diario` (`idDiario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
