CREATE TABLE [dbo].[Subscription] (
    [ClientName]        NVARCHAR (100) NOT NULL,
    [CSAEmailId]        NVARCHAR (100) NOT NULL,
    [ClientContactList] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED ([ClientName] ASC, [CSAEmailId] ASC)
);

