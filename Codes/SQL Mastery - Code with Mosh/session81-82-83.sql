-- session 81 ( Events)

SHOW VARIABLES LIKE 'event%';
SET GLOBAL event_scheduler = ON;
-- Or we just set it off to save our resoureces! our processor shouldn't constantly looking for that.
DROP EVENT IF EXISTS yearly_delete_audit_rows ;

DELIMITER $$ 
CREATE EVENT yearly_delete_audit_rows
ON SCHEDULE 
-- AT '2022-10-02' We can seet it for this exact time 
EVERY 1 YEAR STARTS '2019-10-02' ENDS '2029-10-02'
DO BEGIN 
	DELETE FROM  payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR 
END &&

DELIMITER ; 

-- session 82 ( Viewing Altering Events)
SHOW EVENTS LIKE 'yearly%';
DROP EVENT IF EXISTS yearly_delete_audit_rows ;
ALTER EVENT yearly_delete_audit_rows DISABLE/ ENABLE ;



-- session 84 ( Creating Transaction)

USE sql_store;

START TRANSACTION; 
INSERT INTO orders ( customer_id,order_date, status)
VALUES (1, '2020-01-10',1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1 ,1,1);

COMMIT;


-- session 87 ( Transaction Isolation Level )

SHOW VARIABLES LIKE 'transaction_isolation';
SET GLOBAL TRANSACTION ISOLATION LEVEL REPEATABLE READ;


-- IMPORTANT NOTICE :
-- Sessions 84 to 91 are about TRANSACTION Which is tooo important!!
-- make sure to check them again!