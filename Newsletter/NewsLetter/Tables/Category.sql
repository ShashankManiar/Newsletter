CREATE TABLE [NewsLetter].[Category] (
    [CategoryId]  INT            IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Category_Desc]
    ON [NewsLetter].[Category]([Description] ASC);

