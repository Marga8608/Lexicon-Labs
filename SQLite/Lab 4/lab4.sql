-- Exercise 1
-- Show every order with the customer's first name, last name and the order status.

SELECT c.first_name, c.last_name, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

--Exercise 2

SELECT c.first_name, c.last_name, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id AND c.first_name= 'Erik';

--Exercise 3

SELECT c.first_name, c.last_name, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id AND c.city= 'Göteborg';

--Exercise 4
SELECT p.name, p.category, o.order_id, o.quantity, o.unit_price
FROM order_items o
JOIN products p ON o.product_id = p.product_id;

--Exercise 5
SELECT p.name, o.order_id
FROM order_items o
JOIN products p  ON o.product_id = p.product_id AND p.category= 'Shoes';

--Exercise 6
SELECT p.name, o.quantity, o.unit_price, o.quantity*o.unit_price AS 'Total'
FROM order_items o
JOIN products p  ON o.product_id = p.product_id AND o.order_id= 10;

--Exercise 7
SELECT c.first_name, o.order_date
FROM products p
JOIN order_items o_i ON p.product_id=o_i.product_id AND p.name='Hoodie Black'
JOIN orders o ON o.order_id=o_i.order_id
JOIN customers c ON c.customer_id=o.customer_id;

--Exercise 8
SELECT c.first_name, o.order_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

--Exercise 9
SELECT p.name, o.order_id
FROM products p
LEFT JOIN order_items o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

--Exercise 10
SELECT c.first_name, p.name, o_i.quantity
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id 
JOIN order_items o_i ON o.order_id = o_i.order_id
JOIN products p ON p.product_id = o_i.product_id
WHERE c.city= 'Uppsala';