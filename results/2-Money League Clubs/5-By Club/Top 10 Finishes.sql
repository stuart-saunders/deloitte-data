-- How many Money League apprearances and Top 10 finishes made between 2015 and 2022
SELECT 
    Club, 
    COUNT(Season) AS [No of ML Appearances],
    COUNT(CASE WHEN RevenueRank BETWEEN 1 AND 10 THEN RevenueRank END) As 'Top 10 Finishes',
    COUNT(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN RevenueRank END) As 'Top 5 Finishes'
FROM MoneyLeagueRevenueByClub
GROUP By Club
ORDER BY 
    COUNT(Season) DESC, 
    COUNT(CASE WHEN RevenueRank BETWEEN 1 AND 10 THEN RevenueRank END) DESC,
    COUNT(CASE WHEN RevenueRank BETWEEN 1 AND 5 THEN RevenueRank END) DESC,
    Club



-- How much change has there been in the Top 10?
-- SELECT
--     Club,
--     COUNT(CASE WHEN RevenueRank BETWEEN 1 AND 10 THEN RevenueRank END) As 'Top 10 Finishes'
-- FROM 
--     MoneyLeagueRevenueByClub
-- GROUP BY Club
-- ORDER BY
--     COUNT(CASE WHEN RevenueRank BETWEEN 1 AND 10 THEN RevenueRank END) DESC