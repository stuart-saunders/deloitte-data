SELECT 
    --t1.Season,
    SUM(t1.TotalRevenue) AS [2022 Revenue (£m)],
    --t0.Season,
    SUM(t0.TotalRevenue) AS [2015 Revenue (£m)],
    SUM(t1.TotalRevenue - t0.TotalRevenue) AS [Growth (£m)],
    CAST(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue)) * 100 AS DECIMAL(10,2)) AS [Growth (%)],
    --POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR,
    --ROUND((POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100, 2) AS [CAGR (%)],
    CAST((POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100 AS DECIMAL(10,2)) AS [CAGR (%)]
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022
GROUP BY t1.Season, t0.Season