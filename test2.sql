-- Создайте функцию, которая выводит только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP DATABASE IF EXISTS test2;
CREATE DATABASE IF NOT EXISTS test2;
USE test2;

DELIMITER //
CREATE FUNCTION even_num(num INT) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
DECLARE num1 INT DEFAULT 0;
DECLARE result VARCHAR(50) DEFAULT 0;


WHILE num1 <= num DO
SET result = CONCAT(num1, " ");
SET num1 = num1 + 2;
SET result = CONCAT(result, " ", num1);
END WHILE;
RETURN result;

END //
DELIMITER ;

SELECT even_num(10);