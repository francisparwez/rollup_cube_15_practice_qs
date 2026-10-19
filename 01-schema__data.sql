-- =====================================================
-- PROJECT: Sales Analytics - ROLLUP and CUBE Practice
-- DATABASE: SalesAnalyticsDB
-- PLATFORM: Microsoft SQL Server
-- =====================================================

IF DB_ID ('SalesAnalyticsDB') IS NULL BEGIN
CREATE DATABASE SalesAnalyticsDB;

END;
GO

USE SalesAnalyticsDB;
GO

-- Drop tables in foreign-key dependency order
DROP TABLE IF EXISTS dbo.Sales;

DROP TABLE IF EXISTS dbo.Products;

DROP TABLE IF EXISTS dbo.Salespeople;

DROP TABLE IF EXISTS dbo.Categories;

DROP TABLE IF EXISTS dbo.Regions;
GO

-- 1. Regions and cities
CREATE TABLE dbo.Regions (
    region_id INT PRIMARY KEY,
    region VARCHAR(30) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- 2. Product categories and subcategories
CREATE TABLE dbo.Categories (
    category_id INT PRIMARY KEY,
    category VARCHAR(40) NOT NULL,
    subcategory VARCHAR(50) NOT NULL
);

-- 3. Products
CREATE TABLE dbo.Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(80) NOT NULL,
    category_id INT NOT NULL,
    unit_price DECIMAL(12, 2) NOT NULL,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (category_id) REFERENCES dbo.Categories (category_id)
);

-- 4. Salespeople
CREATE TABLE dbo.Salespeople (
    salesperson_id INT PRIMARY KEY,
    salesperson VARCHAR(80) NOT NULL,
    region_id INT NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT FK_Salespeople_Regions FOREIGN KEY (region_id) REFERENCES dbo.Regions (region_id)
);

-- 5. Sales transactions
CREATE TABLE dbo.Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    region_id INT NOT NULL,
    product_id INT NOT NULL,
    salesperson_id INT NOT NULL,
    quantity INT NOT NULL,
    amount DECIMAL(12, 2) NOT NULL,
    CONSTRAINT FK_Sales_Regions FOREIGN KEY (region_id) REFERENCES dbo.Regions (region_id),
    CONSTRAINT FK_Sales_Products FOREIGN KEY (product_id) REFERENCES dbo.Products (product_id),
    CONSTRAINT FK_Sales_Salespeople FOREIGN KEY (salesperson_id) REFERENCES dbo.Salespeople (salesperson_id),
    CONSTRAINT CK_Sales_Quantity CHECK (quantity > 0),
    CONSTRAINT CK_Sales_Amount CHECK (amount >= 0)
);
GO