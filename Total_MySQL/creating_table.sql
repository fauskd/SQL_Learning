-- 1. Create the database
CREATE DATABASE IF NOT EXISTS emart;
USE emart;

-- 2. Create and populate the januaryorders table
CREATE TABLE januaryorders (
    order_id INT PRIMARY KEY,
    product_code VARCHAR(10),
    order_date DATE
);

INSERT INTO januaryorders (order_id, product_code, order_date) VALUES
(1, 'P001', '2024-01-05'),
(2, 'P012', '2024-01-10'),
(3, 'P004', '2024-01-15'),
(4, 'P017', '2024-01-20'),
(5, 'P008', '2024-01-25'),
(6, 'P016', '2024-01-02'),
(7, 'P001', '2024-01-08'),
(8, 'P009', '2024-01-12'),
(9, 'P013', '2024-01-18'),
(10, 'P006', '2024-01-22'),
(11, 'P003', '2024-01-06'),
(12, 'P015', '2024-01-11'),
(13, 'P001', '2024-01-16'),
(14, 'P002', '2024-01-21'),
(15, 'P010', '2024-01-26');

-- 3. Create and populate the februaryorders table
CREATE TABLE februaryorders (
    order_id INT PRIMARY KEY,
    product_code VARCHAR(10),
    order_date DATE
);

INSERT INTO februaryorders (order_id, product_code, order_date) VALUES
(1, 'P005', '2024-02-03'),
(2, 'P008', '2024-02-08'),
(21, 'P014', '2024-02-13'),
(22, 'P002', '2024-02-18'),
(23, 'P018', '2024-02-23'),
(24, 'P007', '2024-02-05'),
(25, 'P012', '2024-02-10'),
(26, 'P006', '2024-02-15'),
(27, 'P016', '2024-02-20'),
(28, 'P001', '2024-02-25'),
(29, 'P011', '2024-02-07'),
(30, 'P013', '2024-02-12'),
(31, 'P016', '2024-02-17'),
(32, 'P019', '2024-02-18'),
(33, 'P007', '2024-02-28');


-- 4. Create the productdetails table
CREATE TABLE IF NOT EXISTS productdetails (
    product_code VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Populate the productdetails table
INSERT INTO productdetails (product_code, product_name, price) VALUES
('P001', 'Laptop', 899.99),
('P002', 'Smartphone', 699.99),
('P003', 'Tablet', 299.99),
('P004', 'Smartwatch', 129.99),
('P005', 'Camera', 499.99),
('P006', 'Headphones', 79.99),
('P007', 'Monitor', 299.99),
('P008', 'Printer', 149.99),
('P009', 'Gaming Console', 399.99),
('P010', 'External Hard Drive', 129.99),
('P011', 'Router', 79.99),
('P012', 'Smart Speaker', 149.99),
('P013', 'Fitness Tracker', 59.99),
('P014', 'Wireless Earbuds', 89.99),
('P015', 'Digital Camera', 349.99);



