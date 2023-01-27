SET GLOBAL local_infile = TRUE;

CREATE DATABASE floridallc;

USE floridallc;

-- Dumping structure for table floridallc.tokens
CREATE TABLE IF NOT EXISTS `tokens` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT '0',
  `Token` char(36) NOT NULL DEFAULT '',
  `ValidUntil` timestamp NOT NULL DEFAULT ((now() + interval 1 hour)),
  PRIMARY KEY (`Id`),
  KEY `User_FK` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table floridallc.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `pw` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for trigger floridallc.tokens_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `tokens_before_insert` BEFORE INSERT ON `tokens` FOR EACH ROW BEGIN
  SET NEW.Token = UUID();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


CREATE TABLE IF NOT EXISTS `companies` (
  `id` varchar(12) NOT NULL,
  `name` varchar(192) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `filing_type` varchar(15) DEFAULT NULL,
  `princ_add_1` varchar(42) DEFAULT NULL,
  `princ_add_2` varchar(42) DEFAULT NULL,
  `princ_city` varchar(28) DEFAULT NULL,
  `princ_state` varchar(2) DEFAULT NULL,
  `princ_zip` varchar(10) DEFAULT NULL,
  `princ_country` varchar(2) DEFAULT NULL,
  `mail_add_1` varchar(42) DEFAULT NULL,
  `mail_add_2` varchar(42) DEFAULT NULL,
  `mail_city` varchar(28) DEFAULT NULL,
  `mail_state` varchar(2) DEFAULT NULL,
  `mail_zip` varchar(10) DEFAULT NULL,
  `mail_country` varchar(2) DEFAULT NULL,
  `file_date` varchar(8) DEFAULT NULL,
  `fei_number` varchar(14) DEFAULT NULL,
  `more_than_six_off_flag` varchar(1) DEFAULT NULL,
  `last_trx_date` varchar(8) DEFAULT NULL,
  `state_country` varchar(2) DEFAULT NULL,
  `report_year_1` varchar(4) DEFAULT NULL,
  `house_flag_1` varchar(1) DEFAULT NULL,
  `report_date_1` varchar(8) DEFAULT NULL,
  `report_year_2` varchar(4) DEFAULT NULL,
  `house_flag_2` varchar(1) DEFAULT NULL,
  `report_date_2` varchar(8) DEFAULT NULL,
  `report_year_3` varchar(4) DEFAULT NULL,
  `house_flag_3` varchar(1) DEFAULT NULL,
  `report_date_3` varchar(8) DEFAULT NULL,
  `ra_name` varchar(42) DEFAULT NULL,
  `ra_name_type` varchar(1) DEFAULT NULL,
  `ra_add_1` varchar(42) DEFAULT NULL,
  `ra_city` varchar(28) DEFAULT NULL,
  `ra_state` varchar(2) DEFAULT NULL,
  `ra_zip5` varchar(5) DEFAULT NULL,
  `ra_zip4` varchar(4) DEFAULT NULL,
  `princ1_title` varchar(4) DEFAULT NULL,
  `princ1_name_type` varchar(1) DEFAULT NULL,
  `princ1_name` varchar(42) DEFAULT NULL,
  `princ1_add_1` varchar(42) DEFAULT NULL,
  `princ1_city` varchar(28) DEFAULT NULL,
  `princ1_state` varchar(2) DEFAULT NULL,
  `princ1_zip5` varchar(5) DEFAULT NULL,
  `princ1_zip4` varchar(4) DEFAULT NULL,
  `princ2_title` varchar(4) DEFAULT NULL,
  `princ2_name_type` varchar(1) DEFAULT NULL,
  `princ2_name` varchar(42) DEFAULT NULL,
  `princ2_add_1` varchar(42) DEFAULT NULL,
  `princ2_city` varchar(28) DEFAULT NULL,
  `princ2_state` varchar(2) DEFAULT NULL,
  `princ2_zip5` varchar(5) DEFAULT NULL,
  `princ2_zip4` varchar(4) DEFAULT NULL,
  `princ3_title` varchar(4) DEFAULT NULL,
  `princ3_name_type` varchar(1) DEFAULT NULL,
  `princ3_name` varchar(42) DEFAULT NULL,
  `princ3_add_1` varchar(42) DEFAULT NULL,
  `princ3_city` varchar(28) DEFAULT NULL,
  `princ3_state` varchar(2) DEFAULT NULL,
  `princ3_zip5` varchar(5) DEFAULT NULL,
  `princ3_zip4` varchar(4) DEFAULT NULL,
  `princ4_title` varchar(4) DEFAULT NULL,
  `princ4_name_type` varchar(1) DEFAULT NULL,
  `princ4_name` varchar(42) DEFAULT NULL,
  `princ4_add_1` varchar(42) DEFAULT NULL,
  `princ4_city` varchar(28) DEFAULT NULL,
  `princ4_state` varchar(2) DEFAULT NULL,
  `princ4_zip5` varchar(5) DEFAULT NULL,
  `princ4_zip4` varchar(4) DEFAULT NULL,
  `princ5_title` varchar(4) DEFAULT NULL,
  `princ5_name_type` varchar(1) DEFAULT NULL,
  `princ5_name` varchar(42) DEFAULT NULL,
  `princ5_add_1` varchar(42) DEFAULT NULL,
  `princ5_city` varchar(28) DEFAULT NULL,
  `princ5_state` varchar(2) DEFAULT NULL,
  `princ5_zip5` varchar(5) DEFAULT NULL,
  `princ5_zip4` varchar(4) DEFAULT NULL,
  `princ6_title` varchar(4) DEFAULT NULL,
  `princ6_name_type` varchar(1) DEFAULT NULL,
  `princ6_name` varchar(42) DEFAULT NULL,
  `princ6_add_1` varchar(42) DEFAULT NULL,
  `princ6_city` varchar(28) DEFAULT NULL,
  `princ6_state` varchar(2) DEFAULT NULL,
  `princ6_zip5` varchar(5) DEFAULT NULL,
  `princ6_zip4` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata0.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata1.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata2.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata3.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata4.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata5.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata6.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata7.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata8.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE "e:\\cordata\\cordata9.txt.csv" INTO TABLE companies
  LINES TERMINATED BY '\r\n';

ALTER TABLE companies ADD INDEX `ID` (id);
ALTER TABLE companies ADD INDEX `KEY_NAME` (`name`);
ALTER TABLE companies ADD INDEX `KEY_STATUS` (`status`);
ALTER TABLE companies ADD INDEX `KEY_RA_NAME` (`ra_name`);
ALTER TABLE companies ADD INDEX `KEY_PRINC1_NAME` (`princ1_name`);
ALTER TABLE companies ADD INDEX `KEY_FILEDATE_YEAR` ((right(`file_date`,4)));
