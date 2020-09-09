
CREATE proc NewsLetterHeader
	@clientName nvarchar(500),
	@csaEmailId nvarchar(500),
	@startDate datetime,
	@endDate datetime
as
begin


Select '<tr><td  class = tdAnnoucements ><p class=MsoTitle><em><span lang=EN-US class=AzureAnnouncementsNewsLetter>Azure Newsletter</span></em>
<b><i><span lang=EN-US style='+'''' +'font-size:32.0pt;line-height:85%'+''''+ '><o:p></o:p></span></i>
</b></p></td></tr>
<tr><td><p class=MsoSubtitle align=right style='+''''+'margin-bottom:0cm;margin-bottom:.0001pt;text-align:right'+''''+'>
<span lang=EN-US>'+ format(@startDate,'MMMM dd, yyyy')+ ' – '+ format(@endDate,'MMMM dd, yyyy')+'<o:p></o:p></span></p></td></tr>
<tr><td>Welcome to the '+'''Azure Announcements Newsletter'''+', a weekly email for the <b>'+@clientName+'</b> Azure community providing relevant Azure updates. Please let me know if you have any follow-on questions or want a briefing on any of it. Also please let me know anyone else that would like to be added to the distribution list or if you want to '+
		'<a href="'+ 'mailto:'+@csaEmailId+'?subject=Unsubscribe">unsubscribe</a>. I’d also welcome any comments on whether this is useful, and anything else you would like to see it cover. 
<p class=MsoNormal><o:p>&nbsp;</o:p></p><p class=MsoNormal>
<b><span class=NewsHighlights>News Highlights<o:p></o:p></span></b></p>
</td></tr>'

end