-- session 72 ( parameter validation)

DELIMITER $$
CREATE PROCEDURE make_payment( invoice_id INT , payment_amount DECIMAL(9,2) , payment_date DATE) 
 BEGIN 
	UPDATE invoices i 
	SET 
		i.payment_total = payment_amount,
        i.payment_date = payment_date
	WHERE 
		i.invoice_id = invoice_id;
 END $$ 
 DELIMITER ;
 
 
 -- Now we should VALIDATE our PARAMETERS 
 
DROP PROCEDURE IF EXISTS make_payment;

DELIMITER $$
CREATE PROCEDURE make_payment( invoice_id INT , payment_amount DECIMAL(9,2) , payment_date DATE) 
 BEGIN
	IF payment_amount <= 0 THEN 
		SIGNAL SQLSTATE '22003'
			 SET MESSAGE_TEXT = 'Invalid payment amount' ;
	END IF;
    
	UPDATE invoices i 
	SET 
		i.payment_total = payment_amount,
        i.payment_date = payment_date
	WHERE 
		i.invoice_id = invoice_id;
 END $$ 
 DELIMITER ;
 
 
 
 -- session 74 ( Variables )  
 
 -- User or session Variables 
 -- SET @invoices_count = 0
 
 -- Local Variables 
 -- DECLARE risk_factor DECIMAL(9,2) DEFAULT 0
 
DROP PROCEDURE IF EXISTS get_risk_factor;
DELIMITER $$
CREATE PROCEDURE get_risk_factor()
BEGIN
DECLARE risk_factor DECIMAL(9,2) DEFAULT 0;
DECLARE invoices_total DECIMAL(9,2);
DECLARE invoices_count INT;

SELECT COUNT(*), SUM(invoice_total)
INTO invoices_count,invoices_total 
FROM invoices;

SET risk_factor = invoices_total / invoices_count * 5;

SELECT risk_factor;
END $$ 
DELIMITER ;

 