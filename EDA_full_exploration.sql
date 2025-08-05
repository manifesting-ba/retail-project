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
-- Identify high-value and high-volume categories
-- Calculate sales, transactions, and avg spend of each category (high-value)
SELECT Category, 
       SUM(Total_spent) AS Sales, 
       COUNT(DISTINCT Transaction_id) AS Transactions, 
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend_per_transaction
FROM retail_store_sales_cleaned_v1
GROUP BY Category
ORDER BY 4 DESC;
-- Calculate quantity sold of each category (high-volume)
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
-- Calculate the number of transactions and customer spending per customer
SELECT Customer_id, 
       COUNT(Transaction_id) AS Transactions, 
       SUM(Total_spent) AS Customer_spending
FROM retail_store_sales_cleaned_v1
GROUP BY Customer_id
ORDER BY 3 DESC;
-- Calculate quantity and average spend per customer
SELECT Customer_id, 
       SUM(Quantity) AS Quantity, 
       ROUND(SUM(Total_spent)/COUNT(DISTINCT Transaction_id),1) AS Avg_spend
FROM retail_store_sales_cleaned_v1
GROUP BY Customer_id
ORDER BY 3 DESC;
-- Evaluate the relationship between weekday and number of transactions to further understand customer behaviors
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
-- there's not much difference in the number of transactions among days of week, indicating no association
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
-- Inspect payment method patterns over time
SELECT Payment_method, 
       SUBSTR(Transaction_date, 1, 7) AS Month, 
       COUNT(Payment_method) AS Transactions
FROM retail_store_sales_cleaned_v1
GROUP BY Payment_method, SUBSTR(Transaction_date, 1, 7)
ORDER BY 1, 3 DESC; 
