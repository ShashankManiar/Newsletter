CREATE Proc [dbo].[ConsolidateFeeds]
as
Begin

	/*Announcements*/
	
	Insert Into Newsletter.Category([Description])
	Select distinct category from AnnouncementCategory uc
	where not exists ( Select 1 from Newsletter.Category uc1 
		where uc.Category = uc1.[Description])


	Insert into [NewsLetter].[Announcements](	[ItemId],[Title], [Summary],[PubOn],[Link],[CreatedOn])
	Select distinct da2.ItemId, Title, Summary, PubOn,Link,getDate()
		from [dbo].[Announcements] da2
		where not exists (Select 1 from [NewsLetter].[Announcements] nl
								where nl.[ItemId] = da2.itemid)

	Insert into [Newsletter].[AnnouncementCategory]( AnnouncementId,CategoryId)
	Select up.AnnouncementId, a.Categoryid
	from [Newsletter].[Announcements] up
	join (
	select [AnnouncementId]=min(up1.Announcementid), itemId, c.categoryId
	from dbo.Announcements up1
	join dbo.AnnouncementCategory uc on uc.Announcementid = up1.AnnouncementId
	join [Newsletter].Category c on c.[Description] = uc.Category
	group by itemid, c.CategoryId) a
	on a.ItemId = up.ItemId
	where not exists (Select 1 from  [Newsletter].[AnnouncementCategory] uc2
	where uc2.categoryid = a.CategoryId and uc2.Announcementid = up.AnnouncementId)
	
	truncate table dbo.Announcements
	truncate table dbo.announcementcategory
	
	/*Updates*/
	Insert Into Newsletter.Category([Description])
	Select distinct category from updateCategory uc
	where not exists ( Select 1 from Newsletter.Category uc1 
		where uc.Category = uc1.[Description])


	Insert into [NewsLetter].[Updates](	[ItemId],[Title], [Summary],[PubOn],[Link],[CreatedOn])
	Select distinct da2.ItemId, Title, Summary, PubOn,Link,getDate()
		from [dbo].[Updates] da2
		where not exists (Select 1 from [NewsLetter].[Updates] nl
								where nl.[ItemId] = da2.itemid)

	Insert into [Newsletter].[UpdateCategory]( UpdateId,CategoryId)
	Select up.UpdateId, a.Categoryid
	from [Newsletter].[Updates] up
	join (
	select [updateId]=min(up1.updateid), itemId, c.categoryId
	from dbo.Updates up1
	join dbo.UpdateCategory uc on uc.updateid = up1.UpdateId
	join [Newsletter].Category c on c.[Description] = uc.Category
	group by itemid, c.CategoryId) a
	on a.ItemId = up.ItemId
	where not exists (Select 1 from  [Newsletter].[UpdateCategory] uc2
	where uc2.categoryid = a.CategoryId and uc2.Updateid = up.UpdateId)
	
	
	truncate table dbo.updates
	truncate table dbo.UpdateCategory
	

	/*Blog*/
	
	Insert Into Newsletter.Category([Description])
	Select distinct category from BlogCategory uc
	where not exists ( Select 1 from Newsletter.Category uc1 
		where uc.Category = uc1.[Description])


	Insert into [NewsLetter].[Blogs](	[ItemId],[Title], [Summary],[PubOn],[Link],[CreatedOn])
	Select distinct da2.ItemId, Title, Summary, PubOn,Link,getDate()
		from [dbo].[Blogs] da2
		where not exists (Select 1 from [NewsLetter].[Blogs] nl
								where nl.[ItemId] = da2.itemid)

	Insert into [Newsletter].[BlogCategory]( BlogId,CategoryId)
	Select up.BlogId, a.Categoryid
	
	from [Newsletter].[Blogs] up
	
	join (
			select [BlogId]=min(up1.Blogid), itemId, c.categoryId
			from dbo.Blogs up1
			join dbo.BlogCategory uc on uc.Blogid = up1.BlogId
			join [Newsletter].Category c on c.[Description] = uc.Category
				group by itemid, c.CategoryId) a
	on a.ItemId = up.ItemId
	where not exists (Select 1 from  [Newsletter].[BlogCategory] uc2
	where uc2.categoryid = a.CategoryId and uc2.Blogid = up.BlogId)
	
	
	truncate table dbo.blogs
	truncate table dbo.blogcategory
	
End