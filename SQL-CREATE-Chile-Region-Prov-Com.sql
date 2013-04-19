SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Table `region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `region` ;

CREATE  TABLE IF NOT EXISTS `region` (
  `re_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `re_nombre` VARCHAR(45) NOT NULL ,
  `re_rom` VARCHAR(5) NOT NULL ,
  `re_titulo` VARCHAR(55) NOT NULL ,
  PRIMARY KEY (`re_id`) ,
  UNIQUE INDEX `re_id_nombre` (`re_id` ASC, `re_nombre` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1 PARTITION BY KEY() PARTITIONS 1;


-- -----------------------------------------------------
-- Table `provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `provincia` ;

CREATE  TABLE IF NOT EXISTS `provincia` (
  `pr_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `pr_region` INT(10) UNSIGNED NOT NULL ,
  `pr_nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`pr_id`) ,
  INDEX `fk_provincia_region` (`pr_region` ASC) ,
  UNIQUE INDEX `pr_re_nombre` (`pr_region` ASC, `pr_nombre` ASC) ,
  CONSTRAINT `fk_provincia_region`
    FOREIGN KEY (`pr_region` )
    REFERENCES `region` (`re_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `comuna`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comuna` ;

CREATE  TABLE IF NOT EXISTS `comuna` (
  `co_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `co_pr` INT(10) UNSIGNED NOT NULL ,
  `co_nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`co_id`) ,
  INDEX `fk_comuna_provincia` (`co_pr` ASC) ,
  INDEX `co_re_nombre` (`co_pr` ASC, `co_nombre` ASC) ,
  CONSTRAINT `fk_comuna_provincia`
    FOREIGN KEY (`co_pr` )
    REFERENCES `provincia` (`pr_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
