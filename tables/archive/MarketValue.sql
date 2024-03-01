CREATE TABLE [dbo].[MarketValue] (
    [Id]     INT            IDENTITY (1, 1) NOT NULL,
    [Market] VARCHAR (10)   NOT NULL,
    [Season] INT            NOT NULL,
    [Value]  DECIMAL (5, 2) NOT NULL,
    CONSTRAINT [PK_MarketValues] PRIMARY KEY CLUSTERED ([Id] ASC)
);
