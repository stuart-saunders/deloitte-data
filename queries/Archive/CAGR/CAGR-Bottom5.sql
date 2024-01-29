SELECT 
    Season,
    -- 'All',
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR
WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season