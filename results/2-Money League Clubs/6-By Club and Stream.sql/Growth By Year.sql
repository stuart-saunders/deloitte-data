--- SELECT * FROM MoneyLeagueRevenueByClub

SELECT
    t1.Season,
    t1.Nation,
    t1.Club,
    --SUM(t1.TotalRevenue) AS TotalRevenue,
    t1.MatchdayRevenue,
    t1.BroadcastRevenue,
    t1.CommercialRevenue,
    t0.Season AS PrevSeason,
    t0.MatchdayRevenue,
    t0.BroadcastRevenue,
    t0.CommercialRevenue,
    t1.MatchdayRevenue - t0.MatchdayRevenue AS 'Matchday Growth Amount',
    FORMAT(ROUND(((t1.MatchdayRevenue - t0.MatchdayRevenue) / t0.MatchdayRevenue) * 100, 2), 'N', 'en-gb') AS 'Matchday Growth %',
    t1.BroadcastRevenue - t0.BroadcastRevenue AS 'Broadcast Growth Amount',
    FORMAT(ROUND(((t1.BroadcastRevenue - t0.BroadcastRevenue) / t0.BroadcastRevenue) * 100, 2), 'N', 'en-gb') AS 'Broadcast Growth %',
    t1.CommercialRevenue - t0.CommercialRevenue AS 'Commercial Growth Amount',
    FORMAT(ROUND(((t1.CommercialRevenue - t0.CommercialRevenue) / t0.CommercialRevenue) * 100, 2), 'N', 'en-gb') AS 'Commercial Growth %'
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        Club,
        MatchdayRevenue,
        BroadcastRevenue,
        CommercialRevenue
    FROM MoneyLeagueRevenueByClub
    WHERE Season = 2021
    --GROUP BY Season, Nation, Club
) t0
ON t1.Season = t0.Season + 1
AND t1.Nation = t0.Nation
AND t1.Club = t0.Club
--GROUP BY t1.Season, t1.Nation, t1.Club, t0.Season, t0.TotalRevenue