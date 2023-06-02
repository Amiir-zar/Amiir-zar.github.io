-- Session 10 

SELECT *
FROM customers
WHERE points > 1000 AND points < 3000;


-- We can use between to make it more concise and simpler 
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;


-- Exercise : 
-- Return customers that born between 1990-01-01 and 2000-01-01

SELECT * 
FROM customers 
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';


-- Session 11 ( LIKE Operator ) 

SELECT *
FROM customers
WHERE last_name LIKE 'b%' ; 
-- It will show us all of the customers with b in the begginig of their lastname 

SELECT *
FROM customers
WHERE last_name LIKE '%b%' ;  
-- It will show us all of the customers with b somewhere in their lastname 

SELECT *
FROM customers
WHERE last_name LIKE '_____y' ; 

SELECT *
FROM customers
WHERE last_name LIKE 'b____y' ;  
-- It will show us all of the customers their lastname starts with  b and 4 character after that and ends with y 


-- Exercise : 
-- get customers 
-- 1 whose addresses contain TRAIL or AVENUE 
-- 2 phone numbers end with 9 

-- 1 
SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR 
	  address LIKE '%AVENUE%' ; 

-- 2 
SELECT *  
FROM customers
WHERE phone LIKE '%9' ;




