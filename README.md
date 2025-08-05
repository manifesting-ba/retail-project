# RETAIL SALES ANALYSIS PROJECT
## 🎯 Objective
This project aims to **analyze sales trends, evaluate product category performance**, and **understand customer purchasing behavior**. The insights will **support** data-driven decisions in **marketing strategy** and **inventory management**.
## 📊 Executive Summary
#### ✒ Key Observations:
- **Seasonal Trends**: Peaks in **mid-year** and **Q4**; sharp **drops post-holiday** season.
- **Category Performance**:
  - **Butchers**, **Electric Household Essentials**, and **Furniture** are **high performers** in all metrics.
  - **Patisserie** underperforms.
  - **Milk Products** have high volume and transactions but lowest sales.
- **Channel Preferences**:
  - Online and offline usage is **balanced overall**, with **category-specific variations**.
  - However, customers **slightly lean towards online** channels.
- **Positive correlation** between number of transactions and customer spending.

#### 💡 Recommendations Preview:
- **Leverage seasonal peaks** with targeted promotions.
- **Prioritize investment** in **top-performing** categories and products.
- Consider **re-pricing** or **bundling low-performing** categories.
- **Strengthen online strategy** for tech products and essentials and **enhance in-store experience** for furniture.
- Encourage **more frequent purchases** through loyalty programs, rewards, or personalized offers.

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
## 🔧 Tools used
- SQL for data cleaning and exploration
- Tableau for visualization
## 🧹 Data cleaning 
The data cleaning process was performed using SQL, and the full set of queries can be found in [data_cleaning.sql](data_cleaning.sql) . 

Key steps include:
- Standardization
- Duplicates removal
- Missing value handling

The total row count after cleaning is 11,971 rows
## 🔎 Exploratory data analysis
The SQL queries used for exploratory data analysis are available at the following files:
- [EDA_main.sql](EDA_main.sql) - This file includes **only** the SQL queries that **directly support** the findings and visualizations presented in the final report.
- [EDA_full_exploration.sql](EDA_full_exploration.sql) - This file contains the **complete** set of SQL queries executed during the EDA phase. It reflects the full analytical exploration undertaken to understand the dataset from multiple angles.

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

### 🛒 Category Performance Analysis:

<img width="1287" height="626" alt="Total spent by Product Category (1)" src="https://github.com/user-attachments/assets/977591fe-4654-47cb-871d-e8a0e3619ec0" />

<img width="1287" height="626" alt="Total quantity by category" src="https://github.com/user-attachments/assets/a2a53463-c775-4156-bdba-8284cad924e4" />

✒ **Observations**:
- **Butchers** and **Electric Household Essentials** stand out as **value-driven high performers**, excelling in **sales, transactions, and average spend**.
- **Furniture** exhibits solid sales with highest transactions, quantity sold and moderate average spend, suggesting it is a **volume-driven** category.
- **Food** and **Beverages** also show **high total quantities** and solid sales, suggesting they are **staple categories with decent performance**.
- **Patisserie** underperforms across most key metrics (sales, transactions, quantity) despite medium average spend, indicating a need for **pricing or promotional review**.
- **Milk Products** has relatively **high total quantity and transaction volume** but **lowest average spend** ($119.00), suggesting it's a **frequently purchased, low-margin staple**.

💡 **Recommendations**:
- **Invest in High-performing categories** (Butchers and Electric Essentials):
  - Focus promotions and advertising on these categories to maintain momentum and further boost sales.
  - Introduce premium product lines to serve evolving customer needs and capture greater value.
- **Boost Volume-Driven Sales with Bundles and Bulk Incentives** (Furniture and Food):
  - Offer bulk discounts or bundled deals to encourage larger purchases, improve inventory turnover, and drive profitability on frequently purchased items.
  - Example: Bundle a sofa with a coffee table, or offer family meal deals including bulk food items.
- **Reassess Pricing & Promotions for Underperforming category** (Patisserie):
  - Consider new marketing campaigns, pricing adjustments, or bundling with related products to enhance competitiveness and performance.
- **Bundle Low-profit category** (Milk):
  - Pair milk products with complementary goods such as cereals, cookies, or oats to encourage bundled purchases and lift average transaction values.

<img width="1287" height="315" alt="Item Performance Breakdown_ High vs  Low Performers (1)" src="https://github.com/user-attachments/assets/b2dd917d-ace9-40de-a8b8-6b7da06233e1" />

💡 **Recommendations**:
- **Prioritize promotion** of these products.
- **Deep-Dive into Profitability**: While these items lead in sales, analyze their profit margins to ensure they also contribute to net profit—not just revenue.

### 📱 Location Analysis:

<img width="494" height="662" alt="Feuille 16 (1)" src="https://github.com/user-attachments/assets/c33c233c-3e22-4d6f-bba0-b21e5015c9b6" />

✒ **Observations**:
- **Relatively Balanced Distribution**: Transaction volumes are fairly balanced between online and in-store channels.
- **A Slight Preference for Online Shopping**: Online transactions (6,068) modestly exceed in-store (5,903).

 <img width="1263" height="669" alt="Online vs In-Store Transactions by Product Category (2)" src="https://github.com/user-attachments/assets/33dfce41-283e-485c-8313-58db73b01d21" />


- **Tech Categories Skew Heavily Online**: Computers & Electric Accessories and Electric Household Essentials show considerably higher transaction volumes online compared to in-store, indicating **consumer preference for buying tech products digitally**. 
- **Furniture Leads In-store Purchases**: This is likely due to customers preferring to see or test items physically.
- **Balanced Channels for Food and Patisserie**: These categories show a relatively even split between online and offline, suggesting **flexibility** in customer buying behavior.
- **Daily Essentials Lean Online**: Milk products, beverages, and butchers see slightly more tractions online.

💡 **Recommendations**:
- **Enhance Online Strategy for Tech Categories**:
  - Provide more detailed product content, fast delivery, and competitive pricing to optimize online shopping experience.
  - Reduce in-store inventory footprint for these categories to lower overheads.
- **Improve In-Store Experience for Furniture**:
  - Invest in attractive store displays and trial zones
  - Provide in-store-only services (eg: personalized consultation)
- **Maintain Omnichannel Presence for Balanced Categories**:
  - Ensure consistent pricing and promotions online and offline.
  - Offer flexible delivery, pickup options.
- **Support Online Growth for Daily Essentials**:
  - Optimize logistics for fast, fresh delivery
  
### 👩Customer Behavior Analysis

<img width="1314" height="603" alt="Correlation between Customer Spending and Number of Transactions (2)" src="https://github.com/user-attachments/assets/a3112b5f-ed60-4f8d-ad94-8f42c262d27c" />

✒ **Observations**:
- There is a clear **positive linear relationship** between the number of transactions and customer spending.
- Most customers fall within a narrow transaction range (440–520 transactions), suggesting **consistent shopping behavior**.

💡 **Recommendations**:
- **Encouraging more purchases** (e.g., via loyalty programs, rewards, or tailored offers) can drive revenue growth.
