
SELECT
    Season,
    Nation,
    COUNT(Nation) AS [Number of Teams]
FROM
    MoneyLeagueRevenueByClub
GROUP BY
    Season, Nation