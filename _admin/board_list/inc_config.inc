<%
CONST DB_TABLE_NAME = "dbo.tbl_board_list"

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

Function GetClassNameToArray()
	Dim SQL : SQL = "select distinct Sname,Pname from dbo.ClassName Where study_year='"& GetStudyYear() &"' and scode='5' and Status='1' Order By Sname desc, Pname"
	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetClassNameToArray = GetRowsQuery(CONNSTRING_WEB, SQL)
End Function

'게시판
' 0 : take_idx, dt, bbscode, part, top_view, writeday, readnum, title,  content, summery
'10: listimg, writer_id, name, mainimg, main_check, url, press_name1, press_url1, press_logo1, press_name2
'20: press_url2, press_logo2, press_name3, press_url3, press_logo3, filename1, filename2 [26]
Function GetBoardListToArray(ByVal take_idx)
	Dim Field : Field = "take_idx, dt, bbscode, part, top_view, writeday, readnum, title,  content, summery"
	Field = Field & ", listimg, writer_id, name, mainimg, main_check, isnull(url,'') as url, press_name1, press_url1, press_logo1, press_name2"
	Field = Field & ", press_url2, press_logo2, press_name3, press_url3, press_logo3, filename1, filename2"
	Field = Field & ", isNull(isView,'N'), isNull(mlistImg,''), isNull(esdate,''), isNull(eedate,'') "

	Dim SQL : SQL = "Select Top 1 " & Field & " from " & DB_TABLE_NAME & " where take_idx='" & take_idx & "' And Status=1"
'Dim SQL : SQL = "Select Top 1 * from " & DB_TABLE_NAME & " where take_idx='" & take_idx & "' And Status=1"

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetBoardListToArray = GetRowsQuery(CONNSTRING_WEB, SQL)
End Function

'조회수 증가
Sub SetBoardListViewUpCount(ByVal take_idx)
	Dim viewIdx : viewIdx = formatCheckNumZero(Session("board_list_view_idx"))
	If StrComp(viewIdx, take_idx) = 0 Then
		Exit Sub
	End If

	Session("board_list_view_idx") = take_idx

	Dim SQL : SQL = "Update " & DB_TABLE_NAME & " Set readnum=Isnull(readnum,0)+1 where take_idx='" & take_idx & "' And Status=1"
	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	Call ExecuteQuery(CONNSTRING_WEB, SQL)
End Sub


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