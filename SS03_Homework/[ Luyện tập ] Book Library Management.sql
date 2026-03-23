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
-- 5 - Add a new column named "genre" of type VARCHAR to the "Books" table.
ALTER TABLE library.Books ADD COLUMN genre VARCHAR(50);
-- 6 - Rename available column to is_available in the "Books" table.
ALTER TABLE library.Books RENAME COLUMN available TO is_available;
-- 7 - Delete the "email" column from the "Members" table.
ALTER TABLE library.Members DROP COLUMN email;
