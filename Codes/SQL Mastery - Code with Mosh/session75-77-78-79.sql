-- Session 75 ( Functions)

DELIMITER $$
CREATE FUNCTION get_risk_factor  ( client_id INT )
RETURNS INTEGER
DETERMINISTIC 
BEGIN
DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
DECLARE invoices_total DECIMAL(9,2);
DECLARE invoices_count INT;

SELECT COUNT(*), SUM(invoice_total)
INTO invoices_count,invoices_total 
FROM invoices i
WHERE i.client_id = client_id;

SET risk_factor = invoices_total / invoices_count * 5;

RETURN IFNULL(risk_factor,0);
END $$
DELIMITER ;

-- Now we can use our Function even in our codes:

SELECT 
	client_id, 
    name,
    get_risk_factor(client_id) AS risk_factor 
FROM clients


-- Session 77 (Triggers)

DELIMITER $$

CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments 
    FOR EACH ROW 
    
BEGIN
	UPDATE invoices 
	SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
END $$
   
DELIMITER ;


-- Now lets try whether the data will change in the invoices 
-- when we insert data into the payments :


INSERT INTO payments
VALUES ( DEFAULT , 5, 3,'2019-1-1',10,1)


-- Exercise: Create a trigger that reduce the payment_total when we DELETE a invoice


DELIMITER $$

CREATE TRIGGER payments_after_delete
	AFTER DELETE ON  payments
    FOR EACH ROW 
    
BEGIN 
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
END $$
   
DELIMITER ;

-- Now lets try whether the TRIGGER work or not!

DELETE 
FROM payments
WHERE payment_id = 10;

-- session 78 ( Viewing Trigger)
SHOW TRIGGERS ; 

-- session 79 ( Dropping Trigger)

DROP TRIGGER IF EXISTS  payments_after_delete ; 

-- THAT'S IT :))

-- BUT NOTICE :
-- USE this in the first line of creating a trigger just like stored procedure since
-- you first delete the last version of trigger that has been created before otherwise you are gonna encouter an error.

