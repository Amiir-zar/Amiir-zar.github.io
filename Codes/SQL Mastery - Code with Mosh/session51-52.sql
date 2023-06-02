-- session 51 ( Subquereis in the SELECT Clause ) 
USE sql_invoicing;
SELECT invoice_id,
	   invoice_total,
       (SELECT AVG(invoice_total) FROM invoices ) AS invoice_average,
       invoice_total - ( SELECT invoice_average) AS difference 
FROM invoices
;

-- Exercise:

USE sql_invoicing;
SELECT 
	   client_id,
	   name, 
       (SELECT SUM(invoice_total)
        FROM invoices
        WHERE client_id = c.client_id) AS total_sales,
	   (SELECT AVG(invoice_total) FROM invoices) AS average,
       (SELECT total_sales - average) AS difference  
FROM clients c
GROUP BY client_id
;


-- session 52 ( subqueries in the FORM clause) 

-- Q: Write a query that can filter all the empty rows in the last session result! 

SELECT *
FROM (
SELECT 
	   client_id,
	   name, 
       (SELECT SUM(invoice_total)
        FROM invoices
        WHERE client_id = c.client_id) AS total_sales,
	   (SELECT AVG(invoice_total) FROM invoices) AS average,
       (SELECT total_sales - average) AS difference  
FROM clients c
GROUP BY client_id ) AS salary_sumary   
WHERE total_sales IS NOT NULL