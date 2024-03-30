-- How do Big 6 Average Revenues compare to the Average Revenues of the Rest?
SELECT
    Season,
    --AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS [Big 6 Avg Revenue],
    CAST((AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)) AS DECIMAL(10, 2)) AS [Big 6 Avg Revenue (£m)],
    --AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS RestAverage,
    CAST((AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)) AS DECIMAL(10, 2)) AS [Rest Avg Revenue (£m)],
    --AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) - AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Difference,
    CAST((AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) - AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)) AS DECIMAL(10, 2)) AS [Gap (£m)],
    --AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Ratio
    CAST((AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)) AS DECIMAL(10, 2)) AS [Gap Ratio]
FROM
    PLRevenueByClub
GROUP BY Season