SELECT
    Season,
    CAST((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Top 5 Avg Revenue (€m)],
    CAST((AVG(CASE WHEN RevenueRank BETWEEN 6 AND 20 THEN TotalRevenue END)) AS DECIMAL(10,2)) AS [Rest Avg Revenue (€m)],
    CAST(AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) - AVG(CASE WHEN RevenueRank BETWEEN 6 AND 20 THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap (€m)],
    CAST(AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 6 AND 20 THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season

/*
SELECT 
    Nation, 
    --Club, 
    --RevenueRank, 
    MAX(LeaguePosition)
FROM MoneyLeagueRevenueByClub
WHERE Season = 2022
GROUP BY Nation
*/