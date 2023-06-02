-- Session 12 ( REGEXP) 

SELECT *
FROM customers
WHERE last_name REGEXP 'field' ;


SELECT *
FROM customers
WHERE last_name REGEXP '^field';


SELECT *
FROM customers
WHERE last_name REGEXP 'field$';


SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac|rose';


SELECT *
FROM customers
WHERE last_name REGEXP '[gim]a';


SELECT *
FROM customers
WHERE last_name REGEXP 'a[a-h]';

-- To recap : 
--  ^  --> beggining 
--  $  --> end 
--  |  --> logical OR
--  [abcd] --> assess all these in the bracket 
--  [a-h]  --> assess all the character from a to h 


-- Exercise: 
-- get the customers whose 
-- first name are 'ELKA' OR 'AMBUR'
-- last name ends with EY OR ON 
-- last name start with MY OR contains SE 
-- last name contain B followed by R or U 

SELECT * 
FROM customers 
WHERE first_name REGEXP 'ELKA|AMBUR';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'ey$|on$';

SELECT * 
FROM customers 
WHERE last_name REGEXP '^my|se';


SELECT * 
FROM customers 
WHERE last_name REGEXP 'b[ru]';  -- or WHERE last_name REGEXP 'br|bu'



