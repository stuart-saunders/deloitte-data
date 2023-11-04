-- SELECT * FROM PLRevenueByClub
-- DROP TABLE [dbo].[PLRevenueByClub]
CREATE TABLE [dbo].[PLRevenueByClub] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [Season]          INT NOT NULL,
    [Club]            VARCHAR(30) NOT NULL,
    [RevenueRank]     INT NOT NULL,
    [TotalRevenue]    INT NULL,
    [WageCosts]       INT NULL,
    [LeaguePosition]  INT NOT NULL,
    CONSTRAINT [PK_PLRevenueByClub] PRIMARY KEY CLUSTERED ([Id] ASC)
);