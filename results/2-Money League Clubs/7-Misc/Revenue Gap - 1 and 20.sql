-- What is the revenue gap between the Top and Bottom clubs?
SELECT
    Season,
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) As TopClubRevenue,
    MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) As BottomClubRevenue,
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) - MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) AS Difference,
    MAX(CASE WHEN RevenueRank = 1 THEN TotalRevenue END) / MAX(CASE WHEN RevenueRank = 20 THEN TotalRevenue END) AS Ratio
FROM 
    MoneyLeagueRevenueByClub
WHERE
    RevenueRank IN (1, 20)
GROUP BY Season


-- SELECT * FROM PLRevenueByClub
-- WHERE Season = 2022