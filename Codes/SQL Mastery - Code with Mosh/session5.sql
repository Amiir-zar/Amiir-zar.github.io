USE sql_store;

SELECT first_name , 
	   last_name,
       points, 
       points * 100 +10 
FROM customers
ORDER BY first_name 


