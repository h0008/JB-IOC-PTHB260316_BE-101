CREATE DATABASE product_management;
\c product_management;
CREATE TABLE products (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100),
                          category VARCHAR(50),
                          price DECIMAL(15,2),
                          stock INT,
                          manufacturer VARCHAR(50)
);

INSERT INTO products (id, name, category, price, stock, manufacturer) VALUES
                                                                          (1, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
                                                                          (2, 'Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
                                                                          (3, 'Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
                                                                          (4, 'Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
                                                                          (5, 'iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
                                                                          (6, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
                                                                          (7, 'Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');
-- 1 - Add product "Chuột không dây Logitech M170" with price 300,000 VND, stock 20, and manufacturer "Logitech".
INSERT INTO products (id, name, category, price, stock, manufacturer) VALUES (8, 'Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');
-- 2 - Increase all Apple products' prices by 10%.
UPDATE products SET price = price * 1.10 WHERE manufacturer = 'Apple';
-- 3 - Delete all products that are out of stock (stock = 0).
DELETE FROM products WHERE stock = 0;
-- 4 - Display all products priced between 1,000,000 VND and 30,000,000 VND.
SELECT * FROM products WHERE price BETWEEN 1000000 AND 30000000;
-- 5 - Display all the products with stock is NULL.
SELECT * FROM products WHERE stock IS NULL;
-- 6 - List unique product manufacturers.
SELECT DISTINCT manufacturer FROM products;
-- 7 - Display all products, sorted by price in descending order, then ascending order by name.
SELECT * FROM products ORDER BY price DESC, name;
-- 8 - Find all products whose name contains the word "Laptop" (not case-sensitive).
SELECT * FROM products WHERE LOWER(name) LIKE '%laptop%';
-- 9 - Get the first 2 products when sorted by price in descending order.
SELECT * FROM products ORDER BY price DESC LIMIT 2;
