# RETAIL SALES ANALYSIS PROJECT
## 🎯 Objective
This project aims to **analyze sales trends, evaluate product category performance**, and **understand customer purchasing behavior**. The insights will **support** data-driven decisions in **marketing strategy** and **inventory management**.
## 📊 Executive Summary
#### Key Observations:
- **Seasonal Trends**: Peaks in **mid-year** and **Q4**; sharp **drops post-holiday** season.
- **Category Performance**:
  - **Butchers**, **Electric Household Essentials**, and **Furniture** are **high performers** in all metrics.
  - **Patisserie** underperforms.
  - **Milk Products** have high volume and transactions but lowest sales.
- **Channel Preferences**:
  - Online and offline usage is **balanced overall**, with **category-specific variations**.
  - However, customers **slightly lean towards online** channels.
- **Positive correlation** between number of transactions and customer spending.

#### Recommendations Preview:
- **Leverage seasonal peaks** with promotions and marketing campaigns.
- **Prioritize investment** in **top-performing** categories and products.
- Consider **re-pricing** or **bundling low-performing** categories.
- **Strengthen online strategy** for tech products and essentials and **enhance in-store experience** for furniture.
- Encourage **more frequent purchases** through loyalty programs, rewards, or personalized offers.

## 📁 Dataset Overview
- **Source**: [Kaggle - Retail sales dataset](https://www.kaggle.com/datasets/ahmedmohamed2003/retail-store-sales-dirty-for-data-cleaning)
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
## 🔧 Tools Used
- SQL for data cleaning and exploration
- Tableau for visualization
## 🧹 Data Cleaning 
The data cleaning process was performed using SQL, and the full set of queries can be found in [data_cleaning.sql](data_cleaning.sql) . 

Key steps include:
- Standardization
- Duplicates removal
- Missing value handling

The total row count after cleaning is 11,971 rows
## 🔎 Exploratory Data Analysis
The SQL queries used for exploratory data analysis are available at the following files:
- [EDA_main.sql](EDA_main.sql) - This file includes **only** the SQL queries that **directly support** the findings and visualizations presented in the project.
- [EDA_full_exploration.sql](EDA_full_exploration.sql) - This file contains the **complete** set of SQL queries executed during the EDA phase. It reflects the full analytical exploration undertaken to understand the dataset from multiple angles.

### ⌛ Time Series Analysis

<img width="987" height="203" alt="Feuille 15 (2)" src="https://github.com/user-attachments/assets/f5dce520-5eb3-4e23-89b9-a96003024e48" />

✒ **Observations**:
- **Sales Recovery**: After a slight dip in 2023, total sales bounced back in 2024, reaching $524,881, increasing by 6.8% from 2023 to 2024.
- **Rising Customer Activity**: Transactions and quantity sold also peaked in 2024, signaling enhanced customer engagement.
- **Stable Customer Spend**: Average spend per transaction remained stable, hovering around $130 — this suggests growth came from increased volume and purchase frequency.

📍 **Insight**: The data reveals a slight dip in 2023 followed by a **clear rebound** in 2024. Sales, transactions, and quantity sold all increased, suggesting a **potential recovery phase** — possibly due to post-pandemic normalization or improved consumer demand. However, additional context is needed to confirm causality.

<img width="1290" height="626" alt="Spending and Transaction Patterns over time (3)" src="https://github.com/user-attachments/assets/dad5b580-c495-40aa-a3c8-84f844032b76" />

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

<img width="1287" height="626" alt="Total spent by Product Category" src="https://github.com/user-attachments/assets/aa1e3b96-ce8c-4f10-8d6c-b04af79e9ada" />
<img width="1287" height="626" alt="Total quantity by category (1)" src="https://github.com/user-attachments/assets/2e0f9b9c-0f06-4c2a-b91a-5c8fc1de3bd8" />

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
  - Offer bulk discounts or bundled deals to encourage larger purchases, improve inventory turnover, and drive profitability repeated purchases.
- **Reassess Pricing & Promotions for Underperforming category** (Patisserie):
  - Consider new marketing campaigns, pricing adjustments, or bundling with related products to enhance competitiveness and performance.
- **Bundle Low-profit category** (Milk):
  - Pair milk products with complementary goods such as cereals, cookies, or oats to encourage bundled purchases and lift average transaction values.

❕ Detailed bundle recommendations and promotions will be presented in the Product Analysis section.

### 🛍 Product Analysis

<img width="1287" height="315" alt="Item Performance Breakdown_ High vs  Low Performers (1)" src="https://github.com/user-attachments/assets/b2dd917d-ace9-40de-a8b8-6b7da06233e1" />

✒ **Observations**:
- With top sales performance, Item 25_FUR, 25_EHE, 25_BUT, 24_FUR, and 25_FOOD should be prioritized for targeted **marketing and promotional efforts to maximize growth**.

<img width="1289" height="467" alt="Feuille 21 (1)" src="https://github.com/user-attachments/assets/18332c2a-bb63-4272-890e-1e2042c5bbba" />

💡 **Recommendations**:
-  **Strengthen & Leverage Offline Presence for In-store Leaders** (Item 24_FUR, 25_FUR, 25_EHE):
   - Upgrade showroom displays for Furniture products.
   - Create an interactive demo zone for Item_25_EHE — let customers test the appliance before buying.
   - Place these items near checkout or in high-traffic areas.
   - Train staff to provide product expertise and cross-selling suggestions.
- **Online Campaigns for Online-Favored Products** (Item 25_BUT, 25_FOOD):
  - Increase paid ads and social media promotions for these items.
  - Offer “online-only” perks such as free delivery, extra loyalty points, or flash sales.
  - Feature these products prominently on the homepage and in email campaigns.
- **Deep-Dive into Profitability**:
  - While these items lead in sales, it's crucial that we analyze their profit margins to ensure they also contribute to net profit—not just revenue.

<img width="1287" height="626" alt="Item Performance Overview (5)" src="https://github.com/user-attachments/assets/a469030f-76a0-431e-ad75-6d2d36702e45" />

💡 **Recommendations**:
- **Bundle Low Performers with High-Visibility Products**:
  - Pair slow-moving items from the Low Performer quadrant with complementary products from High Performer or Volume Driver categories to increase visibility and sell-through, reducing deadstock risk.
  - Suggested combinations: Item 2 (Sofa) & 3 (Coffee Table); Item 2 (Sofa) & 22 (Corner Shelf); Item 20 (Bean Bag) & 22 (Corner Shelf).
- **Cross-Bundle High Performers with Volume Drivers**:
  - Combine High Performer products with frequently-purchased Volume Drivers to encourage upselling; thus, boosting average order value.
  - Suggested combinations: Item 2 (Sofa) & 25 (Accent Chair); Item 1 (Office Chair) & 8 (Study Table).
  
<img width="1287" height="626" alt="Item Performance Overview (7) (1)" src="https://github.com/user-attachments/assets/1f52dddf-7433-4c22-bc12-041343cee53d" />

💡 **Recommendations**:
- **Pair Niche High-Value with Volume Driver Items**:
  - Use high-demand milk products (Item 1, 3, 4) to cross-sell premium variants (Item 18, 20, 24), helping raise the average basket value without heavy discounting.
- **Bundle Popular Volume Drivers with High-Value Items from Low/High Performers**:
  - Combine high-frequency Volume Drivers (Item 1, 3) with Low or High Performers that have high average spend (Item 25, 21, or 17, 22, 23) to elevate total transaction value while leveraging existing customer traffic.

### 📱 Location Analysis:

<img width="494" height="698" alt="Feuille 16 (1)" src="https://github.com/user-attachments/assets/b44c9f50-2e7d-4151-9774-35a9d32e3825" />

✒ **Observations**:
- **Relatively Balanced Distribution**: Transaction volumes are fairly balanced between online and in-store channels.
- **A Slight Preference for Online Shopping**: Online transactions (6,068) modestly exceed in-store (5,903).

<img width="1263" height="669" alt="Online vs In-Store Transactions by Product Category (2)" src="https://github.com/user-attachments/assets/1d073336-8ac3-4e01-97fb-f8ec40b3ab67" />

- **Tech Categories Skew Heavily Online**: Computers & Electric Accessories and Electric Household Essentials show considerably higher transaction volumes online compared to in-store, indicating **consumer preference for buying tech products digitally**. 
- **Furniture Leads In-store Purchases**: This is likely due to customers preferring to see or test items physically.
- **Balanced Channels for Food and Patisserie**: These categories show a relatively even split between online and offline, suggesting **flexibility** in customer buying behavior.
- **Daily Essentials Lean Online**: Milk products, beverages, and butchers see slightly more tractions online.

 <img width="1289" height="467" alt="Feuille 19 (1)" src="https://github.com/user-attachments/assets/8b50cdfb-c45a-421b-a13a-ede5cae1f335" />

- **Items 5_CEA, 13_EHE, 19_CEA, 20_CEA, and 20_EHE** demonstrate a **strong online presence**, making them ideal candidates for further online-focused promotion and optimization.

<img width="1289" height="407" alt="Feuille 20" src="https://github.com/user-attachments/assets/7e3f7059-099e-48b9-a2ff-7e3eca83a2c3" />

- **Items 8, 15, 24, and 25 in Furniture** show consistently **higher in-store purchases** compared to online, indicating they are well-suited for enhanced showroom displays and in-store promotions.
 
💡 **Recommendations**:
- **Enhance Online Strategy for Tech Categories**:
  - Focus on top-selling online tech products — Item_5_CEA, Item_13_EHE, Item_19_CEA, Item_20_CEA, and Item_20_EHE — by enriching product pages with detailed descriptions, images, and reviews.
  - Offer fast delivery options and competitive pricing to capture and retain online customers for these priority items.
  - Reduce in-store inventory footprint for these categories to lower overheads.
- **Improve In-Store Experience for Furniture**:
  - Prioritize high-performing in-store items — Item_8_FUR, Item_15_FUR, Item_24_FUR, and Item_25_FUR — for prominent showroom displays and engaging trial zones.
  - Introduce exclusive in-store services, such as personalized consultations to strengthen customer engagement.
- **Maintain Omnichannel Presence for Balanced Categories**:
  - Audit pricing weekly to ensure consistent prices online and offline.
  - Align promotion schedules so discounts launch simultaneously across channels.
  - Offer flexible delivery, pickup options.
- **Support Online Growth for Daily Essentials**:
  - Optimize logistics for fast, fresh delivery
  
### 👩 Customer Behavior Analysis

<img width="1287" height="626" alt="Correlation between Customer Spending and Number of Transactions" src="https://github.com/user-attachments/assets/89386006-04af-4a25-b792-808381705e68" />

✒ **Observations**:
- There is a **moderately strong positive correlation** between the number of transactions and customer spending. Customers with both high transaction counts and high average spend per transaction are top contributors to revenue.
- However, the relationship is not perfectly linear since customers with similar transaction counts can have noticeably different spending levels, highlighting the role of other factors like average spend per transaction.

<img width="1335" height="644" alt="Correlation between Customer Spending and Number of Transactions (2)" src="https://github.com/user-attachments/assets/20f9454c-d5fa-4a64-aca8-f125b6cf796b" />

- Key Opportunity Segments:
  - High-Value Customers: (CUST_02, CUST_04, CUST_21, CUST_22, CUST_03, CUST_19)
    - CUST_02, CUST_04, CUST_21, CUST_22 (Orange group): These customers have high average spend per transaction, indicating their willingness to pay, but they don't buy frequently.
    - The same goes for CUST_03 and CUST_19 (Red group): Their averages spend per transaction rank among the highest; however, their total spend is low. This is simply because they don’t buy often enough.
  - Frequent Buyers: (CUST_01, CUST_09, CUST_11)
    - CUST_01, CUST_09: Higher-than-median transactions (485 and 498 respectively) but lowest averages spend per transaction, leading to lower total spending.
    - CUST_11: CUST_11 makes a similar number of transactions as peers (481) but generates $61K total spend — below CUST_10 ($63K) and CUST_23 ($65K) — due to a lower average spend per transaction ($126.26 compared to $131.30 and $134.11).

💡 **Recommendations**:
- **Increase Purchase Frequency for High-Value Customers**: (CUST_02, CUST_04, CUST_21, CUST_22, CUST_03, CUST_19)
  - Offer personalized product recommendations based on past purchases to spark interest.
  - Give bonus points or perks for making a certain number of purchases within a set time frame.
  - Offer flash sales or weekly deals to encourage more visits.
  - Send targeted promos tied to holiday seasons or personal occasions (birthdays, anniversaries).
- **Increase Average Spend per Transaction for Frequent Buyers**: (CUST_01, CUST_09, CUST_11)
  - Train staff (offline) and optimize website prompts (online) to suggest higher-value or complementary items.
  - Offer “spend more, earn more” rewards — e.g., extra loyalty points or cashback for purchases above a set spend threshold.
  - Provide free shipping, gifts, or premium samples only for orders above a certain value.
  - Send personalized offers featuring premium items they haven’t purchased yet.


