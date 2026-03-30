CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           customer_name VARCHAR(100),
                           city VARCHAR(50)
);

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        customer_id INT REFERENCES customers(customer_id),
                        order_date DATE,
                        total_amount NUMERIC(10,2)
);

CREATE TABLE order_items (
                             item_id SERIAL PRIMARY KEY,
                             order_id INT REFERENCES orders(order_id),
                             product_name VARCHAR(100),
                             quantity INT,
                             price NUMERIC(10,2)
);
-- 1. ALIAS:
-- a. Display a list of all orders with the following columns:
-- i. Customer name (customer_name)
-- ii. Order date (order_date)
-- iii. Total amount (total_amount)
SELECT
    c.customer_name,
    o.order_date,
    o.total_amount
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id;
-- 2. Aggregate Functions:
-- a. Calculate aggregate information:
-- i. Total revenue (SUM(total_amount))
-- ii. Average order value (AVG(total_amount))
-- iii. Largest order (MAX(total_amount))
-- iv. Smallest order (MIN(total_amount))
-- v. Number of orders (COUNT(order_id))
SELECT
    SUM(total_amount) AS total_revenue,
    AVG(total_amount) AS average_order_value,
    MAX(total_amount) AS largest_order,
    MIN(total_amount) AS smallest_order,
    COUNT(order_id) AS number_of_orders
FROM
    orders;
-- 3. GROUP BY / HAVING:
-- a. Calculate total revenue by city
SELECT
    c.city,
    SUM(o.total_amount) AS total_revenue
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.city
-- b. Only display cities with total revenue greater than 10,000
HAVING
    SUM(o.total_amount) > 10000;
-- 4. JOIN:
-- a. List all products sold, including:
-- i. Customer name
-- ii. Order date
-- iii. Quantity and price
-- iv. (JOIN 3 tables: customers, orders, order_items)
SELECT
    c.customer_name,
    o.order_date,
    oi.product_name,
    oi.quantity,
    oi.price
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    order_items oi ON o.order_id = oi.order_id;
-- 5. Subquery:
-- a. Find the name of the customer with the highest total revenue.
-- b. Hint: Use SUM(total_amount) in a subquery to find MAX
SELECT
    customer_name
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id
HAVING
    SUM(o.total_amount) = (
        SELECT MAX(total_revenue) FROM (
            SELECT
                c.customer_id,
                SUM(o.total_amount) AS total_revenue
            FROM
                customers c
            JOIN
                orders o ON c.customer_id = o.customer_id
            GROUP BY
                c.customer_id
        ) AS customer_revenues
    );
