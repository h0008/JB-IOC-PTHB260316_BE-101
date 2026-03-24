CREATE DATABASE StudentDB;
\C StudentDB;
CREATE TABLE students_basic (
                                id SERIAL PRIMARY KEY,
                                name VARCHAR(50),
                                age INT,
                                major VARCHAR(50),
                                gpa DECIMAL(3,2)
);

INSERT INTO students_basic (id, name, age, major, gpa) VALUES
                                                           (1, 'An', 20, 'CNTT', 3.5),
                                                           (2, 'Bình', 21, 'Toán', 3.2),
                                                           (3, 'Cường', 22, 'CNTT', 3.8),
                                                           (4, 'Dương', 20, 'Vật lý', 3.0),
                                                           (5, 'Em', 21, 'CNTT', 2.9);
-- 1 - Add a new student record with name "Hùng", age 23, major "Hóa học", and gpa 3.4
INSERT INTO students_basic (id, name, age, major, gpa) VALUES (6, 'Hùng', 23, 'Hóa học', 3.4);
-- 2 - Update the gpa of student "Bình" to 3.6
UPDATE students_basic
SET gpa = 3.6
WHERE name = 'Bình';
-- 3 - Delete all students with gpa less than 3.0
DELETE FROM students_basic
WHERE gpa < 3.0;
-- 4 - List all students, only display the name and major, sorted by gpa in descending order
SELECT name, major FROM students_basic
ORDER BY gpa DESC;
-- 5 - List the unique names of students with the major "CNTT"
SELECT DISTINCT name FROM students_basic
WHERE major = 'CNTT';
-- 6 - List all students with GPA between 3.0 and 3.6
SELECT name, age, major, gpa FROM students_basic
WHERE gpa BETWEEN 3.0 AND 3.6;
-- 7 - Find all students whose name starts with "C" (use LIKE/ILIKE)
SELECT name, age, major, gpa FROM students_basic
WHERE name LIKE 'C%';
-- 8 - List the first 3 students in ascending order, or get from the 2nd to the 4th student (use LIMIT and OFFSET)
SELECT name, age, major, gpa FROM students_basic
ORDER BY name
LIMIT 3;
