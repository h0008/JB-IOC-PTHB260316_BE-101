Create DATABASE LibraryDB;

\c LibraryDB;

CREATE TABLE Books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    published_year char(4) NOT NULL,
    price int NOT NULL,
    stock int
);
INSERT INTO Books (id, title, author, category, published_year, price, stock) VALUES
(1, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
(2, 'Học SQL qua ví dụ', 'Trần Thị Hạnh', 'CSDL', 2020, 125000, 12),
(3, 'Lập trình C cơ bản', 'Nguyễn Văn Nam', 'CNTT', 2018, 95000, 20),
(4, 'Phân tích dữ liệu với Python', 'Lê Quốc Bảo', 'CNTT', 2022, 180000, NULL ),
(5, 'Quản trị cơ sở dữ liệu', 'Nguyễn Thị Minh', 'CSDL', 2021, 150000, 5),
(6, 'Học máy cho người mới bắt đầu', 'Nguyễn Văn Nam', 'AI', 2023, 220000, 8),
(7, 'Khoa học dữ liệu cơ bản', 'Nguyễn Văn Nam', 'AI', 2023, 115000, NULL);

-- 1 - Delete all duplicate records in the "Books" table, keeping only one record for each unique combination of title, author, and published_year
DELETE FROM Books
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Books
    GROUP BY title, author, published_year
);
-- 2 - Increase the price of all books from 2021 onwards and price less than 200,000 by 10%
UPDATE Books
SET price = price * 1.10
WHERE published_year >= '2021' AND price < 200000;
-- 3 - For books with stock is NULL, set the stock to 0
UPDATE Books
SET stock = 0
WHERE stock IS NULL;
-- 4a - Display all books in the "CNTT" or "AI" category in the price range of 100,000 to 250,000
SELECT id, title, author, category, published_year, price, stock FROM Books
WHERE (category = 'CNTT' OR category = 'AI') AND price BETWEEN 100000 AND 250000;
-- 4b - Sort the results by price in descending order, then ascending order of title
SELECT id, title, author, category, published_year, price, stock FROM Books
WHERE (category = 'CNTT' OR category = 'AI')
ORDER BY price DESC, title;
-- 5 - Find all books whose title contains the word "học" (not case-sensitive)
SELECT id, title, author, category, published_year, price, stock FROM Books
WHERE LOWER(title) ILIKE '%học%';
-- 6 - List all categories (DISTINCT) with at least 1 book published after 2020
SELECT DISTINCT category FROM Books
WHERE published_year > '2020';
-- 7 - Display only the first 2 results, ignoring the first result (use LIMIT and OFFSET)
SELECT id, title, author, category, published_year, price, stock FROM Books
ORDER BY id
LIMIT 2 OFFSET 1;
