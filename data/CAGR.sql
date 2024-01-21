INSERT INTO CAGR
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
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    --AND t1.Club = t0.Club
    AND t1.RevenueRank = t0.RevenueRank
--WHERE t1.Season = '2022'
--GROUP BY t1.Season