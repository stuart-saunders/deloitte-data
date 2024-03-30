-- SELECT * FROM MLGrowthBySeasonAndRevenueRank ORDER BY Season, RevenueRank

--INSERT INTO MLGrowthBySeasonAndRevenueRank
SELECT 
    t1.Season,
    t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue,
    t0.Season,
    t0.RevenueRank,
    t0.Club,
    t0.TotalRevenue,
    t1.TotalRevenue - t0.TotalRevenue,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb')
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN MoneyLeagueRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    AND t1.RevenueRank = t0.RevenueRank