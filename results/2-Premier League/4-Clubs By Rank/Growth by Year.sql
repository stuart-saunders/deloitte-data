--SELECT * FROM PLGrowthBySeasonAndRank

SELECT 
    t1.Season,
    t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue,
    t0.Season,
    t0.RevenueRank,
    t0.Club,
    t0.TotalRevenue,
    t1.TotalRevenue - t0.TotalRevenue AS RevenueChange,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    AND t1.RevenueRank = t0.RevenueRank


/*
SELECT RevenueRank, SUM(TotalRevenue)
FROM PLRevenueByClub
WHERE Season = 2022
GROUP BY RevenueRank
ORDER BY SUM(TotalRevenue)
*/