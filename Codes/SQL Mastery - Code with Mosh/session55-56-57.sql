-- session 55 ( Date functions)

SELECT NOW(),  -- shows the current Date and Time 
	   CURDATE(),  -- shows the current Date
	   CURTIME();  -- shows the current Time

SELECT NOW(),
		YEAR(NOW()),  -- We can have only the year 
	    MONTH(NOW()), -- as well as month 
	    DAY(NOW()),   -- also the day 
        HOUR(NOW()),  -- Even hour
        MINUTE(NOW()), -- Minute
        SECOND(NOW());  -- second
        
        
-- We can have these as a string too 

SELECT DAYNAME(NOW()),
	   MONTHNAME(NOW());

-- To put in a SQL language that other databases can understand 

SELECT EXTRACT(YEAR FROM NOW());
SELECT EXTRACT(MONTH FROM NOW());


 -- Exercise:
SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(NOW());


-- session 56 ( Formating Dates and Time)

SELECT DATE_FORMAT(NOW(),'%y'),
	   DATE_FORMAT(NOW(),'%Y');
SELECT
	   DATE_FORMAT(NOW(),'%m'),
       DATE_FORMAT(NOW(),'%M');
SELECT
	   DATE_FORMAT(NOW(),'%d'),
       DATE_FORMAT(NOW(),'%D');
       
SELECT
	   DATE_FORMAT(NOW(),'%Y %m'),
       DATE_FORMAT(NOW(),'%Y %M');

SELECT
	   DATE_FORMAT(NOW(),'%Y %m %d'),
       DATE_FORMAT(NOW(),'%Y %M %D');
       
-- Time_format
SELECT
	   TIME_FORMAT(NOW(),'%h:%i'),
       TIME_FORMAT(NOW(),'%H:%i');




-- session 57 ( calculation Dates and Time)

SELECT  NOW(), INTERVAL 2 DAY);
SELECT DATE_ADD(NOW(), INTERVAL 2 MONTH);
SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR);

-- What if we want to go back in time? 
-- There are actually two approach to deal with this problem 

SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR) AS solution1 ,
	   DATE_SUB(NOW(), INTERVAL 1 YEAR) AS solution2 ; 
-- both are correct! 


-- We can also calculate the differenct between two dates :

SELECT DATEDIFF(NOW(),'2019-09-01');  -- THE OUTPUT WILL BE IN DAYS 


-- We can also calculate the differenct between two Times:

SELECT TIME_TO_SEC('09:00');
SELECT TIME_TO_SEC('09:10') -  TIME_TO_SEC('09:00');

        