
SELECT * FROM PLGrowthBySeasonAndCategory
WHERE Category = 'All'

SELECT
    t1.Club,
    t1.Season,
    t1.TotalRevenue AS Revenue
    t0
    --SUM(TotalRevenue) OVER (ORDER BY TotalRevenue ASC) AS CumulativeRevenue
    --SUM(TotalRevenue) OVER () AS total_revenue
--INTO #Gini_Temp
FROM
    PLRevenueByClub t1
LEFT OUTER JOIN 
    PLRevenueByClub t0
ON
    t1.Season = t0.Season + 1
WHERE
    Club = 'Arsenal'
ORDER BY
    Season



SELECT
    1 - ((CumulativeRevenue + LAG(CumulativeRevenue, 1, 0) OVER (ORDER BY Season)))--* SeasonRevenue) / (2 * SeasonRevenue * MAX(SeasonRevenue)))
FROM
    PLGrowthBySeasonAndCategory

/*
SELECT
    1 - (SUM((CumulativeRevenue + LAG(CumulativeRevenue, 1, 0) OVER (ORDER BY Year)) * Revenue) / (2 * TotalRevenue * MAX(Revenue)))
FROM
    temp_gini_data;
*/




WITH CumulativeCTE AS (
    SELECT
        Category,
        Season,
        CumulativeRevenue,
        LAG(CumulativeRevenue, 1, 0) OVER (PARTITION BY Category ORDER BY Season) AS LaggedCumulativeRevenue,
        SeasonRevenue,
        TotalRevenue        
    FROM
        PLGrowthBySeasonAndCategory
    WHERE
        Category = 'All'
    GROUP BY
        Category, Season, CumulativeRevenue, SeasonRevenue, TotalRevenue
)

SELECT
    1 - (SUM((CumulativeRevenue + LaggedCumulativeRevenue) * SeasonRevenue) / (2 * TotalRevenue * MAX(SeasonRevenue))) AS GiniCoefficient
FROM
    CumulativeCTE
GROUP BY TotalRevenue