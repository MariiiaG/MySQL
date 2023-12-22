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
DECLARE result VARCHAR(200) DEFAULT 0;

SET my_days = seconds DIV 86400;
SET remains = seconds - my_days * 86400;
SET my_hours = remains DIV 3600;
SET seconds = remains - my_hours * 3600;
SET my_mins = seconds DIV 60;
SET remains = seconds - my_mins * 60;


SET result = CONCAT(my_days, " days, ", my_hours, " hours, ", my_mins, " minutes, ", remains, " seconds");

RETURN result;
   
END //

DELIMITER ;

SELECT ConvertSeconds(123456);
