-- 1 - Create a database named "EcommerceDB".
CREATE DATABASE EcommerceDB;
-- Connect to EcommerceDB database after creating
\c EcommerceDB
-- 2 - Create a schema named "shop"
CREATE SCHEMA shop;
-- 3 - Create a table named "Users" in the "shop" schema with the following columns:
CREATE TABLE shop.Users (
                            user_id SERIAL PRIMARY KEY,
                            username VARCHAR(50) NOT NULL UNIQUE,
                            email VARCHAR(100) NOT NULL UNIQUE,
                            password VARCHAR(100) NOT NULL,
                            role VARCHAR(20) CHECK ( role IN ('Customer', 'Admin') )
);
-- 4 - Create a table named "Categories" in the "shop" schema with the following columns:
CREATE TABLE shop.Categories (
                                 category_id SERIAL PRIMARY KEY,
                                 category_name VARCHAR(100) NOT NULL UNIQUE
);
-- 5 - Create a table named "Products" in the "shop" schema with the following columns:
CREATE TABLE shop.Products (
                               product_id SERIAL PRIMARY KEY,
                               product_name VARCHAR(100) NOT NULL,
                               price NUMERIC(10, 2) NOT NULL,
                               stock INT NOT NULL,
                               category_id INT REFERENCES shop.Categories(category_id)
);
-- 6 - Create a table named "Orders" in the "shop" schema with the following columns:
CREATE TABLE shop.Orders (
                             order_id SERIAL PRIMARY KEY,
                             user_id INT REFERENCES shop.Users(user_id),
                             order_date DATE NOT NULL,
                             status VARCHAR(20) CHECK ( status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled') )
);
-- 7 - Create a table named "OrderDetails" in the "shop" schema with
CREATE TABLE shop.OrderDetails (
                                   order_detail_id SERIAL PRIMARY KEY,
                                   order_id INT REFERENCES shop.Orders(order_id),
                                   product_id INT REFERENCES shop.Products(product_id),
                                   quantity INT NOT NULL CHECK (quantity > 0),
                                   price_each NUMERIC(10, 2) CHECK ( price_each > 0 )
);
-- 8 - Create a table named "Payments" in the "shop" schema with the following columns:
CREATE TABLE shop.Payments (
                               payment_id SERIAL PRIMARY KEY,
                               order_id INT REFERENCES shop.Orders(order_id),
                               amount NUMERIC(10, 2) CHECK ( amount > 0 ),
                               payment_date DATE NOT NULL,
                               method VARCHAR(20) CHECK ( method IN ('Credit Card', 'Momo', 'Bank Transfer', 'Cash') )
);
