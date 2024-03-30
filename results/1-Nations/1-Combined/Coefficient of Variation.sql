SELECT
    Season,
    SUM(TotalRevenue) AS 'Total Revenue (€m)',
    -- STDEV(TotalRevenue) AS 'Std Deviation',
    CAST(STDEV(TotalRevenue) AS DECIMAL(10,2)) AS 'Std Deviation',
    --AVG(TotalRevenue) AS Mean,
    CAST(AVG(TotalRevenue) AS DECIMAL(10,2)) AS [Mean],
    --(STDEV(TotalRevenue) / AVG(TotalRevenue)) * 100 AS 'Coefficient of Variation'
    CAST(((STDEV(TotalRevenue) / AVG(TotalRevenue)) * 100) AS DECIMAL(10,2)) AS [Coefficient of Variation]
--FROM NationRevenueByStream
FROM (
    SELECT
        Season,
        Nation,
        SUM(TotalRevenue) AS TotalRevenue
    FROM NationRevenueByStream
    GROUP BY Season, Nation
) t
GROUP BY Season


-- SELECT * FROM NationRevenueByStream
-- WHERE Season = 2022