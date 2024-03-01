-- Values in €m

/*
SELECT * FROM MarketValue
WHERE Market = 'Big5Other'
*/

--*************************************
--* Year-on-Year Increases
--*************************************
SELECT 
    t1.Market AS Market,
    t1.Season AS Current_Season,
    t1.Value AS Current_Value,
    t0.Season AS Comparison_Season,
    t0.Value AS Comparison_Value,
    (t1.Value - t0.Value) AS Period_CHange,
    FORMAT(ROUND(((t1.Value - t0.Value) / t0.Value), 2), 'N', 'en-gb') AS Percentage_Change
FROM MarketValue t1
INNER JOIN MarketValue t0 
    ON t1.Season = t0.Season + 1 --Per Year
    -- ON t1.Season = t0.Season + 7 -- Per Period
    AND t1.Market = t0.Market
WHERE t0.Season >= '2014'
--WHERE t1.Season = '2022'
--WHERE t1.Market = 'Big5Top'
--OR t1.Market = 'Big5Other'
-- WHERE t1.Market = 'Non5Top'
-- WHERE t1.Market = 'Non5Other'
-- WHERE t1.Market = 'Gov'
ORDER BY Current_Season 


/*
European Market Dominated by the top leagues Big 5 Nations of England, Spain, Germany, Italy and France

Between 2015 and 2022, the Market as a whole has increased by 35% (21.8 => 29.5)

Biggest growth, in percentage terms has been the International game (Governing Bodies and National Associations), 
but still dwarfed in finanical terms by the top leagues of the Big 5.

Big 5 top leagues represent 58% of the market in 2022, up from 55% in 2015.

Between 2015 and 2022, Big 5's top leagues have had by far the biggest growth, at 43%, with the others trailing in the teens.

Big 5 top leagues are increasing market share, and growing at more than 3 times the rate of the lower leagues in those countries,
and way in excess of twice the rate of the leagues outside of the biggest nations.
*/