-- There are functiones that i have mentioned in this file but didnt use them in this file as they are very basic.
# RAND, CEILING, TRUNCATE ROUND(), FLOOR, ABS, ROUND for numeric values
# LENGTH, UPPER, LOWER, LTRIM, RTRIM, TRIM,  LOCATION(N, 'KIND'), CONCAT
#RIGHT(', NUMBER OF WORDS), LEFT, SUBSTRING (' POSITION, NUMBER OF WORDS)for strings

SELECT CONCAT(first_name,' ',last_name) AS Fullname
FROM customers;

# date and time functions
# CURDATE, NOW, CURTIME
# YEAR(NOW()), IN PLACE OF YEAR WE CAN USE HOUR, MONTH, DATE,DAY, MINUTE, DAYNAME, MONTHNAME, EXTRACT (YEAR FROM NOW())
SELECT date(now());
#  ORDERS THAT WERE PLACED BEFORE THE CURRENT YEAR
SELECT *
FROM orders
WHERE YEAR(order_date) <= YEAR(NOW());

#FORMATTING DATES
SELECT DATE_FORMAT(NOW(),'%a %D %M %Y') AS DATESTYLE;

SELECT DATE_FORMAT (NOW(), '%H:%i %p') AS DATESTYLE;

#Adding one year to current date
SELECT DATE_ADD(DATE(NOW()), INTERVAL 1 YEAR);

#CALCULATING THE DATE DIFFERENCE
SELECT DATEDIFF('2019-03-11', '2022-04,23');

# filling the null values with approprtiate comments
SELECT order_id, 
	IFNULL(shipper_id, 'not assigned') AS shipper
FROM orders;

# filling the null values with comments, if comments are empty too, then go with the value assigned in the function
SELECT order_id, 
	COALESCE(shipper_id,comments, 'not assigned') AS shipper
FROM orders;

#Filling empty phone number rows with UNKNOWN
SELECT CONCAT(first_name,' ',last_name) AS FullName,
	IFNULL(phone,'Unknown')
FROM customers;

# Commenting whether a product has been ordered more than once
SELECT product_id, p.name , count(*) AS orders,
		IF (COUNT(*) > 1 , "Many times", "Once") AS Frequency
FROM order_items oi
JOIN products p using (product_id)
group by product_id, name
order by count(*) DESC;

# Using CASE to set conditions on whether the orders are active, old, or archived

SELECT order_id, 
CASE 
	WHEN YEAR(order_date) = YEAR('2019-12-31') THEN 'Active'
    WHEN YEAR(order_date) = YEAR('2019-12-31') -1 THEN 'Last Year'
    WHEN YEAR(order_date) < YEAR(now())-1 THEN 'Archived'  -- just demonstrating the use of now()
    ELSE 'FUTURE'
END AS CATEGORY
FROM orders;

#Customers and their category through points
SELECT customer_id, CONCAT(first_name,' ',last_name) As customer,
CASE
	WHEN points > 3000 THEN 'Gold'
    WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
    WHEN points < 2000 THEN 'Bronze'
END AS Category
FROM customers
ORDER BY points DESC;

























