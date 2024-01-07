-- SELECT * FROM PLDebtByClub
-- DROP TABLE PLDebtByClub

CREATE TABLE [dbo].[PLDebtByClub] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Season]         INT            NOT NULL,
    [Club]           VARCHAR (30)   NOT NULL,
    [DebtRank]       INT            NOT NULL,
    [NetCash]        DECIMAL(10, 2) NOT NULL,
    [SoftLoans]      DECIMAL(10, 2) NOT NULL,
    [OtherLoans]     DECIMAL(10, 2) NOT NULL,
    [NetDebt]        DECIMAL(10, 2) NOT NULL,
    [LeaguePosition] INT            NOT NULL,
    CONSTRAINT [PK_PLDebtByClub] PRIMARY KEY CLUSTERED ([Id] ASC)
);