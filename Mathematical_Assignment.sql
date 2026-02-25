DROP TABLE Orders;
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


--Find sine value of an angle.
SELECT SIN(1) FROM dual;

--Find cosine value of an angle.
SELECT COS(1) FROM dual;

--Find tangent value.
SELECT TAN(1) FROM dual;

--Convert degrees to radians.
SELECT 45 * (ACOS(-1)/180) FROM dual;

--Convert radians to degrees.
SELECT 1 * (180/ACOS(-1)) FROM dual;

--Find logarithm (base 10) of a number.
SELECT LOG(10, 100) FROM dual;

--Find natural log of a number.
SELECT LN(10) FROM dual;

--Find square of a number.
SELECT POWER(5,2) FROM dual;

--Find cube of a number.
SELECT POWER(5,3) FROM dual;

--Calculate factorial of a number.
SELECT EXP(SUM(LN(LEVEL))) AS Factorial_5
FROM dual
CONNECT BY LEVEL <= 5;

--Find greatest value among three numbers.
SELECT GREATEST(10,20,30) FROM dual;

--Find least value among three numbers.
SELECT LEAST(10,20,30) FROM dual;


--Calculate variance of sales.
SELECT VARIANCE(Quantity * Unit_Price)
FROM Orders;

--Calculate standard deviation of sales.
SELECT STDDEV(Quantity * Unit_Price)
FROM Orders;

--Find average deviation.
SELECT AVG(ABS(Sales - AVG(Sales) OVER()))
FROM Orders;

--Calculate geometric mean.
SELECT EXP(AVG(LN(Sales)))
FROM Orders;

--Calculate harmonic mean.
SELECT COUNT(*) / SUM(1/Sales)
FROM Orders;

--Find sum of squares.
SELECT SUM(POWER(Sales,2))
FROM Orders;

--Calculate correlation between two columns.
SELECT CORR(Sales, Profit)
FROM Orders;

--Calculate regression slope.
SELECT REGR_SLOPE(Sales, Profit)
FROM Orders;