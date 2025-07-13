-- 1. Drop existing table (optional)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE customers';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- 2. Create customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    balance NUMBER(12,2),
    IsVIP CHAR(1) DEFAULT 'N'  -- 'Y' = VIP, 'N' = Non-VIP
);

-- 3. Insert sample data
INSERT INTO customers VALUES (1, 'John Smith', 8500.00, 'N');
INSERT INTO customers VALUES (2, 'Alice Brown', 10500.75, 'N');
INSERT INTO customers VALUES (3, 'David Lee', 9999.99, 'N');
INSERT INTO customers VALUES (4, 'Priya Mehta', 20000.00, 'N');

COMMIT;

-- 4. PL/SQL block to set IsVIP = 'Y' for customers with balance > 10,000
SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (SELECT customer_id, balance FROM customers) LOOP
        IF rec.balance > 10000 THEN
            UPDATE customers
            SET IsVIP = 'Y'
            WHERE customer_id = rec.customer_id;

            DBMS_OUTPUT.PUT_LINE('Customer ID ' || rec.customer_id || ' promoted to VIP.');
        END IF;
    END LOOP;

    COMMIT;
END;
/
