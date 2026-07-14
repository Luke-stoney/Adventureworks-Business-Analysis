SELECT
    pc.Name AS CategoryName,
    p.Name AS ProductName,
    CAST(SUM(sod.LineTotal) AS DECIMAL(18,2)) AS ProductRevenue,
    RANK() OVER (
        PARTITION BY pc.Name
        ORDER BY SUM(sod.LineTotal) DESC
    ) AS RevenueRank
FROM SalesLT.ProductCategory AS pc
INNER JOIN SalesLT.Product AS p
    ON pc.ProductCategoryID = p.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
GROUP BY
    pc.Name,
    p.Name
ORDER BY
    pc.Name,
    RevenueRank;