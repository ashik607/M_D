

CREATE DATABASE Store;
USE Store;

CREATE TABLE Products (
    product_id CHAR(6) PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    description TEXT,
    price MONEY CHECK (price >= 0),
    quantity INT CHECK (quantity >= 0)
);

select * from Products

USE Store;

CREATE TABLE Sales (
    sale_id CHAR(6) PRIMARY KEY,
    product_id CHAR(6) REFERENCES Products(product_id),
    sale_date DATE NOT NULL,
    quantity_sold INT CHECK (quantity_sold >= 0),
    total_amount MONEY CHECK (total_amount >= 0)
);
 select * from Sales
 
USE Store;

CREATE TABLE Customer_Suppliers (
    cusl_id CHAR(6) PRIMARY KEY CHECK (cusl_id LIKE '[CS][0-9][0-9][0-9][0-9][0-9]'),
    cusl_fname CHAR(15) NOT NULL,
    cusl_lname VARCHAR(15),
    cusl_address TEXT,
    cusl_telno CHAR(12) CHECK (cusl_telno LIKE '012-%[0-9][0-9][0-9][0-9][0-9][0-9]'),
    cusl_city CHAR(12) DEFAULT 'Pabna',
    sales_amnt MONEY CHECK (sales_amnt >= 0),
    proc_amnt MONEY CHECK (proc_amnt >= 0)
);

select * from Customer_Suppliers

CREATE TABLE Items (
    item_id CHAR(6) PRIMARY KEY CHECK (item_id LIKE 'P[0-9][0-9][0-9][0-9][0-9]'),
    item_name CHAR(12),
    item_category CHAR(10),
    item_price FLOAT CHECK (item_price >= 0),
    item_quantity INT CHECK (item_quantity >= 0),
    item_last_sold DATE DEFAULT GETDATE()
);

select * from Items

CREATE TABLE Transactions (
    tran_id CHAR(10) PRIMARY KEY CHECK (tran_id LIKE 'T[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    item_id CHAR(6),
    cust_id CHAR(6), -- Assuming cust_id in Customer_Suppliers is CHAR(6)
    tran_type CHAR(3) CHECK (tran_type IN ('SLD', 'ORD')),
    tran_quantity INT CHECK (tran_quantity >= 0),
    tran_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (item_id) REFERENCES Items(item_id),
    FOREIGN KEY (cust_id) REFERENCES Customer_Suppliers(cusl_id)
);

select * from Transactions




