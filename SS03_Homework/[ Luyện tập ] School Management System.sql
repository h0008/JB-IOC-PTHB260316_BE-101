-- 1 - Create a database named "SchoolDB".
CREATE DATABASE SchoolDB;
-- Connect to SchoolDB database after creating
\c SchoolDB
-- 2 - Create a schema named "school"
CREATE SCHEMA school;
-- 3 - Create a table named "Students" in the "school" schema with the following columns:
CREATE TABLE school.Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL
);
-- 4 - Create a table named "Courses" in the "school" schema with the following columns:
CREATE TABLE school.Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);
-- 5 - Create a table named "Enrollments" in the "school" schema with the following columns:
CREATE TABLE school.Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES school.Students(student_id),
    course_id INT REFERENCES school.Courses(course_id),
    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'F'))
);
