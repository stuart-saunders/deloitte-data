SELECT
    Season,
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) As [Rest Revenue (€m)],
    SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) As [Bottom Nation Revenue (€m)],
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS [Gap (€m)],
    --SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS [Gap Ratio]
    CAST(SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS DECIMAL(10,2)) AS [Gap Ratio]
FROM 
    NationRevenueByStream
GROUP BY Season