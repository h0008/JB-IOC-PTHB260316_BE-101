CREATE DATABASE sales_analysis;
\c sales_analysis;

CREATE TABLE products (
                          product_id SERIAL PRIMARY KEY,
                          product_name VARCHAR(100),
                          category VARCHAR(50)
);

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        product_id INT REFERENCES products(product_id),
                        quantity INT,
                        total_price NUMERIC(10,2)
);

INSERT INTO products (product_id, product_name, category) VALUES
                                                              (1, 'Laptop Dell', 'Electronics'),
                                                              (2, 'iPhone 15', 'Electronics'),
                                                              (3, 'Bàn học gỗ', 'Furniture'),
                                                              (4, 'Ghế xoay', 'Furniture');

INSERT INTO orders (order_id, product_id, quantity, total_price) VALUES
                                                                     (101, 1, 2, 2200),
                                                                     (102, 2, 3, 3300),
                                                                     (103, 3, 5, 2500),
                                                                     (104, 4, 4, 1600),
                                                                     (105, 1, 1, 1100);
-- 1. Write a query to display the total revenue (SUM(total_price)) and the total quantity of products sold (SUM(quantity)) for each product category (category).
--     Alias the columns as follows:
--      total_sales for total revenue
--      total_quantity for total quantity
SELECT p.category,
       SUM(o.total_price) AS total_sales,
       SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category;
-- 2. Only showing groups with total sales greater than 2000.
SELECT p.category,
       SUM(o.total_price) AS total_sales,
       SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(o.total_price) > 2000;
-- 3. Order the results by total sales in descending order.
SELECT p.category,
        SUM(o.total_price) AS total_sales,
        SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(o.total_price) > 2000
ORDER BY total_sales DESC;


