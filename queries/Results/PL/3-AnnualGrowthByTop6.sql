-- Top 6
SELECT 
    --sr.Id,
    sr.Season,
    --sr.RevenueRank,
    --c1.Club,
    SUM(sr.Revenue) AS TotalRevenue,
    sr.PrevSeason,
    --sr.PrevRevenueRank,
    -- c0.Club,
    SUM(sr.PrevRevenue) AS PrevTotalRevenue,
    SUM(sr.RevenueChange) AS RevenueChange,
    --sr.PercentageRevenueChange
    SUM(sr.Revenue) / SUM(sr.PrevRevenue) AS '% Change'
FROM PLGrowthBySeasonAndRank sr
INNER JOIN PLRevenueByClub c1
    ON sr.Season = c1.Season AND sr.RevenueRank = c1.RevenueRank
INNER JOIN PLRevenueByClub c0
    ON sr.PrevSeason = c0.Season AND sr.PrevRevenueRank = c0.RevenueRank
WHERE PrevSeason IS NOT NULL
AND c1.Club IN (
    'Manchester United',
    'Manchester City',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham'
)
GROUP BY sr.Season, sr.PrevSeason
ORDER BY Season--, RevenueRank


-- Non-Top 6
SELECT 
    --sr.Id,
    sr.Season,
    --sr.RevenueRank,
    -- c1.Club,
    SUM(sr.Revenue) AS TotalRevenue,
    sr.PrevSeason,
    --sr.PrevRevenueRank,
    -- c0.Club,
    SUM(sr.PrevRevenue) AS PrevTotalRevenue,
    SUM(sr.RevenueChange) AS RevenueChange,
    --sr.PercentageRevenueChange
    SUM(sr.Revenue) / SUM(sr.PrevRevenue) AS '% Change'
FROM PLGrowthBySeasonAndRank sr
INNER JOIN PLRevenueByClub c1
    ON sr.Season = c1.Season AND sr.RevenueRank = c1.RevenueRank
INNER JOIN PLRevenueByClub c0
    ON sr.PrevSeason = c0.Season AND sr.PrevRevenueRank = c0.RevenueRank
WHERE PrevSeason IS NOT NULL
AND c1.Club NOT IN (
    'Manchester United',
    'Manchester City',
    'Liverpool',
    'Chelsea',
    'Arsenal',
    'Tottenham'
)
GROUP BY sr.Season, sr.PrevSeason
ORDER BY Season--, RevenueRank