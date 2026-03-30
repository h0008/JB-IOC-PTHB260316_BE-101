CREATE TABLE Customer (
                          id SERIAL PRIMARY KEY,
                          name VARCHAR(100),
                          email VARCHAR(100),
                          phone VARCHAR (20),
                          points INT

);
-- 1. Add 7 customers (including 1 without an email)
INSERT INTO Customer (id, name, email, phone, points) VALUES

                                                        (1, 'Alice', 'alice4@gmail.com', '123-456-7890', 150),
                                                        (2, 'Bob', 'bob2@gmail.com ', '234-567-8901', 200),
                                                        (3, 'Charlie', 'charlie3@yahoo.com', '345-678-9012', 300),
                                                        (4, 'David', 'david36@hotmail.com', '456-789-0123', 250),
                                                        (5, 'Eve', 'NULL', '567-890-1234', 100),
                                                        (6, 'Frank', 'frank123@hotmail.com', '678-901-2345', 350),
                                                        (7, 'Grace', 'grace322@gmail.com', '789-012-3456', 400);
-- 2. Query the list of unique customer names (DISTINCT)
SELECT DISTINCT name FROM Customer;
-- 3. Find customers without an email (IS NULL)
SELECT * FROM Customer
WHERE email IS NULL;
-- 4. Display the top 3 customers with the highest reward points, excluding the highest point customer (hint: use OFFSET)
SELECT * FROM Customer
ORDER BY points DESC
OFFSET 1
LIMIT 3;
-- 5. Sort the customer list by name in descending order
SELECT * FROM Customer
ORDER BY name DESC;

