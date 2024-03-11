-- How many times have clubs been relegated without having bottom 3 revenue?
SELECT 
    Season, 
    Club, 
    RevenueRank AS [Revenue Rank],
    LeaguePosition AS [League Position]
FROM PLRevenueByClub
WHERE LeaguePosition > 17
AND RevenueRank < 18