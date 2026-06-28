-- ── CREATE & SELECT DATABASE 
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


-- ── TABLE: customers 
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name  VARCHAR(50),
  last_name   VARCHAR(50),
  email       VARCHAR(100),
  phone       VARCHAR(20)
);


-- ── TABLE: addresses 

CREATE TABLE addresses (
  address_id  INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  street      VARCHAR(255),
  city        VARCHAR(100),
  province       VARCHAR(100),
  zip_code    VARCHAR(20),
  country     VARCHAR(100),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- ── TABLE: categories 
CREATE TABLE categories (
  category_id   INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100)
);


-- ── TABLE: products 
CREATE TABLE products (
  product_id  INT AUTO_INCREMENT PRIMARY KEY,
  category_id INT,
  name        VARCHAR(100),
  description VARCHAR(255),
  price       DECIMAL(10,2),
  stock       INT,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


-- ── TABLE: orders 
CREATE TABLE orders (
  order_id    INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date  DATE,
  status      VARCHAR(50),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- ── TABLE: order_items 
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id      INT,
  product_id    INT,
  quantity      INT,
  unit_price    DECIMAL(10,2),
  FOREIGN KEY (order_id)   REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- ============================================================
-- SAMPLE DATA
-- ============================================================


-- ── INSERT: customers 
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Alice', 'Johnson', 'alice@email.com', '555-1234'),
('Bob',   'Smith',   'bob@email.com',   '555-5678'),
('Carol', 'Davis',   'carol@email.com', '555-9012');


-- ── INSERT: addresses 
INSERT INTO addresses (customer_id, street, city, province, zip_code, country) VALUES
(1, '123 Main St', 'Toronto',   'ON', 'M5H 2N2', 'Canada'),
(2, '456 Oak Ave', 'Vancouver', 'BC', 'V6B 1A1', 'Canada'),
(3, '789 Pine Rd', 'Montreal',  'QC', 'H3A 1A1', 'Canada');


-- ── INSERT: categories 
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');


-- ── INSERT: products 
INSERT INTO products (category_id, name, description, price, stock) VALUES
(1, 'Laptop',   'High performance laptop', 999.99, 50),
(1, 'Phone',    'Latest smartphone',       699.99, 100),
(2, 'T-Shirt',  'Cotton t-shirt',           19.99, 200),
(3, 'SQL Guide','Learn SQL from scratch',   39.99, 75);


-- ── INSERT: orders 
INSERT INTO orders (customer_id, order_date, status) VALUES
(1, '2026-06-01', 'delivered'),
(2, '2026-06-10', 'shipped'),
(3, '2026-06-20', 'pending');


-- ── INSERT: order_items 
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 999.99),
(1, 3, 2,  19.99),
(2, 2, 1, 699.99),
(3, 4, 3,  39.99);
