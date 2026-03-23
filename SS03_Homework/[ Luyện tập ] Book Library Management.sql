-- 1 - Create a database named "LibraryDB".
CREATE DATABASE LibraryDB;
-- Connect to LibraryDB database after creating
\c LibraryDB
-- 2 - Create a schema named "library"
CREATE SCHEMA library;
-- 3 - Create a table named "Books" in the "library" schema with the following    columns:
CREATE TABLE library.Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    available BOOLEAN DEFAULT TRUE
);
-- 4 - Create a table named "Members" in the "library" schema with the following columns:
CREATE TABLE library.Members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    join_date DATE DEFAULT CURRENT_DATE
);
