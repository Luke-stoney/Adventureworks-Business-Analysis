SELECT TOP 10
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    c.CompanyName,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders,
    CAST(SUM(soh.TotalDue) AS DECIMAL(18, 2)) AS TotalRevenue
FROM SalesLT.Customer AS c
INNER JOIN SalesLT.SalesOrderHeader AS soh
    ON c.CustomerID = soh.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.CompanyName
ORDER BY
    TotalRevenue DESC;