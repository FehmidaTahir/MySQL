# Using Joins 

#get the orders with the product id and product name from product table

SELECT order_id, p.product_id, p.name
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
order by order_id;

# Showing which clients paid through which payment system (joining three tables)

SELECT 
	c.client_id, 
	c.name , 
	p.invoice_id,
    
	p.date AS payment_date,
	p.amount, 
	pm.name AS Payment_method
FROM clients c
JOIN payments p
	ON c.client_id = p.client_id
JOIN payment_methods pm 
	ON p.payment_method = pm.payment_method_id
ORDER BY c.client_id;

#joining a table with composite with Compound Join Condition
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_Id
    AND oi.product_id = oin.product_id;
    
 #using outer joins to get all the whether they are ordred or not
 
SELECT p.product_id,name, oi.quantity
FROM products p
LEFT JOIN order_items oi
	ON p.product_id = oi.product_id;

# joining four tables to get orders, customer name, order status, shippers name

SELECT o.order_date, o.order_id, c.first_name ,
 os.name, sh.name
FROM orders o
JOIN order_statuses os
	ON o.status = os.order_status_id
LEFT JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers sh 
	ON o.shipper_id = sh.shipper_id
order by os.name, order_id;

# clients who have sent the payment and via what channel they sent the money

SELECT p.date AS payment_date ,
		c.name AS client_name,
		pm.name AS payment_method,
        amount
FROM payments p 
JOIN payment_methods pm
	ON p.payment_method = pm.payment_method_id
JOIN clients c
	USING (client_id)
order by date;

# categorizing customers based on their points usiing unios
SELECT customer_id, first_name, points, 'Gold' AS status
FROM customers c
WHERE points > 3000
UNION
SELECT customer_id, first_name, points, 'Silver' AS status
FROM customers c
WHERE points between 2000 AND 3000
UNION
SELECT customer_id, first_name, points, 'BRONZE' AS status
FROM customers c
WHERE points < 2000
ORDER BY first_name;





