-- Create Database
CREATE DATABASE BookstoreDB;
USE BookstoreDB;

-- Create Tables
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    Price DECIMAL(10, 2),
    PublishedYear INT
);

-- Insert Data into Authors Table
INSERT INTO Authors (AuthorID, AuthorName)
VALUES (1, 'Jane Doe'),
       (2, 'John Smith'),
       (3, 'Alice Johnson');

-- Insert Data into Books Table
INSERT INTO Books (BookID, Title, AuthorID, Price, PublishedYear)
VALUES 
(1, 'Sample Book 1', 1, 29.99, 2020),
(2, 'Sample Book 2', 2, 19.95, 2019),
(3, 'Sample Book 3', 3, 39.99, 2021),
(5, 'Sample Book 4', 4, 39.99, 2023);

       
       drop table Books
    select * from Authors
    select * from Books

-- Example of GROUP BY and HAVING Clause
SELECT Authors.AuthorName, COUNT(Books.BookID) AS NumberOfBooks
FROM Authors
JOIN Books ON Authors.AuthorID = Books.AuthorID
GROUP BY Authors.AuthorName
HAVING COUNT(Books.BookID) > 1;


-- Example of ORDER BY Clause
SELECT * FROM Books
ORDER BY PublishedYear DESC;

-- Create a View
CREATE VIEW BookDetails AS
SELECT Books.BookID, Books.Title, Authors.AuthorName
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;
-- Select data from the BookDetails view
SELECT * FROM BookDetails;


-- Create an Index
CREATE INDEX idx_AuthorID ON Books(AuthorID);
select * from idx_AuthorID

-- Create a Stored Procedure
CREATE PROCEDURE GetBookByAuthor (@AuthorID INT)
AS
BEGIN
    SELECT * FROM Books WHERE AuthorID = @AuthorID;
END;

-- Execute the stored procedure with a specific AuthorID parameter
EXEC GetBookByAuthor @AuthorID = 2;
