--- Arsenal's CAGR is outlier for Big 6 - remove for 


-- BIG 6
SELECT
    'Big 6' AS Category,
    t1.Season,
    SUM(t1.TotalRevenue) AS CombinedRevenue,
    t0.Season AS PrevSeason,
    SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
    -- SUM(t1.TotalRevenue - t0.TotalRevenue) AS RevenueChange,
    -- FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
    POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.Club = t0.Club
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
GROUP By t1.Season, t0.Season


-- REST
SELECT
    'Rest' AS Category,
    t1.Season,
    SUM(t1.TotalRevenue) AS CombinedRevenue,
    t0.Season AS PrevSeason,
    SUM(t0.TotalRevenue) AS CombinedPrevRevenue,
    -- SUM(t1.TotalRevenue - t0.TotalRevenue) AS RevenueChange,
    -- FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
    POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.Club = t0.Club
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
GROUP By t1.Season, t0.Season