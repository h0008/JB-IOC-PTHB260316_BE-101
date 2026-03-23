
CREATE DATABASE CompanyDB;

\c CompanyDB;

CREATE TABLE Employees (
                           id SERIAL PRIMARY KEY,
                           full_name VARCHAR(100) NOT NULL,
                           department VARCHAR(50) NOT NULL,
                           position VARCHAR(50) NOT NULL,
                           salary int NOT NULL,
                           bonus int,
                           join_year char(4) NOT NULL
);
-- 4 - Insert at least 7 records into the "Employees" table
INSERT INTO Employees (id, full_name, department, position, salary, bonus, join_year) VALUES
                                                                                          (1, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
                                                                                          (2, 'Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
                                                                                          (3, 'Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
                                                                                          (4, 'Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
                                                                                          (5, 'Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
                                                                                          (6, 'Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
                                                                                          (7, 'Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);
-- 2a - Increase 10% salary for all employees in the "IT" department with salary less than 18,000,000
UPDATE Employees
SET salary = salary * 1.10
WHERE department = 'IT' AND salary < 18000000;
-- 2b - For employees with bonus is NULL, set the bonus to 500,000
UPDATE Employees
SET bonus = 500000
WHERE bonus IS NULL;
-- 3a - Display all employees in the "IT" or "HR" department, join after 2020, total salary (salary + bonus) greater than 15,000,000,
SELECT id, full_name, department, position, salary, bonus, join_year FROM Employees
WHERE (department = 'IT' OR department = 'HR') AND join_year > '2020' AND (salary + bonus) > 15000000;
-- 3b - Display only the first 3 employees after sorting by total salary (salary + bonus) in descending order
SELECT id, full_name, department, position, salary, bonus, join_year FROM Employees
ORDER BY (salary + bonus) DESC
LIMIT 3;
-- 4 - Find all employees whose full name starts with "Nguyễn" or ends with "Hân"
SELECT id, full_name, department, position, salary, bonus, join_year FROM Employees
WHERE full_name LIKE 'Nguyễn%' OR full_name LIKE '%Hân';
-- 5 - List all departments with at least 1 employee with bonus is not NULL
SELECT DISTINCT department FROM Employees
WHERE bonus IS NOT NULL;
-- 6 - Display all employees who joined between 2019 and 2022
SELECT id, full_name, department, position, salary, bonus, join_year FROM Employees
WHERE join_year BETWEEN '2019' AND '2022';
