-- Values in €m

-- SELECT * FROM NationRevenueByStream


-- Total Aggregate Revenue
-- SELECT r.Season, n.Name, p.WageCosts, SUM(r.TotalRevenue) as 'Total Revenue'
-- FROM NationRevenueByStream r
-- INNER JOIN Nation n ON r.NationId = n.Id
-- INNER JOIN NationProfitability p ON p.NationId = n.Id
-- GROUP BY r.Season, n.Name, p.WageCosts
-- ORDER BY 'Total Revenue' DESC