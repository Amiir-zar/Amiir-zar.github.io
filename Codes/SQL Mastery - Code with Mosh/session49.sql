-- session 49 ( Correlated subqueries)

-- Select employees whose salary is 
-- above the average in their office 

-- to Turn the question into a SUDO CODE : 
-- for each employee calculate the average salary for employee.office 
-- return the employee if salary > avg

USE sql_hr;

SELECT * 
FROM employees e
WHERE salary > (
	SELECT AVG(salary)
    FROM employees 
    WHERE office_id = e.office_id )
;

-- Exercise : Get the invoices that are larger than 
-- client's average invoice amount 
USE sql_invoicing;
SELECT *
FROM invoices i
WHERE invoice_total > ( 
	SELECT AVG(invoice_total)
    FROM invoices
    WHERE client_id = i.client_id
)
;


-- session 50 ( The Exist Operator)

-- select clients that have an invoice 
-- Solution1 : 
SELECT *
FROM clients 
WHERE client_id IN (
	SELECT DISTINCT client_id
    FROM invoices
    )
;
-- Solution2 : 
SELECT *
FROM clients c
WHERE EXISTS (
	SELECT  client_id
    FROM invoices
    WHERE client_id = c.client_id
    )
;

    
-- Exercise : Find the products that have never been used 

USE sql_store;
SELECT *
FROM products p
WHERE NOT EXISTS( 
	SELECT product_id
    FROM order_items
    WHERE p.product_id = product_id 
    )
    