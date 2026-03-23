-- 1 - Create a database named SalesDB.
CREATE DATABASE SalesDB;
-- Connect to the SalesDB database after creating
\c SalesDB
-- 2 - Create a schema named sales
CREATE SCHEMA sales;
-- 3 - Create a table named Customers in the sales schema with the following columns
CREATE TABLE sales.Customers (
                                 customer_id SERIAL PRIMARY KEY,
                                 first_name VARCHAR(50) NOT NULL,
                                 last_name VARCHAR(50) NOT NULL,
                                 email TEXT NOT NULL UNIQUE,
                                 phone VARCHAR(20)
);
-- Create a table named Products in the sales schema with the following columns
CREATE TABLE sales.Products (
                                product_id SERIAL PRIMARY KEY,
                                product_name VARCHAR(100) NOT NULL,
                                price REAL NOT NULL,
                                stock INT NOT NULL
);
-- Create a table named Orders in the sales schema with the following columns
CREATE TABLE sales.Orders
(
    order_id    SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales.Customers (customer_id),
    order_date  DATE NOT NULL
);
-- Create a table named OrderItems in the sales schema with the following columns
CREATE TABLE sales.OrderItems
(
    order_item_id SERIAL PRIMARY KEY,
    order_id      INT REFERENCES sales.Orders (order_id),
    product_id    INT REFERENCES sales.Products (product_id),
    quantity      INT NOT NULL CHECK ( 1 < quantity)
);
