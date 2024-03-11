-- How do the Average Revenues of the Top 5 compare to the Bottom 5?
SELECT
    Season,
    FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Top 5 Avg Revenue],
    FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Bottom 5 Avg Revenue],
    FORMAT((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) - AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)), 'N', 'en-gb') AS [Gap Amount],
    FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Gap Ratio]
FROM
    PLRevenueByClub
GROUP BY Season