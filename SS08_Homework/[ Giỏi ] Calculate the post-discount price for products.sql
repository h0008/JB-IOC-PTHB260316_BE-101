-- 1. Create table products
CREATE TABLE products (
                          product_id SERIAL PRIMARY KEY,
                          product_name VARCHAR(100) NOT NULL,
                          price NUMERIC(10, 2) NOT NULL,
                          discount_percent NUMERIC(5, 2) DEFAULT 0
);

-- 2. Insert sample data
INSERT INTO products (product_name, price, discount_percent) VALUES
                                                                 ('Asus ROG Strix G531GT', 20000000, 10),
                                                                 ('Logitech G502 Hero', 1200000, 15),
                                                                 ('Cuktech 10 Ultra', 800000, 5),
                                                                 ('Witrn K2 Red', 500000, 0);

-- 3. Requirements
-- a. Calculate the post-discount price for each product
SELECT
    product_name,
    price AS original_price,
    discount_percent,
    (price * (1 - discount_percent / 100)) AS discounted_price
FROM products;

-- b. Filter products with discounted price lower than 1,000,000
SELECT
    product_name,
    (price * (1 - discount_percent / 100)) AS discounted_price
FROM products
WHERE (price * (1 - discount_percent / 100)) < 1000000;