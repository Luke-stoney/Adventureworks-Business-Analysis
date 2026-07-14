SELECT
    pc.Name AS ProductCategory,
    CAST(SUM(sod.LineTotal) AS DECIMAL(18,2)) AS TotalRevenue
FROM SalesLT.ProductCategory AS pc
INNER JOIN SalesLT.Product AS p
    ON pc.ProductCategoryID = p.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
GROUP BY
    pc.Name
ORDER BY
    TotalRevenue DESC;