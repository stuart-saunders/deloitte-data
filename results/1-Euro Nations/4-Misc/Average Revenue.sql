-- What is the revenue gap between the Top and Bottom clubs?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) As TopNationbRevenue,
    MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) As BottomNationRevenue,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) - MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) AS Difference,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) / MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) AS Ratio
FROM 
    NationData
-- WHERE
--     RevenueRank IN (1, 20)
GROUP BY Season