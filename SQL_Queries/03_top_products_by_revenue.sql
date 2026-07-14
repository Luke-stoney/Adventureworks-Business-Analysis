SELECT TOP 10
    p.ProductID,
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    CAST(SUM(sod.LineTotal) AS DECIMAL(18, 2)) AS TotalRevenue
FROM SalesLT.Product AS p
INNER JOIN SalesLT.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
GROUP BY
    p.ProductID,
    p.Name
ORDER BY
    TotalRevenue DESC;