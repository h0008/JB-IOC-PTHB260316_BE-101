-- 1 - Create a database named "LibraryDB".
CREATE DATABASE LibraryDB;
-- Connect to LibraryDB database after creating
\c LibraryDB
-- 2 - Create a schema named "library"
CREATE SCHEMA library;
-- 3 - Create a table named "Books" in the "library" schema with the following columns:
CREATE TABLE library.Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    price REAL
);
-- 4 - View all databases, schemas, and tables in the "LibraryDB" database.
-- View all databases
\l
-- View all schemas in the current database
\dn
-- View all tables in the "library" schema
\dt library.*
-- View all records in the "Books" table
SELECT * FROM library.Books;
