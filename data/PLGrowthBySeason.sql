-- ALL Clubs
INSERT INTO PLGrowthBySeason
SELECT 
    Season,
    'All' AS Category,
    SUM(Revenue) AS SeasonRevenue,
    SUM(PrevRevenue) AS PrevSeasonRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue
FROM PLGrowthBySeasonAndRank
--WHERE RevenueRank BETWEEN 1 AND 5
--WHERE RevenueRank BETWEEN 6 AND 15
--WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season


-- Top 5 Clubs
INSERT INTO PLGrowthBySeason
SELECT 
    Season,
    'Top 5' AS Category,
    SUM(Revenue) AS SeasonRevenue,
    SUM(PrevRevenue) AS PrevSeasonRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 1 AND 5
GROUP BY Season


-- Top Half Clubs
INSERT INTO PLGrowthBySeason
SELECT 
    Season,
    'Top Half' AS Category,
    SUM(Revenue) AS SeasonRevenue,
    SUM(PrevRevenue) AS PrevSeasonRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 6 AND 10
GROUP BY Season

-- Bottom Half Clubs
INSERT INTO PLGrowthBySeason
SELECT 
    Season,
    'Bottom Half' AS Category,
    SUM(Revenue) AS SeasonRevenue,
    SUM(PrevRevenue) AS PrevSeasonRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 11 AND 15
GROUP BY Season

-- Bottom 5 Clubs
INSERT INTO PLGrowthBySeason
SELECT 
    Season,
    'Bottom 5' AS Category,
    SUM(Revenue) AS SeasonRevenue,
    SUM(PrevRevenue) AS PrevSeasonRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageAnnualChange,
    SUM(SUM(Revenue)) OVER (ORDER BY Season) AS CumulativeRevenue
FROM PLGrowthBySeasonAndRank
WHERE RevenueRank BETWEEN 16 AND 20
GROUP BY Season