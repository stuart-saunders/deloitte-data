
-- SELECT * FROM PLRevenueByClub

    -- How Many Clubs Have Finished Top 5 without having Top 5 Revenue?
SELECT
    Season,
    Club,
    RevenueRank AS [Revenue Rank],
    LeaguePosition AS [League Position],
    RevenueRank - LeaguePosition AS Difference
FROM PLRevenueByClub
WHERE LeaguePosition <= 5
AND RevenueRank >= 6

-- How Many Clubs with Top 5 Revenue have Finished Below 5th?
SELECT
    Season,
    Club,
    RevenueRank,
    LeaguePosition
FROM PLRevenueByClub
WHERE LeaguePosition > 5
AND RevenueRank <= 5

-- How Many Teams Have Finished Bottom 5 with Top 10 Revenue
SELECT
    Season,
    Club,
    RevenueRank,
    LeaguePosition
FROM PLRevenueByClub
WHERE LeaguePosition >= 16
AND RevenueRank <= 10


-- How Many Teams Have Finished Bottom 5 with Top 10 Revenue
SELECT
    Season,
    Club,
    RevenueRank,
    LeaguePosition
FROM PLRevenueByClub
WHERE LeaguePosition >= 16 AND RevenueRank >= 10
ORDER BY Season --RevenueRank, LeaguePosition <= 10

--How Many Teams with Bottom 5 Revenue Finish above Bottom 5
SELECT
    Season,
    Club,
    RevenueRank,
    LeaguePosition
FROM PLRevenueByClub
WHERE LeaguePosition <= 16 AND RevenueRank >=16
--ORDER BY RevenueRank, LeaguePosition <= 10

--How is the Gap Between Top 5 and Bottom 5 Over the Period
-- How Many Teams Have Finished Bottom 5 with Top 10 Revenue
SELECT
    Season,
    Club,
    RevenueRank,
    LeaguePosition,
    TotalRevenue
FROM PLRevenueByClub
WHERE 
    RevenueRank = 1
    OR RevenueRank = 20


-- How has the ratio of revenues of bottom and top changed over time?
SELECT
    t1.Season,
    t1.Club,
    t1.RevenueRank,
    t1.TotalRevenue,
    t0.Club,
    t0.RevenueRank,
    t0.TotalRevenue,
    (t1.TotalRevenue - t0.TotalRevenue) AS RevenueDifference,
    (t0.TotalRevenue / t1.TotalRevenue) AS RevenueProportion
FROM PLRevenueByClub t1
INNER JOIN PLRevenueByClub t0
    ON t0.Season = t1.Season
    AND t0.RevenueRank = t1.RevenueRank + 19


--How Have Revenues of Top 5 and Bottom 5 evolved?



-- Below Top 5 revebue qualifying for Champions' League