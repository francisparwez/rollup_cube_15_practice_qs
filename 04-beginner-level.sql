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

-- 3. Quantity Sold by Category
-- Using ROLLUP , calculate:
--     Total quantity for each category
--     Grand total quantity
-- Use:
--     SUM(quantity)

SELECT
    CASE
        WHEN GROUPING(c.category) = 1 THEN 'Grand Total'
        ELSE c.category
    END AS Category,
    SUM(s.quantity) AS QuantitiesSold
FROM
    Sales AS s
    JOIN Products AS p ON s.product_id = p.product_id
    JOIN Categories AS c ON p.category_id = c.category_id
GROUP BY
    ROLLUP (c.category);

-- 4. Sales by Salesperson and Region
-- Using ROLLUP, calculate total sales grouped by:
--	Salesperson
--	Region
-- You should get:
--	Salesperson Region Sales
--	----------- ---------- -----
--	Ali North ...
--	Ali South ...
--	Ali NULL ← Ali subtotal
--	Ahmed North ...
--	Ahmed South ...
--	Ahmed NULL ← Ahmed subtotal
--	NULL NULL ← Grand total

-- 4. Sales by Salesperson and Region

SELECT
    CASE
        WHEN GROUPING(sp.salesperson) = 1 THEN 'Grand Total'
        ELSE sp.salesperson
    END AS SalesPerson,
    CASE
        WHEN GROUPING(sp.salesperson) = 1 THEN 'Grand Total'
        WHEN GROUPING(r.region) = 1 THEN sp.salesperson + ' Sub Total'
        ELSE r.region
    END AS Region,
    SUM(s.amount) AS TotalSales
FROM
    Sales AS s
    JOIN Regions AS r ON s.region_id = r.region_id
    JOIN Salespeople AS sp ON s.salesperson_id = sp.salesperson_id
GROUP BY
    ROLLUP (sp.salesperson, r.region);