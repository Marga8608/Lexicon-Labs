-- Exercise 1
CREATE TABLE books (
	book_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	author TEXT NOT NULL,
	year INTEGER NOT NULL
	);
	
--Exercise 2
DROP TABLE books;

CREATE TABLE books (
	book_id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	author TEXT NOT NULL,
	year INTEGER NOT NULL
		CHECK (year > 1400)
	);
	
--Exercise 3
ALTER TABLE books ADD COLUMN isbn TEXT;

--Exercise 4
DROP TABLE books;

--Exercise 5
CREATE TABLE reviews (
	review_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	rating 	INTEGER NOT NULL
		CHECK (rating > 0 AND rating <6),
	comment TEXT,
	FOREIGN KEY (product_id) REFERENCES products(product_id)
	);
	
--Exercise 6
INSERT INTO reviews(review_id, product_id, rating)
VALUES(1, 1, 6);
--Result: CHECK constraint failed: rating > 0 AND rating <6

--Exercise 7
INSERT INTO reviews(review_id, product_id, rating)
VALUES(1, 50, 5);
--Result: FOREIGN KEY constraint failed

/* Exercise 8
customers				orders				order_items				products
customer_id <--------- 	customer_id			product_id ---------->  product_id
						order_id  <-------- order_id
*/

--Extra Challenges, Level 3

--Exercise 10

CREATE TABLE product_sizes (
	id INTEGER NOT NULL PRIMARY KEY,
	product_id INTEGER NOT NULL,
	size TEXT NOT NULL CHECK (size IN ('S','M','L','XL')),
	stock INTEGER DEFAULT 0,
	UNIQUE(product_id,size),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
	);
	
INSERT INTO product_sizes (id, product_id, size, stock)
VALUES (1, 1, 'M', 2);
-- Result: UNIQUE constraint failed: product_sizes.id


