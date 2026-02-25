
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


-----Write a query to convert all customer names to uppercase.
SELECT UPPER(Customer_Name) AS customer_name FROM Orders;

-----Extract the first 5 characters from Product_Name.
SELECT SUBSTR(Product_name,1,5) AS product_name FROM Orders;

-----Find the length of each Customer_Name.
SELECT LENGTH(customer_name) As name_length FROM Orders;

-----Replace the word "Rice" with "Premium Rice" in Product_Name.
SELECT REPLACE(product_name, 'Rice', 'Premium Rice') AS updated_product FROM Orders;

-----Remove leading and trailing spaces from Customer_Name.
SELECT TRIM(customer_name) AS cleaned_name FROM Orders;

-----Concatenate First_Name and Last_Name as Full_Name.
SELECT Customer_Id || ' ' || Customer_Name AS Full_Name FROM Orders;


-----Find customers whose names start with 'A'.
SELECT * FROM Orders WHERE SUBSTR(Customer_Name,1,1) = 'A';

ALTER TABLE Orders
DROP COLUMN EMAIL_ID;

ALTER TABLE Orders
ADD EMAIL_ID VARCHAR2(100);

UPDATE orders SET email_id = 'ravi.kumar@gmail.com' WHERE order_id = 1001;
UPDATE orders SET email_id = 'sneha.reddy@yahoo.com' WHERE order_id = 1002;
UPDATE orders SET email_id = 'arjun.mehta@outlook.com' WHERE order_id = 1003;
UPDATE orders SET email_id = 'priya.sharma@gmail.com' WHERE order_id = 1004;
UPDATE orders SET email_id = 'kiran.rao@icloud.com' WHERE order_id = 1005;
UPDATE orders SET email_id = 'neha.verma@hotmail.com' WHERE order_id = 1006;
UPDATE orders SET email_id = 'rahul.das@gmail.com' WHERE order_id = 1007;
UPDATE orders SET email_id = 'anjali.nair@protonmail.com' WHERE order_id = 1008;
UPDATE orders SET email_id = 'suresh.patel@yahoo.com' WHERE order_id = 1009;
UPDATE orders SET email_id = 'meena.iyer@gmail.com' WHERE order_id = 1010;

DESC Orders;

--Extract the domain name from Email_ID.
SELECT SUBSTR(email_id, INSTR(email_id, '@') + 1) AS domain_name FROM Orders;
 
--Find the position of '@' in Email_ID.
SELECT INSTR(email_Id, '@') AS at_position FROM Orders;

--Reverse the Product_Name.
SELECT REVERSE(Product_Name) AS Reversed_Name FROM Orders;

--Convert the first letter of each word in Product_Name to uppercase.
SELECT INITCAP(Product_Name) AS Product_Name FROM Orders;

--Extract the last 3 characters from Order_ID.
SELECT SUBSTR(order_id, -3) AS last_3_chars FROM Orders;

--Count how many times letter 'a' appears in Customer_Name.
SELECT 
LENGTH(customer_name) - LENGTH(REPLACE(LOWER(customer_name), 'a', '')) AS count_of_a
FROM Orders;

ALTER TABLE Orders
DROP COLUMN Phone_Number;

ALTER TABLE Orders
ADD Phone_Number VARCHAR2(15);
UPDATE Orders
SET Phone_Number = 
CASE Order_ID
    WHEN 1001 THEN '9876543210'
    WHEN 1002 THEN '9876543211'
    WHEN 1003 THEN '9876543212'
    WHEN 1004 THEN '9876543213'
    WHEN 1005 THEN '9876543214'
    WHEN 1006 THEN '9876543215'
    WHEN 1007 THEN '9876543216'
    WHEN 1008 THEN '9876543217'
    WHEN 1009 THEN '9876543218'
    WHEN 1010 THEN '9876543219'
END
WHERE Order_ID BETWEEN 1001 AND 1010;

COMMIT;

--Mask the last 4 digits of a phone number.
SELECT 
SUBSTR(phone_number, 1, LENGTH(phone_number) - 4) || '****' AS masked_phone
FROM Orders
WHERE phone_number IS NOT NULL;
--Split Full_Name into First_Name and Last_Name.
SELECT 
SUBSTR(Customer_Name, 1, INSTR(Customer_Name, ' ') - 1) AS first_name,
SUBSTR(Customer_Name, INSTR(Customer_Name, ' ') + 1) AS last_name
FROM Orders;

ALTER TABLE Orders
ADD product_code VARCHAR2(50);

UPDATE Orders
SET product_code =
CASE Order_ID
    WHEN 1001 THEN 'AB-101@#'
    WHEN 1002 THEN 'CD-202$%'
    WHEN 1003 THEN 'EF-303!&'
    WHEN 1004 THEN 'GH-404*^'
    WHEN 1005 THEN 'IJ-505()'
    WHEN 1006 THEN 'KL-606++'
    WHEN 1007 THEN 'MN-707=='
    WHEN 1008 THEN 'OP-808??'
    WHEN 1009 THEN 'QR-909//'
    WHEN 1010 THEN 'ST-1000@@'
END
WHERE Order_ID BETWEEN 1001 AND 1010;

COMMIT;

--Remove all special characters from Product_Code.
SELECT Order_ID, product_code
FROM Orders
WHERE Order_ID BETWEEN 1001 AND 1010;

DESC Orders;
--Compare two columns ignoring case sensitivity.

--Find customers whose name contains 'kumar'.
SELECT *
FROM Orders
WHERE LOWER(customer_name) LIKE '%kumar%';
--Pad Order_ID with leading zeros to make it 6 digits.
SELECT LPAD(order_id, 6, '0') AS padded_order_id
FROM Orders;
--Extract substring between two characters.
