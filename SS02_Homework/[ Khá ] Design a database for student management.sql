-- [ Khá ] Design a database for student management
-- 1 - Create a database named "UniversityDB".
CREATE DATABASE UniversityDB;
-- Connect to the UniversityDB database after creating
\c UniversityDB
-- 2 - Create a schema named "university"
CREATE SCHEMA university;
-- 3 - Create a table named "Students" in the "university" schema with the following columns:
CREATE TABLE university.Students (
                                     student_id SERIAL PRIMARY KEY,
                                     first_name VARCHAR(50) NOT NULL,
                                     last_name VARCHAR(50) NOT NULL,
                                     birth_date DATE,
                                     email TEXT NOT NULL UNIQUE
);
-- Create a table named "Courses" in the "university" schema with the following columns:
CREATE TABLE university.Courses (
                                    course_id SERIAL PRIMARY KEY,
                                    course_name VARCHAR(100) NOT NULL,
                                    credits INT
);
-- Create a table named "Enrollments" in the "university" schema with the following columns:
CREATE TABLE university.Enrollments (
                                        enrollment_id SERIAL PRIMARY KEY,
                                        student_id INT REFERENCES university.Students(student_id),
                                        course_id INT REFERENCES university.Courses(course_id),
                                        enroll_date DATE
);
-- 4 - View all databases, schemas, and tables in the "UniversityDB" database.
\l
\dn
\dt university.*
SELECT * FROM university.Students;
SELECT * FROM university.Courses;
SELECT * FROM university.Enrollments;
