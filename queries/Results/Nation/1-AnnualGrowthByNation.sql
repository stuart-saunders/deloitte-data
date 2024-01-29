-- By Nation And Stream
SELECT 
    t1.Nation,
    t1.RevenueStream,
    t1.Season AS Current_Season,
    t1.TotalRevenue AS Current_Revenue,
    t0.Season AS Comparison_Season,
    t0.TotalRevenue AS Comparison_Revenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS Revenue_Change,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM NationRevenueByStream t1
INNER JOIN NationRevenueByStream t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.Nation = t0.Nation
    AND t1.RevenueStream = t0.RevenueStream
-- WHERE t1.Nation IN ('England')
-- WHERE t1.RevenueStream = 'Broadcasting'
-- WHERE t1.RevenueStream = 'Commercial'
ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC


--By Nation
SELECT 
    t1.Nation,
    --t1.RevenueStream,
    t1.Season AS Current_Season,
    SUM(t1.TotalRevenue) AS Current_Revenue,
    t0.Season AS Comparison_Season,
    SUM(t0.TotalRevenue) AS Comparison_Revenue,
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM NationRevenueByStream t1
INNER JOIN NationRevenueByStream t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.Nation = t0.Nation
    AND t1.RevenueStream = t0.RevenueStream
-- WHERE t1.Nation IN ('England')
-- WHERE t1.RevenueStream = 'Broadcasting'
-- WHERE t1.RevenueStream = 'Commercial'
GROUP BY t1.Nation, t1.Season, t0.Season
--ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC