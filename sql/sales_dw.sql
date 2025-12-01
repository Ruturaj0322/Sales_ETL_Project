use sales_dw;

SELECT SUM(total_amount) AS total_revenue
FROM fact_sales;

SELECT 
    p.category,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

SELECT 
    d.year,
    d.month_name,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;

SELECT 
    p.product_name,
    SUM(f.quantity) AS total_units_sold
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 10;

SELECT 
    c.customer_name,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

SELECT 
    c.city,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.city
ORDER BY revenue DESC;

SELECT 
    p.category,
    AVG(f.total_amount) AS avg_order_value
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_order_value DESC;

SELECT 
    d.date,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.date
ORDER BY d.date;

SELECT 
    d.year,
    d.month,
    d.month_name,
    SUM(f.total_amount) AS revenue
FROM fact_sales f
JOIN dim_date d ON f.order_date_key = d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;

SELECT 
    c.customer_name,
    COUNT(DISTINCT f.order_id) AS total_orders
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;