-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema opendata
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `opendata` ;

-- -----------------------------------------------------
-- Schema opendata
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `opendata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `opendata` ;

-- -----------------------------------------------------
-- Table `opendata`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`role` ;

CREATE TABLE IF NOT EXISTS `opendata`.`role` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opendata`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`category` ;

CREATE TABLE IF NOT EXISTS `opendata`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `parent_categoty_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `parent_category_idx` (`parent_categoty_id` ASC) VISIBLE,
  CONSTRAINT `parent_category`
    FOREIGN KEY (`parent_categoty_id`)
    REFERENCES `opendata`.`category` (`parent_categoty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opendata`.`data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`data` ;

CREATE TABLE IF NOT EXISTS `opendata`.`data` (
  `data_id` INT NOT NULL AUTO_INCREMENT,
  `category_id` INT NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `format` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`data_id`, `category_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  INDEX `fk_data_category_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_data_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `opendata`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opendata`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`user` ;

CREATE TABLE IF NOT EXISTS `opendata`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opendata`.`access`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`access` ;

CREATE TABLE IF NOT EXISTS `opendata`.`access` (
  `access_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `data_id` INT NOT NULL,
  PRIMARY KEY (`access_id`, `user_id`, `role_id`, `data_id`),
  INDEX `fk_Access_Data_idx` (`data_id` ASC) VISIBLE,
  INDEX `fk_Access_Role_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_Access_User_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Access_Data`
    FOREIGN KEY (`data_id`)
    REFERENCES `opendata`.`data` (`data_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Access_Role`
    FOREIGN KEY (`role_id`)
    REFERENCES `opendata`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Access_User`
    FOREIGN KEY (`user_id`)
    REFERENCES `opendata`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opendata`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`tag` ;

CREATE TABLE IF NOT EXISTS `opendata`.`tag` (
  `tag_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `opendata`.`link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `opendata`.`link` ;

CREATE TABLE IF NOT EXISTS `opendata`.`link` (
  `link_id` INT NOT NULL AUTO_INCREMENT,
  `data_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`link_id`, `data_id`, `tag_id`),
  INDEX `fk_link_data_idx` (`data_id` ASC) VISIBLE,
  INDEX `fk_link_tag_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_link_data`
    FOREIGN KEY (`data_id`)
    REFERENCES `opendata`.`data` (`data_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_tag`
    FOREIGN KEY (`tag_id`)
    REFERENCES `opendata`.`tag` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `opendata`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`role` (`role_id`, `name`) VALUES (DEFAULT, 'User');
INSERT INTO `opendata`.`role` (`role_id`, `name`) VALUES (DEFAULT, 'Admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `opendata`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`category` (`category_id`, `name`, `parent_categoty_id`) VALUES (DEFAULT,, 'Informatics', NULL);
INSERT INTO `opendata`.`category` (`category_id`, `name`, `parent_categoty_id`) VALUES (DEFAULT,, 'Statistics', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `opendata`.`data`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`data` (`data_id`, `category_id`, `description`, `createdAt`, `updatedAt`, `content`, `format`, `name`) VALUES (DEFAULT,, 1, 'Important tasks', '2023-02-15 15:15:15', '2023-03-15 15:15:15', 'txt', 'txt', 'Informatics');
INSERT INTO `opendata`.`data` (`data_id`, `category_id`, `description`, `createdAt`, `updatedAt`, `content`, `format`, `name`) VALUES (DEFAULT,, 2, 'Important statistics', '2024-04-18 13:17:09', '2024-04-19 13:17:09', 'xlsx', 'xlsx', 'Statistics');

COMMIT;


-- -----------------------------------------------------
-- Data for table `opendata`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`user` (`user_id`, `firstname`, `password`, `lastname`, `email`, `login`) VALUES (DEFAULT, 'Vlad', '1234', 'Koleso', 'vald_koleso@gmail.com', 'vlad');
INSERT INTO `opendata`.`user` (`user_id`, `firstname`, `password`, `lastname`, `email`, `login`) VALUES (DEFAULT, 'Daria', '5678', 'Minze', 'minze@gmail.com', 'minze');

COMMIT;


-- -----------------------------------------------------
-- Data for table `opendata`.`access`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`access` (`access_id`, `user_id`, `role_id`, `data_id`) VALUES (DEFAULT, 1, 1, 1);
INSERT INTO `opendata`.`access` (`access_id`, `user_id`, `role_id`, `data_id`) VALUES (DEFAULT, 2, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `opendata`.`tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`tag` (`tag_id`, `name`) VALUES (DEFAULT, 'informatics');
INSERT INTO `opendata`.`tag` (`tag_id`, `name`) VALUES (DEFAULT,, 'statistics');

COMMIT;


-- -----------------------------------------------------
-- Data for table `opendata`.`link`
-- -----------------------------------------------------
START TRANSACTION;
USE `opendata`;
INSERT INTO `opendata`.`link` (`link_id`, `data_id`, `tag_id`) VALUES (DEFAULT, 1, 1);
INSERT INTO `opendata`.`link` (`link_id`, `data_id`, `tag_id`) VALUES (DEFAULT, 2, 2);

COMMIT;

