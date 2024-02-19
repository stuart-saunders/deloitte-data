/*
SELECT
    t1.Nation,
    t1.RevenueStream AS 'Revenue Stream',
    SUM(t1.TotalRevenue) AS '2022 Revenue',
    t0.TotalRevenue AS '2015 Revenue',
    SUM(t1.TotalRevenue) - t0.TotalRevenue AS 'Growth Amount',
    FORMAT(ROUND(((SUM(t1.TotalRevenue) - t0.TotalRevenue) / t0.TotalRevenue) * 100, 2), 'N', 'en-gb') AS 'Growth %',    
    POWER((SUM(t1.TotalRevenue) / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
INTO #temp
FROM NationRevenueByStream t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        RevenueStream,
        SUM(TotalRevenue) AS TotalRevenue
    FROM NationRevenueByStream
    GROUP BY Season, Nation, RevenueStream
) t0
ON t1.Season = t0.Season + 7
AND t1.Nation = t0.Nation
AND t1.RevenueStream = t0.RevenueStream
WHERE t0.Season IS NOT NULL

-- Nations
-- AND t1.Nation = 'England'
-- AND t1.Nation = 'France'
-- AND t1.Nation = 'Germany'
-- AND t1.Nation = 'Italy'
-- AND t1.Nation = 'Spain'

-- Revenue Streams
--AND t1.RevenueStream = 'Broadcasting'
--AND t1.RevenueStream = 'Commercial'
--AND t1.RevenueStream = 'Matchday'

GROUP BY t1.Season, t1.Nation, t1.RevenueStream, t0.Season, t0.TotalRevenue
ORDER BY CAGR DESC
*/

SELECT
    [Revenue Stream],
    MAX([2015 Revenue]) / MIN([2015 Revenue]) AS [(2015) Top : Bottom],
    MAX([2022 Revenue]) / MIN([2022 Revenue]) AS [(2022) Top : Bottom]
    
FROM #temp
GROUP BY [Revenue Stream]

--DROP TABLE #temp