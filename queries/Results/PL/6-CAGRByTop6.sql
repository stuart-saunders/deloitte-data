--SELECT * FROM PLGrowthBySeasonAndRank

-- TOP 6
SELECT
    --t1.RevenueRank,
    t1.Season,
    --t1.Club,
    SUM(t1.Revenue) AS '2022 Revenue',
    t0.Season,
    --t0.Club,
    SUM(t0.Revenue) AS '2015 Revenue',
    POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season) + 1))) - 1 AS CAGR
FROM PLGrowthBySeasonAndRank t1
LEFT OUTER JOIN PLGrowthBySeasonAndRank t0 
    ON t1.Season = t0.Season + 7 --Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE 
    t1.Season = '2022'
AND
    t1.Club IN (
        'Manchester City',
        'Manchester United',
        'Liverpool',
        'Chelsea',
        'Arsenal',
        'Tottenham'
    )
GROUP BY t1.Season, t0.Season


-- NON-TOP 6
SELECT
    --t1.RevenueRank,
    t1.Season,
    --t1.Club,
    SUM(t1.Revenue) AS '2022 Revenue',
    t0.Season,
    --t0.Club,
    SUM(t0.Revenue) AS '2015 Revenue',
    POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season) + 1))) - 1 AS CAGR
FROM PLGrowthBySeasonAndRank t1
LEFT OUTER JOIN PLGrowthBySeasonAndRank t0 
    ON t1.Season = t0.Season + 7 --Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE 
    t1.Season = '2022'
AND
    t1.Club NOT IN (
        'Manchester City',
        'Manchester United',
        'Liverpool',
        'Chelsea',
        'Arsenal',
        'Tottenham'
    )
GROUP BY t1.Season, t0.Season




















---- OLD

-- SELECT
--     --t1.Category,
--     --t1.RevenueRank,
--     c1.Club,
--     t1.Season,
--     t1.Revenue,
--     --t1.CumulativeRevenue,
--     t1.PrevSeason,
--     t1.PrevRevenue,
--     POWER((t1.Revenue / t1.PrevRevenue), (1.0 / ((t1.Season - t0.Season) + 1))) - 1 AS CAGR
-- FROM PLGrowthBySeasonAndRank t1
-- LEFT OUTER JOIN PLGrowthBySeasonAndRank t0 
--     ON t1.Season = t0.Season + 7 --Per Period
--     AND t1.RevenueRank = t0.RevenueRank
-- INNER JOIN PLRevenueByClub c1
--     ON t1.Season = c1.Season + 7
--     --AND t1.RevenueRank = c1.RevenueRank
-- -- INNER JOIN PLRevenueByClub c0
-- --     ON sr.PrevSeason = c0.Season AND sr.PrevRevenueRank = c0.RevenueRank
-- WHERE 
--     t1.Season = '2022'
