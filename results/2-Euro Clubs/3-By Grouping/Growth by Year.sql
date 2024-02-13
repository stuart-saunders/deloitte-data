SELECT
    Season,
    Grouping,
    SUM(Revenue) AS CombinedRevenue,
    PrevSeason,
    SUM(PrevRevenue) AS CombinedPrevRevenue,
    SUM(RevenueChange) AS CombinedRevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue)) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM MLGrowthBySeasonAndGrouping
--WHERE Grouping = 'All'
--WHERE Grouping = 'Top 5'
--WHERE Grouping = 'Middle-Top'
--WHERE Grouping = 'Middle-Bottom'
--WHERE Grouping = 'Bottom 5'
GROUP BY Season, Grouping, PrevSeason
ORDER BY PercentageRevenueChange DESC