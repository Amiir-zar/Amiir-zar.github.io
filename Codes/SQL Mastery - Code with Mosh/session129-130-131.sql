-- session 129 ( Creating Relationship)

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customer(customer_id)
        ON UPDATE CASCADE 
        ON DELETE NO ACTION
);

-- session 130 ( Altering FOREIGN/ PRIMARY KEY )

ALTER TABLE orders
	ADD PRIMARY KEY (order_id),
    DROP PRIMARY KEY, 
    DROP FOREIGN KEY fk_orders_customers , 
    ADD FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customer(customer_id)
        ON UPDATE CASCADE 
        ON DELETE NO ACTION; 
        
-- session 131 (character sets and collations)

-- We can change character set in several ways : 
-- 1 
CREATE DATABASE db
	CHARACTER SET latin1;
    
-- 2 
ALTER DATABASE db
	CHARACTER SET latin1;
    
-- 3 
CREATE TABLE table1(.......)
	CHARACTER SET latin1;alter

-- 4 
ALTER TABLE db
	CHARACTER SET latin1;
    
-- 5 
CREATE TABLE table1(
	first_name CHAR(50) CHARACTER SET latin1 
)




    