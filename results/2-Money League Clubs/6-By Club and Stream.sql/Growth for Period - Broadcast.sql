SELECT
    t1.Season,
    t1.Nation,
    t1.Club,
    t1.BroadcastRevenue,
    t0.Season AS PrevSeason,
    t0.BroadcastRevenue,
    t1.BroadcastRevenue - t0.BroadcastRevenue AS 'Broadcast Growth Amount',
    FORMAT(ROUND(((t1.BroadcastRevenue - t0.BroadcastRevenue) / t0.BroadcastRevenue) * 100, 2), 'N', 'en-gb') AS 'Broadcast Growth %'
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        Club,
        BroadcastRevenue
    FROM MoneyLeagueRevenueByClub
) t0
ON t1.Season = t0.Season + 7
AND t1.Nation = t0.Nation
AND t1.Club = t0.Club
ORDER BY [Broadcast Growth %] DESC