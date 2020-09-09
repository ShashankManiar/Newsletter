CREATE TABLE [NewsLetter].[AnnouncementCategory] (
    [AnnouncementId] INT NOT NULL,
    [CategoryId]     INT NOT NULL,
    CONSTRAINT [PK_AnnouncementCategory] PRIMARY KEY CLUSTERED ([AnnouncementId] ASC, [CategoryId] ASC)
);

