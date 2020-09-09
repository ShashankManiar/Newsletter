CREATE TABLE [dbo].[Updates] (
    [ItemId]   VARCHAR (500)   NULL,
    [Title]    NVARCHAR (MAX)  NOT NULL,
    [Summary]  NVARCHAR (MAX)  NOT NULL,
    [PubOn]    DATETIME        NULL,
    [Link]     NVARCHAR (2000) NOT NULL,
    [UpdateId] INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Updates] PRIMARY KEY CLUSTERED ([UpdateId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Updates_1]
    ON [dbo].[Updates]([ItemId] ASC);

