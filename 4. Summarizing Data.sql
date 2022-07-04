
SELECT 
'First half of 2019' AS date_range,
SUM(invoice_total) AS Total_Sales, 
SUM(payment_total) AS Total_Payments , 
SUM( invoice_total - payment_total  ) AS expected
FROM invoices
WHERE payment_date between '2019-01-01' AND '2019-06-30'
UNION
SELECT 
'Second half of 2019' AS date_range,
SUM(invoice_total) AS Total_Sales,
SUM(payment_total) AS Total_Payments ,  
SUM( invoice_total - payment_total  ) AS expected
FROM invoices
WHERE payment_date between '2019-07-01' AND '2019-12-31'
UNION
SELECT 
'2019' AS date_range,
SUM(invoice_total) AS Total_Sales, 
SUM(payment_total) AS Total_Payments , 
SUM( invoice_total - payment_total  ) AS expected
FROM invoices
WHERE payment_date between '2019-01-01' AND '2019-12-31';

#CHECKING WHICH PAYMENT METHOD SENT MORE MONEY
SELECT pm.name AS payment_method , SUM(amount)
FROM payments p
JOIN payment_methods pm 
		ON p.payment_method = pm.payment_method_id
GROUP BY pm.name WITH ROLLUP
ORDER BY amount DESC;




#HAVING CLAUSE
#customers who are locatedin VA and spent more than 500USD
SELECT SUM(oi.quantity * oi.unit_price) AS MONEY_SPENT,c.state, c.first_name, c.customer_id
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi
ON oi.order_id = o.order_id
WHERE state = 'VA'
GROUP BY c.customer_id,c.first_name;















