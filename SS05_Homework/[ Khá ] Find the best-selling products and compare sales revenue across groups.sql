-- 1. Write a subquery to find the product with the highest revenue in the orders table
--     Display: product_name, total_revenue
SELECT p.product_name,
       (SELECT SUM(total_price) FROM orders o WHERE o.product_id = p.product_id) AS total_revenue
FROM products p
ORDER BY total_revenue DESC
LIMIT 1;

-- 2. Write a query to display total revenue by category group (using JOIN + GROUP BY)
SELECT p.category,
       SUM(o.total_price) AS total_revenue
FROM products p
JOIN orders o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
