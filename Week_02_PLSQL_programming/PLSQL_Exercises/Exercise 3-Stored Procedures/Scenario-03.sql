-- 1. Drop the accounts table if it exists
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE accounts';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- 2. Create the accounts table
CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    balance NUMBER(12,2)
);

-- 3. Insert sample accounts
INSERT INTO accounts VALUES (101, 1, 10000.00);  -- Source
INSERT INTO accounts VALUES (102, 2, 3000.00);   -- Destination

COMMIT;

-- 4. Create the TransferFunds procedure
CREATE OR REPLACE PROCEDURE TransferFunds (
    p_source_account_id      IN NUMBER,
    p_destination_account_id IN NUMBER,
    p_amount                 IN NUMBER
) IS
    v_source_balance NUMBER;
BEGIN
    -- Check if source account exists and get its balance
    SELECT balance INTO v_source_balance
    FROM accounts
    WHERE account_id = p_source_account_id
    FOR UPDATE;

    -- Check if sufficient balance is available
    IF v_source_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account.');
    END IF;

    -- Deduct from source account
    UPDATE accounts
    SET balance = balance - p_amount
    WHERE account_id = p_source_account_id;

    -- Add to destination account
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_id = p_destination_account_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Transfer of $' || p_amount || 
                         ' from Account #' || p_source_account_id || 
                         ' to Account #' || p_destination_account_id || 
                         ' completed successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Account not found.');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/

-- 5. Execute the procedure: transfer $2500 from 101 → 102
BEGIN
    TransferFunds(101, 102, 2500);
END;
/
