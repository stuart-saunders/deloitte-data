SELECT
    Season,
    --FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Top 5 Avg Revenue],
    CAST((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Top 5 Avg Revenue (€m)],
    --FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Bottom 5 Avg Revenue],
    CAST((AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Bottom 5 Avg Revenue (€m)],
    --FORMAT((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) - AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)), 'N', 'en-gb') AS [Gap Amount],
    CAST(AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) - AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap (€m)],
    --FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Gap Ratio],
    CAST(AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season