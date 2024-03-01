-- SELECT * FROM PLRevenueByClub

-- What conclusions can be drawn

SELECT 
    t1.Season,
    --t1.RevenueRank,
    --t1.Club,
    --t1.TotalRevenue,
    SUM(t1.TotalRevenue) AS CombinedRevenue,
    t0.Season,
    --t0.RevenueRank,
    --t0.Club,
    --t0.TotalRevenue,
    SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
    --t1.TotalRevenue - t0.TotalRevenue,
    --SUM(t1.TotalRevenue - t0.TotalRevenue) AS CombinedRevenueChange,
    --FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue)) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
    POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
    --FORMAT(ROUND((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
    --SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022
GROUP BY t1.Season, t0.Season




-- SELECT
--     --t1.Category,
--    -- t1.RevenueRank,
--     t1.Season,
--     SUM(t1.Revenue) AS TotalRevenue,
--     --t1.CumulativeRevenue,
--     t0.Season,
--     SUM(t0.Revenue) AS TotalPrevRevenue,
--     -- POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season) + 1))) - 1 AS CAGR
--     POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
-- FROM PLGrowthBySeasonAndRank t1
-- LEFT OUTER JOIN PLGrowthBySeasonAndRank t0 
--     ON t1.Season = t0.Season + 7 --Per Period
--     --ON t1.Season = t0.Season + 1
--     AND t1.RevenueRank = t0.RevenueRank
-- WHERE 
--     t1.Season = '2022'
-- --     AND t0.PrevRevenue IS NOT NULL
-- --     AND t0.Season IS NOT NULL
-- GROUP BY
--     t1.Season, t0.Season
-- --ORDER BY t1.Season DESC, 
