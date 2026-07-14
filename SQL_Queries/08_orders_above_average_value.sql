SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    soh.CustomerID,
    CAST(soh.TotalDue AS DECIMAL(18,2)) AS OrderValue
FROM SalesLT.SalesOrderHeader AS soh
WHERE soh.TotalDue > (
    SELECT AVG(TotalDue)
    FROM SalesLT.SalesOrderHeader
)
ORDER BY
    OrderValue DESC;