# Retail-Orders-Data-Analysis

This project involves cleaning and analyzing a dataset of retail orders using Python and SQL. The dataset is sourced from Kaggle and contains information about orders, including order details, shipping modes, customer segments, locations, product categories, and financial metrics.

## Dataset

The dataset can be found on Kaggle: [Retail Orders Dataset](https://www.kaggle.com/datasets/ankitbansal06/retail-orders)

### Columns and Descriptions

| Column Name   | Description                                           | Data Type  |
|---------------|-------------------------------------------------------|------------|
| order_id      | Unique identifier for each order                      | Integer    |
| order_date    | The date on which the order was placed                | Date       |
| ship_mode     | The mode of shipping used for the order               | String     |
| segment       | The market segment to which the customer belongs      | String     |
| country       | The country where the order was placed                | String     |
| city          | The city where the order was placed                   | String     |
| state         | The state where the order was placed                  | String     |
| postal_code   | The postal code of the location where the order was placed | Integer    |
| region        | The region where the order was placed                 | String     |
| category      | The category of the product ordered                   | String     |
| sub_category  | The sub-category of the product ordered               | String     |
| product_id    | Unique identifier for each product                    | String     |
| quantity      | The quantity of the product ordered                   | Integer    |
| discount      | The discount applied to the order (in monetary terms) | Float      |
| sales_price   | The sales price of the order                          | Float      |
| profit        | The profit earned from the order                      | Float      |

## Data Cleaning with Python

We used Python for the following purposes:
1. **Loading the Dataset**: Read the dataset from a CSV file.
2. **Handling Null Values**: Convert specific values to null.
3. **Fixing Column Names**: Standardize column names by converting to lowercase and replacing spaces with underscores.
4. **Creating Additional Columns**: Calculate discount, sales price, and profit.
5. **Changing Data Types**: Convert the order_date column to datetime format.
6. **Dropping Unwanted Columns**: Remove columns that are not needed for analysis.


## Data Analysis with SQL

I used SQL to answer the following business questions:

1. Top 10 highest revenue-generating products.
2. Top 5 highest selling products in each region.
3. Month over month growth comparison for 2022 and 2023 sales.
4. For each category, which month had the highest sales?
5. Which sub-category had the highest growth by profit in 2023 compared to 2022?

## Summary
This project demonstrates how to clean and analyze a retail orders dataset using Python and SQL. The Python code handles data cleaning and transformation, while the SQL code performs various analytical queries to gain insights into sales performance, product popularity, and growth trends.
