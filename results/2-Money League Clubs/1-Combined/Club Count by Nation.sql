-- Top 20
SELECT
    Season,
    COUNT(CASE WHEN Nation = 'England' THEN Nation END) As 'England',
    COUNT(CASE WHEN Nation = 'France' THEN Nation END) As 'France',
    COUNT(CASE WHEN Nation = 'Germany' THEN Nation END) As 'Germany',
    COUNT(CASE WHEN Nation = 'Italy' THEN Nation END) As 'Italy',
    COUNT(CASE WHEN Nation = 'Spain' THEN Nation END) As 'Spain',
    COUNT(CASE WHEN Nation NOT IN ('England', 'France', 'Germany', 'Italy', 'Spain') THEN Nation END) As 'Other'
FROM 
    MoneyLeagueRevenueByClub
GROUP BY Season

--TOP 10
SELECT
    Season,
    COUNT(CASE WHEN Nation = 'England' THEN Nation END) As 'England',
    COUNT(CASE WHEN Nation = 'France' THEN Nation END) As 'France',
    COUNT(CASE WHEN Nation = 'Germany' THEN Nation END) As 'Germany',
    COUNT(CASE WHEN Nation = 'Italy' THEN Nation END) As 'Italy',
    COUNT(CASE WHEN Nation = 'Spain' THEN Nation END) As 'Spain',
    COUNT(CASE WHEN Nation NOT IN ('England', 'France', 'Germany', 'Italy', 'Spain') THEN Nation END) As 'Other'
FROM 
    MoneyLeagueRevenueByClub
WHERE
    RevenueRank <= 10
GROUP BY Season

-- Top 5
SELECT
    Season,
    COUNT(CASE WHEN Nation = 'England' THEN Nation END) As 'England',
    COUNT(CASE WHEN Nation = 'France' THEN Nation END) As 'France',
    COUNT(CASE WHEN Nation = 'Germany' THEN Nation END) As 'Germany',
    COUNT(CASE WHEN Nation = 'Italy' THEN Nation END) As 'Italy',
    COUNT(CASE WHEN Nation = 'Spain' THEN Nation END) As 'Spain',
    COUNT(CASE WHEN Nation NOT IN ('England', 'France', 'Germany', 'Italy', 'Spain') THEN Nation END) As 'Other'
FROM 
    MoneyLeagueRevenueByClub
WHERE
    RevenueRank <= 5
GROUP BY Season