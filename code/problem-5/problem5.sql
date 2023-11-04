-- Create Database
CREATE DATABASE OnlineStore;
USE OnlineStore;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductName VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Email)
VALUES (1, 'John Doe', 'john.doe@example.com'),
       (2, 'Jane Smith', 'jane.smith@example.com'),
       (3, 'Alice Johnson', 'alice.johnson@example.com');

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, ProductName, Quantity)
VALUES (101, 1, 'Laptop', 2),
       (102, 2, 'Phone', 1),
       (103, 3, 'Tablet', 3);

-- Cartesian Product Example
SELECT * FROM Customers, Orders;

-- Natural Join Example
SELECT * FROM Customers
NATURAL JOIN Orders;

-- Left Outer Join Example
SELECT Customers.CustomerID, CustomerName, ProductName, Quantity
FROM Customers
LEFT OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Right Outer Join Example
SELECT Orders.OrderID, CustomerName, ProductName, Quantity
FROM Customers
RIGHT OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Full Outer Join Example
SELECT Customers.CustomerID, CustomerName, ProductName, Quantity
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
