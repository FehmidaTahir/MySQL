# Using store schema
-- Return all the products
-- name
-- new price (unit price * 1.1)

SELECT  name , unit_price, (unit_price * 1.1) AS new_price
FROM products;

# getting order from a specific year

SELECT *
FROM orders
WHERE order_date >= '2019-01-01' and order_date <= '2019-12-31';

# FIND THE ORDER ITEMS OF A SPECIFIC ORDER

SELECT product_id
FROM order_items
WHERE order_id = '6' AND unit_price*quantity > 30;

#Selecting products with a certain number of in stock

SELECT product_id, name , quantity_in_stock
FROM products
WHERE quantity_in_stock IN (49,38,72);

#getting string with a specific pattern

SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%';

#another way to find string with some pattern is by using REGEXP

SELECT last_name
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

#FIINDING THE ORDERS THAT ARE NOT SHIPPED

SELECT order_id,customer_id
FROM orders
WHERE shipped_date IS NULL;

#ordering data by price 
SELECT order_id,product_id, quantity * unit_price AS TOTAL_PRICE
FROM order_items
WHERE order_id = 2
order by total_price desc ;

# get the top 3 loyal customers

SELECT customer_id, points
FROM customers
order by points desc
limit 3;

