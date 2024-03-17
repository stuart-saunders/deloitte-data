SELECT
    t1.Season,
    t1.Nation,
    t1.Club,
    SUM(t1.TotalRevenue) AS TotalRevenue,
    t0.Season AS PrevSeason,
    t0.TotalRevenue AS PrevTotalRevenue,
    SUM(t1.TotalRevenue) - t0.TotalRevenue AS 'Growth Amount',
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100, 2), 'N', 'en-gb') AS 'Growth %'
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        Club,
        SUM(TotalRevenue) AS TotalRevenue
    FROM MoneyLeagueRevenueByClub
    GROUP BY Season, Nation, Club
) t0
ON t1.Season = t0.Season + 1
AND t1.Nation = t0.Nation
AND t1.Club = t0.Club
GROUP BY t1.Season, t1.Nation, t1.Club, t0.Season, t0.TotalRevenue
ORDER BY t1.Season, SUM(t1.TotalRevenue) DESC