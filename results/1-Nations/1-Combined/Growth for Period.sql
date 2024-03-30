SELECT
    --t1.Season AS 'End Season',
    SUM(t1.TotalRevenue) AS '2022 Revenue (€m)',
    --t0.Season AS 'Start Season',
    t0.TotalRevenue AS '2015 Revenue (€m)',
    SUM(t1.TotalRevenue) - t0.TotalRevenue AS 'Growth (€m)',
    CAST(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100 AS DECIMAL(10,2)) AS [Growth (%)],
    --POWER((SUM(t1.TotalRevenue) / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
    CAST((POWER((SUM(t1.TotalRevenue) / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100 AS DECIMAL(10,2)) AS [CAGR (%)]
FROM NationRevenueByStream t1
LEFT OUTER JOIN (
    SELECT
        Season,
        --Nation,
        SUM(TotalRevenue) AS TotalRevenue
    FROM NationRevenueByStream
    GROUP BY Season --, Nation
) t0
ON t1.Season = t0.Season + 7
--AND t1.Nation = t0.Nation
WHERE t0.Season IS NOT NULL
GROUP BY t1.Season, t0.Season, t0.TotalRevenue