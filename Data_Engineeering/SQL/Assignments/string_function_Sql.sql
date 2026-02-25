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


--1:Write a query to convert all customer names to uppercase.
SELECT  CUSTOMER_NAME,UPPER(CUSTOMER_NAME) FROM ORDERS;

--2.Extract the first 5 characters from Product_Name.
SELECT SUBSTR(PRODUCT_NAME,1,5) FROM ORDERS;

--3.Find the length of each Customer_Name.
SELECT CUSTOMER_NAME,LENGTH(CUSTOMER_NAME)FROM ORDERS;

--4.Replace the word "Rice" with "Premium Rice" in Product_Name.
SELECT PRODUCT_NAME,REPLACE(PRODUCT_NAME, 'RICE', 'PREMIUM RICE') FROM ORDERS;SELECT * FROM ORDERS;

--5.Remove leading and trailing spaces from Customer_Name
SELECT TRIM(CUSTOMER_NAME) FROM ORDERS;

--6.Concatenate First_Name and Last_Name as Full_Name.
SELECT CUSTOMER_NAME, PRODUCT_NAME,CUSTOMER_NAME||' '||PRODUCT_NAME AS FULL_NAME FROM ORDERS;

--7.Find customers whose names start with 'A'.
SELECT * FROM ORDERS WHERE CUSTOMER_NAME LIKE 'A%';SELECT * FROM ORDERS;

--8.Extract the domain name from Email_ID.
SELECT SUBSTR(EMAIL_ID, INSTR(EMAIL_ID,'@')+1) AS DOMAIN FROM ORDERS;

--9.Find the position of '@' in Email_ID.
SELECT EMAIL_ID,INSTR(EMAIL_ID,'@') AS AT_POSITION FROM ORDERS;

--10.Reverse the Product_Name.
SELECT PRODUCT_NAME,REVERSE(PRODUCT_NAME) AS REVERSED_NAME FROM ORDERS;

--11.Convert the first letter of each word in Product_Name to uppercase.
SELECT PRODUCT_NAME, INITCAP(PRODUCT_NAME) AS FORMATED_PRODUCT_NAME FROM ORDERS;

--12.Extract the last 3 characters from Order_ID.
SELECT ORDER_ID,SUBSTR(ORDER_ID,1,3) AS ID FROM ORDERS;

--13.Count how many times letter 'a' appears in Customer_Name.
SELECT CUSTOMER_NAME, LENGTH(LOWER(CUSTOMER_NAME)) -LENGTH(REPLACE(LOWER(CUSTOMER_NAME),'a','')) AS A_COUNT FROM ORDERS;

--14.Mask the last 4 digits of a phone number.
SELECT PHONE_NUMBER,SUBSTR(PHONE_NUMBER,7,4)||'****' AS MARKED_NUMBER FROM ORDERS;

-- 15.Split Full_Name into First_Name and Last_Name.
SELECT SUBSTR(Full_Name, 1, INSTR(Full_Name, ' ') - 1) AS First_Name,SUBSTR(Full_Name, INSTR(Full_Name, ' ') + 1) AS Last_Name FROM orders;

--16.Remove all special characters from Product_Code.
select trim(product_code) from orders;

--17.Compare two columns ignoring case sensitivity.
select * from orders where upper(CUSTOMER_NAME)= UPPER(PRODUCT_NAME);

--18.Find customers whose name contains 'kumar'.
select * from orders where lower(CUSTOMER_NAME) like '%kumar%';

--19.Pad Order_ID with leading zeros to make it 6 digits.
select lpad(order_id,6,'0') AS Orderr_ID from orders;

--20.Extract substring between two characters.
SELECT PRODUCT_CATEGORY,
        SUBSTR(PRODUCT_CATEGORY,
                INSTR(PRODUCT_CATEGORY, '(')+1,
                INSTR(PRODUCT_CATEGORY, ')') -INSTR(PRODUCT_CATEGORY, '{')-1
              ) AS CATEGORY_NAME FROM ORDERS;