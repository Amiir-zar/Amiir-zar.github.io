-- session 33 ( Creating a copy of a Table )

CREATE TABLE orders_archived AS 
SELECT * FROM orders ;

-- Now we only want to insert only some of data in the oreders 
-- so first we truncate all the data in the orders_archived 
-- then INSERT these filtered data into it 


    
--  first write the insert into  
-- then in a SUBQUEERY filter the data we want to have 

INSERT INTO orders_archived 
SELECT *
FROM orders
WHERE order_date < '2019-01-01'
;


-- Exerecise:
USE sql_invoicing;

CREATE TABLE invoices_archived
SELECT 
	i.invoice_id, 
    i.number,
    c.name AS client, 
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.payment_date,
    i.due_date
FROM invoices i 
JOIN clients c
	USING( client_id)
WHERE payment_date IS NOT NULL

