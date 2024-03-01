SELECT
    t1.Season,
    t1.Grouping,
    SUM(t1.Revenue) AS TotalRevenue,
    t0.Season,
    SUM(t0.Revenue) AS TotalPrevRevenue,
    SUM(t1.Revenue) - SUM(t0.Revenue) AS 'Growth Amount',
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue)) * 100, 2), 'N', 'en-gb') AS 'Growth %',
    POWER((SUM(t1.Revenue) / SUM(t0.Revenue)), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
FROM MLGrowthBySeasonAndGrouping t1
LEFT OUTER JOIN MLGrowthBySeasonAndGrouping t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 7 --Per Period
    AND t1.Grouping = t0.Grouping
WHERE t1.Season = 2022
--AND Grouping = 'All'
--AND Grouping = 'Top 5'
--AND Grouping = 'Mid-Top'
--AND Grouping = 'Mid-Bottom'
--AND Grouping = 'Bottom 5'
GROUP BY t1.Season, t1.Grouping, t0.Season
ORDER BY (SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue) DESC
