SELECT
    Season,
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) As RestRevenueAmount,
    SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) As BottomNationRevenueAmount,
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS DifferenceAmount,
    SUM(CASE WHEN Nation IN ('England', 'Germany', 'Spain', 'Italy') THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'France' THEN TotalRevenue END) AS Ratio
FROM 
    NationRevenueByStream
GROUP BY Season