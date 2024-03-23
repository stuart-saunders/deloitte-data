-- SELECT 
--     t1.Season,
--     t1.RevenueRank,
--     t1.Club,
--     t1.TotalRevenue,
--     t0.Season,
--     t0.RevenueRank,
--     t0.Club,
--     t0.TotalRevenue,
--     t1.TotalRevenue - t0.TotalRevenue AS RevenueChange,
--     FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange,
--     POWER((t1.TotalRevenue / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
-- FROM PLRevenueByClub t1
-- LEFT OUTER JOIN PLRevenueByClub t0 
--     ON t1.Season = t0.Season + 7 --Over Period
--     AND t1.RevenueRank = t0.RevenueRank
-- WHERE t1.Season = 2022

SELECT 
    t1.RevenueRank AS [Rank],
    t1.TotalRevenue AS [2022 Revenue (£m)],
    FORMAT((ROUND(((SUM(t1.TotalRevenue) / t22.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2022 Share (%)],
    t0.TotalRevenue AS [2015 Revenue (£m)],
    FORMAT((ROUND(((SUM(t0.TotalRevenue) / t15.TotalRevenue) * 100), 2)), 'N', 'en-gb') AS [2015 Share (%)],
    CASE WHEN (SUM(t1.TotalRevenue) / t22.TotalRevenue - SUM(t0.TotalRevenue) / t15.TotalRevenue) > 0 THEN '+' ELSE '-' END AS [Share +/-],
    t1.TotalRevenue - t0.TotalRevenue AS [Growth Amount],
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS [Growth %],
    --POWER((t1.TotalRevenue / t0.TotalRevenue), (1.0 / ((t1.Season - t0.Season)))) - 1 AS CAGR
    CAST(ROUND((POWER((SUM(t1.TotalRevenue) / SUM(t0.TotalRevenue)), (1.0 / ((t1.Season - t0.Season)))) - 1) * 100, 2) AS DECIMAL(10,2)) AS [CAGR (%)]

FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 7 --Over Period
    AND t1.RevenueRank = t0.RevenueRank
CROSS JOIN (
  SELECT SUM(TotalRevenue) AS [TotalRevenue]
  FROM PLRevenueByClub
  WHERE Season = 2022
) t22
CROSS JOIN (
  SELECT SUM(TotalRevenue) AS [TotalRevenue]
  FROM PLRevenueByClub
  WHERE Season = 2015
) t15
WHERE t1.Season = 2022
GROUP BY t1.RevenueRank, t1.Season, t0.Season, t1.TotalRevenue, t0.TotalRevenue, t22.TotalRevenue, t15.TotalRevenue
ORDER BY [CAGR (%)] DESC