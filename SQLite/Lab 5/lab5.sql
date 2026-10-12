--Exercise 1
SELECT * 
FROM products 
WHERE price >= 150 AND price <= 500 AND category IN('Clothing', 'Accessories')
ORDER BY price DESC;

--Exercise 2
SELECT *
FROM orders
WHERE order_date <= '2026-02-01' AND order_date < '2026-03-01' AND status IS NOT 'cancelled';

--Exercise 3
SELECT o_i.order_id, p.name, o_i.quantity, o_i.unit_price*o_i.quantity AS 'Total'
FROM order_items o_i
JOIN products p ON p.product_id = o_i.product_id AND o_i.unit_price*o_i.quantity > 500
ORDER BY o_i.unit_price*o_i.quantity DESC;

--Exercise 4
SELECT DISTINCT c.first_name 
FROM customers c
JOIN orders o ON c.customer_id=o.customer_id
WHERE o.order_id IS NOT NULL AND c.city IN ('Uppsala', 'Stockholm');

--Exercise 5

INSERT INTO customers VALUES
(11,'Leo','Falk','leo.falk@example.com','Uppsala','2026-10-09');

INSERT INTO orders(customer_id,order_date)
SELECT c.customer_id,'2026-10-09'
FROM customers c
WHERE c.first_name = 'Leo';

--This doesn't work, needs to be fixed!
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
SELECT o.order_id, p.product_id, 1, p.unit_price
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON p.product_id = order_item.product_id AND p.name = 'Hoodie Black'
WHERE c.first_name = 'Leo';
