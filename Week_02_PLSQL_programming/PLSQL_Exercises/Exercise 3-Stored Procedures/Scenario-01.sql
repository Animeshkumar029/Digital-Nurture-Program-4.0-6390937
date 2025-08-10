-- 1. Drop table if exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE savings_accounts';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- 2. Create table for savings accounts
CREATE TABLE savings_accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    balance NUMBER(12, 2)
);

-- 3. Insert sample savings account data
INSERT INTO savings_accounts VALUES (101, 1, 1000.00);
INSERT INTO savings_accounts VALUES (102, 2, 5000.00);
INSERT INTO savings_accounts VALUES (103, 3, 12000.00);
INSERT INTO savings_accounts VALUES (104, 4, 750.00);

COMMIT;

-- 4. Create the stored procedure to apply 1% interest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR acc IN (SELECT account_id, balance FROM savings_accounts) LOOP
        UPDATE savings_accounts
        SET balance = balance + (balance * 0.01)
        WHERE account_id = acc.account_id;

        DBMS_OUTPUT.PUT_LINE('Interest applied to Account ID: ' || acc.account_id ||
                             ', New Balance: ' || TO_CHAR(acc.balance * 1.01, '99999.99'));
    END LOOP;

    COMMIT;
END;
/

-- 5. Run the procedure
BEGIN
    ProcessMonthlyInterest;
END;
/
