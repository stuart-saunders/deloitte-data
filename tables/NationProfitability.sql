CREATE TABLE [dbo].[NationProfitability] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [NationId]        INT NOT NULL,
    [Season]          INT NOT NULL,
    [WageCosts]       INT NOT NULL,
    [OperatingResult] INT NOT NULL,
    CONSTRAINT [PK_NationProfitability] PRIMARY KEY CLUSTERED ([Id] ASC)
);