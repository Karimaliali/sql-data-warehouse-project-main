CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
PRINT '================================================';
PRINT 'loading bronze layer';
PRINT '================================================';
-- Bulk Insert CRM Cust Info 

TRUNCATE TABLE bronze.crm_cust_info;
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\LORD LAPTOP\Desktop\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
WITH (
FIRSTROW= 2,
FIELDTERMINATOR = ',',
TABLOCK
);




-- Bulk Insert prd Info

TRUNCATE TABLE bronze.crm_prd_Info;
BULK INSERT bronze.crm_prd_Info
FROM 'C:\Users\LORD LAPTOP\Desktop\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
WITH (
FIRSTROW= 2,
FIELDTERMINATOR = ',',
TABLOCK
);






-- Bulk Insert CRM Sales details 

TRUNCATE TABLE bronze.crm_sales_details;
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\LORD LAPTOP\Desktop\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
WITH (
FIRSTROW= 2,
FIELDTERMINATOR = ',',
TABLOCK
);

-- Bulk Insert ERB Cust AZ12 

TRUNCATE TABLE bronze.erp_cust_az12;
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\LORD LAPTOP\Desktop\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
WITH (
FIRSTROW= 2,
FIELDTERMINATOR = ',',
TABLOCK
);


-- Bulk Insert ERB LOC A101 

TRUNCATE TABLE bronze.erp_loc_a101;
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\LORD LAPTOP\Desktop\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
WITH (
FIRSTROW= 2,
FIELDTERMINATOR = ',',
TABLOCK
);


-- Bulk Insert ERB PX CAT G1V2 

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\LORD LAPTOP\Desktop\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
FIRSTROW= 2,
FIELDTERMINATOR = ',',
TABLOCK
);

END;
GO 
EXEC bronze.load_bronze;