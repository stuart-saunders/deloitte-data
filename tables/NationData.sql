--SELECT * FROM NationData
--DROP TABLE NationData

CREATE TABLE [dbo].[NationData] (
    [Id]                     INT          IDENTITY (1, 1) NOT NULL,
    [Nation]                 VARCHAR (10)   NOT NULL,
    [Season]                 INT            NOT NULL,
    [WageCosts]              DECIMAL(10, 2) NOT NULL,
    [OperatingResult]        DECIMAL(10, 2) NOT NULL,
    [AverageRevenuePerClub]  DECIMAL(10,2),
    [RevenueRank]            INT
    CONSTRAINT [PK_NationData] PRIMARY KEY CLUSTERED ([Id] ASC)
);