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

===========================================================================
ANALYTICAL FUNCTIONS (WINDOW FUNCTIONS) – 20 Questions
===========================================================================
--1.Assign row numbers to each order
SELECT Order_ID,
    ROW_NUMBER() OVER (ORDER BY Order_Date) AS Row_Num
FROM Orders;

--2.Rank products by price
SELECT Product_Name,
    RANK() OVER (ORDER BY Unit_Price DESC) AS Price_Rank
FROM Orders;

--3.Dense rank products by sales
SELECT Product_Name,
    DENSE_RANK() OVER (ORDER BY (Unit_Price * Quantity) DESC) AS Sales_Rank
FROM Orders;

--4.Find running total of sales
SELECT Order_Date,
    SUM(Unit_Price * Quantity) 
   OVER (ORDER BY Order_Date) AS Running_Total
    FROM Orders;

--5.Calculate cumulative sum by month
SELECT Order_Date,
    SUM(Unit_Price * Quantity)
   OVER (PARTITION BY TO_CHAR(Order_Date,'MM')
     ORDER BY Order_Date) AS Monthly_Cumulative_Sum
FROM Orders;

--6.Find moving average of last 3 days
SELECT Order_Date,
    AVG(Unit_Price * Quantity)
   OVER (ORDER BY Order_Date
     ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS Moving_Avg_3_Days
      FROM Orders;

--7.Calculate lag of previous day sales
SELECT Order_Date,
   (Unit_Price * Quantity) AS Sales,
    LAG(Unit_Price * Quantity)
    OVER (ORDER BY Order_Date) AS Previous_Day_Sales
FROM Orders;

--8.Calculate lead of next day sales
SELECT Order_Date,
   (Unit_Price * Quantity) AS Sales,
    LEAD(Unit_Price * Quantity)
    OVER (ORDER BY Order_Date) AS Next_Day_Sales
     FROM Orders;

--9.Find difference between current and previous sale
SELECT Order_Date,
   (Unit_Price * Quantity) -
    LAG(Unit_Price * Quantity)
    OVER (ORDER BY Order_Date) AS Sales_Difference
 FROM Orders;

--10.Partition sales by region
SELECT partition,
    SUM(Unit_Price * Quantity)
    OVER (PARTITION BY Region) AS Region_Total_Sales
 FROM Orders;

--11.Find top 3 products per category
SELECT *
FROM (
    SELECT Category,
        Product_Name,
        RANK() OVER (PARTITION BY Category
                ORDER BY Unit_Price DESC) AS Rank_Value
 FROM Orders
  )
 WHERE Rank_Value <= 3;

--12.Find bottom 2 customers by sales
SELECT *
FROM (
    SELECT Customer_Name,
           SUM(Unit_Price * Quantity) AS Total_Sales,
           RANK() OVER (ORDER BY SUM(Unit_Price * Quantity)) AS Rank_Value
     FROM Orders
    GROUP BY Customer_Name
 )
 WHERE Rank_Value <= 2;

--13.Calculate percentage of total sales
SELECT Order_ID,
   (Unit_Price * Quantity) /
    SUM(Unit_Price * Quantity) OVER () * 100 AS Sales_Percentage
 FROM Orders;

--14.Calculate NTILE distribution of customers (4 groups example)
SELECT Customer_Name,
   NTILE(4) OVER (ORDER BY SUM(Unit_Price * Quantity) DESC) AS Sales_Group
FROM Orders
GROUP BY Customer_Name;

15.Find first order per customer
SELECT *
FROM (
 SELECT Customer_Name,
        Order_Date,
        ROW_NUMBER() OVER (PARTITION BY Customer_Name
                          ORDER BY Order_Date) AS RN
    FROM Orders
 )
WHERE RN = 1;

--16.Find last order per customer
SELECT *
FROM (
    SELECT Customer_Name,
       Order_Date,
        ROW_NUMBER() OVER (PARTITION BY Customer_Name
                   ORDER BY Order_Date DESC) AS RN
  FROM Orders
 )
 WHERE RN = 1;

--17.Calculate average salary within department
SELECT Department,
   AVG(Salary) OVER (PARTITION BY Department) AS Avg_Department_Salary
 FROM Employees;

--18.Compare current row with max value in partition
SELECT Region,
   Unit_Price,
   MAX(Unit_Price) OVER (PARTITION BY Region) AS Max_In_Region
FROM Orders;

--19.Identify duplicate records using ROW_NUMBER
SELECT *
 FROM (
 SELECT Order_ID,
       ROW_NUMBER() OVER (PARTITION BY Order_ID ORDER BY Order_Date) AS RN
 FROM Orders
 )
 WHERE RN > 1;

--20.Find cumulative distinct count (example: distinct customers over time)
SELECT * FROM ORDERS;
SELECT 
    order_date,
    COUNT(DISTINCT customer_id) 
        OVER (ORDER BY order_date) AS cumulative_customers
FROM orders
ORDER BY order_date;