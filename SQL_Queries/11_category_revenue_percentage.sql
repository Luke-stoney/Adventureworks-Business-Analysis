SELECT
    pc.Name AS CategoryName,
    CAST(SUM(sod.LineTotal) AS DECIMAL(18,2)) AS CategoryRevenue,
    CAST(
        SUM(sod.LineTotal) * 100.0
        / SUM(SUM(sod.LineTotal)) OVER ()
        AS DECIMAL(5,2)
    ) AS RevenuePercentage
FROM SalesLT.ProductCategory AS pc
INNER JOIN SalesLT.Product AS p
    ON pc.ProductCategoryID = p.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail AS sod
    ON p.ProductID = sod.ProductID
GROUP BY
    pc.Name
ORDER BY
    RevenuePercentage DESC;