BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS customers (
  customer_id INTEGER PRIMARY KEY,
  first_name  TEXT NOT NULL,
  last_name   TEXT NOT NULL,
  email       TEXT UNIQUE,
  city        TEXT,
  joined_date TEXT
);
CREATE TABLE IF NOT EXISTS order_items (
  order_id   INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  quantity   INTEGER NOT NULL CHECK (quantity > 0),
  unit_price REAL NOT NULL,
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE IF NOT EXISTS orders (
  order_id    INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL,
  order_date  TEXT NOT NULL,
  status      TEXT NOT NULL DEFAULT 'new'
              CHECK (status IN ('new','shipped','delivered','cancelled')),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE IF NOT EXISTS products (
  product_id INTEGER PRIMARY KEY,
  name       TEXT NOT NULL,
  category   TEXT,
  price      REAL,
  stock      INTEGER
);
INSERT INTO "customers" ("customer_id","first_name","last_name","email","city","joined_date") VALUES (1,'Anna','Lindqvist','anna.lindqvist@example.com','Uppsala','2024-03-14'),
 (2,'Erik','Johansson','erik.j@example.com','Stockholm','2023-11-02'),
 (3,'Sara','Ahmed','sara.ahmed@example.com','Göteborg','2025-01-20'),
 (4,'Johan','Berg','johan.berg@example.com','Uppsala','2022-06-30'),
 (5,'Maria','Nilsson','maria.n@example.com','Malmö','2025-08-11'),
 (6,'Ali','Hassan','ali.hassan@example.com','Stockholm','2024-09-05'),
 (7,'Emma','Karlsson','emma.k@example.com','Västerås','2023-02-17'),
 (8,'Oskar','Persson','oskar.p@example.com','Uppsala','2025-05-28'),
 (9,'Fatima','Yilmaz','fatima.y@example.com','Göteborg','2024-12-01'),
 (10,'Lukas','Ek','lukas.ek@example.com',NULL,'2026-01-09');
INSERT INTO "order_items" ("order_id","product_id","quantity","unit_price") VALUES (1,1,1,599.0),
 (1,3,2,199.0),
 (2,4,1,1199.0),
 (3,9,3,129.0),
 (4,2,2,249.0),
 (4,6,1,499.0),
 (5,8,1,1399.0),
 (6,1,1,599.0),
 (6,10,1,179.0),
 (7,7,1,749.0),
 (8,2,1,249.0),
 (8,9,2,129.0),
 (9,11,1,1299.0),
 (10,3,1,199.0),
 (10,2,3,249.0),
 (11,6,2,499.0),
 (12,4,1,1199.0),
 (12,9,1,129.0),
 (13,1,2,599.0),
 (14,10,2,179.0),
 (14,3,1,199.0),
 (15,8,1,1399.0),
 (15,2,1,249.0);
INSERT INTO "orders" ("order_id","customer_id","order_date","status") VALUES (1,1,'2026-01-05','delivered'),
 (2,2,'2026-01-12','delivered'),
 (3,1,'2026-01-20','delivered'),
 (4,3,'2026-01-28','delivered'),
 (5,4,'2026-02-03','delivered'),
 (6,5,'2026-02-10','delivered'),
 (7,6,'2026-02-14','cancelled'),
 (8,2,'2026-02-21','delivered'),
 (9,8,'2026-02-27','shipped'),
 (10,9,'2026-03-04','shipped'),
 (11,1,'2026-03-09','shipped'),
 (12,3,'2026-03-15','new'),
 (13,6,'2026-03-18','new'),
 (14,4,'2026-03-22','new'),
 (15,2,'2026-03-28','new');
INSERT INTO "products" ("product_id","name","category","price","stock") VALUES (1,'Hoodie Black','Clothing',599.0,25),
 (2,'T-shirt White','Clothing',249.0,60),
 (3,'Cap Logo','Accessories',199.0,40),
 (4,'Sneakers Classic','Shoes',1199.0,12),
 (5,'Water Bottle','Accessories',149.0,0),
 (6,'Joggers Grey','Clothing',499.0,18),
 (7,'Backpack Urban','Accessories',749.0,8),
 (8,'Running Shoes','Shoes',1399.0,5),
 (9,'Socks 3-pack','Clothing',129.0,100),
 (10,'Beanie','Accessories',179.0,30),
 (11,'Rain Jacket','Clothing',1299.0,0),
 (12,'Sandals','Shoes',399.0,22);
COMMIT;
