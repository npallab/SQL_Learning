-- CREATE A SAMPLE DATABSE FOR USE
CREATE DATABASE Employee

USE  Employee

-- Create a sample Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    experience_years INT
);
-- INSERT Sample Data into the table 
INSERT INTO Employees (employee_id, employee_name, department, salary, experience_years) VALUES
(1, 'Alice', 'Engineering', 90000, 5),
(2, 'Bob', 'Engineering', 85000, 4),
(3, 'Charlie', 'HR', 60000, 3),
(4, 'David', 'Engineering', 95000, 6),
(5, 'Eve', 'HR', 65000, 4),
(6, 'Frank', 'Marketing', 70000, 5),
(7, 'Grace', 'Marketing', 72000, 6),
(8, 'Hank', 'Finance', 80000, 7),
(9, 'Ivy', 'Finance', 85000, 8),
(10, 'Jack', 'Finance', 78000, 6);

-- Calculate the average salary of all employees and list employees who earn more than this average.

WITH Average_sal(avg_sal) AS
(SELECT cast (AVG(Salary) as FLOAT) from `Employees`)
SELECT employee_name,salary ,avg_sal from Employees as T1 JOIN Average_sal as T2 ON `T1`.salary > `T2`.avg_sal

--Find the average experience years for each department.
SELECT department,AVG(experience_years) as 'Avg Exp' from Employees
GROUP BY department

-- List all employees along with their department's average salary.
WITH Dept_avg(department_name,avg_sal_dept) AS
(SELECT department,avg(salary) as 'Dept_Avg' from Employees GROUP BY department)
SELECT employee_name,salary,avg_sal_dept,department from Employees as E1 JOIN Dept_avg as E2
ON E1.department=E2.department_name

-- Identify employees whose salary is above the average salary of their department.
WITH Dept_avg(department_name,avg_sal_dept) AS
(SELECT department,avg(salary) as 'Dept_Avg' from Employees GROUP BY department)
SELECT employee_name,salary,avg_sal_dept,department from Employees as E1 JOIN Dept_avg as E2
ON E1.salary>E2.avg_sal_dept

--Find the highest salary in each department and the employee(s) who earn this salary.

WITH Max_sal(dept_name,max_sal) AS
(SELECT department,max(salary) FROM Employees GROUP BY department)
SELECT employee_name,salary,department,max_sal as 'Maximum Salary' from Employees AS E1 JOIN Max_sal AS S1 
ON E1.salary=S1.max_sal

