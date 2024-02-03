SELECT 
    t1.Season,
    t1.RevenueRank,
    t1.Club,
    t1.TotalRevenue,
    t0.Season AS PrevSeason,
    t0.RevenueRank,
    --t0.Club,
    t0.TotalRevenue,
    t1.TotalRevenue - t0.TotalRevenue AS RevenueChange,
    FORMAT(ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 --Per Period
    AND t1.Club = t0.Club
WHERE t0.Season IS NOT NULL
-- AND t1.Club IN (
--     'Manchester United'
-- )
--ORDER BY (t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue DESC