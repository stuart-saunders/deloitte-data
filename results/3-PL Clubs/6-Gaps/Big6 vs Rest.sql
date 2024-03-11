-- How do Big 6 Average Revenues compare to the Average Revenues of the Rest?
SELECT
    Season,
    --AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS [Big 6 Avg Revenue],
    FORMAT((ROUND((AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)), 2)), 'N', 'en-gb')  AS [Big 6 Avg Revenue],
    --AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS RestAverage,
    FORMAT((ROUND((AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)), 2)), 'N', 'en-gb')  AS [Rest Avg Revenue],
    --AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) - AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Difference,
    FORMAT((ROUND((AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) - AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)), 2)), 'N', 'en-gb')  AS [Gap Amount],
    --AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Ratio
    FORMAT((ROUND((AVG(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / AVG(CASE WHEN Club NOT IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END)), 2)), 'N', 'en-gb')  AS [Gap Ratio]
FROM
    PLRevenueByClub
GROUP BY Season