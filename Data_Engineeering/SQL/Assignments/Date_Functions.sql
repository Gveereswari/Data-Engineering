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



--1.Extract year from Order_Date.
SELECT EXTRACT(year from Order_Date)FROM ORDERS;

--2.Extract month from Order_Date.
SELECT EXTRACT(month from ORDER_DATE)FROM ORDERS;

--3.Extract day from Order_Date.
SELECT EXTRACT(day from ORDER_DATE)FROM ORDERS;

--4.Find current date.
SELECT sysdate from dual;

--5.Find current timestamp.
select systimestamp from dual;

--6.Add 7 days to Order_Date.
SELECT Order_Date + 7 FROM ORDERS;

--7.Subtract 30 days from Order_Date.
SELECT Order_Date - 30 FROM ORDERS;

--8.Find difference between two dates.
SELECT DATE '2026-02-23' - DATE '2025-01-01' AS DAYS_DIFFERENCE FROM DUAL;

--9.Find number of months between two dates.
SELECT MONTHS_BETWEEN(DATE '2003-07-31', DATE '2026-02-23') FROM DUAL; 

--10.Find last day of the month.
SELECT LAST_DAY(SYSDATE) FROM DUAL;

--11.Get first day of the year.
SELECT TRUNC(SYSDATE, 'YYYY') FROM DUAL;

--12.Format date as 'DD-MM-YYYY'.
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY') AS FORMATTED_DATE FROM DUAL;

--13.Convert string to date.
SELECT TO_DATE('23-02-2026', 'DD-MM-YYYY') AS CONVERTED_DATE FROM DUAL;

--14.Convert date to string.
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY') AS DATE_STRING FROM DUAL;

--15.Find week number of the year.
SELECT TO_CHAR(SYSDATE,'WW') FROM DUAL;

--16.Find day name from date.
SELECT TO_CHAR(SYSDATE, 'DAY') FROM DUAL;

--17.Find quarter of the year.
SELECT TO_CHAR(SYSDATE,'Q') FROM DUAL;

--18.Calculate age from DOB.
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, DATE '2003-07-31')/12) AS AGE FROM DUAL;

--19.Check if date is weekend.

--20.Find next Monday after a given date.

SELECT NEXT_DAY(SYSDATE, 'MONDAY') AS NEXT_MONDAY FROM DUAL;
