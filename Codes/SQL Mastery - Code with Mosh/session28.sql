-- session 28 ( UNION)

SELECT 
	order_id , 
    order_date,
    'Active' AS status
FROM orders 
WHERE order_date >= '2019-01-01'
UNION
SELECT 
	order_id , 
    order_date,
    'Archived'
FROM orders 
WHERE order_date < '2019-01-01' ;


-- EX2 ( just for learning no usage )

SELECT first_name AS full_name_shippers 
FROM customers
UNION 
SELECT name
FROM shippers ; 

-- Exercise
-- ( categorize the data into three sub group BRONZE, SILVER AND GOLD 
-- based on the customers points and sort them by their name)

SELECT 
	customer_id,
    first_name ,
    points,
    'Bronze' AS type 
FROM customers
WHERE points < 2000 
UNION
SELECT 
	customer_id,
    first_name ,
    points,
    'Silver' AS type 
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT 
	customer_id,
    first_name,
    points,
    'Gold' AS type 
FROM customers
WHERE points > 3000
ORDER BY first_name 