-- SELECT * FROM PLRevenueByClub
-- DROP TABLE [dbo].[PLRevenueByClub]

CREATE TABLE [dbo].[PLRevenueByClub] (
    [Id]             INT             IDENTITY (1, 1) NOT NULL,
    [Season]         INT             NOT NULL,
    [Club]           VARCHAR (30)    NOT NULL,
    [RevenueRank]    INT             NOT NULL,
    [TotalRevenue]   DECIMAL (10, 2) NULL,
    [WageCosts]      DECIMAL (10, 2) NULL,
    [LeaguePosition] INT             NULL,
    CONSTRAINT [PK_PLRevenueByClub] PRIMARY KEY CLUSTERED ([Id] ASC)
);