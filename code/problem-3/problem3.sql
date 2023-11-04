-- Create database
CREATE DATABASE SampleDB;
USE SampleDB;

-- Create Users table
CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    city VARCHAR(255)
);

-- Insert sample data into Users table
INSERT INTO Users (id, name, age, city)
VALUES 
(1, 'Alice', 30, 'New York'),
(2, 'Bob', 25, 'Los Angeles'),
(3, 'Charlie', 35, 'Chicago'),
(4, 'David', 28, 'Houston'),
(5, 'Eva', 32, 'Miami');
select *from Users
-- SELECT examples

-- Example 1: Select all names from the Users table
SELECT name FROM Users;

-- Example 2: Select all columns from the Users table
SELECT * FROM Users;

-- Example 3: Select users older than 30 years from the Users table
SELECT * FROM Users WHERE age > 30;
