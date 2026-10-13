USE order_management;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL,
    Order_Status VARCHAR(20) NOT NULL,
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID)
);

CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID)
    REFERENCES Product(Product_ID)
);
SHOW TABLES;

DESCRIBE Customer;
DESCRIBE Product;
DESCRIBE Orders;
DESCRIBE Order_Details;

SELECT * FROM Customer;

SELECT * FROM Product;

SELECT * FROM Orders;

SELECT * FROM Order_Details;

USE order_management;

SELECT * FROM Orders
WHERE Order_ID BETWEEN 1001 AND 1005;

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES (1001, 1, '2026-10-01', 55000.00, 'Pending');

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES (1002, 2, '2026-10-02', 650.00, 'Shipped');

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES (1003, 3, '2026-10-03', 1800.00, 'Delivered');

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES (1004, 4, '2026-10-04', 2500.00, 'Pending');

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES (1005, 5, '2026-10-05', 900.00, 'Shipped');

SELECT Product_ID, Product_Name FROM Product;
SELECT * FROM Orders;

SELECT * FROM Order_Details;

SELECT *
FROM Order_Details
WHERE Order_Detail_ID BETWEEN 1001 AND 1005;

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Price)
VALUES (1001, 1001, 1, 1, 55000.00);

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Price)
VALUES (1002, 1002, 2, 1, 650.00);

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Price)
VALUES (1003, 1003, 5, 1, 1800.00);

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Price)
VALUES (1004, 1004, 6, 1, 2500.00);

INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Price)
VALUES (1005, 1005, 10, 1, 900.00);

SELECT * FROM Order_Details;

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES (1006, 1, '2026-10-06', 1200.00, 'Pending');

UPDATE Orders
SET Order_Status = 'Shipped'
WHERE Order_ID = 1001;

UPDATE Orders
SET Total_Amount = 56000.00
WHERE Order_ID = 1001;

UPDATE Order_Details
SET Quantity = 2
WHERE Order_Detail_ID = 1001;

DELETE FROM Order_Details
WHERE Order_Detail_ID = 1005;

SELECT o.Order_ID, c.Customer_Name,
       o.Order_Date, o.Total_Amount, o.Order_Status
FROM Orders o
JOIN Customer c
ON o.Customer_ID = c.Customer_ID;

SELECT o.Order_ID, p.Product_Name,
       od.Quantity, od.Price
FROM Order_Details od
JOIN Orders o ON od.Order_ID = o.Order_ID
JOIN Product p ON od.Product_ID = p.Product_ID;

SELECT c.Customer_Name,
       SUM(o.Total_Amount) AS Total_Spent
FROM Customer c
JOIN Orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name;

SELECT Order_Status, COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Status;

SELECT p.Product_Name,
       SUM(od.Quantity) AS Total_Quantity_Sold
FROM Product p
JOIN Order_Details od ON p.Product_ID = od.Product_ID
GROUP BY p.Product_ID, p.Product_Name;

select * from Order_Details;