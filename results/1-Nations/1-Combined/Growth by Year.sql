-- SELECT * FROM NationRevenueByStream

SELECT
    t1.Season,
    SUM(t1.TotalRevenue) AS [Revenue (€m)], --AS TotalRevenue
    t0.Season AS [Previous Season],
    t0.TotalRevenue AS [Previous Revenue (€m)], --AS PrevTotalRevenue,
    SUM(t1.TotalRevenue) - t0.TotalRevenue AS [Growth (€m)],
    --FORMAT(ROUND(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100, 2), 'N', 'en-gb') AS [Growth (%)]
    CAST(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100 AS DECIMAL(10,2)) AS [Growth (%)]
FROM NationRevenueByStream t1
LEFT OUTER JOIN (
    SELECT
        Season,
        SUM(TotalRevenue) AS TotalRevenue
    FROM NationRevenueByStream
    GROUP BY Season
) t0
ON t1.Season = t0.Season + 1
GROUP BY t1.Season, t0.Season, t0.TotalRevenue