SELECT
    Season,
    SUM(CASE WHEN Nation IN ('France', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) As RestRevenueAmount,
    SUM(CASE WHEN Nation IN ('England') THEN TotalRevenue END) As TopNationRevenueAmount,
    SUM(CASE WHEN Nation IN ('France', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) - SUM(CASE WHEN Nation IN ('England') THEN TotalRevenue END) AS DifferenceAmount,
    SUM(CASE WHEN Nation IN ('France', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) / SUM(CASE WHEN Nation IN ('England') THEN TotalRevenue END) AS Ratio
FROM 
    NationRevenueByStream
GROUP BY Season