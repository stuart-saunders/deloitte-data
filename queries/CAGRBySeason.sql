SELECT 
    Season,
    'All',
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGRBySeasonAndRank
--WHERE RevenueRank BETWEEN 1 AND 5
--WHERE RevenueRank BETWEEN 6 AND 15
--WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season