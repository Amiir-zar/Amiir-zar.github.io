-- session 34 ( UPDATE ) 

UPDATE invoices
SET 
	payment_total = invoice_total * 0.5 , 
    payment_date = due_date
WHERE invoice_id = 2   
;  


  -- session 35 ( Updating multiple Rows)
USE sql_invoicing;
UPDATE invoices
SET 
	payment_total = invoice_total * 0.8 , 
    payment_date = '2021-03-03'
WHERE invoice_id IN (7,8)   
;

-- Exercise : 
-- give all people who were born before 1990,  50 extra points 

USE sql_store; 

UPDATE customers
SET points = points + 50
WHERE birth_date < '2019-01-01'
;

-- session 36 ( Using subqueries updates)


USE sql_invoicing;
UPDATE invoices
SET 
    payment_date = due_date,
    payment_total = invoice_total * 0.5 
WHERE client_id IN 
		( SELECT client_id 
          FROM clients
          WHERE state IN ('CA','NY') ) 
;

UPDATE invoices
SET payment_date = due_date
WHERE payment_date IS NULL 
;

-- Exercise: 
-- set the comments in the oders to GOLD where the customer
-- who bought it gained more than 3000 points 

USE sql_store; 
UPDATE orders 
SET comments = 'Gold'
WHERE customer_id IN 
		( SELECT customer_id
		  FROM customers
          WHERE points > 3000 )
;


