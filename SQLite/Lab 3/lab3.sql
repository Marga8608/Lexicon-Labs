-- SQL & databases course  ·  RESET: rebuilds the webshop exactly as it is after Day 3
-- WARNING: deletes the webshop tables in the open database and creates them again.
-- DB Browser: open webshop.db > Execute SQL > open this file > F5 > Ctrl+S

DROP VIEW IF EXISTS order_totals;
DROP VIEW IF EXISTS customer_orders;
DROP VIEW IF EXISTS sales_for_analysts;
DROP VIEW IF EXISTS customer_overview;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS order_sheet;
DROP TABLE IF EXISTS big_orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  first_name  TEXT NOT NULL,
  last_name   TEXT NOT NULL,
  email       TEXT UNIQUE,
  city        TEXT,
  joined_date TEXT
);

CREATE TABLE products (
  product_id INTEGER PRIMARY KEY,
  name       TEXT NOT NULL,
  category   TEXT,
  price      REAL,
  stock      INTEGER
);

INSERT INTO customers VALUES
(1,'Anna','Lindqvist','anna.lindqvist@example.com','Uppsala','2024-03-14'),
(2,'Erik','Johansson','erik.j@example.com','Stockholm','2023-11-02'),
(3,'Sara','Ahmed','sara.ahmed@example.com','Göteborg','2025-01-20'),
(4,'Johan','Berg','johan.berg@example.com','Uppsala','2022-06-30'),
(5,'Maria','Nilsson','maria.n@example.com','Malmö','2025-08-11'),
(6,'Ali','Hassan','ali.hassan@example.com','Stockholm','2024-09-05'),
(7,'Emma','Karlsson','emma.k@example.com','Västerås','2023-02-17'),
(8,'Oskar','Persson','oskar.p@example.com','Uppsala','2025-05-28'),
(9,'Fatima','Yilmaz','fatima.y@example.com','Göteborg','2024-12-01'),
(10,'Lukas','Ek','lukas.ek@example.com',NULL,'2026-01-09');

INSERT INTO products VALUES
(1,'Hoodie Black','Clothing',599,25),
(2,'T-shirt White','Clothing',249,60),
(3,'Cap Logo','Accessories',199,40),
(4,'Sneakers Classic','Shoes',1199,12),
(5,'Water Bottle','Accessories',149,0),
(6,'Joggers Grey','Clothing',499,18),
(7,'Backpack Urban','Accessories',749,8),
(8,'Running Shoes','Shoes',1399,5),
(9,'Socks 3-pack','Clothing',129,100),
(10,'Beanie','Accessories',179,30),
(11,'Rain Jacket','Clothing',1299,0),
(12,'Sandals','Shoes',399,22);

CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date  TEXT NOT NULL,
  status      TEXT NOT NULL DEFAULT 'new'
              CHECK (status IN ('new','shipped','delivered','cancelled')),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_id   INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity   INTEGER NOT NULL CHECK (quantity > 0),
  unit_price REAL NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (order_id, customer_id, order_date, status)
VALUES (1, 1, '2026-01-05', 'delivered');

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (1, 1, 1, 599),
       (1, 3, 2, 199);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(2, 2, '2026-01-12', 'delivered'),
(3, 1, '2026-01-20', 'delivered'),
(4, 3, '2026-01-28', 'delivered'),
(5, 4, '2026-02-03', 'delivered'),
(6, 5, '2026-02-10', 'delivered'),
(7, 6, '2026-02-14', 'cancelled'),
(8, 2, '2026-02-21', 'delivered'),
(9, 8, '2026-02-27', 'shipped'),
(10, 9, '2026-03-04', 'shipped'),
(11, 1, '2026-03-09', 'shipped'),
(12, 3, '2026-03-15', 'new'),
(13, 6, '2026-03-18', 'new'),
(14, 4, '2026-03-22', 'new'),
(15, 2, '2026-03-28', 'new');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(2, 4, 1, 1199),
(3, 9, 3, 129),
(4, 2, 2, 249), (4, 6, 1, 499),
(5, 8, 1, 1399),
(6, 1, 1, 599), (6, 10, 1, 179),
(7, 7, 1, 749),
(8, 2, 1, 249), (8, 9, 2, 129),
(9, 11, 1, 1299),
(10, 3, 1, 199), (10, 2, 3, 249),
(11, 6, 2, 499),
(12, 4, 1, 1199), (12, 9, 1, 129),
(13, 1, 2, 599),
(14, 10, 2, 179), (14, 3, 1, 199),
(15, 8, 1, 1399), (15, 2, 1, 249);

-- Exercise 1

INSERT INTO customers VALUES (11,'Ana','Ball','ana.ball@example.com','Uppsala','2026-10-07');

--Exercise 2

INSERT INTO products VALUES
(13,'Scarf','Accessories',229,15),
(14,'Gloves','Accessories',199,20);

--Exercise 3

INSERT INTO orders (customer_id, order_date) VALUES
(7, '2026-10-07');
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(16, 10, 2, 179);

--Exercise 4
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(16, 9, 0, 129);
--Result: CHECK constraint failed: quantity > 0

--Exercise 5
SELECT * FROM orders WHERE order_id = 12;
UPDATE orders SET status = 'delivered' WHERE order_id = 12;

--Exercise 6
SELECT * FROM products WHERE product_id = 5;
UPDATE products SET stock = 50 WHERE product_id = 5;

--Exercise 7
SELECT * FROM products WHERE category = 'Accessories';
UPDATE products SET price = price*1.1 WHERE category = 'Accessories'; 

--Exercise 8
SELECT * FROM orders WHERE status = 'cancelled';
SELECT * FROM order_items WHERE order_id = 7;
DELETE FROM order_items WHERE order_id = 7;
DELETE FROM orders WHERE order_id = 7;

--Exercise 9
--Changes Reverted, 15 oders found.

--Exercise 10
/* I'm going to make some assumptions here, since there doesn't appear to be much information on this table.
It appears to be a structure containing students, their phone numbers and courses they are taking. It's unclear
whether the first collumn is supposed to contain names, student ids and if it links to another table. It doesn't
really make any sense for it to link to another table, cause all the other columns have to do with the student.
But if it doesn't, there should be a unique student id and a name column, instead of student.
The second column says phone numbers. Does it contain several phone numbers per studen? Cause that's a problem. A better
solution would be a column for the primary phone number and a second column for a secondary phone number. A separate
table for just phone numbers would be an overkill.
There are three separate columns for courses, which makes absolutely no sense. For one some students may have less
courses, some more. There should be a separate table with courses assigned to students.

--Exercise 11

CREATE TABLE order_sheet (
  order_no INTEGER,
  customer TEXT,
  email    TEXT,
  city     TEXT,
  products TEXT,
  total    REAL
);
INSERT INTO order_sheet VALUES
(1, 'Anna Lindqvist', 'anna.lindqvist@example.com', 'Uppsala', 'Hoodie Black, Cap Logo x2', 997),
(3, 'Anna Lindqvist', 'anna.lindqvist@example.com', 'Uppsala', 'Socks 3-pack x3', 387),
(4, 'Sara Ahmed', 'sara.ahmed@example.com', 'Goteborg', 'T-shirt White x2, Joggers Grey', 997),
(6, 'Maria Nilsson', 'maria.n@example.com', 'Malmö', 'Hoodie Black, Beanie', 778),
(11, 'Anna Lindqvist', 'anna.l@example.com', 'Uppsala', 'Joggers Grey x2', 998);
 
It's a table for storing orders, so it should link to a separate table where the customer names and phones are stored.
So the second column should be a FOREIGN KEY customer_id, third and fourth columns do not belong to this table. 
The second last column lists several items, for one they are text, so they are just typed in and secondly there are
several items per column. They should be stored in a separate table called order_items, that links to another table 
containing product. And I could be wrong, but I feel like the last column should ideally be calculated automatically
 from the order_items table.
 
 Exercise 12
 Customer_email belongs to the table that stores the informaion about the customers. Unless it's needed for some reason 
 and is actually a FOREIGN KEY linking to the emails in the customer table.
 
 Exercise 13
 Students, Teachers, Lessons, date, time, room, instrument.
 
 Exercise 14 & 15
 Teachers 1-------N	 Lessons N--------1 Students
   N					 M
	\					/
	 \				   /
	  \				  /
	   M Instruments N	
 
 