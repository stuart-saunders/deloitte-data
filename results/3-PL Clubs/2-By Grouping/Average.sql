SELECT
  t1.Season,
  AVG(t1.TotalRevenue),
  --STDEV(t1.TotalRevenue),
  t0.Season,
  AVG(t0.TotalRevenue),
  --STDEV(t1.TotalRevenue),
  (AVG(t1.TotalRevenue) / AVG(t0.TotalRevenue) - 1) * 100
FROM PLRevenueByClub t1
LEFT OUTER JOIN PLRevenueByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    AND t1.Club = t0.Club
WHERE t0.Season IS NOT NULL

GROUP By t1.Season, t0.Season