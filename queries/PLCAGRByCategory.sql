-- SELECT * FROM PLGrowthBySeason

SELECT
    t1.Category,
    t1.Season,
    t1.SeasonRevenue,
    t1.CumulativeRevenue,
    t0.Season,
    t0.PrevSeasonRevenue,
    POWER((t1.CumulativeRevenue / t0.PrevSeasonRevenue), (1.0 / (t1.Season - t0.Season + 1))) - 1 AS CAGR
FROM PLGrowthBySeason t1
LEFT OUTER JOIN PLGrowthBySeason t0 
    ON t1.Season = t0.Season + 6 --Per Period
    AND t1.Category = t0.Category
WHERE 
    t1.Season = '2022'
    AND t0.PrevSeasonRevenue IS NOT NULL
    AND t0.Season IS NOT NULL