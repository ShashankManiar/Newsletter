--declare
CREATE proc [dbo].[AnnoucementDetails]
@clientName nvarchar(500),
	@csaEmailId nvarchar(500),
	@startDate datetime,
	@endDate datetime
AS  
BEGIN

--Select @clientName = 'NATS',
--	@csaEmailId = 'shmaniar@microsoft.com',
--	@startDate = '2018-10-29',
--	@endDate= '2018-11-04'

exec [dbo].[ConsolidateFeeds]

Select 'Data' = '
<tr>
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472C4 1.0pt;background:#4472C4;padding:0cm 5.4pt 0cm 5.4pt">  
<p><em><span lang="EN-US" style='+'''font-size:32.0pt;line-height:85%;
	font-family:"Calibri Light",sans-serif;color:white'+''''+'>Azure Newsletter</span></em> 
<b><i><span lang="EN-US" style="font-size:32.0pt;line-height:85%">
<u></u><u></u></span></i></b></p>  </td>
</tr>

<tr>
<td width=719 colspan=2 valign=top style='+'''' +'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt'+'''' +'>
<p class=MsoSubtitle align=right style='+'''' +'margin-bottom:0cm;margin-bottom:.0001pt;text-align:right'+'''' +'>
<span lang=EN-US>'+format(@startDate,'MMMM dd, yyyy')+ ' – '+ format(@endDate,'MMMM dd, yyyy')
+'<u></u><u></u></span></p>
</td>
</tr>
<tr>
<td width=719 colspan=2 valign=top style='+'''' +'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt'+'''' +'>
<div style='+'''' +'size:612.0pt 792.0pt;font-family:"Calibri",sans-serif;'+'''' +'>
Welcome to the &#39;Azure Newsletter&#39;, a weekly email for the <b>'+@clientName+'</b> Azure community providing relevant Azure updates. 
Please let me know, if you have any follow-on questions or want a briefing on any of it. 
 I’d also welcome any comments on whether this is useful, and anything else you would like to see it cover.
</div>
</td>
</tr>
<tr style='+'''' +'height:17.9pt'+'''' +'>
<td width=719 colspan=2 valign=top style='+'''' +'width:539.5pt;border:solid #4472C41.0pt;border-top:none;background:#4472C4;padding:0cm 5.4pt 0cm 5.4pt;height:17.9pt'+'''' +'>
<p>
<b><span lang=EN-US style='+'''' +'font-size:18.0pt;color:white'+'''' +'>News Highlights</span></b>
<b><span lang=EN-US style='+'''' +'font-size:18.0pt'+'''' +'><o:p></o:p></span></b></p>
</td></tr>',SectionId =0, 'Section' = 'Header'
Union all


Select 'Data' = '<tr>
<td width=719 colspan=2 valign=top style='+''''+'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt'+''''+'>
<p style = '+'''margin:0cm;margin-bottom:.0001pt;	font-size:11.0pt;font-family:"Calibri",sans-serif;mso-fareast-language:EN-US;'+''''+'>
<span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+'''margin:0cm;margin-bottom:.0001pt;	font-size:11.0pt;font-family:"Calibri",sans-serif;mso-fareast-language:EN-US;'+''''+'>
<span lang="EN-US">In this period, there are '
--<b><u>'+Convert(varchar(10),Count(1))+'</u></b> Announcements!</u></span></p>'
,SectionId =1, 'Section' = 'AnnoucementSummary'

union all
Select 'Data' =  '<b><u>'+ Convert(varchar(10),a.ItemCount)+'</u></b> ' + Item +' </u>',
SectionId =2, 'Section' = 'AnnoucementSummary'
From 
(
Select Item ='Announcements,', ItemCount= Count(1) from NewsLetter.Announcements a where PubOn > = @startDate and PubOn <= @endDate
union all
Select Item ='Updates and', ItemCount= Count(1) from NewsLetter.Updates where PubOn > = @startDate and PubOn <= @endDate
union all
Select Item ='Blogs', ItemCount= Count(1) from NewsLetter.blogs where PubOn > = @startDate and PubOn <= @endDate
) a

union All 
Select 'Data' = '</span></p>',
SectionId= 3, 'Section' = 'AnnoucementSummary'

--Union All

--select 
--'<p style = '+'''margin:0cm;margin-bottom:.0001pt;	font-size:11.0pt;font-family:"Calibri",sans-serif;mso-fareast-language:EN-US;'+''''+'><span lang="EN-US">In this period, there are <b><u>'+Convert(varchar(10),Count(1))+'</u></b> Updates!<u></u><u></u></span>
--</p> 
--<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
--</td>
--</tr>
--<tr style="height:17.0pt">
--<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;background:#4472c4;padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt">
--<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><b><span lang="EN-US" style="font-size:18.0pt;color:white"><h1>Announcements Details</h1></span></b><b><span lang="EN-US" style="font-size:18.0pt"><u></u><u></u></span></b></p>
--</td>
--</tr>

--<tr style='+''''+'height:4.55pt'+''''+'><td width=719 colspan=2 valign=top style='+''''+'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:7.55pt'+''''+'><p style='+''''+'margin:0cm;
--	margin-bottom:.0001pt;
--	font-size:11.0pt;
--	font-family:"Calibri",sans-serif'+''''+'><b><span lang=EN-US style='+''''+'font-size:8.0pt;color:white'+''''+'><o:p>&nbsp;</o:p></span></b></p>
--</td></tr>'	,SectionId =20, 'Section' = 'AnnoucementSummary'

--from NewsLetter.Updates
--where PubOn > = @startDate and PubOn <= @endDate

Union All
Select 'Data' = '<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;background:#4472c4;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<b><a name="'+ itemid+'"></a>
<span lang="EN-US" style="color:white">'+Title+'<u></u><u></u></span></b>
</td>
</tr>
<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'>
<span lang="EN-US">'+ Summary+'<u></u><u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US">Announcement Link: <span>
<a href="'+link+'" target="_blank">'+ Link+'</a>
<u></u><u></u></span></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span> </p>
<u></u><u></u></td>
</tr>',SectionId = 21,'Section' = 'Annoucement Detail'
From NewsLetter.Announcements
where PubOn>=    @startdate and PubOn <=   @enddate 

Union All

Select 'Data' = '<tr style="height:17.0pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;background:#4472c4;padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt">
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><b><span lang="EN-US" style="font-size:18.0pt;color:white"><h1>Update Details</h1></span></b><b><span lang="EN-US" style="font-size:18.0pt"><u></u><u></u></span></b></p>
</td>
</tr>
<tr style='+''''+'height:4.55pt'+''''+'><td width=719 colspan=2 valign=top style='+''''+'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:7.55pt'+''''+'><p style='+''''+'margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif'+''''+'><b><span lang=EN-US style='+''''+'font-size:8.0pt;color:white'+''''+'><o:p>&nbsp;</o:p></span></b></p>
</td></tr>'	,SectionId =30, 'Section' = 'UpdateHeader'

Union All

Select 'Data' = '<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;background:#4472c4;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<b><a name="'+ itemid+'"></a>
<span lang="EN-US" style="color:white">'+Title+'<u></u><u></u></span></b>
</td>
</tr>
<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'>
<span lang="EN-US">'+ Summary+'<u></u><u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US">Update Link: <span>
<a href="'+link+'" target="_blank">'+ Link+'</a>
<u></u><u></u></span></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span> </p>
<u></u><u></u></td>
</tr>',SectionId = 31,'Section' = 'Update Detail'
From NewsLetter.Updates
where PubOn>=    @startdate and PubOn <=   @enddate 

Union All

Select 'Data' = '<tr style="height:17.0pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;background:#4472c4;padding:0cm 5.4pt 0cm 5.4pt;height:17.0pt">
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><b><span lang="EN-US" style="font-size:18.0pt;color:white"><h1>Blogs</h1></span></b><b><span lang="EN-US" style="font-size:18.0pt"><u></u><u></u></span></b></p>
</td>
</tr>
<tr style='+''''+'height:4.55pt'+''''+'><td width=719 colspan=2 valign=top style='+''''+'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:7.55pt'+''''+'><p style='+''''+'margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif'+''''+'><b><span lang=EN-US style='+''''+'font-size:8.0pt;color:white'+''''+'><o:p>&nbsp;</o:p></span></b></p>
</td></tr>'	,SectionId =40, 'Section' = 'BlogHeader'


Union All
Select 'Data' = '<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;background:#4472c4;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<b><a name="'+ itemid+'"></a>
<span lang="EN-US" style="color:white">'+Title+'<u></u><u></u></span></b>
</td>
</tr>
<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'>
<span lang="EN-US">'+ Summary+'<u></u><u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US">Blog Link: <span>
<a href="'+link+'" target="_blank">'+ Link+'</a>
<u></u><u></u></span></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span> </p>
<u></u><u></u></td>
</tr>',SectionId = 41,'Section' = 'New Blogs'
From NewsLetter.Blogs
where PubOn>=    @startdate and PubOn <=   @enddate 



Union All

Select 'Data' ='<tr><td width=719 colspan=2 valign=top style='+''''+'width:539.5pt;border:solid #4472C4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt'+''''+'>
<div class=WordSection1>
<p style = '+'''margin:0cm;margin-bottom:.0001pt;	font-size:11.0pt;font-family:"Calibri",sans-serif;mso-fareast-language:EN-US;'+''''+'><b><span lang=EN-US>
Other useful resources:</span></b></p>

<ul type=disc>
 <li style = '+'''margin:0cm;margin-bottom:.0001pt;	font-size:11.0pt;font-family:"Calibri",sans-serif;mso-fareast-language:EN-US;color:black;background:white'+''''+'><a
     href="https://ptdrv.linkedin.com/xiuwz48"
     >Curated list of articles about cloud architecture, patterns, best practices, Azure learning path and DevOps.</a></li>
</ul>

<p class=MsoListParagraph style='+''''+'text-indent:-18.0pt'+'''><span lang=EN-US
style='+'''font-family:Symbol'+'''>·<span style='+'''font:7.0pt "Times New Roman"'+'''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span lang=EN-US>Find out about Microsoft’s commitment to running
Open Source solutions <b><a
href="https://open.microsoft.com/">here</a></b></span></p>

<p class=MsoListParagraph style='+''''+'text-indent:-18.0pt'+'''><span lang=EN-US
style='+'''font-family:Symbol'+'''>·<span style='+'''font:7.0pt "Times New Roman"'+'''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span lang=EN-US>Having difficulty searching Azure Documentation?
Use </span><a
href="https://azure.microsoft.com/en-us/documentation/articles"
>
<b><span
lang=EN-US>this link</span></b></a> <span lang=EN-US>to easily search/browse
Azure docs online</span></p>

<p class=MsoListParagraph style='+''''+'text-indent:-18.0pt'+'''><span lang=EN-US
style='+'''font-family:Symbol'+'''>·<span style='+'''font:7.0pt "Times New Roman"'+'''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span lang=EN-US>Want to meetup with other likeminded Azure
folk?&nbsp; Check out the </span><a
href="http://www.meetup.com/UKAzureUserGroup/"><b><span
lang=EN-US>UK Azure User Group</span></b></a></p>

<p class=MsoListParagraph style='+'''text-indent:-18.0pt'+'''><span style='+'''font-family:
Symbol'+'''>·<span style='+'''font:7.0pt "Times New Roman"'+'''>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span lang=EN-US>Find out about the datacenters that power the </span><a
href="http://www.globalfoundationservices.com/"
><b><span
lang=EN-US>Microsoft Cloud</span></b></a></p>

<p class=MsoListParagraph style='+'''text-indent:-18.0pt'+'''><span lang=EN-US
style='+''''+'font-family:Symbol'+''''+'>·<span style='+''''+'font:7.0pt "Times New Roman"'+'''>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span lang=EN-US>Check out the Microsoft Azure Roadmap </span><a
href="https://azure.microsoft.com/en-us/roadmap/"
><b><span
lang=EN-US>here</span></b></a></p>
<p style = '+'''margin:0cm;margin-bottom:.0001pt;	font-size:11.0pt;font-family:"Calibri",sans-serif;mso-fareast-language:EN-US;'+''''+'>&nbsp;</p>
</div> </td></tr>','SectionId' =99, 'Section' = 'FooterNote'


union all
Select 'Data' =' 
<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:solid #4472c4 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'><span lang="EN-US"><u></u> <u></u></span></p>
<p style = '+''''+'margin:0cm;margin-bottom:.0001pt;font-size:11.0pt;font-family:"Calibri",sans-serif'+''''+'>
<span lang="EN-US" style = '+'''color: brown;'+'''> Please let me know, if you like to <a style = '+'''font-family:Calibri,sans-serif'+''' href="mailto:'+@csaEmailId+'?subject=Azure Newsletter Unsubscribe - ' + @clientName +'" target="_blank">unsubscribe</a> it.' +'<u></u><u></u></span></p>
</td>
</tr>

<tr style="height:1.9pt">
<td width="719" colspan="2" valign="top" style="width:539.5pt;border:none;padding:0cm 5.4pt 0cm 5.4pt;height:1.9pt">
<br><br><br>
<span lang="EN-US"> <i>This automated newletter service is put together by Shashank Maniar for Microsoft UK CSU community.
Please feel free to share your feedback <a href="'+ 'mailto:shashank.maniar@microsoft.com?subject=Azure Newsletter Feedback - ' + @clientName +'">here</a>
</i>
<u></u><u></u></span>
</td>
</tr>','SectionId' =10000, 'Section' = 'FooterNote Desclaimer'

order by SectionId
End

--Select * 
--From NewsLetter.Announcements
--where PubOn>=    @startdate and PubOn <=   @enddate 