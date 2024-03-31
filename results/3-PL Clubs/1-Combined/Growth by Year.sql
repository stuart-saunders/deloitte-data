SELECT 
    t1.Season,
    SUM(t1.TotalRevenue) AS [Revenue (£m)],
    t0.Season AS [Previous Season],
    SUM(t0.TotalRevenue) AS [Previous Revenue (£m)],
    SUM(t1.TotalRevenue - t0.TotalRevenue) AS [Growth (£m)],
    CAST(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue)) * 100 AS DECIMAL(10,2)) AS [Growth (%)]
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 --Over Period
    AND t1.RevenueRank = t0.RevenueRank
GROUP BY t1.Season, t0.Season



-- SELECT
--     Season,
--     SUM(Revenue) AS CombinedRevenue,
--     PrevSeason,
--     SUM(PrevRevenue) AS CombinedPrevRevenue,
--     SUM(RevenueChange) AS CombinedRevenueChange,
--     FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue)) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
-- FROM PLGrowthBySeasonAndRank
-- GROUP BY Season, PrevSeason