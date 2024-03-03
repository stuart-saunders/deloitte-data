SELECT
    Season,
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) As [Top Nation Revenue Amount],
    SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) As [2nd Nation Revenue Amount],
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS [Gap Amount],
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS [Gap Ratio]
FROM 
    NationRevenueByStream
GROUP BY Season