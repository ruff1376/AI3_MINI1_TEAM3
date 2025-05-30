SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `pt_history`;
CREATE TABLE `pt_history` (
	`history_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`member_no` INT NOT NULL,
	`total_count` INT NULL,
	`used_count` INT NULL,
	`remain_count` INT NULL
);

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
	`qna_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`member_no` INT NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`question` TEXT NOT NULL,
	`question_date` DATE NOT NULL,
	`status` TINYINT NULL
);

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE `trainer` (
	`trainer_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NOT NULL,
	`phone` VARCHAR(20) NOT NULL,
	`admin` TINYINT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS `pt_schedule`;
CREATE TABLE `pt_schedule` (
	`schedule_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`trainer_id` INT NOT NULL,
	`member_no` INT NOT NULL,
	`book_date` DATE NOT NULL,
	`book_time` TIME NOT NULL,
	`note` TEXT NULL
);

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
	`sales_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`trainer_id` INT NOT NULL,
	`date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
	`amount` INT NULL,
	`note` TEXT NULL
);

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
	`qna_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`trainer_id` INT NOT NULL,
	`comment` TEXT NULL,
	`comment_date` DATE NULL
);

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
	`member_no` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NOT NULL,
	`member_id` VARCHAR(100) NOT NULL,
	`password` VARCHAR(100) NOT NULL,
	`phone` VARCHAR(20) NOT NULL,
	`join_date` DATE NOT NULL,
	`expire_date` DATE NOT NULL,
	`admin` TINYINT NOT NULL
);

DROP TABLE IF EXISTS `gym_machine`;
CREATE TABLE `gym_machine` (
	`gym_machine_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(100) NULL,
	`brand` VARCHAR(100) NULL,
	`category` VARCHAR(100) NULL,
	`status` TEXT NULL
);

-- Foreign Keys

ALTER TABLE `pt_history` ADD CONSTRAINT `FK_member_TO_pt_history_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`);
ALTER TABLE `question` ADD CONSTRAINT `FK_member_TO_question_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`);
ALTER TABLE `pt_schedule` ADD CONSTRAINT `FK_trainer_TO_pt_schedule_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`);
ALTER TABLE `pt_schedule` ADD CONSTRAINT `FK_member_TO_pt_schedule_1` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`);
ALTER TABLE `sales` ADD CONSTRAINT `FK_trainer_TO_sales_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`);
ALTER TABLE `comment` ADD CONSTRAINT `FK_trainer_TO_comment_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`);
