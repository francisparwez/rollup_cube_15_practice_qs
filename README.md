# SQL Server `ROLLUP` & `CUBE` Practice

A hands-on T-SQL practice project for learning summary reports, subtotals, grand totals, and multidimensional aggregation with `GROUP BY ROLLUP`, `GROUP BY CUBE`, `GROUPING()`, and `GROUPING_ID()`.

The project uses a synthetic sales database based on Pakistani cities and fictional salespeople. It is designed for Microsoft SQL Server and SQL Server Management Studio (SSMS).

## Project objectives

By completing the exercises, you will practise how to:

- Calculate totals, averages, quantities, and transaction counts.
- Generate subtotals and grand totals with `ROLLUP`.
- Compare hierarchical aggregation with the combinations produced by `CUBE`.
- Identify subtotal and grand-total rows using `GROUPING()`.
- Interpret aggregation bitmasks with `GROUPING_ID()`.
- Combine aggregation with joins, window functions, and date expressions.
- Explain which grouping combinations each query returns.

## Database overview

**Database:** `SalesAnalyticsDB`  
**SQL dialect:** Microsoft SQL Server (T-SQL)  
**Currency:** Synthetic prices and sales amounts are expressed in Pakistani rupees (PKR).  
**Transaction dates:** Generated dates span 2025 and 2026.

The scripts create five tables:

| Table             | Purpose                                                     | Expected rows |
| ----------------- | ----------------------------------------------------------- | ------------: |
| `dbo.Regions`     | Territory IDs, region names, and cities                     |            40 |
| `dbo.Categories`  | Product categories and subcategories                        |            40 |
| `dbo.Products`    | Product names, category IDs, and unit prices                |            40 |
| `dbo.Salespeople` | Fictional salespeople, assigned territories, and hire dates |            40 |
| `dbo.Sales`       | Individual synthetic sales transactions                     |           120 |
| **Total**         |                                                             |       **280** |

> The data is synthetic and intended for SQL practice. It is not a record of actual business transactions.

## Repository files

| File                                | Contents                                                                      |
| ----------------------------------- | ----------------------------------------------------------------------------- |
| `README.md`                         | Project overview, setup steps, schema guide, and exercises                    |
| `01-schema__data.sql`               | Creates `SalesAnalyticsDB` and all five tables                                |
| `02-data-insertion-query.sql`       | Inserts the dimension data and generates 120 sales transactions               |
| `03-verifying-schema.sql`           | Verifies expected row counts for all five tables and reports `PASS` or `FAIL` |
| `04-beginner-level.sql`             | Implementations for beginner questions 1–4 using `ROLLUP` and `GROUPING()`    |
| `15 SQL ROLLUP & CUBE Practice.pdf` | The 15 practice questions (8 beginner and 7 intermediate)                     |

Keep the SQL scripts and practice PDF together in the same project folder.

## Database schema and relationships

```text
Regions
  region_id (PK)
  region
  city
      |
      +----------------------+
      |                      |
      v                      v
Salespeople                Sales
  salesperson_id (PK)        sale_id (PK)
  salesperson                sale_date
  region_id (FK) ------------ region_id (FK)
  hire_date                  product_id (FK)
                             salesperson_id (FK)
                                  |
                                  v
                              Products
                                product_id (PK)
                                product_name
                                category_id (FK)
                                unit_price
                                    |
                                    v
                                Categories
                                  category_id (PK)
                                  category
                                  subcategory
```

Foreign keys enforce the relationships defined in the schema. `Sales.amount` is generated as `Products.unit_price * Sales.quantity`.

### Important schema note

The practice PDF describes a simplified, flat `Sales` table with columns such as `region`, `city`, `category`, `product`, and `salesperson`. This project uses a normalized schema instead. Those descriptive fields are in related tables, so join the relevant tables before grouping by them.

Use these mappings:

| Exercise field   | Actual column             |
| ---------------- | ------------------------- |
| Region name      | `Regions.region`          |
| City             | `Regions.city`            |
| Category name    | `Categories.category`     |
| Product name     | `Products.product_name`   |
| Salesperson name | `Salespeople.salesperson` |
| Sale date        | `Sales.sale_date`         |
| Quantity         | `Sales.quantity`          |
| Sales amount     | `Sales.amount`            |

## Setup instructions

1. Open SQL Server Management Studio and connect to your SQL Server instance.
2. Open and execute `01-schema__data.sql`.
3. Open and execute `02-data-insertion-query.sql`.
4. Run the verification query below.
5. Open the PDF and work through the 15 questions in order.

**Important:** The schema script drops and recreates the five project tables each time it runs. Running it again deletes and rebuilds the tables. The insertion script is intended to be run after the schema script; running it repeatedly without recreating the tables will cause duplicate-key errors.

## Verify the row counts

Run `03-verifying-schema.sql` after creating and populating the database. It compares each table's actual row count with its expected count and returns `PASS` when the counts match or `FAIL` otherwise.

Expected counts are 40 rows in each of the four dimension tables and 120 rows in `Sales` (280 records total).

## Starter query: sales by region and category

Use this query to see how the normalized tables connect and how `ROLLUP` adds subtotal rows.

```sql
USE SalesAnalyticsDB;
GO

SELECT
    r.region,
    c.category,
    SUM(s.amount) AS total_sales
FROM dbo.Sales AS s
INNER JOIN dbo.Regions AS r
    ON s.region_id = r.region_id
INNER JOIN dbo.Products AS p
    ON s.product_id = p.product_id
INNER JOIN dbo.Categories AS c
    ON p.category_id = c.category_id
GROUP BY ROLLUP (r.region, c.category)
ORDER BY
    r.region,
    c.category;
```

In this result, a `NULL` produced by `ROLLUP` represents an aggregated level, such as a regional subtotal or the grand total. In general, do not assume every `NULL` in a grouped result is a subtotal; use `GROUPING()` to identify aggregation-generated `NULL` values.

## Practice questions

The accompanying PDF contains these 15 exercises. The current implementation file, `04-beginner-level.sql`, contains completed solutions for beginner questions 1–4. These queries use `ROLLUP` and `GROUPING()` for regional totals, region/category subtotals, category quantity totals, salesperson/region subtotals, and grand totals. The `03-verifying-schema.sql` script checks the expected record counts. Continue attempting the remaining questions yourself before looking up syntax or asking for a hint.

### Beginner — Questions 1–8

1. **Total sales by region + grand total — completed** in `04-beginner-level.sql`. Uses `ROLLUP(r.region)` and `GROUPING(r.region)` to label the grand-total row.
2. **Sales by region and category — completed** in `04-beginner-level.sql`. Joins `Sales`, `Regions`, `Products`, and `Categories`; uses `ROLLUP(r.region, c.category)` to calculate region/category detail, regional subtotals, and the grand total. `GROUPING()` labels the subtotal and grand-total rows.
3. **Quantity sold by category — completed** in `04-beginner-level.sql`. Uses `SUM(s.quantity)` and `ROLLUP(c.category)` to return each category total and the grand total.
4. **Sales by salesperson and region — completed** in `04-beginner-level.sql`. Joins sales to `Salespeople` using `salesperson_id`; uses `ROLLUP(sp.salesperson, r.region)` to return salesperson/region totals, salesperson subtotals, and the grand total.
5. **Average sale amount by region** — use `AVG(amount)` and include the overall average.
6. **Number of sales by category** — use `COUNT(*)`.
7. **Sales by region and city** — show city detail, regional subtotals, and the grand total.
8. **Compare `GROUP BY` with `ROLLUP`** — explain the additional rows and their meaning.

### Intermediate — Questions 9–15

9. **Sales percentage of grand total** — combine `ROLLUP` with a window-function approach.
10. **`CUBE` on region and category** — return detail, region totals, category totals, and grand total.
11. **Three-column `CUBE`** — aggregate by region, category, and salesperson.
12. **Distinguish subtotals from grand total** — use `GROUPING()`.
13. **Understand `GROUPING_ID()`** — investigate the grouping IDs for a three-column `CUBE`.
14. **Monthly sales with `ROLLUP`** — group by year, month, and region.
15. **Compare `ROLLUP` and `CUBE`** — report sales, quantity, and number of transactions.

### Translating the questions to this schema

For questions involving region and city, join `Sales` to `Regions`. For category and product, join through `Products` to `Categories`. For salesperson, join `Sales` to `Salespeople`.

For example, the core joins for a report using all three dimensions are:

```sql
FROM dbo.Sales AS s
INNER JOIN dbo.Regions AS r
    ON s.region_id = r.region_id
INNER JOIN dbo.Products AS p
    ON s.product_id = p.product_id
INNER JOIN dbo.Categories AS c
    ON p.category_id = c.category_id
INNER JOIN dbo.Salespeople AS sp
    ON s.salesperson_id = sp.salesperson_id
```

Use `r.region`, `c.category`, and `sp.salesperson` as the grouping columns. Use `SUM(s.amount)`, `SUM(s.quantity)`, and `COUNT(*)` for the measures in Question 15.

## Concepts to remember

### `ROLLUP`

`ROLLUP` creates a hierarchy of grouping levels based on the order of the columns. With three columns:

```sql
GROUP BY ROLLUP (r.region, c.category, sp.salesperson)
```

the grouping sets are:

1. Region + category + salesperson
2. Region + category
3. Region
4. Grand total

For `n` columns, this produces `n + 1` grouping sets.

### `CUBE`

`CUBE` generates every combination of the specified grouping columns:

```sql
GROUP BY CUBE (r.region, c.category, sp.salesperson)
```

For three columns, there are `2^3 = 8` grouping sets: the full detail, each two-column combination, each one-column combination, and the grand total.

### `GROUPING()` and `GROUPING_ID()`

- `GROUPING(column)` returns `1` when the column is omitted in the current aggregation row and `0` when it is included in the grouping level.
- `GROUPING_ID(column1, column2, ...)` returns a bitmask representing which specified columns were aggregated away. The column order matters when interpreting its value.

These functions help distinguish a `NULL` introduced by a subtotal from a `NULL` stored in source data.

## Suggested workflow

- [x] Run the schema script.
- [x] Run the insertion script.
- [x] Verify the record counts.
- [x] Complete beginner questions 1–4 (`04-beginner-level.sql`).
- [ ] Complete beginner questions 5–8.
- [ ] Complete intermediate questions 9–12.
- [ ] Complete intermediate questions 13–15.
- [ ] Test your understanding by explaining the output of `ROLLUP`, `CUBE`, `GROUPING()`, and `GROUPING_ID()` without referring to notes.

## Skills demonstrated

- Microsoft SQL Server / T-SQL
- Relational schema and foreign keys
- Multi-table joins
- Aggregate functions (`SUM`, `AVG`, `COUNT`)
- `GROUP BY`, `ROLLUP`, and `CUBE`
- `GROUPING()` for identifying and labelling aggregation rows
- Hierarchical subtotals by category, region, and salesperson
- `GROUPING_ID()` (covered in the remaining practice exercises)
- Window functions
- Date-based aggregation
- Synthetic data generation and validation
- Record-count verification with expected-versus-actual checks

---

**Project:** SQL `ROLLUP` & `CUBE` Practice  
**Database:** `SalesAnalyticsDB`  
**Purpose:** Beginner-to-intermediate SQL analytics practice
