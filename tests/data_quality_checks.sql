SELECT customer_key, COUNT(*) 
FROM gold.dim_customers 
GROUP BY customer_key 
HAVING COUNT(*) > 1;

SELECT product_key, COUNT(*) 
FROM gold.dim_products 
GROUP BY product_key 
HAVING COUNT(*) > 1;

SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c ON f.customer_key = c.customer_key
WHERE c.customer_key IS NULL;

SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
WHERE p.product_key IS NULL;