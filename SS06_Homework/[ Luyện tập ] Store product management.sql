CREATE DATABASE StoreDB;
\c StoreDB;
CREATE SCHEMA IF NOT EXISTS Store;
SET search_path TO Store;
CREATE TABLE Product (
                         id SERIAL PRIMARY KEY,
                         name VARCHAR(100),
                         category VARCHAR(50),
                         price NUMERIC(10, 2),
                         stock INT
);
-- 1. Add 5 products to the table using the INSERT statement

INSERT INTO Product (name, category, price, stock) VALUES
                                                       ('Laptop', 'Electronics', 999.99, 10),
                                                       ('Smartphone', 'Electronics', 499.99, 20),
                                                       ('Headphones', 'Electronics', 199.99, 15),
                                                       ('T-shirt', 'Clothing', 19.99, 50),
                                                       ('Jeans', 'Clothing', 39.99, 30);
-- 2. Display the list of all products
SELECT * FROM Product;
-- 3. Display the top 3 products with the highest price
SELECT * FROM Product
ORDER BY price DESC
LIMIT 3;
-- 4. Display products in the "Electronics" category with a price less than 10,000
SELECT * FROM Product
WHERE category = 'Electronics' AND price < 10000;
-- 5. Sort products by stock quantity in ascending order
SELECT * FROM Product
ORDER BY stock ASC;
