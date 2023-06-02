-- session 42 ( The ROLLUP Operator)
USE sql_invoicing;
SELECT 
    city, 
    state,
    SUM(invoice_total) AS total_sales
FROM invoices i 
JOIN clients c USING( client_id)
GROUP BY city , state WITH ROLLUP
;
-- Exercise:

SELECT 
	pm.name AS payment_method,
    SUM(amount) AS total
FROM payments p
JOIN payment_methods pm 
	ON p.payment_method = pm.payment_method_id  
GROUP BY pm.name WITH ROLLUP 
;

-- session 44( introduction to more complex queries)


-- Q1: Find products that are more expensive than lettuce ( id =3)

SELECT * 
FROM products 
WHERE unit_price > (
		SELECT unit_price
        FROM products 
		WHERE product_id = 3 
)
;


-- Q2 : In sql_hr find employees whose earn more than average 

USE sql_hr;
SELECT *
FROM employees 
WHERE salary > (
	  SELECT AVG(salary)
      FROM employees)
;     



-- session 45 ( The IN operator )

-- Q: FIND the products that have never been ordered 

USE sql_store;

SELECT *
FROM products 
WHERE product_id NOT IN (
	SELECT DISTINCT product_id 
    FROM order_items
    )
;


-- Q2 : FIND the clients without invoices 

USE sql_invoicing;
SELECT *
FROM clients 
WHERE client_id NOT IN (
	SELECT DISTINCT client_id 
    FROM invoices
    )
;

