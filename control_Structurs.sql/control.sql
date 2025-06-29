
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Loans;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Balance DECIMAL(10,2),
    IsVIP CHAR(1) DEFAULT 'N'
);


CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    InterestRate DECIMAL(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers VALUES (1, 'Alice', 65, 12000.00, 'N');
INSERT INTO Customers VALUES (2, 'Bob', 45, 8500.00, 'N');
INSERT INTO Customers VALUES (3, 'Charlie', 70, 15000.00, 'N');


INSERT INTO Loans VALUES (101, 1, 8.50, CURDATE() + INTERVAL 10 DAY);
INSERT INTO Loans VALUES (102, 2, 9.00, CURDATE() + INTERVAL 40 DAY);
INSERT INTO Loans VALUES (103, 3, 7.50, CURDATE() + INTERVAL 25 DAY);


DROP PROCEDURE IF EXISTS ApplyInterestDiscount;
DELIMITER $$

CREATE PROCEDURE ApplyInterestDiscount()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE l_loan_id INT;
    DECLARE cur CURSOR FOR
        SELECT L.LoanID
        FROM Loans L
        JOIN Customers C ON L.CustomerID = C.CustomerID
        WHERE C.Age > 60;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO l_loan_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE Loans
        SET InterestRate = InterestRate - (InterestRate * 0.01)
        WHERE LoanID = l_loan_id;
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;


DROP PROCEDURE IF EXISTS PromoteVIPCustomers;
DELIMITER $$

CREATE PROCEDURE PromoteVIPCustomers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE c_id INT;
    DECLARE cur CURSOR FOR
        SELECT CustomerID FROM Customers WHERE Balance > 10000;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO c_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        UPDATE Customers SET IsVIP = 'Y' WHERE CustomerID = c_id;
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;


DROP PROCEDURE IF EXISTS SendLoanReminders;
DELIMITER $$

CREATE PROCEDURE SendLoanReminders()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE cust_name VARCHAR(100);
    DECLARE due DATE;
    DECLARE cur CURSOR FOR
        SELECT C.Name, L.DueDate
        FROM Loans L
        JOIN Customers C ON L.CustomerID = C.CustomerID
        WHERE L.DueDate BETWEEN CURDATE() AND CURDATE() + INTERVAL 30 DAY;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO cust_name, due;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT CONCAT('Reminder: Dear ', cust_name, ', your loan is due on ', DATE_FORMAT(due, '%d-%b-%Y')) AS Reminder;
    END LOOP;
    CLOSE cur;
END$$

DELIMITER ;

-- ✅ Run procedures:
CALL ApplyInterestDiscount();
CALL PromoteVIPCustomers();
CALL SendLoanReminders();


SELECT * FROM Customers;
SELECT * FROM Loans;
