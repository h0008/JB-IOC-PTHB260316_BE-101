-- 1. Create schema and set up the table
CREATE TABLE order_detail (
                              id SERIAL PRIMARY KEY,
                              order_id INT NOT NULL,
                              product_name VARCHAR(100) NOT NULL,
                              quantity INT NOT NULL CHECK (quantity > 0),
                              unit_price NUMERIC(15,2) NOT NULL CHECK (unit_price >= 0)
);

-- a. Insert sample data for testing
INSERT INTO order_detail (order_id, product_name, quantity, unit_price) VALUES
                                                                            (101, 'Dell XPS 15', 1, 1500.00),
                                                                            (101, 'Logitech MX Master 3', 2, 99.50),
                                                                            (102, 'Razer Gigantus V2', 1, 29.99);

-- 2. Create Stored Procedure
-- a. Calculate the sum of (quantity * unit_price) for a specific order
-- b. Store the result in the OUT parameter
CREATE OR REPLACE PROCEDURE calculate_order_total(order_id_input INT, OUT total NUMERIC)
    LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COALESCE(SUM(quantity * unit_price), 0) INTO total
    FROM order_detail
    WHERE order_id = order_id_input;
END;
$$;

-- 3. Execute Procedure
-- a. Test case: Calculate total for order_id 101 using an anonymous block
DO $$
    DECLARE
        v_total NUMERIC;
    BEGIN
        CALL calculate_order_total(101, v_total);
        RAISE NOTICE 'Total for Order 101 is: %', v_total;
    END;
$$;