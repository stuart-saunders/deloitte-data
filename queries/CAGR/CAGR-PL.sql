-- ****************************************
-- Period 2015-2022
-- ****************************************

-- CAGR for League over Period
SELECT 
    t1.Season AS Current_Season,
    -- t1.RevenueRank,
    -- t1.Club,
    SUM(t1.TotalRevenue) AS All_Current_Revenue,
    --t0.Season AS Comparison_Season,
    -- t0.RevenueRank AS Comparison_Season_Rank,
    -- t0.Club,
    SUM(t0.TotalRevenue) AS '2015_All_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    --AND t1.Club = t0.Club
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = '2022'
GROUP BY t1.Season
--ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC

-- CAGR for Top 5 over Period
SELECT 
    t1.Season AS Current_Season,
    SUM(t1.TotalRevenue) AS Top5_Current_Revenue,
    SUM(t0.TotalRevenue) AS '2015_Top5_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank -- SHOULD THIS BE LeaguePosition??
    AND t1.LeaguePosition = t0.LeaguePosition
WHERE t1.Season = '2022'
  AND (t1.LeaguePosition BETWEEN 1 AND 5)
GROUP BY t1.Season

-- CAGR for Middle 5 over Period
SELECT 
    t1.Season AS Current_Season,
    SUM(t1.TotalRevenue) AS Mid10_Current_Revenue,
    SUM(t0.TotalRevenue) AS '2015_Mid10_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank -- SHOULD THIS BE LeaguePosition??
    AND t1.LeaguePosition = t0.LeaguePosition
WHERE t1.Season = '2022'
  AND (t1.LeaguePosition BETWEEN 6 AND 15)
GROUP BY t1.Season

-- CAGR for Bottom 5 over Period
SELECT 
    t1.Season AS Current_Season,
    SUM(t1.TotalRevenue) AS Bottom5_Current_Revenue,
    SUM(t0.TotalRevenue) AS '2015_Bottom5_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank -- SHOULD THIS BE LeaguePosition??
    AND t1.LeaguePosition = t0.LeaguePosition
WHERE t1.Season = '2022'
  AND (t1.LeaguePosition BETWEEN 16 AND 20)
GROUP BY t1.Season

-- ****************************************
-- Period 2015-2022
-- ****************************************
-- CAGR for League per Year
SELECT 
    t1.Season AS Current_Season,
    -- t1.RevenueRank,
    -- t1.Club,
    SUM(t1.TotalRevenue) AS All_Current_Revenue,
    --t0.Season AS Comparison_Season,
    -- t0.RevenueRank AS Comparison_Season_Rank,
    -- t0.Club,
    SUM(t0.TotalRevenue) AS '2015_All_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    --AND t1.Club = t0.Club
    AND t1.RevenueRank = t0.RevenueRank
--WHERE t1.Season = '2022'
GROUP BY t1.Season


-- CAGR for Top 5 per Year
SELECT 
    t1.Season AS Current_Season,
    -- t1.RevenueRank,
    -- t1.Club,
    SUM(t1.TotalRevenue) AS All_Current_Revenue,
    --t0.Season AS Comparison_Season,
    -- t0.RevenueRank AS Comparison_Season_Rank,
    -- t0.Club,
    SUM(t0.TotalRevenue) AS '2015_All_Revenue',
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) AS Revenue_Change,
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    --AND t1.Club = t0.Club
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.RevenueRank BETWEEN 1 AND 5
GROUP BY t1.Season

-- CAGR for Middle 5 per Year

-- CAGR for Bottom 5 per Year

-- CAGR per Club per Year