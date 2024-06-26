-- What is the revenue gap between the Top and Bottom clubs?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) As 'Top Club Revenue (€m)',
    MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) As 'Bottom Club Revenue (€m)',
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) - MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) AS [Gap (€m)],
    -- MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) / MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) AS [Gap Ratio]
    --FORMAT((ROUND((AVG(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank = 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Gap Ratio],
    CAST((AVG(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank = 20 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM 
    MoneyLeagueRevenueByClub
WHERE
    RevenueRank IN (1, 20)
GROUP BY Season


-- SELECT * FROM MoneyLeagueRevenueByClub
-- WHERE Season = 2022