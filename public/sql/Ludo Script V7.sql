-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ludo
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ludo` ;

-- -----------------------------------------------------
-- Schema ludo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ludo` DEFAULT CHARACTER SET utf8 ;

-- Schema ludo
-- -----------------------------------------------------
USE `ludo` ;

-- -----------------------------------------------------
-- Table `ludo`.`messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`messages` ;

CREATE TABLE IF NOT EXISTS `ludo`.`messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `message_subject` VARCHAR(45) NOT NULL COMMENT 'The topic of the message.',
  `message_text` VARCHAR(200) NOT NULL COMMENT 'The content of the message.',
  `game_position` INT COMMENT 'The virtual day in-game.',
  PRIMARY KEY (`message_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ludo`.`people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`people` ;

CREATE TABLE IF NOT EXISTS `ludo`.`people` (
  `person_id` INT NOT NULL AUTO_INCREMENT,
  `person_name` VARCHAR(45) NOT NULL COMMENT 'The name of the person playing.',
  `institution_name` VARCHAR(45) NOT NULL COMMENT 'The institution the player represents.',
  `username` VARCHAR(45) NOT NULL COMMENT 'The in-game username the person is using.',
  PRIMARY KEY (`person_id`)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ludo`.`game_versions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`game_versions` ;

CREATE TABLE IF NOT EXISTS `ludo`.`game_versions` (
  `version_id` INT NOT NULL AUTO_INCREMENT,
  `version_name` VARCHAR(45) NOT NULL COMMENT 'Which version of the game are we playing?',
  PRIMARY KEY (`version_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ludo`.`game_instances`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`game_instances` ;

CREATE TABLE IF NOT EXISTS `ludo`.`game_instances` (
  `instance_id` INT NOT NULL AUTO_INCREMENT,
  `term_name` VARCHAR(45) NOT NULL COMMENT 'Season and year.',
  `section` VARCHAR(45) NOT NULL COMMENT 'Which section?',
  `course_code` VARCHAR(45) NOT NULL COMMENT 'Which school course is playing this game?',
  `institution_name` VARCHAR(45) NOT NULL COMMENT 'The institution the player represents.',
  `version_id` INT NOT NULL,
  PRIMARY KEY (`instance_id`),
  FOREIGN KEY (`version_id`) REFERENCES `game_versions`(`version_id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ludo`.`role_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`role_types` ;

CREATE TABLE IF NOT EXISTS `ludo`.`role_types` (
  `role_type_id` INT NOT NULL AUTO_INCREMENT,
  `role_type` VARCHAR(45) NOT NULL,
  `version_id` INT NOT NULL,
  PRIMARY KEY (`role_type_id`),
  FOREIGN KEY (`version_id`) REFERENCES `game_versions`(`version_id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ludo`.`actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`actors` ;

CREATE TABLE IF NOT EXISTS `ludo`.`actors` (
  `actor_id` INT NOT NULL AUTO_INCREMENT,
  `actor_type` VARCHAR(45) NOT NULL COMMENT 'I for Individual, T for Team, B for Bot',
  `comment` VARCHAR(45) NOT NULL,
  `role_type_id` INT COMMENT 'The actor\'s in-game role.',
  `person_id` INT COMMENT 'The Player Name, Username, etc.',
  `instance_id` INT NOT NULL,
  PRIMARY KEY (`actor_id`),
  FOREIGN KEY (`person_id`) REFERENCES `people`(`person_id`),
  FOREIGN KEY (`instance_id`) REFERENCES `game_instances`(`instance_id`),
  FOREIGN KEY (`role_type_id`) REFERENCES `role_types`(`role_type_id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ludo`.`message_actions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`message_actions` ;

CREATE TABLE IF NOT EXISTS `ludo`.`message_actions` (
  `message_action_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(10) NOT NULL COMMENT 'This holds the type of the action. Ex: Send, Receive, CC, BCC, Forward',
  `action_time` INT NOT NULL COMMENT 'The date and time the message action is performed',
  `game_position` INT COMMENT 'The virtual day in-game.',
  `message_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`message_action_id`),
  FOREIGN KEY (`message_id`) REFERENCES `messages`(`message_id`),
  FOREIGN KEY (`actor_id`) REFERENCES `actors`(`actor_id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ludo`.`groupings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`groupings` ;

CREATE TABLE IF NOT EXISTS `ludo`.`groupings` (
  `grouping_id` INT NOT NULL AUTO_INCREMENT,
  `actor_id` INT NOT NULL COMMENT 'Represents the individuals being put into groups.',
  `team_id` INT NOT NULL COMMENT 'Represents the teams individuals are being put into.',
  PRIMARY KEY (`grouping_id`),
  FOREIGN KEY (`actor_id`) REFERENCES `actors`(`actor_id`),
  FOREIGN KEY (`team_id`) REFERENCES `actors`(`actor_id`))
ENGINE = InnoDB;



