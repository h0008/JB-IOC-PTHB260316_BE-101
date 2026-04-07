-- 1. Create schema and set up the table
CREATE TABLE employees (
                           emp_id SERIAL PRIMARY KEY,
                           emp_name VARCHAR(100) NOT NULL,
                           job_level INT NOT NULL CHECK (job_level IN (1, 2, 3)),
                           salary NUMERIC(15,2) NOT NULL CHECK (salary >= 0)
);

-- a. Insert sample data for testing
INSERT INTO employees (emp_name, job_level, salary) VALUES
                                                        ('Alice Smith', 1, 1000.00),
                                                        ('Bob Johnson', 2, 2000.00),
                                                        ('Charlie Brown', 3, 3000.00);

-- 2. Create Stored Procedure
-- a. Fetch current salary and job level
-- b. Update salary based on job_level using IF-ELSIF-ELSE
-- c. Return the new salary via OUT parameter
CREATE OR REPLACE PROCEDURE adjust_salary(p_emp_id INT, OUT p_new_salary NUMERIC)
    LANGUAGE plpgsql
AS $$
DECLARE
    v_job_level INT;
    v_current_salary NUMERIC;
BEGIN
    SELECT job_level, salary INTO v_job_level, v_current_salary
    FROM employees
    WHERE emp_id = p_emp_id;

    IF v_job_level = 1 THEN
        p_new_salary := v_current_salary * 1.05;
    ELSIF v_job_level = 2 THEN
        p_new_salary := v_current_salary * 1.10;
    ELSIF v_job_level = 3 THEN
        p_new_salary := v_current_salary * 1.15;
    ELSE
        p_new_salary := v_current_salary;
    END IF;

    UPDATE employees
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END;
$$;

-- 3. Execute Procedure
-- a. Test case: Update salary for employee with emp_id = 3 (Level 3 -> 15% increase)
DO $$
    DECLARE
        v_updated_salary NUMERIC;
    BEGIN
        CALL adjust_salary(3, v_updated_salary);
        RAISE NOTICE 'New salary for Employee 3 is: %', v_updated_salary;
    END;
$$;