SELECT
    t1.Season,
    --t1.Nation,
    SUM(t1.TotalRevenue) AS TotalRevenue,
    t0.Season AS PrevSeason,
    t0.TotalRevenue AS PrevTotalRevenue,
    SUM(t1.TotalRevenue) - t0.TotalRevenue AS 'Growth Amount',
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100, 2), 'N', 'en-gb') AS 'Growth %',    
    POWER((SUM(t1.TotalRevenue) / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        --Nation,
        SUM(TotalRevenue) AS TotalRevenue
    FROM MoneyLeagueRevenueByClub
    GROUP BY Season --, Nation
) t0
ON t1.Season = t0.Season + 7
--AND t1.Nation = t0.Nation
WHERE t0.Season IS NOT NULL
GROUP BY t1.Season, t0.Season, t0.TotalRevenue