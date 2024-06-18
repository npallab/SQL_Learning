-- Creating a sample table 
CREATE DATABASE SQL_Learning

USE SQL_Learning

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2)
);

-- Inserting Sample Data :

INSERT INTO Orders (order_id, customer_id, order_date, amount) VALUES
(1, 101, '2023-01-10', 150.00),
(2, 102, '2023-02-15', 200.00),
(3, 103, '2023-03-20', 250.00),
(4, 101, '2023-04-25', 300.00),
(5, 104, '2023-05-30', 350.00),
(6, 102, '2023-06-10', 400.00),
(7, 105, '2023-07-15', 450.00),
(8, 106, '2023-08-20', 500.00),
(9, 104, '2023-09-25', 550.00),
(10, 103, '2023-10-30', 600.00);

-- View the table 

SELECT * FROM `SQL_Learning`.`Orders`

-- Find all orders that have an amount greater than the average order amount.

-- Find the average order amount

SELECT AVG(amount) from `SQL_Learning`.`Orders`
-- Finding all the orders which have order value more than the average

SELECT * from `SQL_Learning`.`Orders` WHERE amount > (SELECT AVG(amount) from `SQL_Learning`.`Orders`  )

--List the customer IDs who have placed more than one order.
SELECT customer_id,count(order_id) as 'Count_of_order'
from Orders
GROUP BY customer_id
HAVING Count_of_order>1

-- Retrieve the details of the order with the maximum amount.
-- Finding the maximum order value
SELECT max(amount) from `SQL_Learning`.`Orders`

-- Retrieve the details of the order with the maximum amount.

SELECT * from `SQL_Learning`.`Orders` WHERE amount = (SELECT max(amount) from `SQL_Learning`.`Orders`)

-- Find the total amount spent by each customer who has placed an order in 2023.
SELECT customer_id,sum(amount) as 'Total Orders' FROM Orders
GROUP BY customer_id 
HAVING customer_id IN(SELECT customer_id from `SQL_Learning`.`Orders`
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31')

--List all orders where the order amount is greater than the average amount for that customer's orders.
--Query to find average order value

SELECT AVG(amount) from `SQL_Learning`.`Orders`

--- Main Query to retrun the result
SELECT order_id from `SQL_Learning`.`Orders`
WHERE amount>(SELECT AVG(amount) from `SQL_Learning`.`Orders`)

--Retrieve the details of the latest order for each customer.

--- Query to finr date of latest order by each customer :

SELECT customer_id, max(order_date) from `SQL_Learning`.`Orders`
GROUP BY customer_id

-- Main query 
SELECT * 
FROM Orders o1
WHERE order_date = (
    SELECT MAX(order_date)
    FROM Orders o2
    WHERE o1.customer_id = o2.customer_id
);

--Find the number of orders placed in each month of 2023.

SELECT EXTRACT(MONTH from order_date) as month_details,count(order_id) from Orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY month_details

--List the orders placed by customers who have placed an order with an amount greater than $500.
SELECT customer_id,order_date from Orders WHERE amount>=500