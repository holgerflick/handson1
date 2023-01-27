# ALTER TABLE companies ADD PRIMARY KEY (id);
ALTER TABLE companies ADD INDEX `KEY_NAME` (`name`);
ALTER TABLE companies ADD INDEX `KEY_STATUS` (`status`);
ALTER TABLE companies ADD INDEX `KEY_RA_NAME` (`ra_name`);
ALTER TABLE companies ADD INDEX `KEY_PRINC1_NAME` (`princ1_name`);
ALTER TABLE companies ADD INDEX `KEY_FILEDATE_YEAR` ((right(`file_date`,4)));
