-- What proportion of the League's revenues is provided by the Big 6, compared to the rest?
SELECT
    Season,
    SUM(TotalRevenue) as [Total Revenue (£m)],
    SUM(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS [Big 6 Revenue (£m)],
    --SUM(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / SUM(TotalRevenue) as Big6Proportion,
    CAST((SUM(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / SUM(TotalRevenue)) AS DECIMAL(10, 2)) AS [Big 6 Share (%)]
FROM
    PLRevenueByClub
GROUP BY Season