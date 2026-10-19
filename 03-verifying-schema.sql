USE SalesAnalyticsDB;
GO

-- =============================================
-- 1. Verify table existence and record counts
-- Expected:
-- Regions      = 40
-- Categories   = 40
-- Products     = 40
-- Salespeople  = 40
-- Sales        = 120
-- =============================================

SELECT
    table_name,
    actual_records,
    expected_records,
    CASE
        WHEN actual_records = expected_records THEN 'PASS'
        ELSE 'FAIL'
    END AS verification_status
FROM (
        SELECT
            'Regions' AS table_name, COUNT(*) AS actual_records, 40 AS expected_records
        FROM dbo.Regions
        UNION ALL
        SELECT 'Categories', COUNT(*), 40
        FROM dbo.Categories
        UNION ALL
        SELECT 'Products', COUNT(*), 40
        FROM dbo.Products
        UNION ALL
        SELECT 'Salespeople', COUNT(*), 40
        FROM dbo.Salespeople
        UNION ALL
        SELECT 'Sales', COUNT(*), 120
        FROM dbo.Sales
    ) AS verification
ORDER BY table_name;
GO