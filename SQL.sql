CREATE DATABASE DataAnalytics2;
USE DataAnalytics2;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    Product VARCHAR(100),
    Category VARCHAR(50),
    QuantitySold INT,
    PricePerUnit DECIMAL(10,2),
    SaleDate DATE
);	

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Region VARCHAR(50)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    SaleID INT,
    CustomerID INT,
    PurchaseDate DATE,
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Sales (Product, Category, QuantitySold, PricePerUnit, SaleDate) VALUES
('Laptop', 'Electronics', 5, 1200.00, '2024-03-01'),
('Smartphone', 'Electronics', 10, 800.00, '2024-03-02'),
('Headphones', 'Accessories', 15, 150.00, '2024-03-05'),
('Tablet', 'Electronics', 7, 500.00, '2024-03-07'),
('Smartwatch', 'Accessories', 12, 250.00, '2024-03-10');

INSERT INTO Customers (Name, Email, Region) VALUES
('Alice Johnson', 'alice@example.com', 'North America'),
('Bob Smith', 'bob@example.com', 'Europe'),
('Charlie Brown', 'charlie@example.com', 'Asia');

INSERT INTO Transactions (SaleID, CustomerID, PurchaseDate) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-05'),
(4, 1, '2024-03-07'),
(5, 2, '2024-03-10');

SELECT SUM(QuantitySold * PricePerUnit) AS TotalRevenue FROM Sales;

SELECT Category, SUM(QuantitySold * PricePerUnit) AS Revenue FROM Sales GROUP BY Category;

SELECT Product, SUM(QuantitySold) AS TotalUnitsSold FROM Sales GROUP BY Product ORDER BY TotalUnitsSold DESC;

SELECT SaleDate, SUM(QuantitySold * PricePerUnit) AS DailyRevenue FROM Sales GROUP BY SaleDate ORDER BY SaleDate;

SELECT Customers.Name, Sales.Product, Sales.Category, Sales.PricePerUnit, Transactions.PurchaseDate
FROM Transactions
JOIN Sales ON Transactions.SaleID = Sales.SaleID
JOIN Customers ON Transactions.CustomerID = Customers.CustomerID
ORDER BY Transactions.PurchaseDate;

SELECT Customers.Region, SUM(Sales.QuantitySold * Sales.PricePerUnit) AS Revenue
FROM Transactions
JOIN Sales ON Transactions.SaleID = Sales.SaleID
JOIN Customers ON Transactions.CustomerID = Customers.CustomerID
GROUP BY Customers.Region;
