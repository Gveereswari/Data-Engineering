CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    Product_Category VARCHAR(100),
    Product_Name VARCHAR(150),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Payment_Mode VARCHAR(50),
    Store_Location VARCHAR(100)
);

select * from orders;

INSERT INTO Orders
(Order_ID, Order_Date, Customer_ID, Customer_Name, Product_Category, Product_Name, Quantity, Unit_Price, Payment_Mode, Store_Location)
VALUES
(1001, Date'2026-02-01', 'C001', 'Ravi Kumar', 'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore'),

(1002,Date '2026-02-02', 'C002', 'Sneha Reddy', 'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad'),

(1003, Date'2026-02-03', 'C003', 'Arjun Mehta', 'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai'),

(1004,Date '2026-02-04', 'C004', 'Priya Sharma', 'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai'),

(1005, Date'2026-02-05', 'C005', 'Kiran Rao', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore'),

(1006,Date '2026-02-06', 'C006', 'Neha Verma', 'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi'),

(1007, Date'2026-02-07', 'C007', 'Rahul Das', 'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata'),

(1008, Date'2026-02-08', 'C008', 'Anjali Nair', 'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi'),

(1009, Date'2026-02-09', 'C009', 'Suresh Patel', 'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad'),

(1010, Date'2026-02-10', 'C010', 'Meena Iyer',  'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune');

==================================================
---Null Value Functions  20 Questions---
===================================================
--1. Replace NULL price with 0
SELECT NVL(UNIT_PRICE,0) FROM ORDERS;

-- 2.Replace NULL Customer_Name with 'Unknown'
SELECT NVL(CUSTOMER_NAME,'Unknown') FROM ORDERS;

--3. Count NULL values in Product_Name
SELECT COUNT(*) FROM ORDERS WHERE PRODUCT_NAME IS NULL;

--4. Find rows where Order_Date is NULL
SELECT * FROM ORDERS WHERE Order_Date IS NULL;

-- 5.Use COALESCE to return first non-null value
SELECT COALESCE(UNIT_PRICE,0) FROM ORDERS;

--6.Use NVL to replace NULL values.
SELECT NVL(UNIT_PRICE,0) from ORDERS;

--7.Use IFNULL function
SELECT IFNULL(UNIT_PRICE,0) FROM ORDERS;

-- 8.Check if column is NULL
SELECT * FROM Orders WHERE Unit_Price IS NULL;

--9.Check if column is NOT NULL
SELECT * FROM Orders WHERE Unit_Price IS NOT NULL;

--10.Use NULLIF between two columns
SELECT NULLIF(Unit_Price, Quantity) FROM Orders;

--11.Replace blank values with NULL
SELECT NULLIF(Customer_Name, '') FROM Orders;

--12.Count non-null values
SELECT COUNT(Unit_Price) FROM Orders;

--13.Filter records where price is NULL or 0
SELECT * FROM Orders WHERE Unit_Price IS NULL OR Unit_Price = 0;

--14.Use CASE to handle NULL values
SELECT CASE WHEN Unit_Price IS NULL THEN 0 ELSE Unit_Price END FROM Orders;

--15.Compare NULL values properly
SELECT * FROM Orders WHERE Unit_Price IS NULL;

--16.Handle NULL in aggregation
SELECT SUM(NVL(Unit_Price, 0)) FROM Orders;

--17.Find average excluding NULL values
SELECT AVG(Unit_Price) FROM Orders;

--18.Find sum ignoring NULL values
SELECT SUM(Unit_Price) FROM Orders;

--19.Identify columns containing NULL using metadata
SELECT column_name FROM user_tab_columns WHERE table_name = 'ORDERS';

--20.Convert NULL to default system date
SELECT NVL(Order_Date, SYSDATE) FROM Orders;