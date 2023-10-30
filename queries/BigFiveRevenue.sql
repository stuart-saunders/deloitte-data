SELECT * FROM RevenueStream
SELECT * FROM BigFiveCountry
SELECT * FROM BigFiveRevenue

SELECT c.Name, r.Season, rs.Name, r.RevenueAmount
FROM BigFiveRevenue r
INNER JOIN BigFiveCountry c ON r.CountryId = c.Id
INNER JOIN RevenueStream rs ON r.RevenueStreamId = rs.Id