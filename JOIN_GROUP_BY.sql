-- Create a table Customers_Main
CREATE TABLE Customers_Main
(
    Username varchar(20) PRIMARY KEY,
    Full_name   VARCHAR(20),
    Customer_Address VARCHAR(30)
)

-- Create another Table Named Sales

CREATE TABLE Sales
(
    Username VARCHAR(20),
    Item_Name VARCHAR(20),
    Price DECIMAL(10,2)
)


INSERT INTO Customers_Main (Username, Full_name, Customer_Address) VALUES
('johndoe1', 'John Doe', '123 Maple St'),
('janedoe2', 'Jane Doe', '456 Oak St'),
('bsmith3', 'Bob Smith', '789 Pine St'),
('asullivan4', 'Alice Sullivan', '101 Elm St'),
('jdoe5', 'Jack Doe', '202 Birch St'),
('mmiller6', 'Mary Miller', '303 Cedar St'),
('kwilson7', 'Kate Wilson', '404 Spruce St'),
('tjohnson8', 'Tom Johnson', '505 Willow St'),
('hmartinez9', 'Hannah Martinez', '606 Aspen St'),
('gdavis10', 'Gary Davis', '707 Fir St'),
('ewilliams11', 'Eva Williams', '808 Cypress St'),
('jmurphy12', 'Jim Murphy', '909 Redwood St'),
('plopez13', 'Paul Lopez', '1010 Hickory St'),
('nlee14', 'Nina Lee', '1111 Sequoia St'),
('csanchez15', 'Carlos Sanchez', '1212 Juniper St'),
('kroberts16', 'Karen Roberts', '1313 Magnolia St'),
('dward17', 'David Ward', '1414 Poplar St'),
('jmartin18', 'Julia Martin', '1515 Maple St'),
('mramos19', 'Michael Ramos', '1616 Oak St'),
('abrown20', 'Anna Brown', '1717 Pine St');

-- Insert 20 dummy entries into the Sales table
INSERT INTO Sales (Username, Item_Name, Price) VALUES
('johndoe1', 'Laptop', 999.99),
('johndoe1', 'Mouse', 19.99),
('janedoe2', 'Keyboard', 49.99),
('janedoe2', 'Monitor', 199.99),
('bsmith3', 'Chair', 150.00),
('bsmith3', 'Desk', 250.00),
('asullivan4', 'Headphones', 79.99),
('asullivan4', 'Microphone', 129.99),
('jdoe5', 'Tablet', 299.99),
('jdoe5', 'Cover', 29.99),
('mmiller6', 'Camera', 499.99),
('mmiller6', 'Tripod', 59.99),
('kwilson7', 'Smartphone', 699.99),
('kwilson7', 'Charger', 39.99),
('tjohnson8', 'Printer', 149.99),
('tjohnson8', 'Ink', 39.99),
('hmartinez9', 'Router', 89.99),
('hmartinez9', 'Cable', 19.99),
('gdavis10', 'Hard Drive', 89.99),
('gdavis10', 'USB Stick', 14.99);

-- Query to select name of user and item purchased and price by using INNER JOIN

SELECT Full_name, Item_name,Price FROM `Customers_Main` INNER JOIN `Sales`
ON `Customers_Main`.`Username`=`Sales`.`Username`

-- Query to view the total purchase by each customer
SELECT `Customers_Main`.`Full_name`,SUM(Sales.`Price`) AS 'Total Purchase' FROM `Customers_Main` INNER JOIN `Sales`
ON `Customers_Main`.`Username`=`Sales`.`Username`
GROUP BY `Full_name`

-- Creating another table to demonstrate CROSS JOIN
CREATE TABLE Brand
(
    Name_of_Brand VARCHAR(10)
)

INSERT INTO Brand VALUES ('SONY');

SELECT `Customers_Main`.`Customer_Address`,`Brand`.`Name_of_Brand` FROM `Customers_Main` CROSS JOIN `Brand`

-- Creating Another Table to demonstrate SELF JOIN

CREATE TABLE PARENTS_CHILD
(
    Member_ID VARCHAR(10),
    Member_Name VARCHAR(20),
    Parent_ID VARCHAR(10)
)

-- Insert 20 dummy entries into the PARENTS_CHILD table
INSERT INTO PARENTS_CHILD (Member_ID, Member_Name, Parent_ID) VALUES
('M001', 'John Smith', NULL),
('M002', 'Jane Doe', NULL),
('M003', 'Bob Johnson', NULL),
('M004', 'Alice Brown', NULL),
('M005', 'Jack Davis', NULL),
('M006', 'Mary Wilson', NULL),
('M007', 'Tom White', 'M001'),
('M008', 'Hannah Black', 'M002'),
('M009', 'Gary Clark', 'M003'),
('M010', 'Eva Harris', 'M004'),
('M011', 'Jim Lewis', 'M005'),
('M012', 'Paul Walker', 'M006'),
('M013', 'Nina Hall', 'M001'),
('M014', 'Carlos Allen', 'M002'),
('M015', 'Karen Young', 'M003'),
('M016', 'David King', 'M004'),
('M017', 'Julia Scott', 'M005'),
('M018', 'Michael Green', 'M006'),
('M019', 'Anna Baker', 'M007'),
('M020', 'James Wright', 'M008');


SELECT T1.Member_Name as "Name",
T2.Member_Name as "Parent Name"
from `PARENTS_CHILD` as T1 JOIN `PARENTS_CHILD` as T2
ON `T1`.`Member_ID`=`T2`.`Parent_ID`;

