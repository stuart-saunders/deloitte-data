-- What is the revenue gap between the Top and Bottom clubs?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) As [Top Nation Avg Revenue (€m)],
    MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) As [Bottom Nation Avg Revenue (€m)],
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) - MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) AS [Gap (€m)],
    --MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) / MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) AS [Gap Ratio]
    --FORMAT(ROUND((MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) / MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END)), 2), 'N', 'en-gb') AS [Gap Ratio],
    CAST((MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) / MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END)) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM 
    NationData
GROUP BY Season