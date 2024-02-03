SELECT
    --t1.Category,
    t1.RevenueRank,
    t1.Season,
    t1.Revenue,
    --t1.CumulativeRevenue,
    t0.Season,
    t0.Revenue,
    POWER((t1.Revenue / t0.Revenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM PLGrowthBySeasonAndRank t1
LEFT OUTER JOIN PLGrowthBySeasonAndRank t0 
    ON t1.Season = t0.Season + 7 --Per Period
    --ON t1.Season = t0.Season + 1
    AND t1.RevenueRank = t0.RevenueRank
WHERE 
    t1.Season = '2022'
--     AND t0.PrevRevenue IS NOT NULL
--     AND t0.Season IS NOT NULL
--ORDER BY POWER((t1.Revenue / t0.Revenue), (1.0 / ((t1.Season - t0.Season)))) - 1 DESC