-- What proportion of the League's revenues is provided by the Top 5, compared to the rest?
SELECT
    Season,
    SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) AS [Top 5 Revenue (€m)],
    SUM(TotalRevenue) as [Total Revenue (€m)],
    SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / SUM(TotalRevenue) as [Top 5 Revenue Share]
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season