-- Which clubs outside Big 6 have qualified for Champions' League?
-- Correlation between CL Qualification and Revenue?
SELECT *
FROM PLRevenueByClub
WHERE RevenueRank > 5 and LeaguePosition < 5