-- Values in £m

/*
SELECT * FROM PLDebtByClub
WHERE Club = 'Chelsea'
*/

SELECT 
    t1.Season AS Current_Season,
    t1.DebtRank,
    t1.Club,
    t1.NetDebt,
    t0.Season AS Comparison_Season,
    t0.DebtRank AS Comparison_Season_Rank,
    t0.Club,
    t0.NetDebt AS Comparison_Debt,
    (t1.NetDebt - t0.NetDebt) AS Debt_Change,
    FORMAT(ROUND(((t1.NetDebt - t0.NetDebt) / t0.NetDebt ) * 100, 2), 'N', 'en-gb') AS Percentage_Debt_Change
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM PLDebtByClub t1
LEFT OUTER JOIN PLDebtByClub t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    --AND t1.RevenueRank = t0.RevenueRank
    AND t1.Club = t0.Club
WHERE t1.Season > 2015
--AND t1.Club = 'Manchester City'
-- AND t1.Season NOT IN ('2020', '2021')
ORDER BY (ROUND(((t1.NetDebt - t0.NetDebt) / t0.NetDebt ) * 100, 2)) DESC