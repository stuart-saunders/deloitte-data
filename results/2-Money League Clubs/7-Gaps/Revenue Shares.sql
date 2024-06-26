-- What proportion of the League's revenues is provided by the Top 5, compared to the rest?
SELECT
    Season,
    SUM(TotalRevenue) as [Total Revenue (€m)],
    SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) AS [Top 5 Revenue (€m)],
    --SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / SUM(TotalRevenue) as [Top 5 Revenue Share],
    CAST(SUM(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / SUM(TotalRevenue) * 100 AS DECIMAL(10,2)) AS [Top 5 Rev Share (%)]
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season

--Bottom 5 Revenue Share
SELECT
    Season,
    SUM(TotalRevenue) as [Total Revenue (€m)],
    SUM(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) AS [Bottom 5 Revenue (€m)],
    --SUM(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) / SUM(TotalRevenue) as [Bottom 5 Revenue Share],
    CAST(SUM(CASE WHEN RevenueRank BETWEEN 16 AND 20 THEN TotalRevenue END) / SUM(TotalRevenue) * 100 AS DECIMAL(10,2)) AS [Bottom 5 Rev Share (%)]
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season