-- 1. Drop tables if they exist (optional, for repeat runs)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE loans';
    EXECUTE IMMEDIATE 'DROP TABLE customers';
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- Ignore error if table doesn't exist
END;
/

-- 2. Create 'customers' table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    date_of_birth DATE
);

-- 3. Create 'loans' table
CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    interest_rate NUMBER(5,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Insert sample customers
INSERT INTO customers VALUES (1, 'John Smith', TO_DATE('1950-03-15', 'YYYY-MM-DD')); -- Age 75
INSERT INTO customers VALUES (2, 'Alice Brown', TO_DATE('1985-07-22', 'YYYY-MM-DD')); -- Age 39
INSERT INTO customers VALUES (3, 'David Lee', TO_DATE('1948-11-09', 'YYYY-MM-DD')); -- Age 76
INSERT INTO customers VALUES (4, 'Priya Mehta', TO_DATE('1995-06-10', 'YYYY-MM-DD')); -- Age 30

-- 5. Insert sample loans
INSERT INTO loans VALUES (101, 1, 8.5); -- Eligible
INSERT INTO loans VALUES (102, 2, 7.0); -- Not eligible
INSERT INTO loans VALUES (103, 3, 9.2); -- Eligible
INSERT INTO loans VALUES (104, 4, 6.8); -- Not eligible

COMMIT;

-- 6. PL/SQL block to apply 1% discount
SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_customers IS
        SELECT c.customer_id, l.loan_id, l.interest_rate, c.date_of_birth
        FROM customers c
        JOIN loans l ON c.customer_id = l.customer_id;

    v_age NUMBER;
BEGIN
    FOR rec IN cur_customers LOOP
        -- Calculate age
        v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, rec.date_of_birth) / 12);

        -- If age is greater than 60, apply 1% discount
        IF v_age > 60 THEN
            UPDATE loans
            SET interest_rate = interest_rate - 1
            WHERE loan_id = rec.loan_id;

            DBMS_OUTPUT.PUT_LINE('Discount applied for Customer ID: ' || rec.customer_id ||
                                 ', Old Rate: ' || rec.interest_rate ||
                                 ', New Rate: ' || (rec.interest_rate - 1));
        END IF;
    END LOOP;

    COMMIT;
END;
/
