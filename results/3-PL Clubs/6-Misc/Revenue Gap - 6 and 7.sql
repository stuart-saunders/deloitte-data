-- What is the revenue gap between the Big 6 and the top of the rest?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) As Club6Revenue,
    MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END) As Club7Revenue,
    MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) - MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END) AS Difference,
    MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) / MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END) AS Ratio
FROM 
    PLRevenueByClub
WHERE
    RevenueRank IN (6, 7)
GROUP BY Season

-- SELECT * FROM PLRevenueByClub
-- WHERE Season = 2022