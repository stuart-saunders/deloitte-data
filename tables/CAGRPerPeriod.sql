-- DROP TABLE CAGRPerPeriod
-- SELECT * FROM CAGRPerPeriod

-- CREATE TABLE [dbo].[CAGRPerPeriod] (
--     [Id]                      INT IDENTITY (1, 1) NOT NULL,
--     [Category]                VARCHAR(20) NOT NULL,
--     [Season]                  INT NOT NULL,
--     [TotalRevenue]            DECIMAL(10,2) NOT NULL,
--     [StartSeason]             INT NOT NULL,
--     [TotalStartRevenue]       DECIMAL(10,2),
--     [RevenueChange]           DECIMAL(10,2),
--     [PercentageRevenueChange] DECIMAL(10,2),
--     CONSTRAINT [PK_CAGRPerPeriod] PRIMARY KEY CLUSTERED ([Id] ASC)
-- );

CREATE TABLE [dbo].[CAGRPerPeriod] (
    [Id]                      INT IDENTITY (1, 1) NOT NULL,
    [Category]                VARCHAR(20) NOT NULL,
    [Season]                  INT NOT NULL,
    [TotalRevenue]            DECIMAL(10,2) NOT NULL,
    [StartSeason]             INT NOT NULL,
    [TotalStartRevenue]       DECIMAL(10,2),
    [RevenueChange]           DECIMAL(10,2),
    [PercentageRevenueChange] DECIMAL(10,2),
    CONSTRAINT [PK_CAGRPerPeriod] PRIMARY KEY CLUSTERED ([Id] ASC)
);