-- 1 - Add a new column named "genre" of type VARCHAR to the "Books" table.
ALTER TABLE library.Books ADD COLUMN genre VARCHAR(50);
-- 2 - Rename available column to is_available in the "Books" table.
ALTER TABLE library.Books RENAME COLUMN available TO is_available;
-- 3 - Delete the "email" column from the "Members" table.
ALTER TABLE library.Members DROP COLUMN email;
-- 4 - Delete the "OrderDetails" table from the "sales" schema.
DROP TABLE sales.OrderDetails;
