SELECT
  t1.Season,
  AVG(t1.TotalRevenue),
  t0.Season,
  AVG(t0.TotalRevenue),
  (AVG(t1.TotalRevenue) / AVG(t0.TotalRevenue) - 1) * 100
    -- 'Big 6' AS Category,
    -- t1.Season,
    -- SUM(t1.TotalRevenue) AS CombinedRevenue,
    -- t0.Season AS PrevSeason,
    -- SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
    -- SUM(t1.TotalRevenue - t0.TotalRevenue) AS RevenueChnage,
    -- FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.Club = t0.Club
--WHERE t0.Season IS NOT NULL
WHERE t1.Club
-- NOT
IN (
    'Manchester United',
    'Manchester City',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham'
)
AND t1.Season = 2022
GROUP By t1.Season, t0.Season


SELECT
  t1.Season,
  AVG(t1.TotalRevenue),
  t0.Season,
  AVG(t0.TotalRevenue),
  (AVG(t1.TotalRevenue) / AVG(t0.TotalRevenue) - 1) * 100
    -- 'Big 6' AS Category,
    -- t1.Season,
    -- SUM(t1.TotalRevenue) AS CombinedRevenue,
    -- t0.Season AS PrevSeason,
    -- SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
    -- SUM(t1.TotalRevenue - t0.TotalRevenue) AS RevenueChnage,
    -- FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    -- AND t1.Club = t0.Club
    AND t1.RevenueRank = t0.RevenueRank
-- WHERE t0.Season IS NOT NULL
WHERE t1.Club
NOT
IN (
    'Manchester United',
    'Manchester City',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham'
)
AND t1.Season = 2022
GROUP By t1.Season, t0.Season
