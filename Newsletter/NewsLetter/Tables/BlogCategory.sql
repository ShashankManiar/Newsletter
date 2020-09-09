CREATE TABLE [NewsLetter].[BlogCategory] (
    [BlogId]     INT NOT NULL,
    [CategoryId] INT NOT NULL,
    CONSTRAINT [PK_BlogCategory] PRIMARY KEY CLUSTERED ([BlogId] ASC, [CategoryId] ASC)
);

