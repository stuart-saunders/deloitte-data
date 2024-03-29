-- SELECT * FROM PLGrowthBySeasonAndLeaguePosition

--INSERT INTO PLGrowthBySeasonAndLeaguePosition
SELECT 
    t1.Season,
    t1.LeaguePosition,
    t1.Club,
    t1.TotalRevenue,
    t0.Season,
    t0.RevenueRank,
    t0.LeaguePosition,
    t0.Club,
    t0.TotalRevenue,
    t1.TotalRevenue - t0.TotalRevenue,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb')
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    AND t1.LeaguePosition = t0.LeaguePosition
ORDER BY t1.Season, t1.TotalRevenue DESC