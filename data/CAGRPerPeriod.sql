-- ALL
INSERT INTO CAGRPerPeriod
SELECT 
    'All' AS Category,
    t1.Season,
    SUM(t1.Revenue) AS TotalRevenue,
    --t0.Season AS StartSeason,
    SUM(t0.PrevRevenue) AS 'TotalPrevRevenue',
    (SUM(t1.Revenue) - SUM(t0.PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.PrevRevenue)) / SUM(t0.PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR t1
LEFT OUTER JOIN CAGR t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 6 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
--WHERE t1.Season = 2022 
--AND t1.RevenueRank BETWEEN 1 AND 5
GROUP BY t1.Season, t0.Season


-- TOP 5
INSERT INTO CAGRPerPeriod
SELECT 
    'Top 5' AS Category,
    t1.Season,
    SUM(t1.Revenue) AS TotalRevenue,
    t0.Season,
    SUM(t0.PrevRevenue) AS 'TotalStartRevenue',
    (SUM(t1.Revenue) - SUM(t0.PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.PrevRevenue)) / SUM(t0.PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR t1
LEFT OUTER JOIN CAGR t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 6 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022 
AND t1.RevenueRank BETWEEN 1 AND 5
GROUP BY t1.Season, t0.Season


-- MIDDLE 10
INSERT INTO CAGRPerPeriod
SELECT 
    'Middle 10' AS Category,
    t1.Season,
    SUM(t1.Revenue) AS TotalRevenue,
    t0.Season,
    SUM(t0.PrevRevenue) AS 'TotalStartRevenue',
    (SUM(t1.Revenue) - SUM(t0.PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.PrevRevenue)) / SUM(t0.PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR t1
LEFT OUTER JOIN CAGR t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 6 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022 
AND t1.RevenueRank BETWEEN 6 AND 15
GROUP BY t1.Season, t0.Season


-- BOTTOM 5
INSERT INTO CAGRPerPeriod
SELECT 
    'Bottom 5' AS Category,
    t1.Season,
    SUM(t1.Revenue) AS TotalRevenue,
    t0.Season,
    SUM(t0.PrevRevenue) AS 'TotalPrevRevenue',
    (SUM(t1.Revenue) - SUM(t0.PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(t1.Revenue) - SUM(t0.PrevRevenue)) / SUM(t0.PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR t1
LEFT OUTER JOIN CAGR t0 
    --ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 6 -- Per Period
    AND t1.RevenueRank = t0.RevenueRank
WHERE t1.Season = 2022 
AND t1.RevenueRank BETWEEN 16 AND 20
GROUP BY t1.Season, t0.Season