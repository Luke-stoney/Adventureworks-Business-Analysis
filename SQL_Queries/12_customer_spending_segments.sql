WITH CustomerSpending AS
(
    SELECT
        c.CustomerID,
        CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
        COUNT(soh.SalesOrderID) AS TotalOrders,
        CAST(SUM(soh.TotalDue) AS DECIMAL(18,2)) AS TotalSpent
    FROM SalesLT.Customer AS c
    INNER JOIN SalesLT.SalesOrderHeader AS soh
        ON c.CustomerID = soh.CustomerID
    GROUP BY
        c.CustomerID,
        c.FirstName,
        c.LastName
)

SELECT
    CustomerID,
    CustomerName,
    TotalOrders,
    TotalSpent,
    CASE
        WHEN TotalSpent >= 100000 THEN 'High Value'
        WHEN TotalSpent >= 50000 THEN 'Medium Value'
        ELSE 'Lower Value'
    END AS CustomerSegment
FROM CustomerSpending
ORDER BY
    TotalSpent DESC;