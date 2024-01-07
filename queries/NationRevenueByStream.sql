-- Values in €m
-- SELECT * FROM NationRevenueByStream

-- Total Aggregate Revenue
-- SELECT r.Season, r.Nation, p.WageCosts, SUM(r.TotalRevenue) as 'Total Revenue'
-- FROM NationRevenueByStream r
-- INNER JOIN NationProfitability p ON p.Nation = r.Nation
-- GROUP BY r.Season, r.Nation, p.WageCosts
-- ORDER BY 'Total Revenue' DESC

-- *************************************
-- * Revenue Growth By Stream
-- *************************************
SELECT 
    t1.Nation,
    t1.RevenueStream,
    t1.Season AS Current_Season,
    t1.TotalRevenue AS Current_Revenue,
    t0.Season AS Comparison_Season,
    t0.TotalRevenue AS Comparison_Revenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS Revenue_Change,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM NationRevenueByStream t1
INNER JOIN NationRevenueByStream t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.Nation = t0.Nation
    AND t1.RevenueStream = t0.RevenueStream
--WHERE t1.RevenueStream = 'Matchday'
--WHERE t1.RevenueStream = 'Broadcasting'
WHERE t1.RevenueStream = 'Commercial'
ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC


-- *************************************
-- * Revenue Growth By Nation
-- *************************************
SELECT 
    t1.Nation,
    t1.RevenueStream,
    t1.Season AS Current_Season,
    t1.TotalRevenue AS Current_Revenue,
    t0.Season AS Comparison_Season,
    t0.TotalRevenue AS Comparison_Revenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS Revenue_Change,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
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