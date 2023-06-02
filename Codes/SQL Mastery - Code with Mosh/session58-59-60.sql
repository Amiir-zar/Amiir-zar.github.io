-- session 58 ( The INFULL AND COALESCE)

USE sql_store;
SELECT 
	order_id,
    IFNULL(shipper_id,'Not Assigned') As  'usage of IFNULL',
	COALESCE(shipper_id, comments, status, 'Not Assigned') As 'usage of COALESCE'
FROM orders ;

-- Exercise:

SELECT 
	CONCAT(first_name, ' ' ,last_name) AS customer, 
    IFNULL(phone,'Unknown') As phone
FROM customers ;


-- session 59 ( The IF Function)

SELECT
	   order_id,
	   order_date,
       IF(YEAR(order_date) < '2018' , 
		   'Active',
           'Archived') As status	
FROM orders
;


-- Exercise : 
SELECT 
	   product_id,
	   name,
       COUNT(*) AS orders,
       IF(COUNT(*) > 1 , 'Many_times', 'Once') As frequency
FROM products
JOIN order_items USING(product_id)
GROUP BY product_id, name
;

-- session 60 ( the CASE Operator )

SELECT
	   order_id,
	   order_date,
       CASE 
       WHEN YEAR(order_date) BETWEEN '2018-01-01'   AND  '2020-01-01'  THEN  'Future'
       WHEN YEAR(order_date) BETWEEN '2017-01-01'   AND '2017-12-31' THEN 'Active'
       WHEN YEAR(order_date) BETWEEN '2009-01-01'   AND'2016-01-01'  THEN 'Archived'
       END  AS category
FROM orders
;

-- Exercise: 

SELECT 
	CONCAT(first_name, ' ' , last_name) AS customer,
    CASE 
	WHEN points > 3000 THEN 'Gold'
    WHEN points >= 2000 THEN 'Silver'
    ELSE 'Bronze'
	END AS customer_type
FROM customers

