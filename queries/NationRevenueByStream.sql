-- SELECT * FROM RevenueStream
-- SELECT * FROM Nation
-- SELECT * FROM NationRevenueByStream
-- SELECT * FROM NationProfitability
-- SELECT * FROM MarketValue


SELECT n.Name as 'Country', r.Season, s.Name as 'Revenue Stream', r.TotalRevenue
FROM NationRevenueByStream r
INNER JOIN Nation n ON r.NationId = n.Id
INNER JOIN RevenueStream s ON r.RevenueStreamId = s.Id
-- WHERE n.Name = 'England' AND s.Name = 'Matchday'

-- Total Revenue By Nation
SELECT n.Name as 'Nation', r.Season, SUM(r.TotalRevenue) as 'Total Revenue'
FROM NationRevenueByStream r
INNER JOIN Nation n ON r.NationId = n.Id
GROUP BY n.Name, r.Season
HAVING r.Season = 2015

-- Total Aggregate Revenue
-- SELECT r.Season, n.Name, p.WageCosts, SUM(r.TotalRevenue) as 'Total Revenue'
-- FROM NationRevenueByStream r
-- INNER JOIN Nation n ON r.NationId = n.Id
-- INNER JOIN NationProfitability p ON p.NationId = n.Id
-- GROUP BY r.Season, n.Name, p.WageCosts
-- ORDER BY 'Total Revenue' DESC