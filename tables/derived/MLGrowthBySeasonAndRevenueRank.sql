-- SELECT * FROM MLGrowthBySeasonAndRevenueRank
-- DROP TABLE MLGrowthBySeasonAndRevenueRank

CREATE TABLE [dbo].[MLGrowthBySeasonAndRevenueRank] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [RevenueRank]             INT NOT NULL,
    [Club]                    VARCHAR(20),
    [Revenue]                 DECIMAL(10,2) NOT NULL,
    [PrevSeason]              INT,
    [PrevRevenueRank]         INT,    
    [PrevClub]                VARCHAR(20),
    [PrevRevenue]             DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    CONSTRAINT [PK_MLGrowthBySeasonAndRevenueRank] PRIMARY KEY CLUSTERED ([Id] ASC)
);