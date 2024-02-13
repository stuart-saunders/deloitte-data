SELECT
    t1.Season,
    t1.Nation,
    t1.Club,
    t1.MatchdayRevenue,
    t0.Season AS PrevSeason,
    t0.MatchdayRevenue,
    t1.MatchdayRevenue - t0.MatchdayRevenue AS 'Matchday Growth Amount',
    FORMAT(ROUND(((t1.MatchdayRevenue - t0.MatchdayRevenue) / t0.MatchdayRevenue) * 100, 2), 'N', 'en-gb') AS 'Matchday Growth %'
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        Club,
        MatchdayRevenue
    FROM MoneyLeagueRevenueByClub
) t0
ON t1.Season = t0.Season + 7
AND t1.Nation = t0.Nation
AND t1.Club = t0.Club
WHERE t1.Season = 2022
--GROUP BY t1.Season, t1.Nation, t1.Club, t0.Season, t0.TotalRevenue