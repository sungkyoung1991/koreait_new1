<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<!-- #include virtual="/_include/$xss.asp" -->
<%id="9"
category="4"
menu="2"%>
<!-- #include virtual="/_include/inc_header.asp" -->

<%

table ="news_board_eng2"

Function CheckWord(CheckValue)
	CheckValue = replace(CheckValue, "&lt;", "<")
	CheckValue = replace(CheckValue, "&gt;", ">")
	CheckValue = replace(CheckValue, "&quot;","'")
	CheckValue = replace(CheckValue, "&amp;", "&" )

	CheckWord = CheckValue
End Function

'이전글
Function GetBoardListPrevToArray(ByVal Set_Idx, ByVal Set_SubSQL)
	Dim SQL
	SQL = "select top 1 take_idx, title, readnum from "& table &" where take_idx > "& Set_Idx & " and  " & Set_SubSQL &" order by take_idx asc"

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	rsArray = GetRowsQuery(CONNSTRING_WEB, SQL)

	GetBoardListPrevToArray = rsArray
End function

'다음
Function GetBoardListNextToArray(ByVal Set_Idx, ByVal Set_SubSQL)
	Dim SQL
	SQL = "select top 1 take_idx, title, readnum from "& table &" where take_idx < "& Set_Idx & " and " & Set_SubSQL &" order by take_idx desc"

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	rsArray = GetRowsQuery(CONNSTRING_WEB, SQL)

	GetBoardListNextToArray = rsArray
End function

'조회수 증가
Sub SetBoardListViewUpCount(ByVal take_idx)
	Dim viewIdx : viewIdx = formatCheckNumZero(Session("notice_board_list_view_idx"))
	If StrComp(viewIdx, take_idx) = 0 Then
		Exit Sub
	End If

	Session("notice_board_list_view_idx") = take_idx

	Dim SQL : SQL = "Update " & table & " Set readnum=Isnull(readnum,0)+1 where take_idx='" & take_idx & "' And list_view=1"

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	Call UpdateQuery(CONNSTRING_WEB, SQL)
End Sub

'게시판 글 가져오기
Function GetBoardListToArray(ByVal con_id)
	Dim Field : Field = "take_idx, name, writeday, title, content, readnum, writer_id, pwd, url, filename1, filename2, filename3, filename4, filename5"

	Dim SQL : SQL = "Select Top 1 " & Field & " From " & table & " Where take_idx='" & con_id & "' And list_view=1"

	'Response.Write "sk : " + sql

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetBoardListToArray = GetRowsQuery(CONNSTRING_WEB, SQL)
End Function

con_id = FormatCheckNumZero(request("id"))




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
subsql = " list_view=1 and bbscode in ('통합','한국IT전문학교')"
searching = ""

If Len(find) >= 1 then
	if search = "content" then
		subsql = subsql & " and "& search &" LIKE '%"& find &"%'"
	else
		subsql = subsql & " and Lower("& search &") LIKE '%"& LCase(find) &"%'"
	end if

	searching = searching & "&search="& Server.UrlEncode(search) &"&find="& Server.UrlEncode(find)
end if

Dim filenameArr(5)


rsArray = GetBoardListToArray(con_id)

If Not IsArray(rsArray) Then
	Response.Write "<div style='text-align:center;'>검색된 정보가 없습니다.</div>"
Else
	'조회수 증가
	Call SetBoardListViewUpCount(con_id)

	i = 0
	take_idx = rsArray(0,i)
	name = rsArray(1,i)
	writeday = rsArray(2,i)
	title = rsArray(3,i)

	content = rsArray(4,i)

	readnum = rsArray(5,i)
	writer_id = rsArray(6,i)
	pwd = rsArray(7,i)
	url = rsArray(8,i)
	filename1 = rsArray(9,i)
	filename2 = rsArray(10,i)
	filename3 = rsArray(11,i)
	filename4 = rsArray(12,i)
	filename5 = rsArray(13,i)

	writeday = FormatDateTimes(writeday)
	wdate = FormatDate(writeday)

	filenameArr(1) = filename1
	filenameArr(2) = filename2
	filenameArr(3) = filename3
	filenameArr(4) = filename4
	filenameArr(5) = filename5

	content = CheckWord(content)
%>
<script>
function goDownFile(fname){
	var frm = document.frmDel;
	frm.action = "/common/download.asp?folder=news&file=" + escape(fname) + "";
	frm.submit();
}
</script>

<FORM NAME="frmDel" enctype="multipart/form-data" method="POST"></form>
<div>
	<div class="board_title font-24 lh50 font-c-b3">Interview with KoreaIT Students
</div>

	<div class="board_list">
		<div class="list_Group">
			<div class="list_title font-14"><a href="#"><%=title%></a></div>
		</div>
		<div class="list_con">
            <% if filename5 <> "" then%>
            <img src="/upload_files/news/<%=filename5%>"/>
            <%end if%>
			<p><%=content%></p>
		</div>
		<div class="list_file">
			<div>File Attachment</div>
                <!--<div class="ml25">
	                <a href=""><img src="/img/iconicon.jpg" alt="파일아이콘"  class="mr10">File Name.pdf</a>
                </div>-->

                <div class="ml25">
                	<%
					For i = 1 To Ubound(filenameArr,1)
						If Len(filenameArr(i)) >= 4 Then
				%>
						<a href="javascript:" onClick="javascript:goDownFile('<%=filenameArr(i)%>')"><img src="/img/iconicon.jpg" alt="파일아이콘"  class="mr10"><%=filenameArr(i)%></a>
				<%
						End If
					Next
				%>
                </div>

		</div>
	</div>
</div>


<% end if %>


<div class="list_btn mt20 clearfix"><a href="list.asp">LIST</a></div>

<%
RsArray1 = GetBoardListPrevToArray(con_id, subsql) '이전글
RsArray2 = GetBoardListNextToArray(con_id, subsql) '다음글
%>


<ul class="list_navi mt40">
	<!--<li>
		<div>Prev</div>
		<a href="#" class="ml20">Research Team Led by Prof. Rhee Boa of CAU College of Art & Technology Promotes Korean Cultural Heritage to the World</a>
	</li>-->

<%
'이전글
If IsArray(RsArray1) Then
	ahref = ""
	If Len(bbscode) >= 1 Then ahref = ahref & "&bbscode=" & bbscode
	ahref = ahref & "?id=" & RsArray1(0,0) & "&page=" & session("page") & searching
%>
        <li>
            <div>Prev </div>
            <a class="ml20" href="<%=ahref%>"><%=RsArray1(1,0)%></a>
        </li>
<%
End If
%>


	<!--<li>
		<div>Next</div>
		<a href="#" class="ml20">No Previous posts</a>
	</li>-->


<%
'다음글
If IsArray(RsArray2) Then
	ahref = ""
	If Len(bbscode) >= 1 Then ahref = ahref & "&bbscode=" & bbscode
	ahref = ahref & "?id=" & RsArray2(0,0) & "&page=" & session("page") & searching
%>
	<li>
        <div>Next </div>
		<a class="ml20" href="<%=ahref%>"><%=RsArray2(1,0)%></a>
	</li>
<%
End If
%>

</ul>

<!-- #include virtual="/_include/inc_footer.asp" -->
