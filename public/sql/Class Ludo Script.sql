-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

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
  `game_position` VARCHAR(45) NOT NULL COMMENT 'The virtual day in-game.',
  PRIMARY KEY (`message_id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ludo`.`people`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ludo`.`people` ;

CREATE TABLE IF NOT EXISTS `ludo`.`people` (
  `person_id` INT AUTO_INCREMENT,
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
  `actor_name` VARCHAR(45) NOT NULL,
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
  `action_type` VARCHAR(10) NOT NULL COMMENT 'This holds the type of the action. Ex: Send, Receive, CC, BCC, Forward',
  `action_time` INT NOT NULL COMMENT 'The date and time the message action is performed',
  `game_position` VARCHAR(45) NOT NULL COMMENT 'The virtual day in-game.',
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

-- -----------------------------------------------------
-- View `ludo`.`whole_summary
-- -----------------------------------------------------
CREATE VIEW whole_summary AS
SELECT actors.actor_id, actor_name, message_actions.game_position,
(SELECT COUNT(*) FROM message_actions WHERE message_actions.actor_id = actors.actor_id) AS message_participation_count 
FROM actors, message_actions
WHERE message_actions.actor_id = actors.actor_id
GROUP BY actors.actor_id;

-- -----------------------------------------------------
-- View `ludo`.`day_one_summary
-- -----------------------------------------------------
CREATE VIEW day_one_summary AS
SELECT actors.actor_id, actor_name, message_actions.game_position,
(SELECT COUNT(*) FROM message_actions WHERE message_actions.actor_id = actors.actor_id AND game_position = 'Day 1') AS message_participation_count 
FROM actors, message_actions
WHERE game_position = 'Day 1'
GROUP BY actors.actor_id
ORDER BY actor_id;

-- -----------------------------------------------------
-- View `ludo`.`day_two_summary
-- -----------------------------------------------------
CREATE VIEW day_two_summary AS
SELECT actors.actor_id, actor_name, message_actions.game_position,
(SELECT COUNT(*) FROM message_actions WHERE message_actions.actor_id = actors.actor_id AND game_position = 'Day 2') AS message_participation_count 
FROM actors, message_actions
WHERE game_position = 'Day 2'
GROUP BY actors.actor_id
ORDER BY actor_id;

-- -----------------------------------------------------
-- View `ludo`.`day_three_summary
-- -----------------------------------------------------
CREATE VIEW day_three_summary AS
SELECT actors.actor_id, actor_name, message_actions.game_position,
(SELECT COUNT(*) FROM message_actions WHERE message_actions.actor_id = actors.actor_id AND game_position = 'Day 3') AS message_participation_count 
FROM actors, message_actions
WHERE game_position = 'Day 3'
GROUP BY actors.actor_id
ORDER BY actor_id;

-- -----------------------------------------------------
-- View `ludo`.`day_four_summary
-- -----------------------------------------------------
CREATE VIEW day_four_summary AS
SELECT actors.actor_id, actor_name, message_actions.game_position,
(SELECT COUNT(*) FROM message_actions WHERE message_actions.actor_id = actors.actor_id AND game_position = 'Day 4') AS message_participation_count 
FROM actors, message_actions
WHERE game_position = 'Day 4'
GROUP BY actors.actor_id
ORDER BY actor_id;

-- -----------------------------------------------------
-- View `ludo`.`day_five_summary
-- -----------------------------------------------------
CREATE VIEW day_five_summary AS
SELECT actors.actor_id, actor_name, message_actions.game_position,
(SELECT COUNT(*) FROM message_actions WHERE message_actions.actor_id = actors.actor_id AND game_position = 'Day 5') AS message_participation_count 
FROM actors, message_actions
WHERE game_position = 'Day 5'
GROUP BY actors.actor_id
ORDER BY actor_id;

-- -----------------------------------------------------
-- View `ludo`.`individual_workers
-- -----------------------------------------------------
CREATE VIEW individual_workers AS
SELECT actors.person_id, people.person_name, actors.role_type_id, role_type, game_position, action_type, action_time
FROM actors, people, role_types, message_actions
WHERE actors.person_id = people.person_id
AND actors.role_type_id = role_types.role_type_id
AND message_actions.actor_id = actors.actor_id;

-- -----------------------------------------------------
-- View `ludo`.`message_action_detail
-- -----------------------------------------------------
CREATE VIEW message_action_detail AS
SELECT message_actions.actor_id, action_type, game_position, actor_name, actors.role_type_id, actors.person_id, role_type, people.username
FROM message_actions, actors, role_types, people
WHERE message_actions.actor_id = actors.actor_id
AND actors.role_type_id = role_types.role_type_id
AND people.person_id = actors.person_id
ORDER BY actor_id, game_position, person_id;

-- -----------------------------------------------------
-- View `ludo`.`message_gameday_summary
-- -----------------------------------------------------
CREATE VIEW message_gameday_summary AS
SELECT actor_id, actor_name, count(*) message_actions, game_position
FROM message_action_detail
GROUP BY message_action_detail.actor_id, game_position
ORDER BY game_position, actor_id;