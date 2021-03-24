<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
'게시판 이미지
Const BOARD_LIST_IMG_PATH = "/upload_files/ckeditor/board/list/"

If Len(Session("board_list_category")) = 0 Then
	category = "0"
	menu = "0"
	sub_menu = "0"
	bbscode	= XssFilter(request("bbscode"))
Else
	category = Session("board_list_category")
	menu = Session("board_list_menu")
	sub_menu = Session("board_list_sub_menu")
	bbscode = Session("board_list_bbscode")
End If
%>

 <!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
 <!-- S: header 시작 -->
 <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
 <!-- E: header 종료 -->
 
  <!--2020-->
    <!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->    
    <!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->

<!-- #include virtual="/inc/2017/subHeader.asp" -->
<div class="content_body">
<%
Dim subject,partName
table = "dbo.tbl_board_list"
code = XssFilter(Trim(request("code")))
con_id = FormatCheckNumZero(Trim(request("id")))
find = XssFilter(Trim(request("find")))
search = XssFilter(Trim(request("search")))
subject = XssFilter(Trim(request("subject")))
page = FormatCheckNumZero(request("page"))

'''
subsql = " Status=1"

If Len(bbscode) >= 1 Then
	bbscodearr = Split(bbscode,",")
	For i = 0 To Ubound(bbscodearr,1)
		bbscodearr(i) = "'" & Replace(Trim(bbscodearr(i)),"'","") & "'"
	Next

	bbscodeStr = Join(bbscodearr,",")
	subsql = subsql & " And bbscode in (" & bbscodeStr & ")"
End If

if subject <> "" then
	subsql = subsql & "and part Like '%" & subject & "%'"
	searching= searching & "&subject="& subject 
ENd IF
if find <> "" And search <> "" then
	if search = "content" then
		subsql = subsql & " and " & search&" LIKE '%" & find & "%'"
	else
		subsql = subsql & " and Lower(" & search & ") LIKE '%" & LCase(find) & "%'"
	end if
	
	searching = searching & "&search=" & search & "&find=" & Server.UrlEncode(find)
end if



If StrComp(con_id,0) = 0 Or Not isNumeric(request("id")) Then code = "lis"
If StrComp(page,0) = 0 Or Not isNumeric(request("page")) Then page = 1

Select Case Lcase(code)
Case "lis"
%>
<!-- #include file="board_list.asp" -->
<%
Case "con"
%>
<!-- #include file="board_content.asp" -->
<%
Case Else
%>
<!-- #include file="board_list.asp" -->
<%
End Select
%> 
</div>
							

	<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->