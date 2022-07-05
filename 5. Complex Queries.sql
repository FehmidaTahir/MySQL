#getting price of products which are higher than of a speific product
SELECT product_id, name, unit_price
FROM products
WHERE unit_price > (
		SELECT unit_price
		FROM products
		WHERE name LIKE '%Lettuce%');

# Find employees who are earn more than average
SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
);

#Average salaray in a department
SELECT job_title, avg(salary)
FROM employees
GROUP BY job_title;

# clients without any invoices
SELECT *
FROM clients
WHERE client_id NOT IN (
		SELECT DISTINCT client_id
		FROM invoices
);

# Customers who didn't order lettuce
#BY USING sub-queries method
SELECT DISTINCT customer_id
FROM orders
WHERE order_id in (
	SELECT order_id
	FROM order_items
	where product_id = 3);

#By using joins

SELECT DISTINCT o.customer_id
FROM orders o 
JOIN order_items oi 
USING (ORDER_ID)
where product_id = 3
ORDER  BY customer_id;

#co related sub-queries 
# find average invoice for every client

select client_id, avg(invoice_total)
from invoices
group by client_id ;

# select each employee who is earning more than than allother employees in same office

SELECT employee_id, first_name
FROM employees e
where salary >
			(
				SELECT AVG(salary)
                FROM employees
                WHERE office_id = e.office_id
		);

# invoices that are larger than the average of other invices  of same client

SELECT invoice_id, avg(invoice_total)
FROM invoices i  
WHERE invoice_total > (
	SELECT avg(invoice_total)
    FROM invoices 
    WHERE client_id = i.client_id
);

#select clients that have invoice

# Products that have never been ordered

SELECT *
FROM products p 
WHERE NOT EXISTS(
	SELECT product_id
    FROM order_items
    WHERE product_id = p.product_id
);

# SUB QUERIES IN SELECT CLAUSE
SELECT 
	client_id,
	name, 
	(SELECT SUM(invoice_total) FROM invoices WHERE client_id = c.client_id ) AS total_sales, 
	(SELECT AVG(invoice_total) FROM invoices ) AS Average,
	(SELECT total_sales Average) AS difference
FROM clients c
# we can filter this data by using the same query in a FROM clause and WHERE clause













































































