SELECT
    t1.Season,
    SUM(t1.TotalRevenue) AS 'Total Revenue (£m)',
    --STDEV(t1.TotalRevenue) AS 'Std Deviation',
    CAST(STDEV(t1.TotalRevenue) AS DECIMAL(10,2)) AS [Std Dev],
    --AVG(t1.TotalRevenue) AS Mean,
    CAST(AVG(t1.TotalRevenue) AS DECIMAL(10,2)) AS [Mean],
    --(STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100 AS 'Coefficient of Variation'
    CAST((STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100 AS DECIMAL(10,2)) AS [Coefficient of Variation]
FROM PLRevenueByClub t1
GROUP BY t1.Season