-- How do the Average Revenues of the Top 5 compare to the Bottom 5?
SELECT
    Season,
    CAST((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Top 5 Avg Revenue (€m)],
    CAST((AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Bottom 5 Avg Revenue (€m)],
    CAST(AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) - AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap (€m)],
    CAST(AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM
    PLRevenueByClub
GROUP BY Season