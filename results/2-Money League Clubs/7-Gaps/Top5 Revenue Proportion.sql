-- What proportion of the League's revenues is provided by the Top 5, compared to the rest?
SELECT
    Season,
    SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) AS Top5Revenue,
    SUM(TotalRevenue) as TotalRevenue,
    SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / SUM(TotalRevenue) as Top5Proportion
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season