-- Drop tables if they exist
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Employees;

-- Create Accounts table
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    Balance DECIMAL(10,2),
    AccountType VARCHAR(20)
);

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    PerformanceRating INT
);

-- Insert sample data into Accounts
INSERT INTO Accounts VALUES (101, 1, 1000.00, 'savings');
INSERT INTO Accounts VALUES (102, 2, 2000.00, 'savings');
INSERT INTO Accounts VALUES (103, 3, 5000.00, 'current');

-- Insert sample data into Employees
INSERT INTO Employees VALUES (1, 'IT', 50000.00, 5);
INSERT INTO Employees VALUES (2, 'HR', 45000.00, 4);

-- Drop existing procedure if exists and create: ProcessMonthlyInterest
DROP PROCEDURE IF EXISTS ProcessMonthlyInterest;
DELIMITER $$

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
    UPDATE Accounts
    SET Balance = Balance * 1.01
    WHERE AccountType = 'savings';
END$$

DELIMITER ;

-- Drop existing procedure if exists and create: UpdateEmployeeBonus
DROP PROCEDURE IF EXISTS UpdateEmployeeBonus;
DELIMITER $$

CREATE PROCEDURE UpdateEmployeeBonus(
    IN deptName VARCHAR(50),
    IN bonusPercent DECIMAL(5,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = deptName;
END$$

DELIMITER ;

-- Drop existing procedure if exists and create: TransferFunds
DROP PROCEDURE IF EXISTS TransferFunds;
DELIMITER $$

CREATE PROCEDURE TransferFunds(
    IN fromAccount INT,
    IN toAccount INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    DECLARE currentBalance DECIMAL(10,2);

    -- Get balance of source account
    SELECT Balance INTO currentBalance
    FROM Accounts
    WHERE AccountID = fromAccount;

    -- Check sufficient balance
    IF currentBalance >= amount THEN
        -- Deduct from source
        UPDATE Accounts
        SET Balance = Balance - amount
        WHERE AccountID = fromAccount;

        -- Add to destination
        UPDATE Accounts
        SET Balance = Balance + amount
        WHERE AccountID = toAccount;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient funds in source account';
    END IF;
END$$

DELIMITER ;

-- ✅ Example Calls:
-- 1. Apply interest to savings accounts
CALL ProcessMonthlyInterest();

-- 2. Add 10% bonus to IT department
CALL UpdateEmployeeBonus('IT', 10);

-- 3. Transfer 500 from account 102 to 103
CALL TransferFunds(102, 103, 500.00);

-- View results
SELECT * FROM Accounts;
SELECT * FROM Employees;


