-- ALL
--INSERT INTO CAGRPerYear
SELECT 
    Season,
    'All',
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR
GROUP BY Season

--TOP 5
INSERT INTO CAGRPerYear
SELECT 
    Season,
    'Top 5' AS Category,
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR
WHERE RevenueRank BETWEEN 1 AND 5
GROUP BY Season

--MIDDLE 10
INSERT INTO CAGRPerYear
SELECT 
    Season,
    'Middle 10' AS Category,
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR
WHERE RevenueRank BETWEEN 6 AND 15
GROUP BY Season

--BOTTOM 5
INSERT INTO CAGRPerYear
SELECT 
    Season,
    'Bottom 5' AS Category,
    SUM(Revenue) AS TotalRevenue,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM CAGR
WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season