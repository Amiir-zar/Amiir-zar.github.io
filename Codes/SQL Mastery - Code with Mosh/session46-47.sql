-- Session 46 ( subqueries vs joins)


-- Q: find the customers who have ordered lettuce 
-- 		select customer_id, first_name , last_name 

-- solution1 :
SELECT DISTINCT customer_id,first_name, last_name 
FROM customers
WHERE customer_id IN (
	SELECT o.customer_id
    FROM order_items oi
    JOIN orders o USING(order_id) 
    WHERE product_id = 3 
)
;

-- solution2 :
SELECT DISTINCT customer_id,first_name, last_name 
FROM customers
JOIN orders o USING( customer_id)
JOIN order_items oi USING ( order_id)
WHERE oi.product_id = 3 
;

-- session 47 ( The ALL keyword )

-- Q: Select all invoices larger than all invoices of client 3 

-- S1:
USE sql_invoicing;
SELECT *
FROM invoices 
WHERE invoice_total > (
	  SELECT MAX(invoice_total)
      FROM invoices
      WHERE client_id = 3 )
;

-- s2 : ( using ALL KEYWORD)
USE sql_invoicing;
SELECT *
FROM invoices 
WHERE invoice_total > All (
	  SELECT invoice_total
      FROM invoices
      WHERE client_id = 3 )
;


-- session 48 ( The ANY keywords)

SELECT *
FROM clients
WHERE client_id IN (
	SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(*) >= 2
)
;

-- s2: 
SELECT *
FROM clients
WHERE client_id = ANY (
	SELECT client_id
    FROM invoices
    GROUP BY client_id
    HAVING COUNT(*) >= 2
)