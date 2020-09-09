CREATE TABLE [dbo].[Announcements] (
    [ItemId]         VARCHAR (500)   NOT NULL,
    [Title]          NVARCHAR (MAX)  NOT NULL,
    [Summary]        NVARCHAR (MAX)  NOT NULL,
    [PubOn]          DATETIME        NULL,
    [Link]           NVARCHAR (2000) NOT NULL,
    [AnnouncementId] INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_Annoucements] PRIMARY KEY CLUSTERED ([AnnouncementId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Announcements_1]
    ON [dbo].[Announcements]([ItemId] ASC);

