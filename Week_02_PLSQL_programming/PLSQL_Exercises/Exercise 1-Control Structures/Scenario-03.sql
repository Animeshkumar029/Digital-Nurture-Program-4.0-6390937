-- 1. Drop existing tables (optional)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE loans';
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
    email VARCHAR2(100)
);

-- 3. Create loans table
CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    due_date DATE,
    amount NUMBER(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Insert sample customers
INSERT INTO customers VALUES (1, 'John Smith', 'john@example.com');
INSERT INTO customers VALUES (2, 'Alice Brown', 'alice@example.com');
INSERT INTO customers VALUES (3, 'David Lee', 'david@example.com');

-- 5. Insert sample loans (some due within 30 days, some not)
INSERT INTO loans VALUES (101, 1, SYSDATE + 10, 5000.00); -- due soon
INSERT INTO loans VALUES (102, 2, SYSDATE + 45, 7000.00); -- due later
INSERT INTO loans VALUES (103, 3, SYSDATE + 5, 3000.00);  -- due soon
INSERT INTO loans VALUES (104, 1, SYSDATE - 1, 4500.00);  -- overdue

COMMIT;

-- 6. PL/SQL block to send reminders
SET SERVEROUTPUT ON;

BEGIN
    FOR rec IN (
        SELECT c.name, c.email, l.loan_id, l.due_date, l.amount
        FROM loans l
        JOIN customers c ON c.customer_id = l.customer_id
        WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear ' || rec.name || 
            ', your Loan #' || rec.loan_id || 
            ' of amount $' || rec.amount || 
            ' is due on ' || TO_CHAR(rec.due_date, 'DD-MON-YYYY') ||
            '. Please make payment on time.'
        );
    END LOOP;
END;
/
