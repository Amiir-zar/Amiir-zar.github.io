-- session 37 ( Deleting Rows)

DELETE FROM invoices 
WHERE client_id = 
		( SELECT client_id
		  FROM clients
          WHERE name = 'Myworks' );
          
-- session 38 ( Restoring the databases)

-- MAX(), MIN(), SUM(), COUNT(), AVG()

SELECT  MAX(invoice_total) AS highest,
		MIN(invoice_total) AS lowest,
        AVG(invoice_total) AS average,
        SUM(invoice_total) AS total,
        COUNT(invoice_total) AS number_of_invoices
FROM invoices ;

-- We can use it for the date 

SELECT  MAX(invoice_date) AS highest,
		MIN(invoice_date) AS lowest
FROM invoices;

-- We also can filter the output we want to see!

SELECT  MAX(invoice_total) AS highest,
		MIN(invoice_total) AS lowest,
        AVG(invoice_total) AS average
FROM invoices
WHERE invoice_date > '2019-01-01' ; 


-- Exercise (IMPORTANT) : 

SELECT 'First half of the 2019' AS date_range,
		SUM(invoice_total) AS total_sales,
        SUM(payment_total) AS total_payment,
		SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
BETWEEN '2019-01-01' AND '2019-06-30'

UNION 

SELECT 'Second half of the 2019' AS date_range,
		SUM(invoice_total) AS total_sales,
        SUM(payment_total) AS total_payment,
		SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
BETWEEN '2019-07-01' AND '2019-12-31'

UNION

SELECT 'TOTAL' AS date_range,
		SUM(invoice_total) AS total_sales,
        SUM(payment_total) AS total_payment,
		SUM(invoice_total - payment_total) AS what_we_expect
FROM invoices
WHERE invoice_date
BETWEEN '2019-01-01' AND '2019-12-31'


