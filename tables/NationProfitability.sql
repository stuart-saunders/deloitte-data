--SELECT * FROM NationProfitability
--DROP TABLE NationProfitability

CREATE TABLE [dbo].[NationProfitability] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [Nation]          VARCHAR (10)   NOT NULL,
    [Season]          INT            NOT NULL,
    [WageCosts]       DECIMAL(10, 2) NOT NULL,
    [OperatingResult] DECIMAL(10, 2) NOT NULL,
    CONSTRAINT [PK_NationProfitability] PRIMARY KEY CLUSTERED ([Id] ASC)
);