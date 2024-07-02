CREATE DATABASE SQL_PRACTICE

USE SQL_PRACTICE

CREATE TABLE customers_data (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

INSERT INTO customers_data (customer_id, name, city, state, email, phone) VALUES
(1, 'Amit Sharma', 'Mumbai', 'Maharashtra', 'amit.sharma@example.com', '9876543210'),
(2, 'Rita Patel', 'Ahmedabad', 'Gujarat', 'rita.patel@example.com', '9123456789'),
(3, 'Rajesh Kumar', 'Delhi', 'Delhi', 'rajesh.kumar@example.com', '9988776655'),
(4, 'Priya Singh', 'Bangalore', 'Karnataka', 'priya.singh@example.com', '9876501234'),
(5, 'Anita Roy', 'Kolkata', 'West Bengal', 'anita.roy@example.com', '9123067890');

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    sale_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers_data(customer_id)
);

INSERT INTO sales (sale_id, customer_id, sale_date, amount) VALUES
(1, 1, '2023-05-01', 5000.00),
(2, 2, '2023-05-03', 7500.00),
(3, 1, '2023-05-05', 3000.00),
(4, 3, '2023-05-07', 12000.00),
(5, 4, '2023-05-10', 4500.00),
(6, 5, '2023-05-12', 8000.00),
(7, 3, '2023-05-15', 1500.00),
(8, 2, '2023-05-17', 9200.00),
(9, 4, '2023-05-20', 6700.00),
(10, 1, '2023-05-22', 4000.00);

--Create a view to see total sales amount for each customer.
CREATE VIEW SALE_CX AS 
WITH Sale_total(Total_sale,customer_id) AS
(SELECT SUM(amount) as Total_sale, customer_id from `SQL_PRACTICE`.sales
GROUP BY customer_id)
SELECT name, Total_sale from `SQL_PRACTICE`.customers_data as T1 JOIN Sale_total ON `T1`.customer_id=`Sale_total`.customer_id

SELECT * from `SQL_PRACTICE`.`SALE_CX`

--Create a view to see sales details along with customer information.
CREATE OR REPLACE VIEW CX_VIEW AS
WITH Sale_total(Total_sale,customer_id) AS
(SELECT SUM(amount) as Total_sale, customer_id from `SQL_PRACTICE`.sales
GROUP BY customer_id)
SELECT name, Total_sale from `SQL_PRACTICE`.customers_data as T1 JOIN Sale_total ON `T1`.customer_id=`Sale_total`.customer_id
WITH CHECK OPTION;

SELECT * from `SQL_PRACTICE`.`CX_VIEW`

CREATE OR REPLACE VIEW  TEST_VIEW AS 
SELECT * from `SQL_PRACTICE`.customers_data

SELECT * from `SQL_PRACTICE`.`TEST_VIEW`

INSERT INTO `SQL_PRACTICE`.`TEST_VIEW` VALUES (1223,'Pallab','Bangalore','Karnataka','mail.pknath@gmail.com',987676565)

ALTER VIEW `SQL_PRACTICE`.TEST_VIEW
