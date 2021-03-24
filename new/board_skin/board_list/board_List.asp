<%
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
PageNum = page

'게시판 구분에 따른 리스트수
Select Case CStr(Session("board_list_bbscode"))
Case "pressboard"
	PageSize = 9
Case Else
	PageSize = 10
End Select

Field = "take_idx, name, writeday, title, readnum, top_view, listimg, summery, step, re_level, press_name1, press_url1, press_logo1, press_name2, press_url2, press_logo2, press_name3, press_url3, press_logo3, part"
WhereStr = subsql
'OrderBy = "Order by top_view desc, orderCode desc"
OrderBy = "Order By top_view desc, writeDay Desc, take_idx Desc"
PageCount = 0 : RecordCount = 0

'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
rsArray = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, table, WhereStr, OrderBy, PageCount, RecordCount)

'복합게시판일경우 bbsCode 생략 - 2016.05.18
If StrComp(bbscode,Session("board_list_bbscode")) = 0 Then bbscode = ""
%>
<link href="/new/css/list.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.press_logo { padding-top: 30px; }
div.press-summery { line-height: 25px; overflow: hidden; text-overflow: ellipsis; height:75px; -webkit-line-clamp: 3;}

.table-2 table th { padding:5px; }
.table-2 table td div.title { font-weight:bold; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; width:610px; font-size:14px !important; }
.table-2 table td div.summery { padding-top:5px; padding-right:5px; line-height: 25px; overflow: hidden; text-overflow: ellipsis; height:50px; -webkit-line-clamp: 2;}
.table-2 table td div.press_logo { padding-left:5px; padding-top:8px; }
.table-2 table td div.press_logo a img { padding-left:20px; }
.table-2 table td div.press_logo a:first-child img { padding-left:0; }
</style>

<script src="//cdnjs.cloudflare.com/ajax/libs/jQuery.dotdotdot/1.7.4/jquery.dotdotdot.min.js" charset="utf-8"></script>
<script>
$(document).ready(function() {
	$(".table-2 table td div.summery, div.press-summery").dotdotdot({
		//	configuration goes here
		/*	The text to add as ellipsis. */
		ellipsis	: '…',
		wrap		: 'letter',
		lastCharacter	: {
 			/*	Remove these characters from the end of the truncated text. */
			remove		: [ ' ', ',', ';', '.', '!', '?' ],
 
			/*	Don't add an ellipsis if this array contains 
				the last character of the truncated text. */
			noEllipsis	: []
		}
	});
});
</script>

<% Select Case CStr(Session("board_list_bbscode")) %>
<% Case "pressboard" %>
	<!-- #include file="div_board_list_pressboard.inc" -->
<% Case Else %>
	<!-- #include file="div_board_list.inc" -->
<% End Select %>

<% Call PageCounterWeb(Page, PageCount, page_count, "", searching) %>
