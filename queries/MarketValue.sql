SELECT * FROM Market
SELECT * FROM MarketValue

SELECT m.Name, mv.Season, mv.Value
FROM MarketValue mv
INNER JOIN Market m
ON mv.MarketId = m.Id