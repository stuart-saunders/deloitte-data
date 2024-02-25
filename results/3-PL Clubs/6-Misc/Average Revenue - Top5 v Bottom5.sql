-- How do the Average Revenues of the Top 5 compare to the Bottom 5?
SELECT
    Season,
    AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) AS Top5Average,
    AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS Bottom5Average,
    AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS Ratio
FROM
    PLRevenueByClub
GROUP BY Season