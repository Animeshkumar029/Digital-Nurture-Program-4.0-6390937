-- 1. Drop the employees table if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- 2. Create the employees table
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    department VARCHAR2(50),
    salary NUMBER(10, 2)
);

-- 3. Insert sample employee data
INSERT INTO employees VALUES (1, 'John Smith', 'Sales', 50000);
INSERT INTO employees VALUES (2, 'Alice Brown', 'Sales', 55000);
INSERT INTO employees VALUES (3, 'David Lee', 'HR', 40000);
INSERT INTO employees VALUES (4, 'Priya Mehta', 'IT', 60000);
INSERT INTO employees VALUES (5, 'Kunal Shah', 'IT', 62000);

COMMIT;

-- 4. Create the stored procedure to update bonuses
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
) IS
BEGIN
    UPDATE employees
    SET salary = salary + (salary * p_bonus_percent / 100)
    WHERE department = p_department;

    DBMS_OUTPUT.PUT_LINE('Bonuses applied to department: ' || p_department || 
                         ' at ' || p_bonus_percent || '%');

    COMMIT;
END;
/

-- 5. Run the procedure for the 'IT' department with 10% bonus
BEGIN
    UpdateEmployeeBonus('IT', 10);
END;
/
