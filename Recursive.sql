CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (employee_id, name, manager_id) VALUES
(1, 'Arjun Rao', NULL),
(2, 'Bharati Nair', 1),
(3, 'Chandrakant Yadav', 1),
(4, 'Divya Shetty', 2),
(5, 'Esha Kothari', 2),
(6, 'Feroze Khan', 3),
(7, 'Gauri Sen', 3),
(8, 'Hiren Shah', 4),
(9, 'Ipsita Mohanty', 4),
(10, 'Jai Shankar', 5);


SELECT * from `TEST`.employees

-- Print 1-10 without using any function

WITH RECURSIVE REC_1 AS
(SELECT 1 as N
UNION ALL
SELECT N+1 from REC_1
WHERE N<10)
SELECT * from `REC_1`

--Retrieve the entire hierarchy of employees starting from 'Arjun Rao'.

WITH RECURSIVE REC_2 AS
(
    SELECT employee_id,name,manager_id from `TEST`.employees  WHERE name='Arjun Rao'
    UNION ALL
    SELECT e.employee_id,e.name,e.manager_id from `TEST`.employees e JOIN REC_2 ON e.manager_id=`REC_2`.employee_id
)
SELECT * from `REC_2`

--Find the list of all managers and their direct subordinates.
WITH RECURSIVE ManagerSubordinates AS (
    SELECT manager_id, employee_id, name
    FROM employees
    WHERE manager_id IS NOT NULL
    UNION ALL
    SELECT e.manager_id, e.employee_id, e.name
    FROM employees e
    INNER JOIN ManagerSubordinates ms ON e.manager_id = ms.employee_id
)
SELECT GROUP_CONCAT(name) from `ManagerSubordinates`
GROUP BY `ManagerSubordinates`.manager_id

--Determine the level (depth) of each employee in the organizational hierarchy starting from 'Arjun Rao'.**

WITH RECURSIVE EmployeeLevels AS (
    SELECT employee_id, name, manager_id, 1 AS level
    FROM employees
    WHERE name = 'Arjun Rao'
    UNION ALL
    SELECT e.employee_id, e.name, e.manager_id, el.level + 1
    FROM employees e
    INNER JOIN EmployeeLevels el ON e.manager_id = el.employee_id
)
SELECT name, level
FROM EmployeeLevels
ORDER BY level;

--Find all employees who report directly or indirectly to 'Bharati Nair'.

WITH RECURSIVE REC_4 AS
(
    SELECT employee_id,name,manager_id from `TEST`.employees WHERE manager_id=2
    UNION ALL
    SELECT e.employee_id,e.name,e.manager_id from employees AS e INNER JOIN REC_4 ON e.manager_id=`REC_4`.employee_id
)
SELECT * from `REC_4`

--Table Definition and Sample Data
CREATE TABLE roads (
    road_id INT PRIMARY KEY,
    start_location VARCHAR(100),
    end_location VARCHAR(100)
);

INSERT INTO roads (road_id, start_location, end_location) VALUES
(1, 'Mumbai', 'Pune'),
(2, 'Pune', 'Nashik'),
(3, 'Nashik', 'Aurangabad'),
(4, 'Aurangabad', 'Nagpur'),
(5, 'Nagpur', 'Raipur'),
(6, 'Raipur', 'Bhubaneswar'),
(7, 'Bhubaneswar', 'Kolkata'),
(8, 'Mumbai', 'Surat'),
(9, 'Surat', 'Ahmedabad'),
(10, 'Ahmedabad', 'Jaipur'),
(11, 'Jaipur', 'Delhi'),
(12, 'Delhi', 'Agra'),
(13, 'Agra', 'Lucknow'),
(14, 'Lucknow', 'Varanasi'),
(15, 'Varanasi', 'Patna'),
(16, 'Patna', 'Kolkata');

--Find the path from 'Mumbai' to 'Kolkata'.

SELECT * from `SQL_PRACTICE`.roads

WITH RECURSIVE PATH_FINDER AS
(
    SELECT road_id,start_location,end_location from `SQL_PRACTICE`.roads WHERE start_location='Mumbai'
    UNION ALL
    SELECT r.road_id,r.start_location,r.end_location from `SQL_PRACTICE`.roads r JOIN PATH_FINDER ON `PATH_FINDER`.end_location=r.start_location
)SELECT * from PATH_FINDER WHERE end_location='Kolkata'


--Identify all locations that can be reached directly or indirectly from 'Delhi

WITH RECURSIVE INDIR_DEL AS
(
    SELECT roads.road_id,roads.start_location,roads.end_location, 1 as n from roads WHERE start_location='Delhi'
    UNION ALL 
    SELECT r.road_id,r.start_location,r.end_location ,n+1 from roads as r JOIN INDIR_DEL ON r.start_location=`INDIR_DEL`.end_location
)
SELECT * from `INDIR_DEL`

--Calculate the total number of connections required to travel from 'Pune' to 'Bhubaneswar'

WITH RECURSIVE PUNE_COUNTER AS
(
    SELECT 1 as count_conn,end_location from roads WHERE start_location='Pune'
    UNION ALL
    SELECT count_conn+1 as 'count_conn',r.end_location from roads AS r JOIN PUNE_COUNTER ON r.start_location=`PUNE_COUNTER`.end_location
)SELECT * from PUNE_COUNTER WHERE end_location='Bhubaneswar'

