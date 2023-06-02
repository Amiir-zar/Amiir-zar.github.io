-- session 101 JSON 

-- We can create JSON like : 
-- ' { "key" : value, "key" : value , "key" : value , ......} '

UPDATE products 
SET properties  = '
 { 
"dimensions" : [1,2,3],
"weight" :10,
"colour" : "black",
"manufacturer" : { "name" : "sony"}
 }
'
WHERE product_id = 1 ;

-- Also we can create it like :
--  JSON_OBJECT( 'key' , value , 'key' , value , 'key' , value ,.....)

UPDATE products
SET properties  = 
JSON_OBJECT( 'dimensions' , JSON_ARRAY(3,4,5),
			 'weight', 10,
             'colour', "red",
             'manufacturer', JSON_OBJECT('name','sony')
             )

WHERE product_id = 2 ;


-- We can easily access each lable in the JSON column:
-- JSON_EXTRACT(The JSON column name , '$.name of the lable ')

SELECT product_id, JSON_EXTRACT(properties, '$.weight')
FROM sql_store.products;

-- We can access into the JSON more easily : 

SELECT 
	   properties -> '$.weight',
       properties -> '$.dimensions[0]',
       properties -> '$.manufacturer.name' 
FROM sql_store.products
WHERE product_id = 1 ;


-- we can also use it in the where condition !!!
SELECT * 
FROM sql_store.products
WHERE properties -> '$.manufacturer.name' = 'sony' ; 


-- We can also ALTER the value of a JSON column : 
UPDATE products
SET properties = JSON_SET( properties , '$.weight', 20 )
WHERE product_id = 1 ;

-- ALSO we can ADD new key to a JSON  with that:alter

UPDATE products
SET properties = JSON_SET( properties , '$.age', 123 )
WHERE product_id = 1 ;

-- Also we can DELETE a value in the JSON 
UPDATE products
SET properties = JSON_REMOVE( properties , '$.age')
WHERE product_id = 1 ;



 