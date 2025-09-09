-- Create table in the database.

CREATE TABLE retail_sales
	(
		transaction_id INT PRIMARY KEY,
		sale_date DATE,
		sale_time TIME,
		customer_id INT,
		gender VARCHAR(10),
		age INT,
		category VARCHAR(20),
		quantity INT,
		price_per_unit FLOAT,
		cogs FLOAT,
		total_sale FLOAT
	)

SELECT * FROM retail_sales
limit 10

-- To get the totall record in the database

SELECT COUNT(*) FROM retail_sales

-- we will check the null value in each columns in table.
SELECT * FROM retail_sales
WHERE transaction_id IS NULL;


-- DATA CLEANING

SELECT * FROM retail_sales
WHERE transaction_id IS NULL
	OR 
	sale_date IS NULL
	OR
	sale_timE IS NULL
	OR
	gender IS NULL
	OR
	customer_id IS NULL
	OR 
	age IS NULL
	OR 
	category IS NULL
	OR 
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	Total_sale IS NULL;


--- Now we'll delete the null records 

DELETE FROM retail_sales
WHERE transaction_id IS NULL
	OR 
	sale_date IS NULL
	OR
	sale_timE IS NULL
	OR
	gender IS NULL
	OR
	customer_id IS NULL
	OR 
	age IS NULL
	OR 
	category IS NULL
	OR 
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	Total_sale IS NULL;

SELECT * FROM retail_sales;
---------------------------------------------------------------------------
-- Data Exploration

-- How many sales we have ?

SELECT COUNT(*) as Total_sales FROM retail_sales;

-- How many customer we have ?

SELECT COUNT(DISTINCT(customer_id)) From retail_sales;

-- How many categories we have ? & What are those category we have ?

SELECT COUNT(DISTINCT(category)) FROM retail_sales;

-- SELECT category FROM retail_sales
-- GROUP BY category
-- ORDER BY category ASC;

SELECT DISTINCT(category) FROM retail_sales;

-----------------------------------------------------------------------------------
--- DATA ANALYSIS & BUSINESS KEY PROBLEM & ANSWER

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT SUM(total_sale) FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing'
--     and the quantity sold is more than 4 in th month of Nov-2022.

SELECT * FROM retail_sales
WHERE category = 'Clothing' 
		AND 
		TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
		AND
		quantity >= 4;

select * from retail_sales;

-- Q3 : Calculate SQL query to calculate the total sales (Total_sales) for each category.

SELECT SUM(total_sale) as total_sales, category, COUNT(*) AS total_order
FROM retail_sales
GROUP BY category
HAVING category IN 
	(SELECT category 
		FROM retail_sales 
		GROUP BY category);

-- Q4 : Write a SQL query to find the average age of customers who purchased
--       items from the 'Beauty' category . 

SELECT ROUND(AVG(age)) as avg_age
FROM retail_sales
WHERE category = 'Beauty'; 

-- Q5 : Write a SQL query to find all transaction where the total_sale is greater 
--      than 1000

SELECT * FROM retail_sales
WHERE total_sale > 1000;

-- Q6 : Write a SQL query to find out the total number of transactions (transaction_id)
---     made by each gender in each category .

SELECT category, gender, COUNT(transaction_id) as total_order 
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Q7 : Write a SQL query to calculate the average sale for each month. 
--      Find out the best selling month in each year.

SELECT Year, 
		Month,
		avg_sale FROM 
(
	SELECT 
		EXTRACT (year FROM sale_date) as Year, --for postgreSQL only
	-- but for MYSQL We have to write in this way to extract Year from sale_date -
	-- YEAR (sale_date) 
		EXTRACT (month FROM sale_date) as Month,
		ROUND(AVG(total_sale)) as avg_sale,
		RANK() OVER (PARTITION BY EXTRACT(year FROM sale_date) 
		ORDER BY AVG(total_sale) desc) AS RANK 
	FROM retail_sales
	GROUP BY Year, Month
	ORDER BY Year, avg_sale desc) AS t1 
WHERE RANK = 1;


-- Q8 : Write a SQL query to find the top 5 customers based on the highest
--      total sales.

SELECT 
		customer_id,
		SUM(total_sale) as Total_sale
		--RANK() OVER (PARTITION BY customer_id ORDER BY SUM(total_sale)DESC)AS RNK
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

select * from retail_sales;

-- Q9 : Write a query to find out the total number of unique customers who purchased
--      items from each category.

SELECT category, 
		COUNT(DISTINCT(customer_id)) AS UNI_CUSTOMER
FROM retail_sales
GROUP BY 1
ORDER BY 1;

-- Q10 : Write a SQL query to create each shift and number of orders
--       (Example Morning <= 12, Afternoon between 12 & 17, evening >17)

SELECT * FROM retail_sales
WITH hourly_sale 
AS
(
SELECT *,
	CASE 
		WHEN EXTRACT(Hour from sale_time)< 12 THEN 'Morning'
		WHEN EXTRACT(Hour from sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
FROM retail_sales
)

SELECT 
	shift,
	COUNT(*)
FROM hourly_sale
GROUP BY shift;
