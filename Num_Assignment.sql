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
   'Home & Kitchen', 'Pressure Cooker', 1, 1899, 'Credit Card', 'Pune')

SELECT * FROM dual;

COMMIT;








--1)Round Unit_Price to 2 decimal places.
SELECT ROUND(Unit_Price, 2) AS Rounded_Price
FROM Orders;

--2)Find total sales per order.
SELECT 
    Order_ID,
    SUM(Quantity * Unit_Price) AS Total_Sales
FROM Orders
GROUP BY Order_ID;
--3)Calculate average order value.
SELECT AVG(Quantity * Unit_Price) AS Avg_Order_Value
FROM Orders;

--4)Find highest product price.
SELECT MAX(Unit_Price) FROM Orders;

--5)Find lowest product price.
SELECT MIN(Unit_Price) FROM Orders;

--6)Calculate percentage discount applied.(IF discount is 10%)
SELECT Order_ID,
       (Quantity * Unit_Price) * (10/100) AS Discount_Amount
FROM Orders;

--7)Find modulus of Quantity divided by 2.
SELECT MOD(Quantity, 2) AS Remainder FROM Orders;

--8)Convert negative values to positive.
SELECT ABS(Unit_Price) AS Positive FROM Orders;

--9)Truncate price without rounding.
SELECT TRUNC(Unit_Price,1) AS Truncated_price FROM Orders;

--10)Find square root of total sales.
SELECT SQRT(Quantity * Unit_Price) AS square_root FROM Orders;

--11)Calculate exponential value of a number.
SELECT EXP(quantity) AS Exponential_value FROM orders;

--12)Calculate power of 2^5.
SELECT POWER(2,5) FROM DUAL;

--13)Find absolute difference between two prices.
SELECT ABS(Order_ID - Unit_Price) As Difference FROM Orders;

--14)Calculate sales growth percentage.


--15)Find random number between 1 and 100.
SELECT TRUNC(DBMS_RANDOM.value(1,101)) AS random FROM DUAL;

--16)Divide total sales by number of orders.
SELECT SUM(Quantity * Unit_Price) / COUNT(Order_ID) AS Avg_Sales
FROM Orders;

--17)Find ceiling value of price.
SELECT CEIL(Unit_Price) AS Ceiling_Value
FROM Orders;

--18)Find floor value of price.
SELECT FLOOR(Unit_Price) AS Floor_Value
FROM Orders;

--19)Convert decimal to integer.
SELECT ROUND(Unit_Price) AS Integer_Value
FROM Orders;

--20)Calculate compound interest.
SELECT 10000 * POWER((1 + 0.10/1), 1*2) AS Compound_Amount
FROM dual;