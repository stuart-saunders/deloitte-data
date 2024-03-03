SELECT
    Season,
    SUM(CASE WHEN Nation IN ('France', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) As [Rest Revenue Amount],
    SUM(CASE WHEN Nation IN ('England') THEN TotalRevenue END) As [Top Nation Revenue Amount],
    SUM(CASE WHEN Nation IN ('France', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) - SUM(CASE WHEN Nation IN ('England') THEN TotalRevenue END) AS [Gap Amount],
    SUM(CASE WHEN Nation IN ('France', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) / SUM(CASE WHEN Nation IN ('England') THEN TotalRevenue END) AS [Gap Ratio]
FROM 
    NationRevenueByStream
GROUP BY Season