-- SELECT * FROM PLGrowthBySeasonAndCategory WSeason = 2015
-- DROP TABLE PLGrowthBySeasonAndCategory

CREATE TABLE [dbo].[PLGrowthBySeasonAndCategory] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [Category]                VARCHAR(20) NOT NULL,
    [SeasonRevenue]           DECIMAL(10,2) NOT NULL,
    [PrevSeasonRevenue]       DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    [CumulativeRevenue]       DECIMAL(10,2),
    [TotalRevenue]       DECIMAL(10,2)
    CONSTRAINT [PK_PLGrowthBySeason] PRIMARY KEY CLUSTERED ([Id] ASC)
);