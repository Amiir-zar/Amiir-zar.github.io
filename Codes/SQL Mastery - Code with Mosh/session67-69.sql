-- session 67 ( Creating a PROCEDURE) 

DELIMITER $$
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END $$
DELIMITER ;

-- For using the PROCEDURE we just made we should call it ! 
CALL get_clients()

-- Exercise:
DELIMITER $$
CREATE PROCEDURE get_balance()
BEGIN 
	SELECT * 
    FROM clients_balance  -- thats a view that we created in the previous sessions!
	WHERE balance > 0 ;
END $$
DELIMITER ;

CALL get_balance()
;
-- session 69 ( Drop procedure)

DROP PROCEDURE IF EXISTS get_balance;

DELIMITER $$
CREATE PROCEDURE get_balance()
BEGIN 
	SELECT * 
    FROM clients_balance  -- thats a view that we created in the previous sessions!
	WHERE balance > 0 ;
END $$
DELIMITER ;

