CREATE DATABASE sql_project_1;


-- Create Table--

CREATE TABLE reatil_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
)


-- DATA CLEANING -- 

SELECT 
    *
FROM
    reatil_sales
WHERE
    transactions_id IS NULL
        OR sale_date IS NULL
        OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantiy IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL
        OR total_sale IS NULL;
    
    
DELETE FROM reatil_sales 
WHERE
    transactions_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;


-- Question - How many sales we have ?--

SELECT 
    COUNT(*) AS Total_Sales
FROM
    reatil_sales;
    
-- How many uniques Customers do we have ? --

SELECT 
    COUNT(DISTINCT customer_id) AS Total_Sales
FROM
    reatil_sales;
    
    
-- Question 1: Write a sql query to retrieve all the columns for sales made on "2022-11-05" ?

SELECT 
    *
FROM
    reatil_sales
WHERE
    sale_date = '2022-11-05';


-- Question 2: Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022--

SELECT 
    *
FROM
    reatil_sales
WHERE
    category = 'Clothing' AND quantiy >= 4
        AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';


-- Question 3: Write a SQL query to calculate the total sales (total_sale) for each category--

SELECT 
    category, SUM(total_sale)
FROM
    reatil_sales
GROUP BY category;



-- Question 4: Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category ? --

SELECT 
    ROUND(AVG(age), 2) AS Average_Age
FROM
    reatil_sales
WHERE
    category = 'Beauty';
    
    
    
-- Question 5: Write a SQL query to find all transactions where the total_sale is greater than 1000--

SELECT 
    *
FROM
    reatil_sales
WHERE
    total_sale > 1000;



-- Question 6: Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.: --

SELECT 
    category, gender, COUNT(*) AS Total_Transaction
FROM
    reatil_sales
GROUP BY gender , category;



-- Question 7: Write a SQL query to calculate the average sale for each month. Find out best selling month in each year --

SELECT 
    YEAR(sale_date) AS Year_Number,
    MONTH(sale_date) AS Month_Number,
    ROUND(AVG(total_sale), 2) AS Average_Sales
FROM
    reatil_sales
GROUP BY sale_date
ORDER BY MONTH(sale_date) ASC;



-- Question 8: Write a SQL query to find the top 5 customers based on the highest total sales--

SELECT 
    customer_id, SUM(total_sale) AS Total_Sales
FROM
    reatil_sales
GROUP BY customer_id
ORDER BY SUM(total_sale) DESC
LIMIT 5;


-- Question 9: Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT 
    category, COUNT(DISTINCT customer_id) AS Unique_Customers
FROM
    reatil_sales
GROUP BY category;


-- Question 10: Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) <= 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS Number_of_Orders
FROM
    reatil_sales
GROUP BY shift;

    