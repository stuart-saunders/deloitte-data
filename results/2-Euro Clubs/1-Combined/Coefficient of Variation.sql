SELECT
    t1.Season,
    SUM(t1.TotalRevenue) AS 'Total Revenue',
    STDEV(t1.TotalRevenue) AS 'Std Deviation',
    AVG(t1.TotalRevenue) AS Mean,
    (STDEV(t1.TotalRevenue) / AVG(t1.TotalRevenue)) * 100 AS 'Coefficient of Variation'
FROM MoneyLeagueRevenueByClub t1
GROUP BY t1.Season
