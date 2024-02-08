DECLARE @StartSeason INT;
DECLARE @EndSeason INT;

SET @EndSeason = 2022;
SET @StartSeason = 2015;

SELECT 
    t1.Season AS 'End Season',
    SUM(t1.TotalRevenue) AS 'End Revenue',
    t0.Season AS 'Start Season',
    SUM(t0.TotalRevenue) AS 'Start Revenue',
    SUM(t1.TotalRevenue - t0.TotalRevenue) AS 'Growth Amount',
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue)) * 100, 2), 'N', 'en-gb') AS 'Growth %',    
    POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 7 --7 Year Period
    ON t1.Season = t0.Season + (@EndSeason - @StartSeason)
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022
GROUP BY t1.Season, t0.Season