-- DROP TABLE CAGRPerYear
-- SELECT * FROM CAGRPerYear

CREATE TABLE [dbo].[CAGRPerYear] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Season]                  INT NOT NULL,
    [Category]                VARCHAR(20) NOT NULL,
    [TotalRevenue]            DECIMAL(10,2) NOT NULL,
    [TotalPrevRevenue]        DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    CONSTRAINT [PK_CAGRPerYear] PRIMARY KEY CLUSTERED ([Id] ASC)
);