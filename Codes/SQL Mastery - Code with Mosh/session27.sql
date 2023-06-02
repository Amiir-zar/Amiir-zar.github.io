
SELECT 
	*	
FROM  customers c 
CROSS JOIN products p
-- or we can say it like:
-- From c, orders o 
ORDER BY  c.first_name ;

-- Exercise: 
-- 1
SELECT 
	p.name AS product,
    sh.name AS shipper 
FROM products p 
CROSS JOIN shippers sh ;
-- 2
SELECT 
	p.name AS product,
    sh.name AS shipper 
FROM products p , shippers sh

