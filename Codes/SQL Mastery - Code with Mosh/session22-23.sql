-- session 22 ( Outer Join)

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id  
FROM customers c
LEFT  JOIN orders o 
ON c.customer_id = o.customer_id
ORDER BY c.customer_id ;


-- Exercise : 

SELECT
	p.product_id, 
    p.name ,
    oi.quantity
    
FROM products p

LEFT OUTER JOIN order_items oi
ON oi.product_id = p.product_id ; 


-- session 23 ( Outer Join between Multiple Tables )

SELECT 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
LEFT JOIN orders o 
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh 
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id ;



-- Exercise:

SELECT 
	o.order_id,
    o.order_date, 
    c.first_name AS customer,
    sh.name AS shipper ,
    os.name
FROM orders o 
JOIN customers c
	ON o.customer_id = c.customer_id 
LEFT JOIN shippers sh    
	ON o.shipper_id = sh.shipper_id
JOIN order_statuses os  
	ON  o.status = os.order_status_id
    
