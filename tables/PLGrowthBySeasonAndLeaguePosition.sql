-- SELECT * FROM PLGrowthBySeasonAndLeaguePosition
-- DROP TABLE PLGrowthBySeasonAndLeaguePosition

CREATE TABLE [dbo].[PLGrowthBySeasonAndLeaguePosition] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [LeaguePosition]          INT,
    [Club]                    VARCHAR(20),
    [Revenue]                 DECIMAL(10,2) NOT NULL,
    [PrevSeason]              INT,
    [PrevLeaguePosition]      INT,
    [PrevClub]                VARCHAR(20),
    [PrevRevenue]             DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    CONSTRAINT [PK_PLGrowthBySeasonAndLeaguePosition] PRIMARY KEY CLUSTERED ([Id] ASC)
);