-- Creating the database
CREATE DATABASE University;
USE University;

-- Creating the instructor table
CREATE TABLE instructor (
    ID INT,
    name NVARCHAR(50),
    dept_name NVARCHAR(50),
    salary INT
);

-- Inserting data into the instructor table
INSERT INTO instructor VALUES (22222, 'Einstein', 'Physics', 95000);
INSERT INTO instructor VALUES (12121, 'We', 'Finance', 90000);
INSERT INTO instructor VALUES (32343, 'El Said', 'History', 60000);

select *from instructor
-- ... (other insert statements)

-- Creating backup tables
CREATE TABLE backup_ins (
    ID INT,
    name NVARCHAR(50),
    dept_name NVARCHAR(50),
    salary INT
);


CREATE TABLE backup_del (
    ID INT,
    name NVARCHAR(50),
    dept_name NVARCHAR(50),
    salary INT
);

-- Creating the insert trigger
CREATE TRIGGER ins_trigger
ON instructor
AFTER INSERT
AS 
BEGIN
    INSERT INTO backup_ins (ID, name, dept_name, salary)
    SELECT ID, name, dept_name, salary
    FROM inserted;
END;
-- Selecting data from the backup_ins table
SELECT * FROM backup_ins;

-- Creating the delete trigger
CREATE TRIGGER del_trigger
ON instructor
AFTER DELETE
AS 
BEGIN
    INSERT INTO backup_del (ID, name, dept_name, salary)
    SELECT ID, name, dept_name, salary
    FROM deleted;
END;

-- Selecting data from the backup_del table
SELECT * FROM backup_del;

-- Deleting a record from the instructor table
DELETE FROM instructor WHERE ID = 32343;
select * from instructor
-- Displaying records from the backup_del table
SELECT * FROM backup_del;
