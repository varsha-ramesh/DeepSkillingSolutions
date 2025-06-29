
DROP TABLE IF EXISTS Accounts;


CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    Balance DECIMAL(10,2)
);


INSERT INTO Accounts VALUES (101, 1, 5000.00);
INSERT INTO Accounts VALUES (102, 2, 15000.00);


DROP FUNCTION IF EXISTS CalculateAge;
DELIMITER $$

CREATE FUNCTION CalculateAge(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END$$

DELIMITER ;


-- EMI formula: (P * r * (1 + r)^n) / ((1 + r)^n – 1)
DROP FUNCTION IF EXISTS CalculateMonthlyInstallment;
DELIMITER $$

CREATE FUNCTION CalculateMonthlyInstallment(
    loanAmount DECIMAL(10,2),
    annualRate DECIMAL(5,2),
    durationYears INT
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE r DECIMAL(10,6);
    DECLARE n INT;
    DECLARE emi DECIMAL(10,2);

    SET r = annualRate / 12 / 100;
    SET n = durationYears * 12;

    IF r = 0 THEN
        SET emi = loanAmount / n;
    ELSE
        SET emi = (loanAmount * r * POW(1 + r, n)) / (POW(1 + r, n) - 1);
    END IF;

    RETURN ROUND(emi, 2);
END$$

DELIMITER ;


DROP FUNCTION IF EXISTS HasSufficientBalance;
DELIMITER $$

CREATE FUNCTION HasSufficientBalance(accId INT, amt DECIMAL(10,2))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE currentBalance DECIMAL(10,2);

    SELECT Balance INTO currentBalance
    FROM Accounts
    WHERE AccountID = accId;

    RETURN currentBalance >= amt;
END$$

DELIMITER ;


SELECT CalculateAge('1990-05-10') AS Age;


SELECT CalculateMonthlyInstallment(100000, 10.0, 5) AS MonthlyEMI;


SELECT HasSufficientBalance(101, 4000) AS CanTransact;  -- Should return 1 (true)
SELECT HasSufficientBalance(101, 6000) AS CanTransact;  -- Should return 0 (false)
