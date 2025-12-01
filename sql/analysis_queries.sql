use sales_dw;
-- 1. Total Revenue
SELECT SUM(total_amount) AS total_revenue FROM fact_sales;

-- 2. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM fact_sales;

-- 3. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM fact_sales;

-- 4. Revenue by Category
SELECT p.category, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- 5. Top 10 Best-Selling Products
SELECT p.product_name, SUM(f.quantity) AS units_sold
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units_sold DESC
LIMIT 10;

-- 6. Top 5 Highest Revenue Products
SELECT p.product_name, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- 7. Customer Lifetime Value (LTV)
SELECT c.customer_name, SUM(f.total_amount) AS lifetime_value
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id,c.customer_name
ORDER BY lifetime_value DESC;

-- 8. Total Orders Per Customer
SELECT c.customer_name, COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- 9. Revenue by City
SELECT c.city, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

-- 10. Monthly Revenue
SELECT d.year, d.month_name, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;

-- 11. Quarterly Revenue
SELECT d.year, d.quarter, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.year, d.quarter
ORDER BY d.year, d.quarter;

-- 12. Daily Revenue Trend
SELECT d.date, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.date
ORDER BY d.date;

-- 13. Average Order Value (AOV)
SELECT AVG(total_amount) AS avg_order_value FROM fact_sales;

-- 14. Category-wise Average Order Value
SELECT p.category, AVG(f.total_amount) AS avg_order_value
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_order_value DESC;

-- 15. Most Popular Category per Month
SELECT d.year, d.month_name, p.category, SUM(f.quantity) AS units_sold
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY d.year, d.month, p.category
ORDER BY d.year, d.month;

-- 16. Check for Nulls in Fact Table
SELECT *FROM fact_sales
WHERE customer_id IS NULL OR product_id IS NULL OR order_date_key IS NULL;

-- 17. Count Duplicate Orders
SELECT order_id, COUNT(*) AS cnt
FROM fact_sales
GROUP BY order_id
HAVING cnt > 1;

-- 18. Product Price Verification
SELECT product_id, product_name, price
FROM dim_product
ORDER BY price DESC;

-- 19. Overall Sales Summary
SELECT SUM(total_amount) AS revenue, COUNT(DISTINCT order_id) AS total_orders, COUNT(DISTINCT customer_id) AS total_customers,
SUM(quantity) AS total_units
FROM fact_sales;

-- 20. Peak Sales Day
SELECT d.date, SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.date
ORDER BY revenue DESC
LIMIT 1;
