-- session 13 ( IS NULL) 

SELECT * 
FROM customers
WHERE phone IS NULL ; 

-- Exercise : 
-- get the orders that are not shipped 

SELECT * 
FROM orders
WHERE shipped_date IS NULL ;



-- session 14 ( ORDER BY clause) 
SELECT * 
FROM customers
ORDER BY first_name;

-- we can change to descending order by using DESC
SELECT * 
FROM customers
ORDER BY first_name DESC;


-- we can combine the order 
-- ( Eg. we sort the data based on the state and for simillar stat we 
-- them by their first_name )
SELECT * 
FROM customers
ORDER BY state, first_name ; 


-- also we can select some columns but sort the Data based on others ( ONLY on MYSQL)
SELECT first_name, last_name 
FROM customers
ORDER BY birth_date ; 

-- Exercise:
SELECT * , quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC ; 

-- Or we can just say it like this way 
SELECT *
FROM order_items
WHERE order_id = 2
ORDER BY  quantity * unit_price DESC ; 

