-- BIG 6
SELECT
    'Big 6' AS Category,
    --t1.Season,
    SUM(t1.TotalRevenue) AS [2022 Revenue (£m)],
    FORMAT((ROUND(((SUM(t1.TotalRevenue) / t22.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2022 Rev Share (%)],
    --t0.Season AS PrevSeason,
    SUM(t0.TotalRevenue) AS [2015 Revenue (£m)],
    FORMAT((ROUND(((SUM(t0.TotalRevenue) / t15.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2015 Rev Share (%)],
    SUM(t1.TotalRevenue - t0.TotalRevenue) AS [Growth Amount],
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS [Growth %],
    --POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
    CAST((POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100 AS DECIMAL(10,3)) AS [CAGR (%)]
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.RevenueRank = t0.RevenueRank
CROSS JOIN (
  SELECT SUM(TotalRevenue) AS TotalRevenue
  FROM PLRevenueByClub
  WHERE Season = 2022
) t22
CROSS JOIN (
  SELECT SUM(TotalRevenue) AS [TotalRevenue]
  FROM PLRevenueByClub
  WHERE Season = 2015
) t15
WHERE t0.Season IS NOT NULL
AND t1.Club
-- NOT
IN (
    'Manchester United',
    'Manchester City',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham'
)
GROUP By t1.Season, t0.Season, t22.TotalRevenue, t15.TotalRevenue

UNION

-- REST
SELECT
    'Rest' AS Category,
    --t1.Season,
    SUM(t1.TotalRevenue) AS [2022 Revenue (£m)],
    FORMAT((ROUND(((SUM(t1.TotalRevenue) / t22.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2022 Rev Share (%)],
    --t0.Season AS PrevSeason,
    SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
    FORMAT((ROUND(((SUM(t0.TotalRevenue) / t15.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2015 Rev Share (%)l],
    SUM(t1.TotalRevenue - t0.TotalRevenue) AS [Revenue Change],
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS [% Change],
    --POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
    CAST((POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100 AS DECIMAL(10,3)) AS [CAGR (%)]
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.RevenueRank = t0.RevenueRank
CROSS JOIN (
  SELECT SUM(TotalRevenue) AS TotalRevenue
  FROM PLRevenueByClub
  WHERE Season = 2022
) t22
CROSS JOIN (
  SELECT SUM(TotalRevenue) AS [TotalRevenue]
  FROM PLRevenueByClub
  WHERE Season = 2015
) t15
WHERE t0.Season IS NOT NULL
AND t1.Club
NOT
IN (
    'Manchester United',
    'Manchester City',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham'
)
GROUP By t1.Season, t0.Season, t22.TotalRevenue, t15.TotalRevenue











-- SELECT
--     'Big 6' AS Category,
--     t1.Season,
--     SUM(t1.TotalRevenue) AS CombinedRevenue,
--     t0.Season AS PrevSeason,
--     SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
--     SUM(t1.TotalRevenue - t0.TotalRevenue) AS RevenueChange,
--     FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange,
--     POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
-- FROM PLRevenueByClub t1
-- LEFT OUTER JOIN PLRevenueByClub t0 
--     --ON t1.Season = t0.Season + 1 --Per Year
--     ON t1.Season = t0.Season + 7 --Over Period
--     AND t1.RevenueRank = t0.RevenueRank
-- WHERE t0.Season IS NOT NULL
-- --AND t1.Club
-- -- NOT
-- -- IN (
-- --     'Manchester United',
-- --     'Manchester City',
-- --     'Liverpool',
-- --     'Chelsea',
-- --     'Arsenal',
-- --     'Tottenham'
-- -- )
-- GROUP By t1.Season, t0.Season

--SELECT * FROM PLRevenueByClub