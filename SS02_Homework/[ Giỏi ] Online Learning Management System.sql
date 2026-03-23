-- 1 - Create a database named "ElearningDB".
CREATE DATABASE ElearningDB;
-- Connect to the ElearningDB database after creating
\c ElearningDB
-- 2 - Create a schema named "elearning"
CREATE SCHEMA elearning;
-- 3 - Create a table named "Students" in the "elearning" schema with the following columns:
CREATE TABLE elearning.Students (
                                    student_id SERIAL PRIMARY KEY,
                                    first_name VARCHAR(50) NOT NULL,
                                    last_name VARCHAR(50) NOT NULL,
                                    email TEXT NOT NULL UNIQUE
);
-- Create a table named "Instructors" in the "elearning" schema with the following columns
CREATE TABLE elearning.Instructors (
                                       instructor_id SERIAL PRIMARY KEY,
                                       first_name VARCHAR(50) NOT NULL,
                                       last_name VARCHAR(50) NOT NULL,
                                       email TEXT NOT NULL UNIQUE
);
-- Create a table named "Courses" in the "elearning" schema with the following columns
CREATE TABLE elearning.Courses (
                                   course_id SERIAL PRIMARY KEY,
                                   course_name VARCHAR(100) NOT NULL,
                                   instructor_id INT REFERENCES elearning.Instructors(instructor_id)
);
-- Create a table named "Enrollments" in the "elearning" schema with the following
CREATE TABLE elearning.Enrollments (
                                       enrollment_id SERIAL PRIMARY KEY,
                                       student_id INT REFERENCES elearning.Students(student_id),
                                       course_id INT REFERENCES elearning.Courses(course_id),
                                       enroll_date DATE NOT NULL
);
-- Create a table named "Assignments" in the "elearning" schema with the following columns
CREATE TABLE elearning.Assignments (
                                       assignment_id SERIAL PRIMARY KEY,
                                       course_id INT REFERENCES elearning.Courses(course_id),
                                       title VARCHAR(100) NOT NULL,
                                       due_date DATE NOT NULL
);
-- Create a table named "Submissions" in the "elearning" schema with the following columns
CREATE TABLE elearning.Submissions (
                                       submission_id SERIAL PRIMARY KEY,
                                       assignment_id INT REFERENCES elearning.Assignments(assignment_id),
                                       student_id INT REFERENCES elearning.Students(student_id),
                                       submission_date DATE NOT NULL,
                                       grade REAL CHECK (grade >= 0 AND grade <= 100)
);
