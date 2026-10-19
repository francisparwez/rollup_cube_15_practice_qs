USE SalesAnalyticsDB;
GO

INSERT INTO
    dbo.Regions (region_id, region, city)
VALUES (1, 'North', 'Lahore'),
    (2, 'North', 'Islamabad'),
    (3, 'North', 'Rawalpindi'),
    (4, 'North', 'Faisalabad'),
    (5, 'North', 'Sialkot'),
    (6, 'North', 'Gujranwala'),
    (7, 'North', 'Sargodha'),
    (8, 'North', 'Jhelum'),
    (9, 'North', 'Abbottabad'),
    (10, 'North', 'Peshawar'),
    (11, 'South', 'Karachi'),
    (12, 'South', 'Hyderabad'),
    (13, 'South', 'Sukkur'),
    (14, 'South', 'Larkana'),
    (15, 'South', 'Nawabshah'),
    (16, 'South', 'Mirpur Khas'),
    (17, 'South', 'Thatta'),
    (18, 'South', 'Badin'),
    (19, 'South', 'Jacobabad'),
    (20, 'South', 'Khairpur'),
    (21, 'East', 'Multan'),
    (22, 'East', 'Bahawalpur'),
    (23, 'East', 'Rahim Yar Khan'),
    (24, 'East', 'Dera Ghazi Khan'),
    (25, 'East', 'Sahiwal'),
    (26, 'East', 'Okara'),
    (27, 'East', 'Pakpattan'),
    (28, 'East', 'Vehari'),
    (29, 'East', 'Khanewal'),
    (30, 'East', 'Lodhran'),
    (31, 'West', 'Quetta'),
    (32, 'West', 'Gwadar'),
    (33, 'West', 'Turbat'),
    (34, 'West', 'Khuzdar'),
    (35, 'West', 'Chaman'),
    (36, 'West', 'Zhob'),
    (37, 'West', 'Loralai'),
    (38, 'West', 'Sibi'),
    (39, 'West', 'Kohat'),
    (40, 'West', 'Bannu');

INSERT INTO
    dbo.Categories (
        category_id,
        category,
        subcategory
    )
VALUES (1, 'Electronics', 'Laptops'),
    (2, 'Electronics', 'Desktops'),
    (3, 'Electronics', 'Monitors'),
    (4, 'Electronics', 'Keyboards'),
    (5, 'Electronics', 'Mice'),
    (6, 'Electronics', 'Printers'),
    (
        7,
        'Electronics',
        'Headphones'
    ),
    (8, 'Electronics', 'Storage'),
    (
        9,
        'Furniture',
        'Office Chairs'
    ),
    (
        10,
        'Furniture',
        'Office Desks'
    ),
    (11, 'Furniture', 'Bookcases'),
    (
        12,
        'Furniture',
        'Filing Cabinets'
    ),
    (
        13,
        'Furniture',
        'Meeting Tables'
    ),
    (14, 'Furniture', 'Sofas'),
    (15, 'Furniture', 'Shelving'),
    (
        16,
        'Furniture',
        'Reception Desks'
    ),
    (17, 'Clothing', 'Shirts'),
    (18, 'Clothing', 'Trousers'),
    (19, 'Clothing', 'Jackets'),
    (20, 'Clothing', 'Shoes'),
    (21, 'Clothing', 'Belts'),
    (22, 'Clothing', 'Bags'),
    (23, 'Clothing', 'Uniforms'),
    (24, 'Clothing', 'Accessories'),
    (25, 'Groceries', 'Rice'),
    (
        26,
        'Groceries',
        'Cooking Oil'
    ),
    (27, 'Groceries', 'Flour'),
    (28, 'Groceries', 'Tea'),
    (29, 'Groceries', 'Coffee'),
    (
        30,
        'Groceries',
        'Canned Food'
    ),
    (31, 'Groceries', 'Spices'),
    (32, 'Groceries', 'Snacks'),
    (33, 'Stationery', 'Notebooks'),
    (34, 'Stationery', 'Pens'),
    (35, 'Stationery', 'Paper'),
    (36, 'Stationery', 'Folders'),
    (37, 'Stationery', 'Markers'),
    (38, 'Stationery', 'Staplers'),
    (39, 'Stationery', 'Envelopes'),
    (
        40,
        'Stationery',
        'Calculators'
    );

INSERT INTO
    dbo.Products (
        product_id,
        product_name,
        category_id,
        unit_price
    )
VALUES (
        1,
        'Business Laptop',
        1,
        180000
    ),
    (
        2,
        'Office Desktop',
        2,
        145000
    ),
    (3, 'LED Monitor', 3, 42000),
    (
        4,
        'Mechanical Keyboard',
        4,
        8500
    ),
    (5, 'Wireless Mouse', 5, 3500),
    (6, 'Laser Printer', 6, 38000),
    (
        7,
        'Wireless Headphones',
        7,
        12000
    ),
    (8, 'External SSD', 8, 18000),
    (
        9,
        'Ergonomic Chair',
        9,
        32000
    ),
    (
        10,
        'Executive Desk',
        10,
        55000
    ),
    (
        11,
        'Office Bookcase',
        11,
        22000
    ),
    (
        12,
        'Filing Cabinet',
        12,
        18000
    ),
    (
        13,
        'Conference Table',
        13,
        75000
    ),
    (14, 'Office Sofa', 14, 65000),
    (
        15,
        'Metal Shelving',
        15,
        15000
    ),
    (
        16,
        'Reception Desk',
        16,
        48000
    ),
    (17, 'Formal Shirt', 17, 4500),
    (
        18,
        'Formal Trousers',
        18,
        5500
    ),
    (19, 'Winter Jacket', 19, 9500),
    (20, 'Leather Shoes', 20, 8500),
    (21, 'Leather Belt', 21, 1800),
    (22, 'Travel Bag', 22, 6500),
    (23, 'Staff Uniform', 23, 4000),
    (
        24,
        'Fashion Accessories',
        24,
        2200
    ),
    (
        25,
        'Premium Rice Bag',
        25,
        3200
    ),
    (
        26,
        'Cooking Oil Bottle',
        26,
        950
    ),
    (
        27,
        'Wheat Flour Bag',
        27,
        1800
    ),
    (28, 'Tea Pack', 28, 1200),
    (29, 'Ground Coffee', 29, 2200),
    (30, 'Canned Beans', 30, 450),
    (
        31,
        'Mixed Spice Pack',
        31,
        350
    ),
    (32, 'Snack Box', 32, 800),
    (33, 'Notebook Pack', 33, 600),
    (
        34,
        'Ballpoint Pen Pack',
        34,
        350
    ),
    (
        35,
        'Printer Paper Ream',
        35,
        1200
    ),
    (
        36,
        'Document Folders',
        36,
        500
    ),
    (37, 'Marker Set', 37, 450),
    (
        38,
        'Heavy Duty Stapler',
        38,
        1800
    ),
    (39, 'Envelope Pack', 39, 300),
    (
        40,
        'Scientific Calculator',
        40,
        2500
    );

INSERT INTO
    dbo.Salespeople (
        salesperson_id,
        salesperson,
        region_id,
        hire_date
    )
VALUES (
        1,
        'Ali Ahmed',
        1,
        '2022-01-10'
    ),
    (
        2,
        'Sara Khan',
        2,
        '2022-03-15'
    ),
    (
        3,
        'Usman Malik',
        3,
        '2022-05-20'
    ),
    (
        4,
        'Ayesha Shah',
        4,
        '2022-07-12'
    ),
    (
        5,
        'Hamza Ali',
        5,
        '2022-09-08'
    ),
    (
        6,
        'Fatima Noor',
        6,
        '2022-11-21'
    ),
    (
        7,
        'Bilal Hussain',
        7,
        '2023-01-05'
    ),
    (
        8,
        'Zainab Iqbal',
        8,
        '2023-02-14'
    ),
    (
        9,
        'Omar Farooq',
        9,
        '2023-04-18'
    ),
    (
        10,
        'Maryam Aslam',
        10,
        '2023-06-22'
    ),
    (
        11,
        'Ahmed Raza',
        11,
        '2023-08-10'
    ),
    (
        12,
        'Hira Javed',
        12,
        '2023-09-17'
    ),
    (
        13,
        'Danish Akram',
        13,
        '2023-10-25'
    ),
    (
        14,
        'Noor Fatima',
        14,
        '2023-11-12'
    ),
    (
        15,
        'Hassan Tariq',
        15,
        '2023-12-04'
    ),
    (
        16,
        'Iqra Saeed',
        16,
        '2024-01-19'
    ),
    (
        17,
        'Saad Qureshi',
        17,
        '2024-02-26'
    ),
    (
        18,
        'Mahnoor Asif',
        18,
        '2024-03-11'
    ),
    (
        19,
        'Fahad Sheikh',
        19,
        '2024-04-23'
    ),
    (
        20,
        'Amna Khalid',
        20,
        '2024-05-16'
    ),
    (
        21,
        'Taha Yousuf',
        21,
        '2024-06-07'
    ),
    (
        22,
        'Sana Waheed',
        22,
        '2024-07-15'
    ),
    (
        23,
        'Rayan Ahmed',
        23,
        '2024-08-21'
    ),
    (
        24,
        'Laiba Imran',
        24,
        '2024-09-09'
    ),
    (
        25,
        'Arham Nadeem',
        25,
        '2024-10-14'
    ),
    (
        26,
        'Eman Zafar',
        26,
        '2024-11-18'
    ),
    (
        27,
        'Kashif Ilyas',
        27,
        '2024-12-02'
    ),
    (
        28,
        'Dua Salman',
        28,
        '2025-01-13'
    ),
    (
        29,
        'Sameer Abbas',
        29,
        '2025-02-20'
    ),
    (
        30,
        'Anaya Rizvi',
        30,
        '2025-03-06'
    ),
    (
        31,
        'Rehan Butt',
        31,
        '2025-04-11'
    ),
    (
        32,
        'Minal Azhar',
        32,
        '2025-05-19'
    ),
    (
        33,
        'Shayan Mir',
        33,
        '2025-06-23'
    ),
    (
        34,
        'Alina Baig',
        34,
        '2025-07-08'
    ),
    (
        35,
        'Waleed Anwar',
        35,
        '2025-08-17'
    ),
    (
        36,
        'Nimra Shahid',
        36,
        '2025-09-22'
    ),
    (
        37,
        'Adeel Hashmi',
        37,
        '2025-10-05'
    ),
    (
        38,
        'Rida Amin',
        38,
        '2025-11-14'
    ),
    (
        39,
        'Zeeshan Qadir',
        39,
        '2025-12-09'
    ),
    (
        40,
        'Sadia Tariq',
        40,
        '2026-01-16'
    );

;
WITH
    Numbers AS (
        SELECT 1 AS n
        UNION ALL
        SELECT n + 1
        FROM Numbers
        WHERE
            n < 120
    )
INSERT INTO
    dbo.Sales (
        sale_id,
        sale_date,
        region_id,
        product_id,
        salesperson_id,
        quantity,
        amount
    )
SELECT
    n AS sale_id,
    DATEADD (
        DAY,
        (n * 7) % 639,
        CAST('2025-01-01' AS DATE)
    ) AS sale_date,
    ((n - 1) % 40) + 1 AS region_id,
    ((n * 7 - 1) % 40) + 1 AS product_id,
    ((n * 3 - 1) % 40) + 1 AS salesperson_id,
    ((n * 5) % 10) + 1 AS quantity,
    CAST(
        p.unit_price * (((n * 5) % 10) + 1) AS DECIMAL(12, 2)
    ) AS amount
FROM Numbers AS num
    JOIN dbo.Products AS p ON p.product_id = ((n * 7 - 1) % 40) + 1 OPTION (MAXRECURSION 120);
GO