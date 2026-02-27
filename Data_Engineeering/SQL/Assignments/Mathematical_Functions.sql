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
=================================================================================
--MATHEMATICAL FUNCTIONS -20 QUESTIONS--
=================================================================================

--1.Find sine value of an angle.
select sin(50) from dual;

--2.Find cosine value of an angle.
select cos(90) from dual;

--3.Find tangent value.
select tan(75) from dual;

--4.Convert degrees to radians.
SELECT TAN(55*(ACOS(-1)/180)) AS RADIANS_45DEG FROM DUAL;

--5.Convert radians to degrees.
SELECT 1/TAN(0.7854)*(180/ACOS(-1)) AS DEGREES FROM DUAL;

--6.Find logarithm (base 10) of a number.
SELECT LOG(10,5) AS LOG10_VALUE FROM DUAL;

--7.Find natural log of a number.
SELECT LN(10) AS NATURAL_LOG FROM DUAL;

--8.Find square of a number.
SELECT SQRT(2) FROM DUAL;

--9.Find cube of a number.
SELECT POWER(5,3) FROM DUAL;

--10.Calculate factorial of a number.
SELECT EXP(SUM(LN(LEVEL))) FROM dual CONNECT BY LEVEL <=5;

--11.Find greatest value among three numbers.
select greatest(10,34,56) FROM DUAL;

--12.Find least value among three numbers.
SELECT LEAST(10,34,56) FROM DUAL;

--13.Calculate variance of sales.
SELECT variance(QUANTITY * UNIT_PRICE) FROM ORDERS;

--14.Calculate standard deviation of sales.
SELECT STDDEV(Quantity * Unit_Price) FROM Orders;

--15.Find average deviation.
SELECT AVG(ABS(sales - avg_sales))
FROM (
    SELECT Quantity * Unit_Price AS sales,
    AVG(Quantity * Unit_Price) OVER () AS avg_sales
    FROM Orders
    );

--16.Calculate geometric mean.
SELECT EXP(AVG(LN(Quantity * Unit_Price))) FROM Orders;

--17.Calculate harmonic mean.
SELECT COUNT(*) / SUM(1 / (Quantity * Unit_Price)) FROM Orders;

--18.Find sum of squares.
SELECT  SUM(POWER(unit_price * quantity, 2)) AS sum_of_squares FROM orders;

--19.Calculate correlation between two columns.
SELECT CORR(Quantity, Unit_Price) FROM Orders;

--20.Calculate regression slope.
SELECT REGR_SLOPE(Unit_Price, Quantity) FROM Orders;