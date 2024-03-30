-- SELECT * FROM PLGrowthBySeasonAndRevenueRank ORDER BY Season, RevenueRank

--INSERT INTO PLGrowthBySeasonAndRevenueRank
SELECT 
    t1.Season,
    t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue,
    t0.Season,
    t0.RevenueRank,
    t0.Club,
    t0.TotalRevenue,
    t1.TotalRevenue - t0.TotalRevenue,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb')
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    AND t1.RevenueRank = t0.RevenueRank


/*

SELECT 
    Season,
    'All',
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    --SUM(Revenue) + SUM(PrevRevenue) AS CumulativeRevenue,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR
GROUP BY Season

*/