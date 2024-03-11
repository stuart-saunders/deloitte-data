-- What is the revenue gap between the Big 6 and the top of the rest?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) As [Club 6 Revenue],
    MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END) As [Club 7 Revenue],
    MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) - MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END) AS [Gap Amount],
    --MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) / MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END) AS [Gap Ratio]
    FORMAT((ROUND((MAX(CASE WHEN RevenueRank = 6 THEN TotalRevenue END) / MAX(CASE WHEN RevenueRank = 7 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Gap Ratio]
FROM 
    PLRevenueByClub
WHERE
    RevenueRank IN (6, 7)
GROUP BY Season

-- SELECT * FROM PLRevenueByClub
-- WHERE Season = 2022