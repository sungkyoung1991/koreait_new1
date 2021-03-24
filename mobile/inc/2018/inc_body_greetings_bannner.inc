<%
Function GetSelectionListToArr()
	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period', @type=''"
	GetSelectionListToArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)	
End Function

Selection = GetSelectionListToArr()
Study_year = Selection(0).item("Study_year")
%>

<div class="greetings_ban"  style="position:relative">
    <a href="/2018/2020_application.asp?year=2021" class="ui-link" data-ajax="false">
		<img src="/images/2020/greetings_banner_2021.jpg">
	</a>			
<!--<span><%=Study_year%>학년 신·편입생 모집</span>-->
<span style=""><%=Selection(0).item("m_period_e_date")%> 까지</span>




<div class="greetings_ban"  style="position:relative">
    <a href="/2018/2020_application.asp?year=2022" class="ui-link" data-ajax="false">
		<img src="/images/2020/greetings_banner_2022.jpg">
	</a>			
<!--<span><%=Study_year%>학년 신·편입생 모집</span>-->
<span style="">03월 12일 까지</span>
			
			
			
</div>