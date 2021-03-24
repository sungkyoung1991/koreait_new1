<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%id="9"
category="4"
menu="2"%>
<!-- #include virtual="/_include/inc_header.asp" -->

<%
table = "news_board_eng2"
bbscode = Trim(request("bbscode")) : bbscode = Replace(bbscode,"'","") : bbscode = Replace(bbscode,"""","")
code = Trim(request("code")) : code = Replace(code,"'","") : code = Replace(code,"""","")



search = Trim(request("search")) : search = Replace(search,"'","")
find = Trim(request("find")) : find = Replace(find,"'","")

'2016.09.01 - 검색오류 방지
Select Case CStr(search)
Case "title", "content"
	find = Replace(find,"%","")
	find = Replace(find,"'","")
	find = Replace(find,"""","")
Case Else
	search = ""
	find = ""
End Select

'중간고사, 기말고사 생략 - 2016.06.02
subsql = " list_view=1 and bbscode in ('notice_eng')"
searching = ""

If Len(find) >= 1 then
	if search = "content" then
		subsql = subsql & " and "& search &" LIKE '%"& find &"%'"
	else
		subsql = subsql & " and Lower("& search &") LIKE '%"& LCase(find) &"%'"
	end if

	searching = searching & "&search="& Server.UrlEncode(search) &"&find="& Server.UrlEncode(find)
End If

'Page 검사 - 2016.06.22
If Not isNumeric(request("page")) Or request("page") = "" Or request("page") = "0" Then
	page = 1
else
	page = request("page")
end if

session("page") = page

' 페이징 리스트
' Set_PageSize : 페이지 사이즈
' Set_PageNum : 현재페이지
' Set_Field : 필드명
' Set_Table : 테이블명
' Set_Where : 검색조건
' Set_OrderBy : 정렬조건
' Set_PageCount : 전체페이지 갯수(반환)
' Set_RecordCount : 전체리스트 갯수(반환)

page_count = 10

PageSize = 17
PageNum = page

Field = "take_idx, name, writeday, title, readnum, top_view, step, re_level"
WhereStr = subsql
OrderBy = "Order by top_view desc, writeday desc"
PageCount = 0 : RecordCount = 0

'Response.Write "Select top 10 " & Field & " From " & table & " Where " & WhereStr &  " " & OrderBy
'Response.End

'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
rsArray = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, table, WhereStr, OrderBy, PageCount, RecordCount)


%>

<div>
	<div class="board_title font-24 lh50 font-c-b3">Interview</div>

	<div class="board_list">

    	<%
					If Not IsArray(rsArray) Then
					%>
						<div height="1" colspan="5" align="center">등록된 게시물이 없습니다.</div>
					<%
					Else
						For i = 0 To Ubound(rsArray,2)
						  	news = ""
					  		width = ""

							take_idx = rsArray(0,i)
							name = rsArray(1,i)
							writeday = rsArray(2,i)
							title = Trim(rsArray(3,i))
							readnum = FormatCheckNumZero(rsArray(4,i))
							top_view = FormatCheckNumZero(rsArray(5,i))
							Step = FormatCheckNumZero(rsArray(6,i))
							re_level = FormatCheckNumZero(rsArray(7,i))

							writeday = FormatDatetimes(writeday)
							wdate = left(writeday,10)
							title = replace(title,"&quot;","'")

						'	If Len(title) > 34 Then
'								title = Mid(title,1,32) & ".."
'							End If

							If CDbl(re_level) > 0 Then
								wid = re_level
								for k=1 to wid
									width=width&"&nbsp;"
								Next

								reply = width & "<img src='images/re.gif'>"
							Else
								reply = ""
							End If

							If DateDiff("h",writeday,Now()) < 24  AND StrComp(step,0) = 0 AND StrComp(re_level,0) = 0 Then
								news = "&nbsp;<img src='/img/newbtn.png' width='9' height='9' align='absmiddle' alt='new' />"
							End If

							tNum = RecordCount - CDbl(rsArray(Ubound(rsArray,1),i)) + 1
					%>


                        <div class="list_Group">
                            <a href="list_open.asp?id=<%=take_idx%>" class="list_title font-14" style="width:100%;"><%=title%><%=news%></a>
                            <div class="list_data font-12"><%=wdate%></div>
                        </div>

					<%
						Next
					End if
					%>
                </div>
            </div>

<%
Sub PageCounterWebPrevNext(ByVal page_num, ByVal page_count, ByVal count_page, ByVal page_name, ByVal page_value)
	page_num = FormatCheckNumZero(page_num)
	page_count = FormatCheckNumZero(page_count)
	If StrComp(page_num,0) = 0 Then page_num = 1
	If StrComp(page_count,0) = 0 Then page_count = 1
	If CDbl(page_num) >= cDbl(page_count) Then page_num = page_count
	page_count = cdbl(page_count)

	Dim blockPage : blockPage = Int((page_num-1)/count_page) * count_page + 1

	'If Len(page_name) = 0 Then page_name = LCASE(TRIM(Request.ServerVariables("SCRIPT_NAME")))
	If StrComp(Left(page_value,1),"&") <> 0 And Len(page_value) >= 1 Then page_value = "&" & page_value

	Response.Write "<div class=""pagenavi"">"

	if StrComp(page_num,1) = 0 Then
		Response.Write "<a href=""#"" class=""previouspostslink"">prev</a>"
	Else
		Response.write "<a class=""previouspostslink"" href=""" & page_name & "?page=" & page_num-1 & page_value & """><i title='이전'>prev</i></a>"
	End if

	Dim i : i = 1
	Do Until i > count_page or blockPage > page_count
		If blockPage = int(page_num) Then
			Response.Write "<span class='current'>" & blockPage & "</span>"
		Else
			Response.Write "<a href=""" & page_name & "?page=" & blockPage & page_value & """>" & blockPage & "</a>"
		End If

		blockPage = blockPage + 1
		i = i + 1
	Loop

	If CDbl(page_num) >= CDbl(page_count) Or CDbl(blockPage) > CDbl(page_count) then
		Response.Write "<a href=""#"" class=""nextpostslink"">next</a>"
	Else
		If CDbl(blockPage) >= CDbl(page_count) Then blockPage = page_count
		Response.Write "<a class=""nextpostslink"" href=""" & page_name & "?page=" & page_num+1 & page_value & """><i title='다음'>next</i></a>"
	End if

	Response.Write "</div>"
End Sub

%>
	<% Call PageCounterWebPrevNext(Page, PageCount, page_count,"", searching) %>

<!-- #include virtual="/_include/inc_footer.asp" -->
