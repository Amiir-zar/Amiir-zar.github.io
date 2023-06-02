SELECT * 
FROM Customers
WHERE points > 2500 ; 

-- all operators : 
--  > ||  <  ||   =>  || =<  ||   <> or != 

SELECT * 
FROM Customers
WHERE  state = 'VA';

SELECT *
FROM Customers
WHERE birth_date > '1990-1-10';

-- Exercise : get the orders placed this year 

SELECT * 
FROM orders 
WHERE order_date > '2019-01-01' ;

-- Session 8 ( how to combine the conditions)
SELECT * 
FROM Customers
WHERE points > 2500 AND points < 3500 ; 

-- Exercise : 
-- Select quantity and unit_price of #6 order where 
-- the totall order excedes more than 30$ ?

SELECT unit_price, quantity 
FROM order_items 
WHERE order_id = 6 AND ( quantity * unit_price ) > 30  ;

-- session 9 

SELECT * 
FROM Customers 
WHERE state IN ( 'VA', 'FL' ,'GA' ) ;


SELECT * 
FROM Customers 
WHERE state NOT IN ( 'VA', 'FL' ,'GA' ) ;


 -- Exercise:
 -- Return quanitiy in stock equal to 49,38,72 
 
SELECT *
FROM products
WHERE quantity_in_stock IN (49,38,72 ) ;

