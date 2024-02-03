SELECT * FROM PLGrowthBySeasonAndRank

-- Include Club Names
SELECT 
    sr.Id,
    sr.Season,
    sr.RevenueRank,
    c1.Club,
    sr.Revenue,
    sr.PrevSeason,
    sr.PrevRevenueRank,
    c0.Club,
    sr.PrevRevenue,
    sr.RevenueChange,
    sr.PercentageRevenueChange
FROM PLGrowthBySeasonAndRank sr
INNER JOIN PLRevenueByClub c1
ON sr.Season = c1.Season AND sr.RevenueRank = c1.RevenueRank
INNER JOIN PLRevenueByClub c0
ON sr.PrevSeason = c0.Season AND sr.PrevRevenueRank = c0.RevenueRank
WHERE PrevSeason IS NOT NULL
ORDER BY Season, RevenueRank --PercentageRevenueChange DESC