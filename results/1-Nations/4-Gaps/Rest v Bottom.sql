SELECT
    Season,
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) As [Rest Revenue Amount],
    SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) As [Bottom Nation Revenue Amount],
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS [Gap Amount],
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS [Gap Ratio]
FROM 
    NationRevenueByStream
GROUP BY Season