-- Disable SQL strict mode before importing table to allow blanks
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
-- DATA CLEANING
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
-- Rename columns
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
-- Check the format of all columns and look for blanks
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

SELECT DISTINCT Quantity  -- include 0
FROM retail_store_sales_cleaned_v1
ORDER BY 1;

SELECT DISTINCT Total_spent  -- include 0
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

SELECT DISTINCT Discount_applied  -- contain missing information
FROM retail_store_sales_cleaned_v1
ORDER BY 1;
-- Columns need filling: item, price per unit, quantity, total spent, location(if possible), discount (if possible)
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
-- Price per unit column
UPDATE retail_store_sales_cleaned_v1
SET Price_per_unit = Total_spent/Quantity;

SELECT *
FROM retail_store_sales_cleaned_v1
WHERE Price_per_unit IS NULL; -- both quantity and total spent are missing - may consider deleting
-- Quantity column
SELECT *
FROM retail_store_sales_cleaned_v1
WHERE Quantity = 0 AND Price_per_unit IS NOT NULL; -- no new rows found besides the rows above
-- Total spent column
SELECT *
FROM retail_store_sales_cleaned_v1
WHERE Total_spent = 0 AND Price_per_unit IS NOT NULL; -- no new rows found
-- Delete price per unit rows that can't be retrieved
DELETE FROM retail_store_sales_cleaned_v1
WHERE Price_per_unit IS NULL AND Quantity = 0 AND Total_spent = 0; 
-- 604 rows are deleted

-- Fill item column
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

