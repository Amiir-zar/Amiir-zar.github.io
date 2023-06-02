-- Session 70 ( PARAMETERS )

DROP PROCEDURE IF EXISTS get_balance;
DELIMITER $$
CREATE PROCEDURE get_balance( state CHAR(2) )
BEGIN 
	SELECT * 
    FROM clients c  
	WHERE c.state = state ;  -- the second state is the variable we put in the get_balance
END $$
DELIMITER ;

CALL get_balance('CA'); -- its just like a function we give it a value and get a output

-- Exercise:

DELIMITER $$
CREATE PROCEDURE get_invoices_by_client( client_id INT )
BEGIN 
	SELECT *
    FROM invoices i
    WHERE i.client_id = client_id ;
END $$
DELIMITER ;

CALL get_invoices_by_client(1);



-- session 71 ( Defaults Value) 

DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state( state CHAR(2) )
BEGIN 
	IF state IS NULL THEN
		SELECT * FROM clients;
    ELSE 
		SELECT *
		FROM clients c
		WHERE c.state = state ;
	END IF;
END $$
DELIMITER ;

CALL get_clients_by_state('CA');

-- A better way to say it ! ( the previous one is too verbose!)

DROP PROCEDURE IF EXISTS get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state( state CHAR(2) )
BEGIN 
		SELECT *
		FROM clients c
		WHERE c.state = IFNULL(state,c.state) ;
END $$
DELIMITER ;

CALL get_clients_by_state(NULL);


-- Exercise: 

DROP PROCEDURE IF EXISTS get_payments;
DELIMITER $$
CREATE PROCEDURE get_payments( client_id INT, payment_method_id TINYINT)
BEGIN 
	SELECT *
    FROM payments p
	WHERE
		p.client_id = IFNULL(client_id, p.client_id) AND 
        p.payment_method = IFNULL(payment_method_id, p.payment_method);
END $$
DELIMITER ;	

CALL get_payments(NULL,NULL);
 