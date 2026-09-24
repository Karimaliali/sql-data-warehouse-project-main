CREATE OR ALTER PROCEDURE silver.load_silver AS 
BEGIN
PRINT '============================================';
PRINT 'Loading Silver Layer';
PRINT '============================================';
-- 1. clean & Load CRM Cust Info
TRUNCATE TABLE silver.crm_cust_info;
INSERT INTO silver.crm_cust_info (
cst_id,cst_key, cst_firstname, cst_lastname, cst_marital, cst_gndr,cst_create_date)

SELECT 
	cst_id,
	cst_key,
	TRIM(cst_firstname) AS cst_firstname,
	TRIM(cst_lastname) AS cst_lastname,
	CASE
		WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'Single'
		WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'Married'
		ELSE 'n/a'
	END AS cst_marital_status,
	CASE
		WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'Female'
		WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'Male'
		ELSE 'n/a'
	END AS cst_gndr,
	cst_create_date
FROM (
SELECT *,
	ROW_NUMBER()OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
	FROM bronze.crm_cust_info
	WHERE cst_id IS NOT NULL)
	t WHERE flag_last = 1;
-- 2 . clean & load CRM P roduct Info 

	END;
	GO 
	EXEC silver.load_silver;