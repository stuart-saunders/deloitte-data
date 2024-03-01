SELECT
    t1.Season,
    t1.Nation,
    SUM(t1.BroadcastRevenue) AS BroadcastRevenue,
    SUM(t1.CommercialRevenue) AS CommercialRevenue,
    SUM(t1.MatchdayRevenue) AS MatchdayRevenue,
    t0.Season AS PrevSeason,
    t0.BroadcastRevenue AS PrevBroadcastRevenue,
    t0.CommercialRevenue AS PrevCommercialRevenue,
    t0.BroadcastRevenue AS PrevMatchdayRevenue,
    SUM(t1.BroadcastRevenue) - t0.BroadcastRevenue AS 'Broadcast Growth Amount',
    SUM(t1.CommercialRevenue) - t0.CommercialRevenue AS 'Commercial Growth Amount',
    SUM(t1.MatchdayRevenue) - t0.MatchdayRevenue AS 'Matchday Growth Amount',
    FORMAT(ROUND(((SUM(t1.BroadcastRevenue) - t0.BroadcastRevenue) / t0.BroadcastRevenue) * 100, 2), 'N', 'en-gb') AS 'Broadcast Growth %',
    FORMAT(ROUND(((SUM(t1.CommercialRevenue) - t0.CommercialRevenue) / t0.CommercialRevenue) * 100, 2), 'N', 'en-gb') AS 'Commercial Growth %',
    FORMAT(ROUND(((SUM(t1.MatchdayRevenue) - t0.MatchdayRevenue) / t0.MatchdayRevenue) * 100, 2), 'N', 'en-gb') AS 'Matchday Growth %'
FROM MoneyLeagueRevenueByClub t1
LEFT OUTER JOIN (
    SELECT
        Season,
        Nation,
        --Club,
        SUM(BroadcastRevenue) AS BroadcastRevenue,
        SUM(CommercialRevenue) AS CommercialRevenue,
        SUM(MatchdayRevenue) AS MatchdayRevenue
    FROM MoneyLeagueRevenueByClub
    GROUP BY Season, Nation
) t0
ON t1.Season = t0.Season + 1
AND t1.Nation = t0.Nation
--AND t1.Club = t0.Club
--WHERE t1.Nation = 'ENf'
GROUP BY  t1.Season, t1.Nation, t0.Season, t0.BroadcastRevenue, t0.CommercialRevenue, t0.MatchdayRevenue
--ORDER BY [Broadcast Growth %] DESC