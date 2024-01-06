-- Values in €m

-- SELECT * FROM MarketValue
--WHERE Market = 'Big5Other'

-- Year-on-Year Increases
SELECT 
    t1.Market AS Market,
    t1.Season AS Current_Season,
    t1.Value AS Current_Value,
    t0.Season AS Previous_Season,
    t0.Value AS Previous_Value,
    (t1.Value - t0.Value) AS Period_Increase,
    FORMAT(ROUND(((t1.Value - t0.Value) / t0.Value), 2), 'N', 'en-gb') AS Percentage_Increase
FROM MarketValue t1
INNER JOIN MarketValue t0 
    -- ON t1.Season = t0.Season + 1 --Per Year
    ON t1.Season = t0.Season + 8 -- Per Period
    AND t1.Market = t0.Market
--WHERE t1.Market = 'Big5Top'
--OR t1.Market = 'Big5Other'
-- WHERE t1.Market = 'Non5Top'
-- WHERE t1.Market = 'Non5Other'
-- WHERE t1.Market = 'Gov'
ORDER BY Percentage_Increase DESC