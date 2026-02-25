CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR2(10),
    Customer_Name VARCHAR2(100),
    Product_Category VARCHAR2(100),
    Product_Name VARCHAR2(150),
    Quantity NUMBER,
    Unit_Price NUMBER(10,2),
    Payment_Mode VARCHAR2(50),
    Store_Location VARCHAR2(100)
);
SET DEFINE OFF;

INSERT ALL

  INTO Orders VALUES
  (1001, DATE '2026-02-01', 'C001', 'Ravi Kumar',
   'Electronics', 'Wireless Mouse', 2, 799, 'UPI', 'Bangalore')

  INTO Orders VALUES
  (1002, DATE '2026-02-02', 'C002', 'Sneha Reddy',
   'Grocery', 'Basmati Rice 5kg', 1, 650, 'Credit Card', 'Hyderabad')

  INTO Orders VALUES
  (1003, DATE '2026-02-03', 'C003', 'Arjun Mehta',
   'Fashion', 'Men''s T-Shirt', 3, 499, 'Cash', 'Chennai')

  INTO Orders VALUES
  (1004, DATE '2026-02-04', 'C004', 'Priya Sharma',
   'Electronics', 'Bluetooth Speaker', 1, 1499, 'Debit Card', 'Mumbai')

  INTO Orders VALUES
  (1005, DATE '2026-02-05', 'C005', 'Kiran Rao',
   'Home & Kitchen', 'Mixer Grinder', 1, 2499, 'UPI', 'Bangalore')

  INTO Orders VALUES
  (1006, DATE '2026-02-06', 'C006', 'Neha Verma',
   'Beauty', 'Face Cream', 4, 299, 'Credit Card', 'Delhi')

  INTO Orders VALUES
  (1007, DATE '2026-02-07', 'C007', 'Rahul Das',
   'Grocery', 'Cooking Oil 1L', 5, 180, 'Cash', 'Kolkata')

  INTO Orders VALUES
  (1008, DATE '2026-02-08', 'C008', 'Anjali Nair',
   'Fashion', 'Women''s Jeans', 2, 1199, 'UPI', 'Kochi')

  INTO Orders VALUES
  (1009, DATE '2026-02-09', 'C009', 'Suresh Patel',
   'Electronics', 'Smartphone', 1, 15999, 'Debit Card', 'Ahmedabad')

  INTO Orders VALUES
  (1010, DATE '2026-02-10', 'C010', 'Meena Iyer',
   'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune');

SELECT * FROM dual;

COMMIT;

--Extract year from Order_Date.
SELECT EXTRACT(YEAR FROM Order_Date) AS Year FROM Orders;

--Extract month from Order_Date.
SELECT EXTRACT(MONTH FROM Order_Date) AS Month FROM Orders;

--Extract day from Order_Date.
SELECT EXTRACT(DAY FROM Order_Date) AS Day FROM Orders;

--Find current date.
SELECT SYSDATE FROM DUAL;

--Find current timestamp.
SELECT SYSTIMESTAMP FROM DUAL;

--Add 7 days to Order_Date.
SELECT Order_Date + 7 AS New_Date FROM Orders;

--Subtract 30 days from Order_Date.
SELECT Order_Date - 30 AS New_Date FROM Orders;

--Find difference between two dates.
SELECT Order_Date - DATE '2026-02-08' AS Difference FROM Orders;

--Find number of months between two dates.
SELECT MONTHS_BETWEEN(SYSDATE, Order_Date) AS Months_Dates FROM Orders;

--Find last day of the month.
SELECT LAST_DAY(Order_Date) AS Last_Day FROM Orders;

--Get first day of the year.
SELECT TRUNC(Order_Date, 'Year') FROM Orders;

--Format date as 'DD-MM-YYYY'.
SELECT TO_CHAR(Order_Date, 'DD-MM-YY') AS Format_Date FROM Orders;

--Convert string to date.
SELECT TO_DATE('25-02-2026', 'DD-MM-YYYY') FROM dual;

--Convert date to string.
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM dual;

--Find week number of the year.
SELECT TO_CHAR(Order_Date, 'WW') AS Week_Number FROM Orders;

--Find day name from date.
SELECT TO_CHAR(Order_Date, 'DAY') AS Day_Name FROM Orders;

 --Find quarter of the year.
SELECT TO_CHAR(Order_Date, 'Q') AS Quarter FROM Orders;

--Calculate age from DOB.
SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, DOB)/12) AS Age FROM Orders;

--Check if date is weekend.
SELECT CASE 
       WHEN TO_CHAR(Order_Date, 'DY') IN ('SAT','SUN') 
       THEN 'Weekend'
       ELSE 'Weekday'
       END AS Day_Type
FROM Orders;

--Find next Monday after a given date.
SELECT NEXT_DAY(Order_Date, 'MONDAY') AS NEXT_DATY FROM Orders;
