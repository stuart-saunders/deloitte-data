SELECT
    Season,
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) As TopNationRevenueAmount,
    SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) As BottomNationRevenueAmount,
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) - SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS DifferenceAmount,
    SUM(CASE WHEN Nation = 'England' THEN TotalRevenue END) / SUM(CASE WHEN Nation = 'Spain' THEN TotalRevenue END) AS Ratio
FROM 
    NationRevenueByStream
GROUP BY Season