 -- Session 15 ( LIMIT Clause ) 
 
 -- we can limit the output ( for example just see only 6 of them)
 SELECT *
 FROM customers
 LIMIT 6;
 
 
 -- down bellow 6 first data will be ingnored and 7,8,9 will be shown
 SELECT *
 FROM customers
 LIMIT 6,3 ;
 
 
 -- Exercise : 
 SELECT *
 FROM customers
 ORDER BY points DESC
 LIMIT 3 ;
 
 
 -- Session 16 ( Inner Joins ) 
 
 -- we wanna join orders table with cutomers table ( to do so we should use JOIN ) 
SELECT *
FROM orders 
JOIN  customers ON orders.customer_id = customers.customer_id ; 
-- or INNER JOIN customers ( there is no difference) 



-- it was so complicated lets make it more simpler by choosing some the columns 
SELECT order_id, first_name, last_name , customers.customer_id 
FROM orders 
JOIN  customers ON orders.customer_id = customers.customer_id ;
-- or INNER JOIN customers ( there is no difference) 

-- Since we had the customer_id  in both the orders and customers, 
-- we prefix the customers_id with one of those ( we could preffix it with orders too )

-- Notice : ( Abbreviation )
-- We can abbreviate the names with shorter display names 

SELECT order_id, first_name, last_name , o.customer_id 
FROM orders o
JOIN  customers c ON o.customer_id = c.customer_id ; 


-- Exercise : 

SELECT order_id, oi.product_id , quantity, oi.unit_price  
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id ;


-- session 17 ( joining Across Databses) 

USE sql_store;
SELECT * 
FROM order_items oi
JOIN sql_inventory.products p 
	ON oi.product_id = p.product_id ; 

-- or we can choose the sql_inventory as our workspace and preffix the ones in the sql_store
    
USE sql_inventory;
SELECT * 
FROM sql_store.order_items oi
JOIN products p 
	ON oi.product_id = p.product_id ; 

 