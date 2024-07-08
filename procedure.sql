--Table Definitions and Sample Data
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers (customer_id, name, city, state, email) VALUES
(1, 'Amit Sharma', 'Mumbai', 'Maharashtra', 'amit.sharma@example.com'),
(2, 'Rita Patel', 'Ahmedabad', 'Gujarat', 'rita.patel@example.com'),
(3, 'Rajesh Kumar', 'Delhi', 'Delhi', 'rajesh.kumar@example.com'),
(4, 'Priya Singh', 'Bangalore', 'Karnataka', 'priya.singh@example.com'),
(5, 'Anita Roy', 'Kolkata', 'West Bengal', 'anita.roy@example.com');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (product_id, name, price) VALUES
(1, 'Laptop', 50000.00),
(2, 'Smartphone', 20000.00),
(3, 'Tablet', 15000.00),
(4, 'Smartwatch', 5000.00),
(5, 'Headphones', 2000.00);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date) VALUES
(1, 1, 1, 1, '2023-06-01'),
(2, 2, 2, 2, '2023-06-03'),
(3, 1, 3, 1, '2023-06-05'),
(4, 3, 4, 3, '2023-06-07'),
(5, 4, 5, 4, '2023-06-10'),
(6, 5, 1, 1, '2023-06-12'),
(7, 3, 2, 2, '2023-06-15'),
(8, 2, 3, 1, '2023-06-17'),
(9, 4, 4, 2, '2023-06-20'),
(10, 1, 5, 3, '2023-06-22');


-- Create a procedure to retrieve the total number of orders placed by a specific customer.
DELIMITER $$

CREATE PROCEDURE Order_Details(p_customer_id INT)
BEGIN
    DECLARE c_count int;
    SELECT COUNT(1) INTO c_count from `SQL_PRACTICE`.orders WHERE customer_id=p_customer_id;
    IF c_count > 0 THEN
        SELECT customer_id,count(order_id) from `SQL_PRACTICE`.orders 
        GROUP BY customer_id
        HAVING customer_id=p_customer_id;
    ELSE
        SELECT 'Error' as Message;
    END IF ;
END $$

CALL `Order_Details`(1)

--Create a procedure to update the price of a specific product.

CREATE PROCEDURE Price_update(IN p_product_id INT ,IN p_price_new INT)
BEGIN
    DECLARE p_count INT;
    SELECT count(1) INTO p_count from products where product_id=p_product_id;
    IF p_count>0 THEN
        UPDATE products
        SET price=p_price_new
        WHERE product_id=p_product_id;
    ELSE
        SELECT 'Error: Product Does not Exists' as ERROR;
    END IF ;
END $$

CALL `Price_update`('2','1300')

