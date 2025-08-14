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
-- Identify high-demand categories for promotion focus during peak periods 
SELECT SUBSTR(Transaction_date, 6, 2) AS Month, 
       Category, 
       COUNT(Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY SUBSTR(Transaction_date, 6, 2), Category
ORDER BY 1, 3 DESC;

-- 3. Product category analysis
-- Identify high-value and high-volume categories
-- Calculate sales and avg spend of each category (high-value)
SELECT Category, 
       SUM(Total_spent) AS Sales, 
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend_per_transaction
FROM retail_store_sales_cleaned_v1
GROUP BY Category
ORDER BY 2 DESC;
-- Calculate quantity sold and transactions of each category (high-volume)
SELECT Category, 
       SUM(Quantity) AS Total_quantity,
       COUNT(DISTINCT Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Category
ORDER BY 2 DESC; 
-- 4. Product analysis
-- Identify top 5 items by sales
SELECT Item, SUM(Total_spent) AS Sales
FROM retail_store_sales_cleaned_v1
GROUP BY Item
ORDER BY 2 DESC;
-- Calculate number of transactions of these items online and offline
SELECT Item, 
       Location, 
       COUNT(Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
WHERE Item = "Item_25_FUR" OR Item = "Item_25_EHE" OR Item = "Item_25_BUT" OR Item = "Item_24_FUR" OR Item = "Item_25_FOOD"
GROUP BY Item, Location
ORDER BY 1;

-- 5. Location analysis
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
-- Tech products to prioritize for online optimization
SELECT Item, Location, COUNT(Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
WHERE Category = "Electric household essentials" OR Category = "Computers and electric accessories"
GROUP BY Item, Location
ORDER BY 1,2;
-- Identify furniture pieces with high in-store transactions
SELECT Item, Location, COUNT(Transaction_id) AS Transactions
FROM retail_store_sales_cleaned_v1
WHERE Category = "Furniture" 
GROUP BY Item, Location
ORDER BY 1,2;

-- 6. Customer behavior analysis
-- Calculate the number of transactions and customer spending per customer
SELECT Customer_id, 
       COUNT(Transaction_id) AS Transactions, 
       SUM(Total_spent) AS Customer_spending
FROM retail_store_sales_cleaned_v1
GROUP BY Customer_id
ORDER BY 1;
