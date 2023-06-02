-- how to use DISTINCT to have unique output?
-- EX :
-- SELECT DISTINCT state 
-- FROM customers



-- Question : Return all ( name , unit_price, unit_price * 1.1 ) 
-- solution 
SELECT 
	name,
	unit_price,
	unit_price * 1.1 AS 'new price'
 FROM products 