SELECT
    Season,
    Grouping,
    SUM(Revenue) AS CombinedRevenue,
    PrevSeason,
    SUM(PrevRevenue) AS CombinedPrevRevenue,
    SUM(RevenueChange) AS CombinedRevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue)) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM PLGrowthBySeasonAndGrouping
--WHERE Grouping = 'All'
--WHERE Grouping = 'Top 5'
--WHERE Grouping = 'Middle-Top'
--WHERE Grouping = 'Middle-Bottom'
--WHERE Grouping = 'Bottom 5'
GROUP BY Season, Grouping, PrevSeason
--ORDER BY (SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) DESC








-- SELECT 
--     t1.Season,
--     'All' AS Grouping,
--     --t1.RevenueRank,
--     --t1.Club,
--     SUM(t1.TotalRevenue) AS Revenue,
--     t0.Season,
--     --t0.RevenueRank,
--     --t0.Club,
--     SUM(t0.TotalRevenue) AS PrevRevenue,
--     (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS RevenueChange,
--     --t1.TotalRevenue - t0.TotalRevenue,
--     FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb'),
--     SUM(SUM(t1.TotalRevenue)) OVER (ORDER BY t1.Season) AS CumulativeRevenue,
--     SUM(SUM(t1.TotalRevenue)) OVER () AS TotalRevenue
-- FROM PLRevenueByClub t1
-- LEFT OUTER JOIN PLRevenueByClub t0 
--     ON t1.Season = t0.Season + 1 --Per Year
--     AND t1.RevenueRank = t0.RevenueRank
-- GROUP BY t1.Season, t0.Season