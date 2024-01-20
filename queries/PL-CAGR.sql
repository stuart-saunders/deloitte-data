
-- SELECT
--     entity_id,
--     ((MAX(revenue) / MIN(revenue))^(1 / COUNT(DISTINCT year)) - 1) AS overall_cagr,
--    ((LAG(revenue) OVER (ORDER BY year) / revenue)^(1) - 1) AS year_on_year_cagr
-- FROM
--     revenue_data
-- GROUP BY
--     entity_id, year
-- ORDER BY
--     entity_id, year;


-- Example SQL query to calculate CAGR for each entity
-- SELECT
--     Club,
--     -- ((MAX(TotalRevenue) / MIN(TotalRevenue))^(1 / COUNT(DISTINCT Season)) - 1) AS cagr
--     (POWER(MAX(TotalRevenue) / MIN(TotalRevenue), 1.0 / COUNT(DISTINCT Season)) - 1) AS cagr
    
-- FROM
--     PLRevenueByClub
-- GROUP BY
--     Club;


-- CAGR for League as a Whole for Duration
-- SELECT
--     --((MAX(TotalRevenue) / MIN(TotalRevenue))^(1 / (MAX(Season) - MIN(Season) + 1)) - 1) AS league_cagr
--     (POWER(MAX(TotalRevenue) / MIN(TotalRevenue), 1.0 / (MAX(Season) - MIN(Season) + 1)) - 1) AS league_cagr
-- FROM
--     PLRevenueByClub;

--CAGR for League as Whole for specific Season
-- SELECT
--     --((MAX(TotalRevenue) / MIN(TotalRevenue))^(1 / COUNT(DISTINCT Club)) - 1) AS league_cagr
--     (POWER(MAX(TotalRevenue) / MIN(TotalRevenue), 1.0 / COUNT(DISTINCT Club)) - 1) AS league_cagr
-- FROM
--     PLRevenueByClub
-- WHERE
--     Season = 2022; -- Replace with the desired season year


--CAGR per club for specific Season
-- SELECT
--     Club,
--     (POWER(MAX(TotalRevenue) / MIN(TotalRevenue), 1.0 / COUNT(DISTINCT Season)) - 1) AS club_cagr
-- FROM
--     PLRevenueByClub
-- WHERE
--     Season = 2022 -- Replace with the desired season year
-- GROUP BY
--     Club;



-- SELECT
--     Club,
--     --(MAX(TotalRevenue) / LAG(MAX(TotalRevenue), 1) OVER (PARTITION BY Club ORDER BY Season)) - 1 AS club_cagr
--     -- MAX(TotalRevenue) / LAG(MAX(TotalRevenue), 1, NULL) OVER (ORDER BY Season) - 1 AS club_cagr
--     MAX(TotalRevenue) / LAG(MAX(TotalRevenue), 1, NULL) OVER (PARTITION BY Club ORDER BY Season) - 1 AS club_cagr
-- FROM
--     PLRevenueByClub
-- WHERE
--     Season = 2022 -- Replace with the desired season year
-- GROUP BY
--     Club, Season;



-- CAGR for League as a Whole per Year
SELECT 
    t1.Season AS Current_Season,
    -- t1.RevenueRank,
    -- t1.Club,
    SUM(t1.TotalRevenue) AS Total_Current_Revenue,
    -- t0.Season AS Previous_Season,
    -- t0.RevenueRank AS Previous_Season_Rank,
    -- t0.Club,
    SUM(t0.TotalRevenue) AS Total_Previous_Revenue,
    -- (t1.TotalRevenue - t0.TotalRevenue) AS Total_Revenue_Change,
    (SUM(t1.TotalRevenue) - SUM(t0.TotalRevenue)) / SUM(t0.TotalRevenue) AS Percentage_Revenue_Change
    --FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    AND t1.Club = t0.Club
--WHERE t1.Season > 2015
GROUP BY t1.Season
HAVING t1.Season = 2019
--AND t1.Club = 'Manchester City'
--AND t1.Season NOT IN ('2020', '2021')
--ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC


-- CAGR per Club per Year
SELECT 
    t1.Season AS Current_Season,
    -- t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue AS Current_Revenue,
    -- t0.Season AS Previous_Season,
    -- t0.RevenueRank AS Previous_Season_Rank,
    -- t0.Club,
    t0.TotalRevenue AS Previous_Revenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS Revenue_Change,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS Percentage_Revenue_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    AND t1.Club = t0.Club
WHERE t1.Season > 2015
-- WHERE t1.Season = 2019
ORDER BY (ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2)) DESC