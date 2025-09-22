### 🛒 Zepto SQL Project

# This project contains SQL queries for analyzing product, pricing, and inventory data from a Zepto dataset. It demonstrates data exploration, cleaning, and business insights using SQL.

# 📂 Database Schema
<img width="376" height="319" alt="Screenshot 2025-09-22 100557" src="https://github.com/user-attachments/assets/47e02372-2ed6-47a1-95f1-113c3f7f3414" />


# 🔎 Project Workflow
1. Data Exploration

  - View all product data (SELECT * FROM Zepto).
  - Count total rows in the dataset.
  - Check for null values across key fields.
  - Compare stock available vs. unavailable.
  - Detect duplicate product names.

2. Data Cleaning

  - Identify and remove products with invalid mrp = 0.
  - Convert prices from paise to rupees.

3. Business Insights

  - Top 10 best-value products based on discount percent.
  - High MRP products that are out of stock.
  - Estimated revenue per category based on selling price and stock.
  - Products with MRP > 500 and discount < 10%.
  - Top 5 categories with highest average discount.
  - Price per gram for products above 100g.
  - Categorize products into Low, Medium, Bulk weight categories.
  - Total inventory weight per category.

# 📊 Key Learnings

  - ****Data Quality Checks**:** Detect missing values, duplicates, and invalid pricing.

  - ****Data Cleaning**:** Standardize values and correct unit discrepancies.

  - ****Business Analytics with SQL**:** Discounts, inventory, and revenue analysis.

  - ****Advanced SQL**:** Use of CASE, aggregations, grouping, and ordering to drive insights.

# 🛠️ Tech Stack

  - Database: PostgreSQL / MySQL

  - SQL Concepts Used:

  - Data exploration & validation

  - Data cleaning (updates, deletes)

  - Aggregates (SUM, AVG, COUNT)

  - Conditional logic (CASE)

  - Sorting & grouping
