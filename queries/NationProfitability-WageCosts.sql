-- Values in €m

-- SELECT * FROM NationProfitability


-- *************************************
-- * Wage Costs
-- *************************************
SELECT 
    t1.Nation,
    t1.Season AS Current_Season,
    t1.WageCosts AS Current_Wage_Costs,
    t0.Season AS Previous_Season,
    t0.WageCosts AS Previous_Wage_Costs,
    (t1.WageCosts - t0.WageCosts) AS Wage_Cost_Increase,
    FORMAT(ROUND(((t1.WageCosts - t0.WageCosts) / t0.WageCosts ), 2), 'N', 'en-gb') AS Percentage_Wage_Cost_Increase
FROM NationProfitability t1
INNER JOIN NationProfitability t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.Nation = t0.Nation
-- WHERE t1.Nation = 'England'
ORDER BY Current_Season
