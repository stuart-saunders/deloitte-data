-- What proportion of the League's revenues is provided by the Big 6, compared to the rest?
SELECT
    Season,
    SUM(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) AS Big6Revenue,
    SUM(TotalRevenue) as TotalRevenue,
    SUM(CASE WHEN Club IN ('Manchester United', 'Manchester City', 'Liverpool', 'Chelsea', 'Arsenal', 'Tottenham') THEN TotalRevenue END) / SUM(TotalRevenue) as Big6Proportion
FROM
    PLRevenueByClub
GROUP BY Season