CREATE TABLE [dbo].[PLRevenueByStream] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [Season]        INT           NOT NULL,
    [RevenueStream] NVARCHAR (20) NOT NULL,
    [TotalRevenue]  INT           NOT NULL,
    CONSTRAINT [PK_PLRevenueByStream] PRIMARY KEY CLUSTERED ([Id] ASC)
);