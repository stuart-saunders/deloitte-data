SELECT
    Season,
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) As [Top Nation Revenue (€m)],
    SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) As [2nd Nation Revenue (€m)],
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS [Gap (€m)],
    --SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS [Gap Ratio],
    CAST(SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM 
    NationRevenueByStream
GROUP BY Season