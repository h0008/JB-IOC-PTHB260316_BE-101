CREATE DATABASE StoreDB;
\C StoreDB;
CREATE TABLE products_basic (
                                id SERIAL PRIMARY KEY,
                                name VARCHAR(50),
                                category VARCHAR(50),
                                price DECIMAL(10,2),
                                stock INT
);

INSERT INTO products_basic (id, name, category, price, stock) VALUES
                                                                  (1, 'Laptop Dell', 'Electronics', 1500.00, 5),
                                                                  (2, 'Chuột Logitech', 'Electronics', 25.50, 50),
                                                                  (3, 'Bàn phím Razer', 'Electronics', 120.00, 20),
                                                                  (4, 'Tủ lạnh LG', 'Home Appliances', 800.00, 3),
                                                                  (5, 'Máy giặt Samsung', 'Home Appliances', 600.00, 2);
-- 1 - Add a new product record with name "Điều hòa Panasonic", category "Home Appliances", price 400.00, and stock 10
INSERT INTO products_basic (id, name, category, price, stock) VALUES (6, 'Điều hòa Panasonic', 'Home Appliances', 400.00, 10);
-- 2 - Update the stock of "Laptop Dell" to 7
UPDATE products SET stock = 7
WHERE name = 'Laptop Dell';
-- 3 - Delete all products with no stock (stock = 0)
DELETE FROM products_basic
WHERE stock = 0;
-- 4 - List all products by ascending order of price
SELECT name, category, price, stock FROM products_basic
ORDER BY price ASC;
-- 5 - List the unique categories of products (DISTINCT)
SELECT DISTINCT category FROM products_basic;
-- 6 - List all products with price between 100 and 1000
SELECT name, category, price, stock FROM products_basic
WHERE price BETWEEN 100 AND 1000;
-- 7 - Find all products whose name contains the word "LG" or "Samsung" (use LIKE/ILIKE)
SELECT name, category, price, stock FROM products_basic
WHERE name LIKE '%LG%' OR name LIKE '%Samsung%';
-- 8 - List the first 2 products in descending order of price, or get from the 2nd to the 3th product (use LIMIT and OFFSET)
SELECT name, category, price, stock FROM products_basic
ORDER BY price DESC
LIMIT 2 OFFSET 1;
