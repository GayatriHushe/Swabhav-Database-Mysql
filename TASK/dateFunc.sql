DELIMITER //
CREATE FUNCTION GETMYDATE()
RETURNS VARCHAR(20)
BEGIN
	
    RETURN DATE_FORMAT(NOW(), '%Y%m%d');
    
END; //
DELIMITER ;

SELECT GETMYDATE();