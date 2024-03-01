SELECT
    --Season,
    Nation,
    SUM(TotalRevenue) AS 'Total Revenue',
    STDEV(TotalRevenue) AS 'Std Deviation',
    AVG(TotalRevenue) AS Mean,
    (STDEV(TotalRevenue) / AVG(TotalRevenue)) * 100 AS 'Coefficient of Variation'
--FROM NationRevenueByStream
FROM (
    SELECT
        Season,
        Nation,
        SUM(TotalRevenue) AS TotalRevenue
    FROM MoneyLeagueRevenueByClub
    GROUP BY Season, Nation
) t
GROUP BY Season--, Nation