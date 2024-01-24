-- SELECT * FROM PLGrowthBySeason WHERE Season = 2015
-- DROP TABLE PLGrowthBySeason

CREATE TABLE [dbo].[PLGrowthBySeason] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [Category]                VARCHAR(20) NOT NULL,
    [SeasonRevenue]           DECIMAL(10,2) NOT NULL,
    [PrevSeasonRevenue]       DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    [CumulativeRevenue]       DECIMAL(10,2)
    CONSTRAINT [PK_PLGrowthBySeason] PRIMARY KEY CLUSTERED ([Id] ASC)
);