-- CAGR for League per Year

-- SELECT * FROM CAGR

SELECT 
    Season,
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS 'TotalPrevRevenue',
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM CAGR
GROUP BY Season


-- SELECT 
--     t1.Season AS Current_Season,
--     -- t1.RevenueRank,
--     -- t1.Club,
--     SUM(t1.TotalRevenue) AS All_Current_Revenue,
--     --t0.Season AS Comparison_Season,
--     -- t0.RevenueRank AS Comparison_Season_Rank,
--     -- t0.Club,
--     SUM(t0.TotalRevenue) AS '2015_All_Revenue',
--     (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
--     FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
--     --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
-- FROM PLRevenueByClub t1
-- LEFT OUTER JOIN PLRevenueByClub t0 
--     ON t1.Season = t0.Season + 1 --Per Year
--     --ON t1.Season = t0.Season + 7 -- Per Period
--     --AND t1.RevenueRank = t0.RevenueRank
--     --AND t1.Club = t0.Club
--     AND t1.RevenueRank = t0.RevenueRank
-- --WHERE t1.Season = '2022'
-- GROUP BY t1.Season
