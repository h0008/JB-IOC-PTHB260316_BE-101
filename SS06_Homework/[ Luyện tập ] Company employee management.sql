CREATE DATABASE CompanyDB;
\c CompanyDB;
CREATE SCHEMA IF NOT EXISTS Company;
SET search_path TO Company;
CREATE TABLE Employee (
                          id SERIAL PRIMARY KEY,
                          full_name VARCHAR(100),
                          department VARCHAR(50),
                          salary NUMERIC(10,2),
                          hire_date DATE
);
-- 1. Add 6 new employees
INSERT INTO Employee (full_name, department, salary, hire_date) VALUES
                                                        ('John Doe', 'HR', 5000000.00, '2023-01-15'),
                                                        ('Jane Smith', 'IT', 7500000.00, '2024-03-10'),
                                                        ('Emily Davis', 'Finance', 6000000.00, '2023-06-01'),
                                                        ('Michael Brown', 'IT', 8000000.00, '2022-11-20'),
                                                        ('Sarah Wilson', 'HR', 5500000.00, '2023-05-30'),
                                                        ('David Smith', 'Finance', 6500000.00, '2022-09-25');
-- 2. Increase the salary of all employees in the IT department by 10%
UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'IT';
-- 3. Delete employees with a salary less than 6,000,000
DELETE FROM Employee
WHERE salary < 6000000.00;
-- 4. Display the list of all employees with "Smith" in their name (non-case sensitive)
SELECT * FROM Employee
WHERE full_name ILIKE '%Smith%';
-- 5. Display all employees hired between January 1, 2023, and December 31, 2023
SELECT * FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';
