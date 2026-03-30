CREATE DATABASE company_db;
\c company_db
CREATE SCHEMA company;
CREATE TABLE departments (
                             dept_id SERIAL PRIMARY KEY,
                             dept_name VARCHAR(100)
);

CREATE TABLE employees (
                           emp_id SERIAL PRIMARY KEY,
                           emp_name VARCHAR(100),
                           dept_id INT REFERENCES departments(dept_id),
                           salary NUMERIC(10,2),
                           hire_date DATE
);

CREATE TABLE projects (
                          project_id SERIAL PRIMARY KEY,
                          project_name VARCHAR(100),
                          dept_id INT REFERENCES departments(dept_id)
);
INSERT INTO departments (dept_name) VALUES ('Human Resources'), ('Finance'), ('Engineering'), ('Marketing');
INSERT INTO employees (emp_name, dept_id, salary, hire_date) VALUES
('Alice Johnson', 1, 60000.00, '2020-01-15'),
('Bob Smith', 2, 75000.00, '2019-03-10'),
('Charlie Brown', 3, 90000.00, '2018-07-22'),
('Diana Prince', 4, 65000.00, '2021-05-30');
INSERT INTO projects (project_name, dept_id) VALUES
('Employee Onboarding', 1),
('Budget Analysis', 2),
('Software Development', 3),
('Marketing Campaign', 4);
-- 1. ALIAS:
-- a. Display a list of employees including Employee Name, Department, Salary
-- b. Using table aliases (employees as e, departments as d).
SELECT e.emp_name AS Employee_Name, d.dept_name AS Department, e.salary AS Salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
-- 2. Aggregate Functions:
-- a. Calculate:
-- i. Total salary budget for the entire company
-- ii. Average salary
-- iii. Highest and lowest salary
-- iv. Number of employees
SELECT
    SUM(salary) AS Total_Salary_Budget,
    AVG(salary) AS Average_Salary,
    MAX(salary) AS Highest_Salary,
    MIN(salary) AS Lowest_Salary,
    COUNT(*) AS Number_of_Employees
FROM employees;
-- GROUP BY / HAVING:
-- a. Calculate the average salary for each department
-- b. Only display departments with an average salary > 15,000,000
SELECT d.dept_name AS Department, AVG(e.salary) AS Average_Salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 15000000;
-- JOIN:
-- List projects along with the responsible department and employees belonging to that department
SELECT p.project_name AS Project, d.dept_name AS Department, e.emp_name AS Employee
FROM projects p
JOIN departments d ON p.dept_id = d.dept_id
JOIN employees e ON d.dept_id = e.dept_id;
-- Subquery:
-- a. Find employees with the highest salary in each department
-- b. Hint: Subquery nested in WHERE salary IN (SELECT MAX(...))
SELECT emp_name, dept_id, salary
FROM employees
WHERE (dept_id, salary) IN (
    SELECT dept_id, MAX(salary)
    FROM employees
    GROUP BY dept_id
);

