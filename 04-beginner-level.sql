USE SalesAnalyticsDB;
GO

--1. Total Sales by Region + Grand Total
--Using ROLLUP , calculate total sales for each region .
--Your result should contain:
--Region TotalSales
------------- ----------
--  North ...
--  South ...
--  East ...
--  West ...
--  NULL Grand Total
--Requirement: Use ROLLUP .

SELECT
    CASE
        WHEN GROUPING(r.region) = 1 THEN 'Grand Total'
        ELSE r.region
    END AS Region,
    SUM(s.amount) AS TotalSales
FROM Sales s
    JOIN Regions r ON s.region_id = r.region_id
GROUP BY
    ROLLUP (r.Region);

-- 2. Sales by Region and Category
-- Using ROLLUP , calculate total sales for each:
--     Region
--     └── Category
-- Your result should show:
--     Sales for each region/category combination
--     Regional subtotal
--     Grand total
-- Example structure:
--     North Electronics ...
--     North Furniture ...
--     North NULL ← North subtotal
--     South Electronics ...
--     South Furniture ...
--     South NULL ← South subtotal
--     NULL NULL ← Grand total

SELECT
    CASE
        WHEN GROUPING(r.region) = 1 THEN 'Grand Total'
        ELSE r.region
    END AS Region,
    CASE
        WHEN GROUPING(r.region) = 1 THEN 'Grand Total'
        WHEN GROUPING(c.category) = 1 THEN r.region + ' Sub Total'
        ELSE c.category
    END AS Category,
    SUM(s.amount) AS TotalSales
FROM
    Sales AS s
    JOIN Regions AS r ON s.region_id = r.region_id
    JOIN Products AS p ON s.product_id = p.product_id
    JOIN Categories AS c ON p.category_id = c.category_id
GROUP BY
    ROLLUP (r.region, c.category);