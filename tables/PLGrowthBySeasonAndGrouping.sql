-- SELECT * FROM PLGrowthBySeasonAndGrouping
-- DROP TABLE PLGrowthBySeasonAndGrouping

CREATE TABLE [dbo].[PLGrowthBySeasonAndGrouping] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [Grouping]                VARCHAR(20) NOT NULL,
    [Revenue]           DECIMAL(10,2) NOT NULL,
    [PrevSeason]              INT,
    [PrevRevenue]       DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    [CumulativeRevenue]       DECIMAL(10,2),
    [TotalRevenue]       DECIMAL(10,2)
    CONSTRAINT [PK_PLGrowthBySeasonAndGrouping] PRIMARY KEY CLUSTERED ([Id] ASC)
);