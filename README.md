# RETAIL SALES ANALYSIS PROJECT
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

✒ **Observations**:
- **Sales Recovery**: After a slight dip in 2023, total sales bounced back in 2024, reaching $524,881, increasing by 6.8% from 2023 to 2024.
- **Rising Customer Activity**: Transactions and quantity sold also peaked in 2024, signaling enhanced customer engagement.
- **Stable Customer Spend**: Average spend per transaction remained stable, hovering around $130 — this suggests growth came from increased volume and purchase frequency.

📍 **Insight**: The data reveals a slight dip in 2023 followed by a **clear rebound** in 2024. Sales, transactions, and quantity sold all increased, suggesting a **potential recovery phase** — possibly due to post-pandemic normalization or improved consumer demand. However, additional context is needed to confirm causality.

<img width="1290" height="603" alt="Spending and Transaction Patterns over time (2)" src="https://github.com/user-attachments/assets/5566c9b7-7c75-4e1d-8f60-92a628c85590" />

✒ **Observations**:
- **Clear Seasonality**: Spending and transactions exhibit clear seasonal trends, with noticeable **peaks in late Q4** (Nov-Dec) and **around mid-year** — likely aligned with holiday shopping and summer events.
- **Post-peak Declines**: A **sharp drop follows each peak season**, especially at the **start of the year** (Jan-Feb), indicating a slowdown in consumer activity.
💡 **Recommendations**:
- **Capitalize on Peak Seasons**:
    - Launch **major promotions, product launches**, and **marketing campaigns** in late Q4 and summer months.
    - **Scale up inventory** ahead of seasonal peaks to meet demand.
    - **Increase staffing, bolster customer support**, and scale up **logistics operations** during high-demand periods to maintain service quality.
- **Counteract Post-Holiday Declines**:
    - Deploy **loyalty perks** or **"new year" sales** in January–February to sustain revenue.
    - **Adjust supply levels** in off-seasons to minimize holding costs and unsold stock.

### Category Performance Analysis:

<img width="1287" height="626" alt="Total spent by Product Category" src="https://github.com/user-attachments/assets/3bc9ef80-4a04-4b37-a8b0-24aa1c03761d" />
<img width="1287" height="626" alt="Total quantity by category" src="https://github.com/user-attachments/assets/a2a53463-c775-4156-bdba-8284cad924e4" />

✒ **Observations**:
- **Butchers** and **Electric Household Essentials** stand out as **value-driven high performers**, excelling in **sales, transactions, and average spend**.
- **Furniture** shows high sales, transactions, and quantity sold with moderate average spend, suggesting it is a **volume-driven** category.
- **Food** and **Beverages** also show **high total quantities** and solid sales, suggesting they are **staple categories with steady performance**.
- **Patisserie** underperforms across most key metrics (sales, transactions, quantity) despite medium average spend, indicating a need for **pricing or promotional review**.
- **Milk Products** has relatively **high total quantity and transaction volume** but **lowest average spend** ($119.00), suggesting it's a **frequently purchased, low-margin staple**.

💡**Recommendations**:
- **Invest in High-performing categories** (Butchers and Electric Essentials):
  - Focus promotions and advertising on these categories to maintain momentum and further boost sales
  - Introduce higher-end products to these categories to serve evolving customer needs and capture greater value
- **Boost Volume-Driven Sales with Bundles and Bulk Incentives** (Furniture and Food):
  - Offer bulk purchase discounts or bundled promotions to encourage larger purchases, improve inventory turnover, and drive profitability on frequently purchased items
  - Eg: Offer package deals (e.g., table + chairs, bed frame + mattress) to increase transaction size.
- **Reassess Pricing for Underperforming category** (Patisserie):
  - Consider new marketing campaigns, pricing adjustments, or bundling with related products to enhance competitiveness and performance
- **Bundle Low-profit category** (Milk):
  - Pair milk products with complementary goods such as cereals or cookies to increase basket size and profitability.
