-- How many times have clubs been relegated without having bottom 3 revenue?
SELECT *
FROM PLRevenueByClub
WHERE LeaguePosition > 17
AND RevenueRank < 18