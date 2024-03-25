SELECT
    t1.Season,
    t1.Grouping,
    SUM(t1.Revenue) AS TotalRevenue,
    t0.Season,
    SUM(t0.Revenue) AS TotalPrevRevenue,
    SUM(t1.Revenue) - SUM(t0.Revenue) AS 'Growth Amount',
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue)) * 100, 2), 'N', 'en-gb') AS 'Growth %',
    POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM MLGrowthBySeasonAndGrouping t1
LEFT OUTER JOIN MLGrowthBySeasonAndGrouping t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Per Period
    AND t1.Grouping = t0.Grouping
WHERE t1.Season = 2022
AND t1.Grouping != 'All'
--AND Grouping = 'Top 5'
--AND Grouping = 'Mid-Top'
--AND Grouping = 'Mid-Bottom'
--AND Grouping = 'Bottom 5'
GROUP BY t1.Season, t1.Grouping, t0.Season
ORDER BY (SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue) DESC


SELECT
    t1.Grouping,
    SUM(t1.Revenue) AS [2022 Revenue (€m)],
    FORMAT((ROUND(((SUM(t1.Revenue) / t22.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2022 % Rev Share],
    SUM(t0.Revenue) AS [2015 Revenue (€m)],
    FORMAT((ROUND(((SUM(t0.Revenue) / t15.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2015 % Rev Share],
    SUM(t1.Revenue) - SUM(t0.Revenue) AS [Growth Amount],
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue)) * 100, 2), 'N', 'en-gb') AS [Growth %],
    POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM MLGrowthBySeasonAndGrouping t1
LEFT OUTER JOIN MLGrowthBySeasonAndGrouping t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Per Period
    AND t1.Grouping = t0.Grouping
CROSS JOIN (
  SELECT SUM(Revenue) AS [TotalRevenue]
  FROM MLGrowthBySeasonAndGrouping
  WHERE Season = 2022 AND [Grouping] = 'All'
) t22
CROSS JOIN (
  SELECT SUM(Revenue) AS [TotalRevenue]
  FROM MLGrowthBySeasonAndGrouping
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