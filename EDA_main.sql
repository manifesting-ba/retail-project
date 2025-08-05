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
-- Calculate sales, transactions by month
SELECT SUBSTR(Transaction_date, 1, 7) AS Month, 
       SUM(Total_spent) AS Sales,
       COUNT(DISTINCT Transaction_id) AS Transactions
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
ORDER BY 2 DESC;
-- Calculate quantity sold of each category to identify high-volume categories
SELECT Category, 
       SUM(Quantity) AS Total_quantity,
       COUNT(DISTINCT Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Category
ORDER BY 2 DESC; 
-- Identify top 5 items by sales
SELECT Item, SUM(Total_spent) AS Sales
FROM retail_store_sales_cleaned_v1
GROUP BY Item
ORDER BY 2 DESC;

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
ORDER BY 1;
