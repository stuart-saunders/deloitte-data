-- SELECT
--     t1.Season,
--     t1.Grouping,
--     SUM(t1.Revenue) AS CombinedRevenue,
--     t0.Season,
--     SUM(t0.Revenue) AS CombinedPrevRevenue,
--     SUM(t1.Revenue) - SUM(t0.Revenue) AS CombinedRevenueChange,
--     FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue)) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange,
--     POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
-- FROM PLGrowthBySeasonAndGrouping t1
-- LEFT OUTER JOIN PLGrowthBySeasonAndGrouping t0 
--     --ON t1.Season = t0.Season + 1 --Per Year
--     ON t1.Season = t0.Season + 7 --Per Period
--     AND t1.Grouping = t0.Grouping
-- WHERE t1.Season = 2022
-- --AND Grouping = 'All'
-- --AND Grouping = 'Top 5'
-- --AND Grouping = 'Mid-Top'
-- --AND Grouping = 'Mid-Bottom'
-- --AND Grouping = 'Bottom 5'
-- GROUP BY t1.Season, t1.Grouping, t0.Season
-- ORDER BY (SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue) DESC


-- SELECT
--     t1.Grouping,
--     FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue)) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange,
--     POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
-- FROM PLGrowthBySeasonAndGrouping t1
-- LEFT OUTER JOIN PLGrowthBySeasonAndGrouping t0 
--     ON t1.Season = t0.Season + 7 --Per Period
--     AND t1.Grouping = t0.Grouping
-- WHERE t1.Season = 2022
-- GROUP BY t1.Grouping, t1.Season, t0.Season
-- ORDER BY CAGR DESC


SELECT
    t1.Grouping,
    SUM(t1.Revenue) AS [2022 Revenue (£m)],
    FORMAT((ROUND(((SUM(t1.Revenue) / t22.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2022 Rev Share (%)],
    SUM(t0.Revenue) AS [2015 Revenue (£m)],
    FORMAT((ROUND(((SUM(t0.Revenue) / t15.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2015 Rev Share (%)],
    SUM(t1.Revenue) - SUM(t0.Revenue) AS [Growth (£m)],
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue)) * 100, 2), 'N', 'en-gb') AS [Growth (%)],
    --POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR,
    CAST((POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100 AS DECIMAL(10,3)) AS [CAGR (%)]

FROM PLGrowthBySeasonAndGrouping t1
LEFT OUTER JOIN PLGrowthBySeasonAndGrouping t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Per Period
    AND t1.Grouping = t0.Grouping
CROSS JOIN (
  SELECT SUM(Revenue) AS [TotalRevenue]
  FROM PLGrowthBySeasonAndGrouping
  WHERE Season = 2022 AND [Grouping] = 'All'
) t22
CROSS JOIN (
  SELECT SUM(Revenue) AS [TotalRevenue]
  FROM PLGrowthBySeasonAndGrouping
  WHERE Season = 2015 AND [Grouping] = 'All'
) t15
WHERE t1.Season = 2022
AND t1.Grouping != 'All'
--AND Grouping = 'Top 5'
--AND Grouping = 'Mid-Top'
--AND Grouping = 'Mid-Bottom'
--AND Grouping = 'Bottom 5'
GROUP BY t1.Grouping, t1.Season, t0.Season, t22.TotalRevenue, t15.TotalRevenue
ORDER BY (SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue) DESC