#inserting multiple new rows 
INSERT INTO products (name,quantity_in_stock,unit_price)
VALUES ('POTATO',23,0.8),
		('Mango',43, 1.3),
        ('HONEY',12,5);
        
# inserting hierarchical rows
#Orders and order_items table have a parent child relationship

#we'll first add the order and gain the order_id
INSERT INTO orders (customer_id,order_date,status)
VALUES (2,'2022-01-16',2);

INSERT INTO order_items
VALUES(LAST_INSERT_ID(), 3,1,3.6);

# Copy specifc data rows after joining two tables and make into a new table 

CREATE TABLE invoices_archived AS
SELECT invoice_id,c.name AS client, invoice_total, payment_total,payment_date
FROM invoices i
JOIN clients c
WHERE payment_date is NOT NULL
ORDER BY c.client_id;

# UPDATING ROW
UPDATE invoices 
SET payment_date = due_date,
payment_total = invoice_total * 0.5
WHERE invoice_id = 3;

# giving 50 more points to customers who are  born before 1990
-- updating multiple rows 
UPDATE invoices 
SET payment_date = due_date,
payment_total = invoice_total * 0.5
WHERE client_id IN ( 3, 6);

# giving 50 more points to customers who are  born before 1990
-- updating multiple rows 
UPDATE customers 
SET points = points +50 
WHERE birth_date < '1990-01-01';

# Adding comments to the customers's comments column - based on their points

UPDATE orders
SET comments = "Gold Customer"
WHERE customer_id IN (
			SELECT customer_id
			FROM customers
			WHERE points > 3000);

# DELETING ROWS 
DELETE FROM products 
WHERE PRODUCT_ID > 11;

#DELETE ALL INVOICES WHERE CLIENT IS MyWorks

DELETE FROM invoices
WHERE client_id = (
		SELECT client_id 
		FROM clients
		WHERE name = 'Myworks' 
)






















