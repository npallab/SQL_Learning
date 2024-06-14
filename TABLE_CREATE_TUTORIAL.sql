-- Create the Database
CREATE DATABASE LEARN_SQL

-- Create a table udner the database 
CREATE TABLE School_Table
(  
    Name_of_teacher VARCHAR(100),
    Emp_ID VARCHAR(10) PRIMARY KEY,
    Gender VARCHAR(1) CHECK(Gender IN('M','F','O')),
    Salary DECIMAL(10,2)
);

--ALter the table and add another column : Subject_Taught

ALTER Table School_Table
ADD COLUMN  Subject_Taught VARCHAR(10)

--INSERT ONE DATA INTO THE TABLE
INSERT INTO School_Table VALUES ('Ahmed','SCH0012','M','15000.00','Maths');

-- INSERT MULTIPLE DATA INTO THE TABLE
INSERT INTO School_Table VALUES ('Aliya', 'SCH0039', 'O', 15000.00, 'Maths'),
('Sara', 'SCH0013', 'F', 16000.00, 'Science'),
('John', 'SCH0014', 'M', 15500.00, 'English'),
('Emily', 'SCH0015', 'F', 15000.00, 'History'),
('Michael', 'SCH0016', 'M', 15800.00, 'Physics'),
('Linda', 'SCH0017', 'F', 15200.00, 'Chemistry'),
('Robert', 'SCH0018', 'M', 15100.00, 'Biology'),
('Rachel', 'SCH0019', 'F', 15300.00, 'Geography'),
('David', 'SCH0020', 'M', 15900.00, 'Com Sci'),
('Monica', 'SCH0021', 'F', 15700.00, 'Phy Edu');

-- SELCET ALL TEACHERS WHOSE SALARY IS MORE THAN 15000

SELECT * from School_Table WHERE Salary >= 15000 

-- SELCET ALL TEACHERS WHOSE NAME STARTS WITH R

SELECT * from School_Table WHERE Name_of_teacher LIKE 'R%' 

-- SELCET ALL TEACHERS AND REPLACE GENER BY MALE OF FEMALE

SELECT Name_of_teacher,
    CASE 
        WHEN Gender = 'M' THEN  'Male'
        WHEN Gender = 'F' THEN 'Female'
    ELSE  'NON BINARY'
    END AS GENDER
from School_Table

