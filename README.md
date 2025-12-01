**Sales ETL & Data Warehouse Project**

**This project demonstrates an end-to-end ETL (Extract–Transform–Load) pipeline built using:**

Python (Pandas)

MySQL as the Data Warehouse

SQL for analytics

The project loads raw sales data, transforms it into a star-schema format, and performs analytical queries.

**Project Workflow**
1. Extract

     Source CSV files:

     customers.csv

     products.csv

     orders.csv

     Loaded using pandas.read_csv().

2. Transform

     Key transformations performed:

     Cleaned missing values

     Standardized column names

     Converted date to date_key format (YYYYMMDD)

     Calculated total_amount = quantity × unit_price

     Created dim_customer, dim_product, dim_date

     Created fact_sales with foreign keys

     Removed duplicates

     Validated data types and row counts

3. Load

     Data was loaded into MySQL using:

     pymysql.connect(...)
     cursor.execute(...)


     Load order:

     dim_customer

     dim_product

     dim_date

     fact_sales

     Ensures referential integrity.

**SQL Analytics**

20+ analytical queries were created to analyze:

Total revenue

Customer lifetime value

Product performance

Category trends

Monthly revenue

Peak sales day

City-level revenue

All queries are included in:

sql/analysis_queries.sql

 **Tech Stack**

   Python

   Pandas

   MySQL

   Jupyter Notebook

   SQL

**How to Run**

Clone repository

Import CSV files from /data

Run create_tables.sql in MySQL

Execute ETL notebooks or Python scripts

Run queries from /sql/analysis_queries.sql

**Results**

After building the pipeline, the data warehouse enables:

Fast analytical queries

Clean dimensional structure

Reusable ETL scripts

Zero manual intervention after setup
