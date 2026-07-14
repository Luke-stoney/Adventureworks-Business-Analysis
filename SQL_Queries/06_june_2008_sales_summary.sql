SELECT
    YEAR(OrderDate) AS SalesYear,
    MONTH(OrderDate) AS SalesMonth,
    COUNT(SalesOrderID) AS TotalOrders,
    CAST(SUM(TotalDue) AS DECIMAL(18, 2)) AS TotalRevenue,
    CAST(AVG(TotalDue) AS DECIMAL(18, 2)) AS AverageOrderValue
FROM SalesLT.SalesOrderHeader
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate);