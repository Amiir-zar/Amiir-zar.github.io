INSERT INTO customers (first_name, last_name, birth_date,address, city, state)
VALUES('Smith','John','1991-01-01','Kosar','Qazvin','QA')
; 

INSERT INTO shippers(name)
VALUES('shipper1'),
('shipper2'),
('shipper2 ')
;

-- Exercise : 
INSERT INTO products(name, quantity_in_stock , unit_price)
VALUES('P1','60','2.1'),('P2','72','2.2'),('P3', '23','3.1 ')
;


-- session 32 
INSERT INTO orders( customer_id , order_date, status)
VALUES (1,'2009-01-01',1)
;

INSERT INTO order_items
VALUES 
	(last_insert_id(),1,1,2.43),
    (last_insert_id(),2,1,4.43)
; 




