CREATE TABLE [NewsLetter].[Updates] (
    [ItemId]    VARCHAR (500)   NULL,
    [Title]     NVARCHAR (MAX)  NOT NULL,
    [Summary]   NVARCHAR (MAX)  NOT NULL,
    [PubOn]     DATETIME        NULL,
    [Link]      NVARCHAR (2000) NOT NULL,
    [CreatedOn] DATETIME        NULL,
    [UpdateId]  INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Updates] PRIMARY KEY CLUSTERED ([UpdateId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Updates]
    ON [NewsLetter].[Updates]([ItemId] ASC);

