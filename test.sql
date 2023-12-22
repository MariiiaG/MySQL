DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS test;
USE test;

DELIMITER //

CREATE FUNCTION ConvertSeconds(seconds INT)
RETURNS VARCHAR(50)
DETERMINISTIC 
BEGIN
DECLARE my_days INT DEFAULT 0;
DECLARE my_hours INT DEFAULT 0;
DECLARE my_mins INT DEFAULT 0;
DECLARE remains INT DEFAULT 0;
DECLARE result VARCHAR(50) DEFAULT 0;

SET my_days = seconds / 86400;
SET remains = seconds - my_days * 86400;
SET my_hours = remains / 3600;
SET remains = remains - remains * 3600;

SET result = CONCAT(my_days, " days,", my_hours, " hours", my_mins, "minutes", remains, " seconds");

RETURN result;
   
END //

DELIMITER ;

SELECT ConvertSeconds(123456);
