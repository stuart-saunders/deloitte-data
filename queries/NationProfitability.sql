-- Values in €m

-- SELECT * FROM NationProfitability

-- *************************************
-- * Operating Result
-- *************************************
SELECT 
    t1.Nation,
    t1.Season AS Current_Season,
    t1.OperatingResult AS Current_Operating_Result,
    t0.Season AS Previous_Season,    
    t0.OperatingResult AS Previous_Operating_Result,    
    (t1.OperatingResult - t0.OperatingResult) AS Operating_Result_Increase,
    --ROUND(((t1.OperatingResult - t0.OperatingResult) / t0.OperatingResult) * 100, 2) AS Percentage_Operating_Result_Increase
    FORMAT(ROUND(((t1.OperatingResult - t0.OperatingResult) / t0.OperatingResult) * 100, 2), 'N', 'en-gb') AS Percentage_Operating_Result_Change
FROM NationProfitability t1
INNER JOIN NationProfitability t0 
    ON t1.Season = t0.Season + 1 --Per Year
    --ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.Nation = t0.Nation
-- WHERE t1.Nation = 'England'
--ORDER BY ABS(ROUND(((t1.OperatingResult - t0.OperatingResult) / t0.OperatingResult) * 100, 2))
-- ORDER BY
--   CASE
--     WHEN ROUND(((t1.OperatingResult - t0.OperatingResult) / t0.OperatingResult) * 100, 2) >= 0 THEN 0
--     ELSE 1
--   END, ABS(ROUND(((t1.OperatingResult - t0.OperatingResult) / t0.OperatingResult) * 100, 2)) DESC
ORDER BY Current_Season