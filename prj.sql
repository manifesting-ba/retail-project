-- Disable SQL strict mode before importing table to allow nulls
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
## DATA CLEANING
-- View the table
SELECT *
FROM retail_store_sales
LIMIT 100;
-- Create a copy
CREATE TABLE retail_store_sales_cleaned_v1
LIKE retail_store_sales;
INSERT INTO retail_store_sales_cleaned_v1
SELECT *
FROM retail_store_sales;
SELECT *
FROM retail_store_sales_cleaned_v1;

-- Standardize the data
-- rename columns
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Transaction ID` to Transaction_id;
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Customer ID` to Customer_id;
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Price Per Unit` to Price_per_unit;
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Total Spent` to Total_spent;
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Payment Method` to Payment_method;
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Transaction Date` to Transaction_date;
ALTER TABLE retail_store_sales_cleaned_v1
RENAME COLUMN `Discount Applied` to Discount_applied;
-- check the format of all columns and look for blanks
SELECT COUNT(Transaction_id)  -- transaction ids are unique so they must equal row numbers
FROM retail_store_sales_cleaned_v1;
SELECT DISTINCT Customer_id  -- 25 unique customer id: checked
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Category
FROM retail_store_sales_cleaned_v1;
SELECT DISTINCT Item  -- contain missing information - need filling
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Price_per_unit  -- contain missing information
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Quantity  -- include 0?
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Total_spent  -- include 0?
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Payment_method
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Location
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Transaction_date
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
SELECT DISTINCT Discount_applied  -- include missing information
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
-- Columns contain nulls: item, price per unit, quantity, total spent, location, discount
-- Change Transaction_date data type from text to date
SELECT *
FROM retail_store_sales_cleaned_v1;
ALTER TABLE retail_store_sales_cleaned_v1
MODIFY COLUMN Transaction_date DATE;

-- Look for duplicates
SELECT *, ROW_NUMBER() OVER(PARTITION BY Transaction_id, Customer_id, Category, Item, Price_per_unit, Quantity, Total_spent, Payment_method, Location, Transaction_date, Discount_applied) AS row_num
FROM retail_store_sales_cleaned_v1
ORDER BY row_num DESC;
-- there's no row_num > 1 which means there's no duplicates

-- Handle missing values
-- price per unit
UPDATE retail_store_sales_cleaned_v1
SET Price_per_unit = Total_spent/Quantity;
SELECT *
FROM retail_store_sales_cleaned_v1
WHERE Price_per_unit IS NULL; -- both quantity and total spent are missing - may consider deleting
-- quantity 
SELECT *
FROM retail_store_sales_cleaned_v1
WHERE Quantity = 0 AND Price_per_unit IS NOT NULL; -- no new rows found besides the rows above
-- total spent
SELECT *
FROM retail_store_sales_cleaned_v1
WHERE Total_spent = 0 AND Price_per_unit IS NOT NULL; -- no new rows found
-- delete null price per unit rows
DELETE FROM retail_store_sales_cleaned_v1
WHERE Price_per_unit IS NULL AND Quantity = 0 AND Total_spent = 0; -- avoid overdeleting
-- 604 rows are deleted

SELECT * 
FROM retail_store_sales_cleaned_v1
WHERE Category = 'Patisserie' AND Price_per_unit = 20;
-- fill item column
SELECT *
FROM retail_store_sales_cleaned_v1 AS t1
JOIN retail_store_sales_cleaned_v1 AS t2
 ON t1.Category = t2.Category AND t1.Price_per_unit = t2.Price_per_unit
WHERE (t1.Item = '') AND t2.Item != '';
UPDATE retail_store_sales_cleaned_v1 AS t1
JOIN retail_store_sales_cleaned_v1 AS t2
 ON t1.Category = t2.Category AND t1.Price_per_unit = t2.Price_per_unit
SET t1.Item = t2.Item
WHERE (t1.Item = '') AND t2.Item != '';
SELECT DISTINCT Item
FROM retail_store_sales_cleaned_v1;
SELECT *
FROM retail_store_sales_cleaned_v1;

## EDA
-- 1. Overview: total sales, transactions, quantity sold
SELECT SUM(Total_spent) AS Sales, 
       COUNT(DISTINCT Transaction_id) AS Transactions, 
       SUM(Quantity) AS Quantity,
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),2) AS Avg_spend_per_transaction
FROM retail_store_sales_cleaned_v1;

-- 2. Time-series analysis
-- Identify time range
SELECT MIN(Transaction_date), MAX(Transaction_date)
FROM retail_store_sales_cleaned_v1;
-- Calculate sales, transactions, quantity sold, avg spend per transaction by year 
SELECT SUBSTR(Transaction_date, 1, 4) AS Year, 
	   SUM(Total_spent) AS Sales, 
       COUNT(DISTINCT Transaction_id) AS Transactions, 
       SUM(Quantity) AS Quantity,
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend_per_transaction
FROM retail_store_sales_cleaned_v1
GROUP BY SUBSTR(Transaction_date, 1, 4)
ORDER BY 2 DESC;
-- Calculate sales, transactions, quantity sold, avg spend per transaction by month
SELECT SUBSTR(Transaction_date, 1, 7) AS Month, 
	   SUM(Total_spent) AS Sales,
       COUNT(DISTINCT Transaction_id) AS Transactions,
       SUM(Quantity) AS Quantity,
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),2) AS Avg_spend_per_transaction
FROM retail_store_sales_cleaned_v1
GROUP BY SUBSTR(Transaction_date, 1, 7)
ORDER BY SUM(Total_spent) DESC;

-- 3. Product category analysis
-- Calculate sales, transactions, and avg spend of each category
SELECT Category, 
       SUM(Total_spent) AS Sales, 
       COUNT(DISTINCT Transaction_id) AS Transactions, 
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend_per_transaction
FROM retail_store_sales_cleaned_v1
GROUP BY Category
ORDER BY 4 DESC;
-- Calculate quantity sold of each category to identify high-volume categories
SELECT Category, 
	   SUM(Quantity) AS Total_quantity,
       COUNT(DISTINCT Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Category
ORDER BY 2 DESC; 
-- Calculate sales, number of transactions, average spend, and quantity of each item
SELECT Item, 
	   SUM(Total_spent) AS Sales, 
       COUNT(DISTINCT Transaction_id) AS Transactions, 
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend_per_transaction,
       SUM(Quantity) AS Quantity
FROM retail_store_sales_cleaned_v1
GROUP BY Item
ORDER BY 2 DESC; -- focus on top 5 items
-- Monthly performance by category
SELECT Category, 
       SUBSTR(Transaction_date, 1, 7) AS Month, 
       SUM(Total_spent) AS Sales,
       COUNT(Transaction_id) AS Transactions,
       SUM(Quantity) AS Quantity
FROM retail_store_sales_cleaned_v1
GROUP BY SUBSTR(Transaction_date, 1, 7), Category
ORDER BY 1, 2;

-- 4. Location analysis
-- Calculate transaction counts of each location
SELECT Location, COUNT(DISTINCT Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Location;
-- Compare online vs in-store transaction counts of each category
SELECT Category, Location,
       COUNT(DISTINCT Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Category, Location
ORDER BY 1, 2;

-- 5. Customer behavior analysis
-- Discover the correlation between the number of transactions and customer spending
SELECT Customer_id, 
       COUNT(Transaction_id) AS Transactions, 
       SUM(Total_spent) AS Customer_spending
FROM retail_store_sales_cleaned_v1
GROUP BY Customer_id
ORDER BY 3 DESC;
-- I want to see if high total spent is associated with large quantity and high average spend 
SELECT Customer_id, 
       SUM(Quantity) AS Quantity, 
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend
FROM retail_store_sales_cleaned_v1
GROUP BY Customer_id
ORDER BY 3 DESC;
-- However, there seems to be no correlation
-- Following, I want to see the relationship between weekday and number of transactions to understand customer behaviors
WITH day_of_week AS 
(
SELECT Transaction_id, Transaction_date, 
CASE 
 WHEN WEEKDAY(Transaction_date) = 0 THEN 'Mon'
 WHEN WEEKDAY(Transaction_date) = 1 THEN 'Tue'
 WHEN WEEKDAY(Transaction_date) = 2 THEN 'Wed' 
 WHEN WEEKDAY(Transaction_date) = 3 THEN 'Thu'
 WHEN WEEKDAY(Transaction_date) = 4 THEN 'Fri'
 WHEN WEEKDAY(Transaction_date) = 5 THEN 'Sat' 
 WHEN WEEKDAY(Transaction_date) = 6 THEN 'Sun'
 END AS Day_of_week
FROM retail_store_sales_cleaned_v1
)
SELECT Day_of_week, COUNT(Transaction_id) AS Transactions
FROM day_of_week
GROUP BY Day_of_week
ORDER BY 2 DESC;
-- there's not much difference among days of week, indicating no association
-- Calculate number of transactions with and without discount 
SELECT Discount_applied, COUNT(Discount_applied) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Discount_applied; -- no significant gap & too many unknowns
-- Identify payment method patterns
SELECT Payment_method, 
       COUNT(Payment_method) AS Transactions,
       ROUND(COUNT(Payment_method)/ SUM(COUNT(Payment_method)) OVER(),2) *100 AS Percentage
FROM retail_store_sales_cleaned_v1
GROUP BY Payment_method; -- the distribution for 3 methods is relatively even
-- inspect payment method patterns over time
SELECT Payment_method, 
       SUBSTR(Transaction_date, 1, 7) AS Month, 
       COUNT(Payment_method) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Payment_method, SUBSTR(Transaction_date, 1, 7)
ORDER BY 1, 3 DESC; 
