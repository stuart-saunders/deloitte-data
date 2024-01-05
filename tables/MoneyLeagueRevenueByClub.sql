--SELECT * FROM MoneyLeagueRevenueByClub
--DROP TABLE MoneyLeagueRevenueByClub

CREATE TABLE [dbo].[MoneyLeagueRevenueByClub] (
    [Id]                  INT IDENTITY (1, 1) NOT NULL,
    [Nation]              VARCHAR(10) NOT NULL,
    [Season]              INT NOT NULL,
    [Club]                VARCHAR(30) NOT NULL,
    [RevenueRank]         INT NOT NULL,
    [MatchdayRevenue]     DECIMAL(5, 1) NOT NULL,
    [BroadcastRevenue]    DECIMAL(5, 1) NOT NULL,
    [CommercialRevenue]   DECIMAL(5, 1) NOT NULL,
    [TotalRevenue]        DECIMAL(5, 1) NOT NULL,
    [TransferIncome]      DECIMAL(5, 1) NULL,
    [TransferExpenditure] DECIMAL(5, 1) NULL,
    [NetTransferBalance]  DECIMAL(5, 1) NULL,
    [WageCosts]           DECIMAL(5, 1) NULL,
    [LeaguePosition]      INT NOT NULL,
    CONSTRAINT [PK_MoneyLeagueRevenueByClub] PRIMARY KEY CLUSTERED ([Id] ASC)
);