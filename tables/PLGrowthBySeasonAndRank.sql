-- SELECT * FROM PLGrowthBySeasonAndRank
-- DROP TABLE PLGrowthBySeasonAndRank

CREATE TABLE [dbo].[PLGrowthBySeasonAndRank] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [RevenueRank]             INT NOT NULL,
    [Revenue]                 DECIMAL(10,2) NOT NULL,
    [PrevSeason]              INT,
    [PrevRevenueRank]         INT,
    [PrevRevenue]             DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    CONSTRAINT [PK_PLGrowthBySeasonAndRank] PRIMARY KEY CLUSTERED ([Id] ASC)
);


/*
SELECT 
    Season,
    --RevenueRank,
    -- t1.Club,
    SUM(Revenue) AS TotalRevenue,
    --t0.Season AS Comparison_Season,
    -- t0.RevenueRank AS Comparison_Season_Rank,
    -- t0.Club,
    SUM(PrevRevenue) AS TotalPrevRevenue,
    (SUM(Revenue) - SUM(PrevRevenue)) AS RevenueChange,
    FORMAT(ROUND(((SUM(Revenue) - SUM(PrevRevenue)) / SUM(PrevRevenue) ) * 100, 2), 'N', 'en-gb') AS PercentageRevenueChange
    --ROUND(((t1.TotalRevenue - t0.TotalRevenue) / t0.TotalRevenue ), 2) AS Percentage_Revenue_Increase
FROM CAGR
WHERE RevenueRank BETWEEN 1 AND 5
GROUP BY Season
*/