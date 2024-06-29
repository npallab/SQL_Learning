CREATE DATABASE LEARN_SQL

USE LEARN_SQL

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10, 2),
    sale_date DATE
);

INSERT INTO Sales (product_name, category, quantity, price, sale_date) VALUES
('Product A', 'Category 1', 10, 15.00, '2024-01-01'),
('Product B', 'Category 2', 20, 30.00, '2024-01-02'),
('Product C', 'Category 1', 5, 7.50, '2024-01-03'),
('Product D', 'Category 3', 12, 18.00, '2024-01-04'),
('Product E', 'Category 2', 6, 9.00, '2024-01-05'),
('Product F', 'Category 1', 8, 12.00, '2024-01-06'),
('Product G', 'Category 3', 15, 22.50, '2024-01-07'),
('Product H', 'Category 2', 25, 37.50, '2024-01-08'),
('Product I', 'Category 1', 14, 21.00, '2024-01-09'),
('Product J', 'Category 3', 9, 13.50, '2024-01-10'),
('Product K', 'Category 2', 7, 10.50, '2024-01-11'),
('Product L', 'Category 1', 13, 19.50, '2024-01-12'),
('Product M', 'Category 3', 11, 16.50, '2024-01-13'),
('Product N', 'Category 2', 16, 24.00, '2024-01-14'),
('Product O', 'Category 1', 10, 15.00, '2024-01-15'),
('Product P', 'Category 3', 18, 27.00, '2024-01-16'),
('Product Q', 'Category 2', 4, 6.00, '2024-01-17'),
('Product R', 'Category 1', 22, 33.00, '2024-01-18'),
('Product S', 'Category 3', 6, 9.00, '2024-01-19'),
('Product T', 'Category 2', 19, 28.50, '2024-01-20'),
('Product U', 'Category 1', 21, 31.50, '2024-01-21'),
('Product V', 'Category 3', 17, 25.50, '2024-01-22'),
('Product W', 'Category 2', 8, 12.00, '2024-01-23'),
('Product X', 'Category 1', 23, 34.50, '2024-01-24'),
('Product Y', 'Category 3', 10, 15.00, '2024-01-25'),
('Product Z', 'Category 2', 5, 7.50, '2024-01-26'),
('Product AA', 'Category 1', 11, 16.50, '2024-01-27'),
('Product BB', 'Category 3', 14, 21.00, '2024-01-28'),
('Product CC', 'Category 2', 9, 13.50, '2024-01-29'),
('Product DD', 'Category 1', 18, 27.00, '2024-01-30'),
('Product EE', 'Category 3', 13, 19.50, '2024-01-31'),
('Product FF', 'Category 2', 7, 10.50, '2024-02-01'),
('Product GG', 'Category 1', 16, 24.00, '2024-02-02'),
('Product HH', 'Category 3', 11, 16.50, '2024-02-03'),
('Product II', 'Category 2', 12, 18.00, '2024-02-04'),
('Product JJ', 'Category 1', 20, 30.00, '2024-02-05'),
('Product KK', 'Category 3', 19, 28.50, '2024-02-06'),
('Product LL', 'Category 2', 6, 9.00, '2024-02-07'),
('Product MM', 'Category 1', 25, 37.50, '2024-02-08'),
('Product NN', 'Category 3', 15, 22.50, '2024-02-09'),
('Product OO', 'Category 2', 10, 15.00, '2024-02-10'),
('Product PP', 'Category 1', 14, 21.00, '2024-02-11'),
('Product QQ', 'Category 3', 8, 12.00, '2024-02-12'),
('Product RR', 'Category 2', 18, 27.00, '2024-02-13'),
('Product SS', 'Category 1', 9, 13.50, '2024-02-14'),
('Product TT', 'Category 3', 22, 33.00, '2024-02-15'),
('Product UU', 'Category 2', 17, 25.50, '2024-02-16'),
('Product VV', 'Category 1', 12, 18.00, '2024-02-17'),
('Product WW', 'Category 3', 11, 16.50, '2024-02-18'),
('Product XX', 'Category 2', 5, 7.50, '2024-02-19');

SELECT * from `LEARN_SQL`.`Sales`

SELECT category, max(price) from `LEARN_SQL`.`Sales` GROUP BY category


SELECT *, max(price) over() as 'Max Price' from `LEARN_SQL`.`Sales`

SELECT *, max(price) over(PARTITION BY category) as 'Max Price' from `LEARN_SQL`.`Sales`

SELECT *,ROW_NUMBER() over() as 'Row' from `LEARN_SQL`.`Sales`


SELECT *,RANK() over(PARTITION BY price ORDER BY price) as 'Rank' from `LEARN_SQL`.`Sales`

SELECT *,DENSE_RANK() over(PARTITION BY price ORDER BY price) as 'Rank' from `LEARN_SQL`.`Sales`

SELECT *, lead(price) over() as 'next price' from `LEARN_SQL`.`Sales`

SELECT *, lag(price) over() as 'next price' from `LEARN_SQL`.`Sales`

SELECT *,min(price) over() as 'MIN' from `LEARN_SQL`.`Sales`

SELECT *,ROW_NUMBER() over(PARTITION BY category) as 'Cat' from `LEARN_SQL`.`Sales`

SELECT *, RANK() OVER(PARTITION BY category) as 'Rat' from `LEARN_SQL`.`Sales`

SELECT *, lead(price) over() as 'price' from `LEARN_SQL`.`Sales`


SELECT *,ROW_NUMBER() over() as 'Rank of price' from `LEARN_SQL`.`Sales` ORDER BY price 

SELECT *,lead(price) over () as 'Next price' FROM `LEARN_SQL`.`Sales`

SELECT *, lag(price) over() as 'Last price' from `LEARN_SQL`.`Sales`

SELECT *,max(price) over(PARTITION BY product_name) as 'Max in catagory' from `LEARN_SQL`.`Sales`

WITH avrg(Average_price) as (SELECT ROUND(AVG(price),2) from Sales)
SELECT * FROM Sales as T1 JOIN avrg on T1.price>avrg.Average_price

SELECT *,FIRST_VALUE(product_name) over(PARTITION BY category order by price ) as 'Most Expensive Prodcut' from `LEARN_SQL`.`Sales`



SELECT *,LAST_VALUE(Product_name) over(PARTITION BY category order by price range BETWEEN UNBOUNDED PRECEDING and  UNBOUNDED FOLLOWING) as 'Sasta Product' from `LEARN_SQL`.`Sales`


SELECT *, max(price) over w as 'Max',rank() over w , lead(price) over w from `LEARN_SQL`.`Sales`
window w as (PARTITION BY category range BETWEEN UNBOUNDED PRECEDING and  UNBOUNDED FOLLOWING)

SELECT *, NTH_VALUE(price,2) over w as 'Sec Highests' from `LEARN_SQL`.`Sales`
window w as (PARTITION BY category ORDER BY price range BETWEEN UNBOUNDED PRECEDING and  UNBOUNDED FOLLOWING)


SELECT *, NTILE(4) over (ORDER BY price) FROM `LEARN_SQL`.`Sales`

SELECT *, CUME_DIST() over( ORDER BY price) from `LEARN_SQL`.`Sales`

SELECT *, PERCENT_RANK() over(ORDER BY price desc) FROM `LEARN_SQL`.`Sales`