-- SELECT * FROM PLDebtByClub
-- DROP TABLE PLDebtByClub

CREATE TABLE [dbo].[PLDebtByClub] (
    [Id]              INT IDENTITY (1, 1) NOT NULL,
    [Season]          INT NOT NULL,
    [Club]            VARCHAR(30) NOT NULL,
    [DebtRank]        INT NOT NULL,
    [NetCash]         INT NOT NULL,
    [SoftLoans]       INT NOT NULL,
    [OtherLoans]      INT NOT NULL,
    [NetDebt]         INT NOT NULL,
    [LeaguePosition]  INT NOT NULL
    CONSTRAINT [PK_PLDebtByClub] PRIMARY KEY CLUSTERED ([Id] ASC)
);