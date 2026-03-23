-- 1 - Create a database named "CompanyDB".
CREATE DATABASE CompanyDB;
-- Connect to CompanyDB database after creating
\c CompanyDB
-- 2 - Create a schema named "company"
CREATE SCHEMA company;
-- 3 - Create a table named "Departments" in the "company" schema with the following columns:
CREATE TABLE company.Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
-- 4 - Create a table named "Employees" in the "company" schema with the following columns:
CREATE TABLE company.Employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    department_id INT REFERENCES company.Departments(department_id
);
-- 5 - Create a table named "Projects" in the "company" schema with the following columns:
CREATE TABLE company.Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
-- 6 - Create a table named "EmployeeProjects" in the "company" schema with the following columns:
CREATE TABLE company.EmployeeProjects (
    emp_id SERIAL PRIMARY KEY,
    project_id INT REFERENCES company.Projects(project_id)
);

