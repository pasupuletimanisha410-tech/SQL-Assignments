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



--Replace NULL price with 0.
SELECT NVL(Unit_Price, 0) AS Price
FROM Orders;

--Replace NULL Customer_Name with 'Unknown'.
SELECT NVL(Customer_Name, 'Unknown') AS Customer_Name
FROM Orders;

--Count NULL values in Product_Name.
SELECT COUNT(*) AS Null_Count
FROM Orders
WHERE Product_Name IS NULL;

--Find rows where Order_Date is NULL.
SELECT *
FROM Orders
WHERE Order_Date IS NULL;

--Use COALESCE to return first non-null value.
SELECT COALESCE(Customer_Name, Product_Name, 'No Data') AS Result
FROM Orders;

--Use NVL to replace NULL values.
SELECT NVL(Unit_Price, 0)
FROM Orders;

--Use IFNULL function.
SELECT NVL(Unit_Price, 0)
FROM Orders;

--Check if column is NULL.
SELECT *
FROM Orders
WHERE Unit_Price IS NULL;

--Check if column is NOT NULL.
SELECT *
FROM Orders
WHERE Unit_Price IS NOT NULL;

--Use NULLIF between two columns.
SELECT NULLIF(Unit_Price, 0) AS Result
FROM Orders;

--Replace blank values with NULL.
SELECT NULLIF(Customer_Name, '') AS Customer_Name
FROM Orders;

--Count non-null values.
SELECT COUNT(Unit_Price) AS Non_Null_Count
FROM Orders;

--Filter records where price is NULL or 0.
SELECT *
FROM Orders
WHERE Unit_Price IS NULL
   OR Unit_Price = 0;

--Use CASE to handle NULL values.
SELECT
  CASE
     WHEN Unit_Price IS NULL THEN 0
     ELSE Unit_Price
  END AS Unit_Price
FROM Orders;

--Compare NULL values properly.
SELECT * FROM Orders WHERE Unit_Price IS NULL;

--Handle NULL in aggregation.
SELECT SUM(NVL(Unit_Price, 0)) AS Total_Sales
FROM Orders;

--Find average excluding NULL values.
SELECT AVG(Unit_Price) AS Avg_Price
FROM Orders;

--Find sum ignoring NULL values.
SELECT SUM(Unit_Price) AS Total
FROM Orders;

--Identify columns containing NULL using metadata.
SELECT column_name, nullable
FROM user_tab_columns
WHERE table_name = 'ORDERS';

--Convert NULL to default system date.
SELECT NVL(Order_Date, SYSDATE) AS Order_Date
FROM Orders;