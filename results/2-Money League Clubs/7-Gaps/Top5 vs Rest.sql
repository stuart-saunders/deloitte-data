SELECT
    Season,
    FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Top 5 Avg Revenue],
    FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 6 AND 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Rest Avg Revenue],
    FORMAT((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) - AVG(CASE WHEN RevenueRank BETWEEN 6 AND 20 THEN TotalRevenue END)), 'N', 'en-gb') AS [Gap Amount],
    FORMAT((ROUND((AVG(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN TotalRevenue END) / AVG(CASE WHEN RevenueRank BETWEEN 6 AND 20 THEN TotalRevenue END)), 2)), 'N', 'en-gb') AS [Gap Ratio]
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