-- Values in £m

-- SELECT * FROM PLRevenueByStream

SELECT 
    t1.Season AS Current_Season,
    t1.RevenueStream,
    t1.TotalRevenue AS Current_Revenue,
    t0.Season AS Comparison_Season,
    t0.TotalRevenue AS Comparison_Revenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS Revenue_Change,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLRevenueByStream t1
INNER JOIN PLRevenueByStream t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.RevenueStream = t0.RevenueStream
--WHERE t1.RevenueStream = 'Broadcasting'
--WHERE t1.RevenueStream = 'Commercial'
--WHERE t1.RevenueStream = 'Matchday'
--ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC