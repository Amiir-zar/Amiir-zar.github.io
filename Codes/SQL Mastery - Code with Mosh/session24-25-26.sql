
USE sql_hr;

SELECT 
	e.employee_id,
    e.first_name,
    m.first_name AS manager 
FROM employees e  
LEFT JOIN employees m 
	ON e.reports_to = m.employee_id  ;
    
    
-- session 25 ( The USING clause ) 

USE sql_store;

SELECT 
	o.order_id,
    c.first_name
FROM orders o
JOIN customers c 
	-- c.customer_id = o.customer_id
	USING(customer_id) ; 
    
SELECT 
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o 
JOIN customers c 
	USING(customer_id)
LEFT JOIN shippers sh
	USING(shipper_id) ; 
    
    
SELECT *
FROM order_items oi 
JOIN order_item_notes oin
	-- ON oi.order_id =  oin.order_id AND oi.product_id =  oin.product_id cross
	USING(order_id , product_id)

