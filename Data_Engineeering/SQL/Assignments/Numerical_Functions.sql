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

**NUMERICAL FUNCTIONS**

--1.Round Unit_Price to 2 decimal places.
SELECT ROUND(unit_price,2) FROM ORDERS;

--2.Find total sales per order.
SELECT SUM(UNIT_PRICE) FROM ORDERS;

--3.Calculate average order value.
 select avg(unit_price) from orders;

--4.Find highest product price.
SELECT MAX(UNIT_PRICE) FROM ORDERS;

--5.Find lowest product price.
SELECT MIN(UNIT_PRICE) FROM ORDERS;

--6.Calculate percentage discount applied.

--7.Find modulus of Quantity divided by 2.
SELECT MOD(QUANTITY, 2) FROM ORDERS;

--8.Convert negative values to positive.
select abs(unit_price) from orders;

--9.Truncate price without rounding.
 select trunc(unit_price,2) from orders;

--10.Find square root of total sales.
SELECT SQRT(SUM(QUANTITY * UNIT_PRICE))AS SQRT_TOTAL_SALES FROM ORDERS;

--11.Calculate exponential value of a number.
SELECT EXP(quantity) FROM orders;

--12.Calculate power of 2^5.
SELECT POWER(2,5) FROM DUAL;

--13.Find absolute difference between two prices.
select abs(100-150) from DUAL;

--14.Calculate sales growth percentage.


--15.Find random number between 1 and 100.
select trunc(dbms_random.value(1,101)) as random from dual;

--16.Divide total sales by number of orders.
 select sum(unit_price)/count(QUANTITY) from orders;

--17.Find ceiling value of price.
 select ceil(unit_price) from orders;

--18.Find floor value of price.
 select floor(unit_price) from orders;

--19.Convert decimal to integer.
select round(unit_price) from orders;

--20.Calculate compound interest.