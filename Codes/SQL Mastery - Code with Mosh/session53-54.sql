-- Session 53 ( Numeric Functions): 
-- ROUND , TRUNCATE , CEILING , FLOOR , ABS , RAND

SELECT ROUND(23.931);
SELECT ROUND(23.7652,2);

SELECT TRUNCATE(23.931,1);
SELECT TRUNCATE(23.7652,2);

SELECT CEILING(23.931);
SELECT CEILING(23.131);

SELECT FLOOR(23.931);
SELECT FLOOR(23.131);

SELECT ABS(-5.2);
SELECT ABS(5.2);

SELECT RAND();





-- Session 54 ( String Functions)
-- LENGTH , UPPER , LOWER 
-- LTRIM , RTRIM , TRIM
-- LEFT , RIGHT 
-- LOCATE,SUBSTRING
-- REPLACE , CONCAT


SELECT LENGTH('sky');
SELECT UPPER('sky');  -- UPERCASE 
SELECT LOWER('sky');  -- LOWERCASE 

SELECT LTRIM('     sky'); -- LEFT TRIM 
SELECT LTRIM('sky     '); -- RIGHT TRIM 
SELECT TRIM('     sky     ');  -- TRIM ALL 


SELECT LEFT('kindergarden',4);  -- Shows first 4 charactors
SELECT RIGHT('kindergarden',6); -- Shows last 6 charactors

SELECT SUBSTRING('Hello_dear_world',7,5);  -- shows the from the 7th word to 5 words after 

SELECT LOCATE('n','kindergarden');
SELECT LOCATE('N','kindergarden');
SELECT LOCATE('r','kindergarden');
SELECT LOCATE('q','kindergarden');  -- we will encounter 0 if the word does not exist
SELECT LOCATE('garden','kindergarden');  -- we can also search for bunch of words

SELECT REPLACE( 'kindergarYen','garYen','garden');
SELECT CONCAT('Amir','Hossein');

-- Ex:
SELECT CONCAT(first_name,'  ' , last_name) AS Full_name
FROM customers;

 