-- session 61 ( creating views) 

USE sql_invoicing;

-- first we create the view : 
CREATE VIEW sales_by_client AS 
SELECT 
	 c.client_id,
     c.name,
     SUM(invoice_total) AS total_sales     
FROM clients c
JOIN invoices i USING ( client_id)
GROUP BY client_id,name
;

-- now we can use it! 

SELECT * FROM sales_by_client ; 

SELECT * FROM sales_by_client
ORDER BY total_sales DESC ; 


-- Exercise : creating balance view

CREATE VIEW clients_balance AS 
SELECT 
	c.client_id,
    c.name,
    SUM( invoice_total -  payment_total ) AS balance 
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id,name
;

SELECT * FROM clients_balance;
