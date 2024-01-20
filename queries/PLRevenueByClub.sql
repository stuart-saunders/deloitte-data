-- Values in £m

-- SELECT * FROM PLRevenueByClub

SELECT 
    t1.Season AS Current_Season,
    t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue AS Current_Revenue,
    t0.Season AS Comparison_Season,
    t0.RevenueRank AS Comparison_Season_Rank,
    t0.Club,
    t0.TotalRevenue AS Comparison_Revenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS Revenue_Change,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    AND t1.Club = t0.Club
--WHERE t1.Season > 2015
WHERE t1.Season = 2017
--AND t1.Club = 'Manchester City'
AND t1.Season NOT IN ('2020', '2021')
ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC