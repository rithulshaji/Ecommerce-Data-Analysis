CREATE DATABASE SQL_PYTHON_PROJECT
USE SQL_PYTHON_PROJECT;

CREATE TABLE sales_order (
  order_id int NOT NULL,
  order_date date NOT NULL,
  ship_mode varchar(30),
  segment varchar(30) NOT NULL,
  country varchar(30) NOT NULL,
  city varchar(30) NOT NULL,
  state varchar(30) NOT NULL,
  postal_code varchar(20) NOT NULL,
  region varchar(30) NOT NULL,
  category varchar(30) NOT NULL,
  sub_category varchar(50) NOT NULL,
  product_id varchar(30) NOT NULL,
  quantity int NOT NULL,
  discount decimal(10,2) NOT NULL,
  sales_price decimal(10,2) NOT NULL,
  profit decimal(10,2) NOT NULL,
  PRIMARY KEY (order_id)
) 

SELECT * FROM sales_order;
-- 1) Find top 10 highest revenue generating products

SELECT 
 product_id, 
 SUM(sales_price) AS sales 
FROM sales_order
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;

-- 2) Find top 5 highest selling products in each region
WITH CTE AS
(
SELECT 
 region, 
 product_id, 
 SUM(sales_price) AS sales 
FROM sales_order
GROUP BY region,product_id
)

SELECT * FROM
(
SELECT 
 *, 
 ROW_NUMBER() OVER (PARTITION BY region ORDER BY sales DESC) AS rno
FROM CTE
) AS A
 WHERE rno<=5;

-- 3) Find month over month growth comparison for 2022 and 2023 sales (ex: Jan 2022 & Jan 2023 etc)

WITH cte AS
(
SELECT 
  YEAR(order_date) AS order_year, 
  MONTH(order_date) AS order_month,
  SUM(sales_price) AS sales
FROM sales_order
GROUP BY order_year,order_month
ORDER BY order_year,order_month
)
SELECT 
 order_month,
 sum(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
 sum(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte 
GROUP BY order_month
ORDER BY order_month;

-- 4) For each category which month had the highest sales?

WITH cte AS
(
SELECT 
 category,
 DATE_FORMAT(order_date, '%Y-%m') AS order_year_month,
 SUM(sales_price) AS sales
FROM sales_order
GROUP BY category,order_year_month
ORDER BY category, sales DESC
),

cte2 AS
(
SELECT *, RANK () OVER ( PARTITION BY category ORDER BY sales DESC) AS rnk
FROM cte
)
SELECT * FROM cte2
WHERE rnk=1;

-- 5) Which sub-category had the highest growth by profit in 2023 compared to 2022?

WITH cte AS
(
SELECT 
 YEAR(order_date) AS order_year, 
 sub_category, 
 SUM(sales_price) AS sales
FROM sales_order
GROUP BY YEAR(order_date), sub_category
ORDER BY YEAR(order_date), SUM(sales_price) DESC
),

cte2 AS
(
SELECT 
 sub_category, 
 SUM(CASE WHEN order_year=2022 THEN sales ELSE 0 END) AS sales_2022,
 SUM(CASE WHEN order_year=2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY sub_category
)

SELECT 
 *,
 ROUND(((sales_2023 - sales_2022) /sales_2022) * 100,2) AS yoy_growth
FROM cte2
ORDER BY yoy_growth DESC
LIMIT 1;