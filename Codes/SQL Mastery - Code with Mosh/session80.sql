-- Session 80 ( Using Trigger for Audinting)

USE sql_invoicing;


-- first we create a table for observing the actions 

CREATE TABLE payments_audit
(
		client_id		INT,
        date			DATE,
        amount			DECIMAL(9,2),
        action_type		VARCHAR(50), 
        action_date		DATETIME
)

-- see whether it works or not 

DELIMITER $$

DROP TRIGGER IF EXISTS  payments_after_insert ; 
CREATE TRIGGER payments_after_insert
	AFTER INSERT ON payments 
    FOR EACH ROW 
    
BEGIN
	UPDATE invoices 
	SET payment_total = payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id , NEW.date , NEW.amount , 'INSERT' , NOW());
END $$
   
DELIMITER ;


INSERT INTO payments
VALUES ( DEFAULT , 5, 4,'2019-1-1',30,1)


DELIMITER $$
DROP TRIGGER IF EXISTS  payments_after_delete ; 
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON  payments
    FOR EACH ROW 
    
BEGIN 
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
	INSERT INTO payments_audit
    VALUES (OLD.client_id , OLD.date , OLD.amount , 'DELETE' , NOW());
    
END $$
   
DELIMITER ;

DELETE 
FROM payments
WHERE payment_id = 11;

