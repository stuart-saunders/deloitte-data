-- SELECT * FROM CAGR
-- DROP TABLE CAGR

CREATE TABLE [dbo].[CAGR] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [RevenueRank]             INT NOT NULL,
    [Club]                    VARCHAR(30) NOT NULL,
    [Revenue]                 DECIMAL(10,2) NOT NULL,
    [PrevSeason]              INT,
    [PrevRevenueRank]         DECIMAL(10,2),
    [PrevClub]                VARCHAR(30),
    [PrevRevenue]             DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    CONSTRAINT [PK_CAGR] PRIMARY KEY CLUSTERED ([Id] ASC)
);
