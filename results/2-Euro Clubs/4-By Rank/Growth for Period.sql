SELECT
    t1.Season,
    --t1.Nation,
    t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue AS TotalRevenue,
    t0.Season AS PrevSeason,
    t0.TotalRevenue AS PrevTotalRevenue,
    --t0.RevenueRank,
    t0.Club,
    t1.TotalRevenue - t0.TotalRevenue AS 'Growth Amount',
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue) * 100, 2), 'N', 'en-gb') AS 'Growth %',
    POWER((t1.TotalRevenue / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        RevenueRank,
        Club,
        TotalRevenue AS TotalRevenue
    FROM MoneyLeagueRevenueByClub
    --GROUP BY Season, Nation, RevenueRank
) t0
ON t1.Season = t0.Season + 7
--AND t1.Nation = t0.Nation
AND t1.RevenueRank = t0.RevenueRank
--GROUP BY t1.Season, t1.Nation, t1.RevenueRank, t0.Season, t0.TotalRevenue
WHERE t1.Season = 2022
ORDER BY CAGR DESC



SELECT *
FROM MoneyLeagueRevenueByClub
WHERE Season = 2015
AND Nation = 'England'

SELECT 
    Season,
    Nation,
    COUNT(Club)
FROM MoneyLeagueRevenueByClub
WHERE Season IN (2015, 2022)
GROUP BY Nation, Season