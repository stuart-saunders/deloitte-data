--SELECT * FROM NationRevenueByStream

SELECT
    Season,
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) As [Top Nation Revenue],
    SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) As [Bottom Nation Revenue],
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS [Gap Amount],
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS [Gap Ratio]
FROM 
    NationRevenueByStream
GROUP BY Season