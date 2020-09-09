CREATE TABLE [NewsLetter].[Blogs] (
    [ItemId]    VARCHAR (500)   NULL,
    [Title]     NVARCHAR (MAX)  NOT NULL,
    [Summary]   NVARCHAR (MAX)  NOT NULL,
    [PubOn]     DATETIME        NULL,
    [Link]      NVARCHAR (2000) NOT NULL,
    [BlogId]    INT             IDENTITY (1, 1) NOT NULL,
    [CreatedOn] DATETIME        NULL,
    CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED ([BlogId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Blogs]
    ON [NewsLetter].[Blogs]([ItemId] ASC);

