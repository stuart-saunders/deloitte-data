SELECT
    Season,
    COUNT(CASE WHEN Nation = 'England' THEN Nation END) AS [England],
    COUNT(CASE WHEN Nation = 'France' THEN Nation END) AS [France],
    COUNT(CASE WHEN Nation = 'Germany' THEN Nation END) AS [Germany],
    COUNT(CASE WHEN Nation = 'Italy' THEN Nation END) AS [Italy],
    COUNT(CASE WHEN Nation = 'Spain' THEN Nation END) AS [Spain]
FROM
    MoneyLeagueRevenueByClub
GROUP BY Season