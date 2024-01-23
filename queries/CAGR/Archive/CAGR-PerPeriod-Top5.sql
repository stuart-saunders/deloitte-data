
SELECT 
    t1.Season,
    SUM(t1.Revenue) AS TotalRevenue,
    SUM(t0.PrevRevenue) AS 'TotalPrevRevenue',
    (SUM(t1.Revenue) - SUM(t0.PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.PrevRevenue)) / SUM(t0.PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR t1
LEFT OUTER JOIN CAGR t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 6 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022 
AND t1.RevenueRank BETWEEN 1 AND 5
GROUP BY t1.Season

--/*
SELECT 
    t1.Season AS Current_Season,
    SUM(t1.TotalRevenue) AS Top5_Current_Revenue,
    SUM(t0.TotalRevenue) AS '2015_Top5_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
    --AND t1.LeaguePosition = t0.LeaguePosition
WHERE t1.Season = '2022'
  AND (t1.LeaguePosition BETWEEN 1 AND 5)
GROUP BY t1.Season
--*/

SELECT SUM(TotalRevenue)
FROM PLRevenueByClub
--WHERE RevenueRank BETWEEN 1 AND 5
WHERE Season = 2022

SELECT SUM(TotalRevenue)
FROM PLRevenueByClub
--WHERE RevenueRank BETWEEN 1 AND 5
WHERE Season = 2015