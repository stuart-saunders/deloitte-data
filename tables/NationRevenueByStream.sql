-- SELECT * FROM NationRevenueByStream
-- DELETE FROM NationRevenueByStream
-- DROP TABLE NationRevenueByStream

CREATE TABLE [dbo].[NationRevenueByStream] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [Nation]        VARCHAR (10)   NOT NULL,
    [Season]        INT            NOT NULL,
    [RevenueStream] NVARCHAR (20)  NOT NULL,
    [TotalRevenue]  DECIMAL(10, 2) NOT NULL,
    CONSTRAINT [PK_NationRevenueByStream] PRIMARY KEY CLUSTERED ([Id] ASC)
);