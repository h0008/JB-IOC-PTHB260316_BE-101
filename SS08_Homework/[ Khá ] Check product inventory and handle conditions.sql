-- 1. Create schema and set up the table
CREATE TABLE inventory (
                           product_id SERIAL PRIMARY KEY,
                           product_name VARCHAR(100) NOT NULL,
                           quantity INT NOT NULL CHECK (quantity >= 0)
);

-- a. Insert sample data for testing
INSERT INTO inventory (product_name, quantity) VALUES
                                                   ('Logitech G502 Mouse', 50),
                                                   ('Keychron Q1 Keyboard', 5);

-- 2. Create Stored Procedure
-- a. Check if the product has enough stock
-- b. Raise an exception if quantity < requested quantity
CREATE OR REPLACE PROCEDURE check_stock(p_id INT, p_qty INT)
    LANGUAGE plpgsql
AS $$
DECLARE
    v_current_stock INT;
BEGIN
    SELECT quantity INTO v_current_stock FROM inventory WHERE product_id = p_id;

    IF v_current_stock < p_qty THEN
        RAISE EXCEPTION 'Không đủ hàng trong kho';
    ELSE
        RAISE NOTICE 'Product % has enough stock. Available: %', p_id, v_current_stock;
    END IF;
END;
$$;

-- 3. Execute Procedure
-- a. Test case 1: Product has enough stock (50 > 10)
CALL check_stock(1, 10);

-- b. Test case 2: Product does not have enough stock (5 < 10)
-- Note: This will raise an exception and halt execution in Termux
CALL check_stock(2, 10);