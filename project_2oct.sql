create database SQL_project_p2 ;

-- Create table 
drop table if exists retail_sales  ;
create table retail_sales
   (
      transactions_id INT ,
      sale_date DATE ,
      sale_time TIME ,
      customer_id INT ,
      gender VARCHAR(15) , 
      age INT ,
      category VARCHAR(15) ,
      quantiy INT , 
      price_per_unit FLOAT , 
      cogs FLOAT ,
      total_sale FLOAT 
)
;

select * from retail_sales ;

select count(*) from retail_sales ;

--cleaning null value
select * from retail_sales 
where transactions_id is NULL ;

select * from retail_sales 
where sale_date is NULL 
;

select * from retail_sales 
where sale_time is NULL 
;


select * from retail_sales 
where
transactions_id is NULL 
OR 
sale_time is NULL
OR
sale_time is NULL
OR
customer_ID is NULL
OR 
gender is NULL 
OR 
age is NULL
OR 
category is NULL 
OR 
quantiy is NULL 
OR 
price_per_unit is NULL 
OR 
cogs is NULL 
OR 
total_sale is NULL
;
DELETE FROM retail_sales
select * from retail_sales ;
-- data exlploration 

-- how many sales we have 
select count(*) as total_sales from retail_sales;

-- how many customer we have 
select COUNT(DISTINCT customer_ID) as total_customer from retail_sales;

-- distinct category 
select distinct(category) as distinct_category from retail_sales ;



-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date = '2022-11-05' ;
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and
--the quantity sold is more than 4 in the month of Nov-2022
select * from retail_sales 
where category = 'Clothing'
AND quantiy >= 4
AND 
TO_CHAR(sale_date, 'YYYY-MM') = '2022-11';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select sum(total_sale) AS total_sales , category
, count(*)  AS total_sales 
from retail_sales 
GROUP BY category ;

-- Q.4 Write a SQL query to find the average age of customers who purchased items
--from the 'Beauty' category.
select ROUND(AVG(age), 2) AS avg_age  
from retail_sales 
where category = 'Beauty' ;





-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

select * from retail_sales
where 
total_sale > 1000
;
-- Q.6 Write a SQL query to find the total number of 
--transactions (transaction_id) made by each gender in each category.
select gender , category ,  count(*) AS total_trns
from retail_sales
group by gender,category 
order by category
;


-- Q.7 Write a SQL query to calculate the average sale for each month.
--Find out best selling month in each year
select 
extract(year from sale_date ) AS year ,
extract(month from sale_date) AS month ,
AVG(total_sale) AS avg_sales from retail_sales 
group by 1 , 2
order by 1 , 2 
;

-- Q.8 Write a SQL query to find the top 5 customers based on the 
--highest total sales 
select customer_id ,
sum(total_sale) AS total_sales	
from retail_sales 
group by customer_id 
order by total_sales desc
LIMIT 5
;

-- Q.9 Write a SQL query to find the number of unique customers who purchased
--items from each category.
select category ,  
sum(total_sale) AS total_sales	
from retail_sales 
group by customer_id 
order by total_sales desc
LIMIT 5
;
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales ;
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift ;

-- End of project
