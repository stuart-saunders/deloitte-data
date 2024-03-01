-- What is the revenue gap between the Top and Bottom clubs?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) As TopNationRevenueAmount,
    MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) As BottomNationRevenueAmount,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) - MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) AS DifferenceAmount,
    MAX(CASE WHEN RevenueRank = 1 THEN AverageRevenuePerClub END) / MAX(CASE WHEN RevenueRank = 5 THEN AverageRevenuePerClub END) AS Ratio
FROM 
    NationData
GROUP BY Season