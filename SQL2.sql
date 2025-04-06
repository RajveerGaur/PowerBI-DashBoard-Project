CREATE DATABASE DataAnalytics;
USE DataAnalytics;

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    Product VARCHAR(100),
    Category VARCHAR(50),
    QuantitySold INT,
    PricePerUnit DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO Sales (Product, Category, QuantitySold, PricePerUnit, SaleDate) VALUES
('Laptop', 'Electronics', 5, 1200.00, '2024-03-01'),
('Smartphone', 'Electronics', 10, 800.00, '2024-03-02'),
('Headphones', 'Accessories', 15, 150.00, '2024-03-05'),
('Tablet', 'Electronics', 7, 500.00, '2024-03-07'),
('Smartwatch', 'Accessories', 12, 250.00, '2024-03-10');

select * from Sales;

SELECT SUM(QuantitySold * PricePerUnit) AS TotalRevenue FROM Sales;

SELECT Category, SUM(QuantitySold * PricePerUnit) AS Revenue FROM Sales GROUP BY Category;

SELECT Product, SUM(QuantitySold) AS TotalUnitsSold FROM Sales GROUP BY Product ORDER BY TotalUnitsSold DESC;

SELECT SaleDate, SUM(QuantitySold * PricePerUnit) AS DailyRevenue FROM Sales GROUP BY SaleDate ORDER BY SaleDate;
