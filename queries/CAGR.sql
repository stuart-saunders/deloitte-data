-- PER PERIOD
-- SELECT * FROM CAGR

SELECT 
    t0.Season,
    SUM(t1.Revenue) AS TotalRevenue,
    SUM(t0.Revenue) AS 'TotalPrevRevenue',
    (SUM(t1.Revenue) - SUM(t0.Revenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.Revenue)) / SUM(t0.Revenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR t1
LEFT OUTER JOIN CAGR t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 6 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = '2022'
AND t1.RevenueRank BETWEEN 1 AND 5
GROUP BY t0.Season



SELECT SUM(TotalRevenue)
FROM PLRevenueByClub
WHERE LeaguePosition BETWEEN 1 AND 5