# RETAIL SALES ANALYSIS SQL PROJECT
## 🎯 Objective
The objective of this project is to explore sales trends, assess product category performance, and understand customer purchasing behavior. The insights derived from this analysis aim to support data-driven decision-making for marketing strategies and inventory management.
## 📁 Dataset Overview
- **Source**: [Kaggle - Retail sales dataset](retail_store_sales.csv)
- **License**: CC BY-SA 4.0 License
- **Time range**: January 2022 - January 2025
- **Size**: 12,575 rows x 11 columns
- **Key features**:
  - Transaction ID, Customer ID
  - Category, Item, Price Per Unit
  - Quantity, Total Spent
  - Payment Method, Location, Transaction Date, Discount Applied
### ⚠ Caveats:
- Partial Month (January 2025):
  - Data for January 2025 is incomplete and may distort trends or monthly comparisons. It should be excluded from time-based analysis unless specifically accounted for.
- Synthetic Data:
  - The dataset is artificially generated for analysis purposes. While it mimics real-world structures and distributions, it may not fully reflect actual customer behavior, seasonality, or market dynamics.
## 🧹 Data cleaning 
The data cleaning process was performed using SQL, and the full set of queries can be found in [data_cleaning.sql](data_cleaning.sql) . 
Key steps included:
- Standardization
- Duplicates removal
- Missing value handling
The total row count after cleaning is 11,971 rows
## 🔎 Exploratory data analysis
The SQL queries used for exploratory data analysis are available at
### ⌛ Time series analysis

<img width="1289" height="603" alt="Spending and Transaction Patterns over time (1)" src="https://github.com/user-attachments/assets/79212d95-0488-4301-8a2f-1768eecc60e0" />
