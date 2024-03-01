-- ALL Clubs
INSERT INTO PLGrowthBySeasonAndGrouping
SELECT 
    Season,
    'All' AS Grouping,
    SUM(Revenue) AS Revenue,
    PrevSeason,
    SUM(PrevRevenue) AS PrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    SUM(SUM(Revenue)) OVER () AS TotalRevenue
FROM PLGrowthBySeasonAndRank
--WHERE RevenueRank BETWEEN 1 AND 5
--WHERE RevenueRank BETWEEN 6 AND 15
--WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season, PrevSeason


-- Top 5 Clubs
INSERT INTO PLGrowthBySeasonAndGrouping
SELECT 
    Season,
    'Top 5' AS Grouping,
    SUM(Revenue) AS Revenue,
    PrevSeason,
    SUM(PrevRevenue) AS PrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    SUM(SUM(Revenue)) OVER () AS TotalRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 1 AND 5
GROUP BY Season, PrevSeason


-- Middle Clubs
INSERT INTO PLGrowthBySeasonAndGrouping
SELECT 
    Season,
    'Middle-Top' AS Grouping,
    SUM(Revenue) AS Revenue,
    PrevSeason,
    SUM(PrevRevenue) AS PrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    SUM(SUM(Revenue)) OVER () AS TotalRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 6 AND 10
GROUP BY Season, PrevSeason

-- Bottom Half Clubs
INSERT INTO PLGrowthBySeasonAndGrouping
SELECT 
    Season,
    'Middle-Bottom' AS Grouping,
    SUM(Revenue) AS Revenue,
    PrevSeason,
    SUM(PrevRevenue) AS PrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    SUM(SUM(Revenue)) OVER () AS TotalRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 11 AND 15
GROUP BY Season, PrevSeason

-- Bottom 5 Clubs
INSERT INTO PLGrowthBySeasonAndGrouping
SELECT 
    Season,
    'Bottom 5' AS Grouping,
    SUM(Revenue) AS Revenue,
    PrevSeason,
    SUM(PrevRevenue) AS PrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue,
    SUM(SUM(Revenue)) OVER () AS TotalRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season, PrevSeason