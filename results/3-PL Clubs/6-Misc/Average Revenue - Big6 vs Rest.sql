-- How do Big 6 Average Revenues compare to the Average Revenues of the Rest?
SELECT
    Season,
    AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Big6Average,
    AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS RestAverage,
    AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) - AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Difference,
    AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Ratio
FROM
    PLRevenueByClub
GROUP BY Season