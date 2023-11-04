-- Create a new database
CREATE DATABASE SampleDatabase;

-- Use the newly created database
USE SampleDatabase;

-- Create a new table within the database
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50)
);

-- Add a new column to the Employees table
ALTER TABLE Employees
ADD Email VARCHAR(100);

-- Insert data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Email)
VALUES (1, 'John', 'Doe', 30, 'IT', 'john.doe@example.com'),
       (2, 'Alice', 'Smith', 28, 'HR', 'alice.smith@example.com'),
       (3, 'Bob', 'Johnson', 35, 'Finance', 'bob.johnson@example.com');

-- Drop the Employees table
DROP TABLE Employees;

-- Drop the SampleDatabase
DROP DATABASE SampleDatabase;
