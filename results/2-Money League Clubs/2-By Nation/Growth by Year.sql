-- SELECT * FROM MoneyLeagueRevenueByClub WHERE Season = 2019

SELECT
    t1.Season,
    t1.Nation,
    SUM(t1.TotalRevenue) AS [Revenue (€m)],
    t0.Season AS [Previous Season],
    t0.TotalRevenue AS [Revenue (€m)],
    SUM(t1.TotalRevenue) - t0.TotalRevenue AS 'Growth (€m)',
    CAST(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100 AS DECIMAL(10,2)) AS [Growth (%)]
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        SUM(TotalRevenue) AS TotalRevenue
    FROM MoneyLeagueRevenueByClub
    GROUP BY Season, Nation
) t0
ON t1.Season = t0.Season + 1
AND t1.Nation = t0.Nation
WHERE t1.Nation = 'England'
GROUP BY t1.Season, t1.Nation, t0.Season, t0.TotalRevenue
