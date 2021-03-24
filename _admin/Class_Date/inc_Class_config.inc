<%
CONST DB_TABLE_NAME = "dbo.ClassName"

Function GetStudyYear()
	Dim study_year, MMDD
	MMDD = Right(Replace(Left(now(),10),"-",""),4)
	if MMDD > "0307" then
		study_year = Cstr(year(now)+1)
	else
		study_year = Cstr(year(now))
	end If

	GetStudyYear = study_year
End Function

'검색
find = Replace(Replace(Trim(request("find")),"'",""),"""","")
search = Replace(Replace(Trim(request("search")),"'",""),"""","")
bbscode = Replace(Replace(Trim(request("bbscode")),"'",""),"""","")
part = Replace(Replace(Trim(request("part")),"'",""),"""","")
mcheck = formatCheckNum(request("mcheck")) '메인노출

searching = ""

'검색
If Len(search) >= 1 And Len(find) >= 1 Then
	searching = searching & "&search=" & Server.UrlEncode(search) & "&find=" & Server.UrlEncode(find)
End If

If Len(bbscode) >= 1 Then
	searching = searching & "&bbscode=" & Server.UrlEncode(bbscode)
End If

If Len(part) >= 1 Then
	searching = searching & "&part=" & Server.UrlEncode(part)
End If


If Len(mcheck) >= 1 Then
	searching = searching & "&mcheck=" & Server.UrlEncode(mcheck)
End If


'If StrComp(Left(searching,1),"&")=0 Then searching = Mid(searching,2)
%>