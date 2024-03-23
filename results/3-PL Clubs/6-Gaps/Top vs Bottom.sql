-- What is the revenue gap between the Top and Bottom clubs?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) As [Top Club Revenue],
    MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) As [Bottom Club Revenue],
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) - MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) AS [Gap Amount],
    FORMAT((ROUND((MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) / MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Gap Ratio]

FROM 
    PLRevenueByClub
WHERE
    RevenueRank IN (1, 20)
GROUP BY Season


-- SELECT * FROM PLRevenueByClub
-- WHERE Season = 2022