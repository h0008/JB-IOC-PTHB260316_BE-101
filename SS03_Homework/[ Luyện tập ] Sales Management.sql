-- 1 - Create a schema named "sales" in the "LibraryDB" database.
CREATE SCHEMA sales;
-- 2 - Create a table named "Products" in the "sales" schema with the following columns:
CREATE TABLE sales.Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR NOT NULL,
    price NUMERIC (10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);
-- 3 - Create a table named "Orders" in the "sales" schema with the following columns:
CREATE TABLE sales.Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    member_id INT REFERENCES library.Members (member_id)
);
-- 4 - Create a table named "OrderDetails" in the "sales" schema with the following columns:
CREATE TABLE sales.OrderDetails (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.Orders (order_id),
    product_id INT REFERENCES sales.Products (product_id),
    quantity INT NOT NULL
);
-- 5 - Delete the "OrderDetails" table from the "sales" schema.
DROP TABLE sales.OrderDetails;
