SELECT TOP 20
    p.ProductID,
    p.Name AS ProductName,
    pc.Name AS CategoryName,
    CAST(p.ListPrice AS DECIMAL(18,2)) AS ListPrice
FROM SalesLT.Product AS p
LEFT JOIN SalesLT.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
LEFT JOIN SalesLT.ProductCategory AS pc
    ON p.ProductCategoryID = pc.ProductCategoryID
WHERE sod.ProductID IS NULL
ORDER BY
    pc.Name,
    p.Name;