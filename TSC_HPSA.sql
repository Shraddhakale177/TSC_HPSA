-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema teacher_student_connect
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema teacher_student_connect
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `teacher_student_connect` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `teacher_student_connect` ;

-- -----------------------------------------------------
-- Table `teacher_student_connect`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`admin` (
  `ad_id` VARCHAR(15) NOT NULL,
  `ad_first_name` VARCHAR(50) NULL DEFAULT NULL,
  `ad_last_name` VARCHAR(50) NULL DEFAULT NULL,
  `ad_age` INT(2) NULL DEFAULT NULL,
  `ad_gender` VARCHAR(6) NULL DEFAULT NULL,
  `ad_contact_no` BIGINT(10) NULL DEFAULT NULL,
  `ad_password` VARCHAR(15) NULL DEFAULT NULL,
  `ad_status` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`documents`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`documents` (
  `doc_keyword` VARCHAR(50) NOT NULL,
  `doc_title` VARCHAR(100) NULL DEFAULT NULL,
  `doc_author` VARCHAR(50) NULL DEFAULT NULL,
  `doc_subject` VARCHAR(50) NULL DEFAULT NULL,
  `doc_year` VARCHAR(4) NULL DEFAULT NULL,
  `doc_path` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`doc_keyword`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`login` (
  `login_id` VARCHAR(15) NOT NULL,
  `login_password` VARCHAR(15) NULL DEFAULT NULL,
  `login_type` VARCHAR(6) NULL DEFAULT NULL,
  PRIMARY KEY (`login_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`resource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`resource` (
  `res_code` VARCHAR(20) NOT NULL,
  `res_description` VARCHAR(500) NULL DEFAULT NULL,
  `skill_name` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`res_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`skills` (
  `skill_name` VARCHAR(100) NOT NULL,
  `skill_level` VARCHAR(6) NULL DEFAULT NULL,
  `skill_audience` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`skill_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`user` (
  `us_id` VARCHAR(15) NOT NULL,
  `us_first_name` VARCHAR(50) NULL DEFAULT NULL,
  `us_last_name` VARCHAR(50) NULL DEFAULT NULL,
  `us_age` INT(2) NULL DEFAULT NULL,
  `us_gender` VARCHAR(6) NULL DEFAULT NULL,
  `us_contact_no` BIGINT(10) NULL DEFAULT NULL,
  `us_category` VARCHAR(8) NULL DEFAULT NULL,
  `us_password` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`us_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`student` (
  `st_id` VARCHAR(15) NOT NULL,
  `st_us_id` VARCHAR(15) NULL DEFAULT NULL,
  `st_name` VARCHAR(100) NULL DEFAULT NULL,
  `st_spl` VARCHAR(100) NULL DEFAULT NULL,
  `st_no_of_document` INT(4) NULL DEFAULT NULL,
  `st_image` BLOB NULL DEFAULT NULL,
  `st_batch` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  INDEX `st_us_id_idx` (`st_us_id` ASC),
  CONSTRAINT `st_us_id`
    FOREIGN KEY (`st_us_id`)
    REFERENCES `teacher_student_connect`.`user` (`us_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`superuser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`superuser` (
  `super_id` VARCHAR(15) NOT NULL,
  `super_password` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`super_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `teacher_student_connect`.`teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `teacher_student_connect`.`teacher` (
  `tr_id` VARCHAR(15) NOT NULL,
  `tr_us_id` VARCHAR(15) NULL DEFAULT NULL,
  `tr_name` VARCHAR(100) NULL DEFAULT NULL,
  `tr_spl` VARCHAR(100) NULL DEFAULT NULL,
  `tr_no_of_student` INT(4) NULL DEFAULT NULL,
  `tr_planned_leaves` VARCHAR(4) NULL DEFAULT NULL,
  `tr_date` DATE NULL DEFAULT NULL,
  `tr_time` VARCHAR(10) NULL DEFAULT NULL,
  `tr_batch` VARCHAR(10) NULL DEFAULT NULL,
  `tr_subject` VARCHAR(10) NULL DEFAULT NULL,
  `tr_notes` VARCHAR(100) NULL DEFAULT NULL,
  `tr_image` BLOB NULL DEFAULT NULL,
  PRIMARY KEY (`tr_id`),
  INDEX `tr_us_id_idx` (`tr_us_id` ASC),
  CONSTRAINT `tr_us_id`
    FOREIGN KEY (`tr_us_id`)
    REFERENCES `teacher_student_connect`.`user` (`us_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
