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

<img width="987" height="180" alt="Feuille 15" src="https://github.com/user-attachments/assets/7c5f8bcb-9289-41bd-8b73-c84b3875d24e" />

- **Observations**:
  - **Sales Recovery**: After a slight dip in 2023, total sales bounced back in 2024, reaching $524,881, increasing by 6.8% from 2023 to 2024.
  - **Rising Customer Activity**: Transactions and quantity sold also peaked in 2024, signaling enhanced customer engagement.
  - **Stable Customer Spend**: Average spend per transaction remained stable, hovering around $130 — this suggests growth came from increased volume and purchase frequency.
- **Insight**: The data reveals a slight dip in 2023 followed by a **clear rebound** in 2024. Sales, transactions, and quantity sold all increased, suggesting a **potential recovery phase** — possibly due to post-pandemic normalization or improved consumer demand. However, additional context is needed to confirm causality.

<img width="1290" height="603" alt="Spending and Transaction Patterns over time (2)" src="https://github.com/user-attachments/assets/5566c9b7-7c75-4e1d-8f60-92a628c85590" />
