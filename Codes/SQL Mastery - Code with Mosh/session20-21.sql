-- session 20 ( Compound Join Condition)

SELECT * 
FROM order_items oi 
JOIN  order_item_notes oin 
	ON oi.order_id = oin.order_id
	AND oi.product_id = oin.product_id ; 
    

-- session 21 ( implicit Join )

SELECT *
FROM orders o 
JOIN customers c
ON o.customer_id = c.customer_id ; 

-- We can implicitly join them by using where 

SELECT * 
FROM orders o , customers c 
WHERE o.customer_id = c.customer_id ;

-- THESE TWO JOINING ARE BASICALLY SAME ! 





    
