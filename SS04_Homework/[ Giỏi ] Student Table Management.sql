CREATE DATABASE student_management;
\c student_management;
CREATE TABLE students (
                          id SERIAL PRIMARY KEY,
                          full_name VARCHAR(50),
                          gender VARCHAR(10),
                          birth_year INT,
                          major VARCHAR(50),
                          gpa DECIMAL(3,2)
);

INSERT INTO students (id, full_name, gender, birth_year, major, gpa) VALUES
                                                                         (1, 'Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
                                                                         (2, 'Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
                                                                         (3, 'Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
                                                                         (4, 'Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
                                                                         (5, 'Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
                                                                         (6, 'Lưu Đức Tài', 'Nam', 2004, 'Cơ khí', NULL),
                                                                         (7, 'Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);
-- 1 - Add student "Lê Hoàng Nam", gender "Nam", birth year 2003, major "CNTT", GPA 3.8.
INSERT INTO students (id, full_name, gender, birth_year, major, gpa) VALUES (8, 'Lê Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);
-- 2 - Update the GPA of student "Lê Quốc Cường" to 3.4
UPDATE students SET gpa = 3.4 WHERE full_name = 'Lê Quốc Cường';
-- 3 - Delete student with GPA IS NULL.
DELETE FROM students WHERE gpa IS NULL;
-- 4 - Display all students majoring in "CNTT" with a GPA greater than 3.0, only getting the first 3 records.
SELECT * FROM students WHERE major = 'CNTT' AND gpa > 3.0
LIMIT 3;
-- 5 - List unique majors
SELECT DISTINCT major FROM students;
-- 6 - Display all students majoring in "CNTT" and sort them by GPA in descending order. then ascending order by name.
SELECT * FROM students WHERE major = 'CNTT' ORDER BY gpa DESC, full_name;
-- 7 - Find all student starting with "Nguyễn"
SELECT * FROM students WHERE full_name LIKE 'Nguyễn%';
-- 8 - Display all student born between 2001 and 2003
SELECT * FROM students WHERE birth_year BETWEEN 2001 AND 2003;
