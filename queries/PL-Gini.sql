-- SELECT * FROM PLRevenueByClub

-- Step 1: Create a temporary table with cumulative revenue and total revenue
--CREATE TEMPORARY TABLE temp_gini_data AS
SELECT
    Club,
    Season,
    TotalRevenue AS Revenue,
    SUM(TotalRevenue) OVER (ORDER BY TotalRevenue ASC) AS CumulativeRevenue,
    SUM(TotalRevenue) OVER () AS total_revenue
INTO #Gini_Temp
FROM
    PLRevenueByClub
WHERE
    Season = '2022';

--SELECT * FROM #Gini_Temp
--DROP TABLE #Gini_Temp

-- Step 2: Calculate the Gini coefficient
SELECT
    1 - (SUM((CumulativeRevenue + LAG(CumulativeRevenue, 1, 0) OVER (ORDER BY Revenue ASC)) * Revenue) OVER () / (2 * total_revenue * MAX(Revenue)))
FROM
    #Gini_Temp;




-- Step 1: Create a common table expression (CTE) with cumulative revenue and total revenue
WITH temp_gini_data AS (
    SELECT
        Club,
        TotalRevenue AS revenue,
        SUM(TotalRevenue) OVER (ORDER BY TotalRevenue ASC) AS cumulative_revenue,
        SUM(TotalRevenue) OVER () AS total_revenue
    FROM
        PLRevenueByClub
    WHERE
        season = '2022'
)

-- Step 2: Calculate the Gini coefficient
SELECT
    1 - (SUM((cumulative_revenue + LAG(cumulative_revenue, 1, 0) OVER (ORDER BY revenue ASC)) * revenue) OVER () / (2 * total_revenue * MAX(revenue)))
FROM
    temp_gini_data;

    SELECT * FROM temp_gini_data










SELECT
    1 - (
        SUM((cumulative_revenue + LAG(cumulative_revenue, 1, 0) OVER (ORDER BY TotalRevenue ASC)) * TotalRevenue) /
        (2 * total_revenue * MAX(TotalRevenue))
    ) AS gini_coefficient
FROM (
    -- Step 2: Create a subquery to calculate cumulative revenue and total revenue
    SELECT
        TotalRevenue,
        SUM(TotalRevenue) OVER (ORDER BY TotalRevenue ASC) AS cumulative_revenue,
        SUM(TotalRevenue) OVER () AS total_revenue
    FROM
        PLRevenueByClub
    WHERE
        Season = '2022'
) AS subquery;











-- DROP TABLE #Gini_Temp
-- SELECT * FROM #Gini_Temp


-- Step 1: Create a temporary table with cumulative revenue and total revenue
SELECT
    Club,
    Season,
    TotalRevenue AS Revenue,
    SUM(TotalRevenue) OVER (ORDER BY TotalRevenue ASC) AS CumulativeRevenue,
    SUM(TotalRevenue) OVER () AS total_revenue
INTO #Gini_Temp
FROM
    PLRevenueByClub
WHERE
    Season = '2022';

-- Step 2: Calculate the Gini coefficient
SELECT
    1 - (SUM((CumulativeRevenue + LaggedCumulativeRevenue) * Revenue) / (2 * total_revenue * MAX(Revenue))) AS GiniCoefficient
FROM (
    SELECT
        Club,
        Season,
        Revenue,
        CumulativeRevenue,
        LAG(CumulativeRevenue, 1, 0) OVER (ORDER BY Revenue ASC) AS LaggedCumulativeRevenue,
        total_revenue
    FROM
        #Gini_Temp
) AS Subquery
GROUP BY
    total_revenue;
