
CREATE  Proc AnnoucementSummary
	@startDate datetime,
	@endDate datetime
as
Begin

Select
announcementSummary = '<tr style='''+'height:17.9pt'+'''>
	<td  class=SummaryRowTitle > 
		<p class=MsoNormal>
			<b><span lang=EN-US style='+''''+'font-size:18.0pt;color:white'+''''+'>Announcements Summary</span></b>
			<b><span lang=EN-US style='+''''+'font-size:18.0pt'+''''+'><o:p></o:p></span></b>
		</p>
	</td>
	</tr>
	<tr>
	<td>
		<p class=MsoNormal>
			<span lang=EN-US><o:p>&nbsp;</o:p></span></p>	
		<p class=MsoNormal>
		<span lang=EN-US>This week there are <b><u>'+Convert(varchar(10),Count(1))+'</u></b> Announcements!<o:p></o:p></span>
		</p><p class=MsoNormal>     <span lang=EN-US><o:p>&nbsp;</o:p></span></p
		</td>
	</tr>'
from Announcements
where PubOn > = @startDate and PubOn <= @endDate

End