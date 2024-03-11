SELECT
    t1.Season,
    SUM(t1.TotalRevenue) AS 'Total Revenue',
    --STDEV(t1.TotalRevenue) AS 'Std Deviation',
    FORMAT((ROUND((STDEV(t1.TotalRevenue)), 2)), 'N', 'en-gb') AS [Std Dev],
    --AVG(t1.TotalRevenue) AS Mean,
    FORMAT((ROUND((AVG(t1.TotalRevenue)), 2)), 'N', 'en-gb') AS Mean,
    --(STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100 AS 'Coefficient of Variation'
    FORMAT((ROUND(((STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100), 2)), 'N', 'en-gb') AS 'Coefficient of Variation'
FROM PLRevenueByClub t1
GROUP BY t1.Season