SELECT
    t1.Season,
    SUM(t1.TotalRevenue) AS 'Total Revenue (€m)',
    -- STDEV(t1.TotalRevenue) AS 'Std Deviation',
    ROUND(STDEV(t1.TotalRevenue), 2) AS 'Std Dev',
    -- AVG(t1.TotalRevenue) AS Mean,
    CAST(AVG(t1.TotalRevenue) AS DECIMAL(10,2)) AS [Mean],
    -- (STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100 AS 'Coefficient of Variation',
    --ROUND((STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100, 2) AS 'Coefficient of Variation',
    CAST((STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100 AS DECIMAL(10,2)) AS [Coefficient of Variation]
FROM MoneyLeagueRevenueByClub t1
GROUP BY t1.Season

-- FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue) * 100, 2), 'N', 'en-gb') AS 'Growth %',