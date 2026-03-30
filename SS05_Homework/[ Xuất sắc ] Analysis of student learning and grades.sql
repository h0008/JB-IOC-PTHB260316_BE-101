CREATE DATABASE student_grades;
\c student_grades
CREATE SCHEMA student_analysis;
\c student_analysis
CREATE TABLE students (
                          student_id SERIAL PRIMARY KEY,
                          full_name VARCHAR(100),
                          major VARCHAR(50)
);

CREATE TABLE courses (
                         course_id SERIAL PRIMARY KEY,
                         course_name VARCHAR(100),
                         credit INT
);

CREATE TABLE enrollments (
                             student_id INT REFERENCES students(student_id),
                             course_id INT REFERENCES courses(course_id),
                             score NUMERIC(5,2)
);
INSERT INTO students (full_name, major) VALUES
                                            ('Alice Johnson', 'Computer Science'),
                                            ('Bob Smith', 'Mathematics'),
                                            ('Charlie Brown', 'Physics'),
                                            ('Diana Prince', 'Literature'),
                                            ('Ethan Hunt', 'Engineering');
INSERT INTO courses (course_name, credit) VALUES
                                              ('Introduction to Programming', 3),
                                              ('Calculus I', 4),
                                              ('Classical Mechanics', 3),
                                              ('Shakespearean Literature', 2),
                                              ('Thermodynamics', 3);
INSERT INTO enrollments (student_id, course_id, score) VALUES
                                                           (1, 1, 85.5),
                                                           (1, 2, 90.0),
                                                           (2, 1, 78.0),
                                                           (2, 3, 88.5),
                                                           (3, 2, 92.0),
                                                           (3, 4, 80.0),
                                                           (4, 1, 70.0),
                                                           (4, 5, 75.5),
                                                           (5, 3, 82.0),
                                                           (5, 4, 89.0);
-- 1. ALIAS:
-- a. List the students along with their course names and scores
-- b. Using short table aliases (e.g., s, c, e)
-- c. And column aliases like Student Name, Course, Score
SELECT s.full_name AS "Student Name", c.course_name AS "Course", e.score AS "Score"
FROM enrollments e
         JOIN students s ON e.student_id = s.student_id
         JOIN courses c ON e.course_id = c.course_id;
-- 2. Aggregate Functions:
-- a. For each student, calculate:
-- i. Average score
-- ii. Highest score
-- iii. Lowest score
SELECT s.full_name AS "Student Name",
       AVG(e.score) AS "Average Score",
       MAX(e.score) AS "Highest Score",
       MIN(e.score) AS "Lowest Score"
FROM enrollments e
         JOIN students s ON e.student_id = s.student_id
GROUP BY s.full_name;
-- 3. GROUP BY / HAVING:
-- a. Find majors with an average score higher than 7.5
SELECT s.major AS "Major", AVG(e.score) AS "Average Score"
FROM enrollments e
         JOIN students s ON e.student_id = s.student_id
GROUP BY s.major
HAVING AVG(e.score) > 7.5;
-- 4. JOIN:
-- a. List all students, course names, credits, and scores (JOIN 3 tables)
SELECT s.full_name AS "Student Name", c.course_name AS "Course", c.credit AS "Credits", e.score AS "Score"
-- 5. Subquery:
-- a. Find students with an average score higher than the overall average score
-- b. Hint: use AVG(score) in the subquery
FROM enrollments e
         JOIN students s ON e.student_id = s.student_id
         JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id IN (
    SELECT student_id
    FROM enrollments
    GROUP BY student_id
    HAVING AVG(score) > (SELECT AVG(score) FROM enrollments)
);
