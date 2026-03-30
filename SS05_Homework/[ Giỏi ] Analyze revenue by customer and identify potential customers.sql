CREATE DATABASE sales_db;
\c sales_db
CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           customer_name VARCHAR(100),
                           city VARCHAR(50)
);

CREATE TABLE orders_v2 (
                           order_id SERIAL PRIMARY KEY,
                           customer_id INT REFERENCES customers(customer_id),
                           order_date DATE,
                           total_price NUMERIC(10,2)
);

CREATE TABLE order_items (
                             item_id SERIAL PRIMARY KEY,
                             order_id INT REFERENCES orders_v2(order_id),
                             product_id INT,
                             quantity INT,
                             price NUMERIC(10,2)
);

INSERT INTO customers (customer_id, customer_name, city) VALUES
                                                             (1, 'Nguyễn Văn A', 'Hà Nội'),
                                                             (2, 'Trần Thị B', 'Đà Nẵng'),
                                                             (3, 'Lê Văn C', 'Hồ Chí Minh'),
                                                             (4, 'Phạm Thị D', 'Hà Nội');

INSERT INTO orders_v2 (order_id, customer_id, order_date, total_price) VALUES
                                                                           (101, 1, '2024-12-20', 3000),
                                                                           (102, 2, '2025-01-05', 1500),
                                                                           (103, 1, '2025-02-10', 2500),
                                                                           (104, 3, '2025-02-15', 4000),
                                                                           (105, 4, '2025-03-01', 800);

INSERT INTO order_items (item_id, order_id, product_id, quantity, price) VALUES
                                                                             (1, 101, 1, 2, 1500),
                                                                             (2, 102, 2, 1, 1500),
                                                                             (3, 103, 3, 5, 500),
                                                                             (4, 104, 2, 4, 1000);
-- 1. Write a query to display the total revenue and total number of orders for each customer:
-- a. Only display customers with total revenue > 2000
-- b. Use ALIAS: total_revenue and order_count
SELECT
    c.customer_name,
    SUM(o.total_price) AS total_revenue,
    COUNT(o.order_id) AS order_count
FROM
    customers c
JOIN
    orders_v2 o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id
HAVING
    SUM(o.total_price) > 2000;

-- 2. Write a subquery to find the average revenue of all customers
-- a. Then display those customers with revenue greater than that average.
WITH customer_revenue AS (
    SELECT
        c.customer_name,
        SUM(o.total_price) AS total_revenue
    FROM
        customers c
    JOIN
        orders_v2 o ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id
)
SELECT
    customer_name,
    total_revenue
FROM
    customer_revenue
WHERE
    total_revenue > (SELECT AVG(total_revenue) FROM customer_revenue);
-- 3. Use HAVING + GROUP BY to filter out the city with the highest total revenue:
SELECT
    c.city,
    SUM(o.total_price) AS total_revenue
FROM
    customers c
JOIN
    orders_v2 o ON c.customer_id = o.customer_id
GROUP BY
    c.city
HAVING
    SUM(o.total_price) = (
        SELECT MAX(city_revenue) FROM (
            SELECT
                c.city,
                SUM(o.total_price) AS city_revenue
            FROM
                customers c
            JOIN
                orders_v2 o ON c.customer_id = o.customer_id
            GROUP BY
                c.city
        ) AS city_revenues
    );
-- 4. (Extended) Use INNER JOIN between customers, orders, order_items to display details:
--  Customer name, city name, total products purchased, total expenditure
SELECT
    c.customer_name,
    c.city,
    SUM(oi.quantity) AS total_products_purchased,
    SUM(oi.quantity * oi.price) AS total_expenditure
FROM
    customers c
JOIN
    orders_v2 o ON c.customer_id = o.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_id;






