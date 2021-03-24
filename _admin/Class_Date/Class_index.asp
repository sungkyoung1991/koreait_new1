<!-- #include virtual = "/inc/Admin_Inc_utf8.inc" -->
<!-- #include file="inc_Class_config.inc" -->
<%
subsql = "idx >= 1"

Study_year = FormatCheckNum(Request("Study_year"))
If Len(Study_year) = 0 Then Study_year = Year(Date()) + 1

subsql = subsql & " And Study_year='" & Study_year & "'"
searching = "&Study_year=" & Study_year

'************************************************
page = FormatCheckNumZero(request("page"))
If StrComp(page,0) = 0 Then page = 1
session("page") = page
cPage = page

' 페이징 리스트
' Set_PageSize : 페이지 사이즈
' Set_PageNum : 현재페이지
' Set_Field : 필드명
' Set_Table : 테이블명
' Set_Where : 검색조건
' Set_OrderBy : 정렬조건
' Set_PageCount : 전체페이지 갯수(반환)
' Set_RecordCount : 전체리스트 갯수(반환)

PAGE_COUNT = 10

PageSize = 20
PageNum = page

Field = "idx, Study_year, Sname, Pname, Hname, Status, Jungwon, IsNull(Major,'') As Major, Scode"
WhereStr = subsql
OrderBy = "Order By Study_year desc, scode Asc, orderby Asc, sname Asc, Course Asc, Hname Asc"
PageCount = 0 : RecordCount = 0


'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
rsList = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, DB_TABLE_NAME, WhereStr, OrderBy, PageCount, RecordCount)
%>
<!DOCTYPE html>
<html>
<head>
<!-- #include virtual="/_admin/inc/inc_head.inc" -->

<style type="text/css">
#wrap { width:800px; padding:30px 0 0 15px; }
.button-area { text-align:center; margin:20px auto 30px; }
.page-area  { text-align:center; margin:10px auto 30px; }
textarea { font-size:12px; line-height:1.4; }
select {  font-family: 돋움체; }
.admin_tit2 {
    color: #000000;
    font-size: 22px;
    font-weight: bold;
	border-bottom:3px solid #663300; 
	margin-bottom:10px; 
	line-height:30px;
}

#layer-write-container input[type='text'] { width:95%; }
</style>
<script language="javascript">
$(document).ready(function() {

});

function MovePage(tStr){
	if (tStr == "UPDATE") {
		document.location.href = window.location.pathname+window.location.search;
	} else {
		document.location.href = window.location.pathname;
	}
}

function showWrite(idx) {
	var param = { "idx" : idx };
	$("#layer-write-container").html("");
	$.post("Class_form_div.asp", param, function (data) {
		var result = $(data);
		$("#layer-write-container").html(data);
		$("#layer-write-container input[readonly]").css("background-color","#EEE");
		layer_open();
	});
}

function sendSubmit(mode) {
	if ($("#wFrm input[name='Pname']").val() == "") {
		alert("학부를 입력해 주세요.");
		$("#wFrm input[name='Pname']").focus();
		return;
	}

	if ($("#wFrm input[name='Hname']").val() == "") {
		alert("학과를 입력해 주세요.");
		$("#wFrm input[name='Hname']").focus();
		return;
	}

	if ($("#wFrm input[name='Jungwon']").val() == "") {
		alert("정원을 입력해 주세요.");
		$("#wFrm input[name='Jungwon']").focus();
		return;
	}

	$("#wFrm input[name='mode']:hidden").val(mode);

	var url = $("#wFrm").attr("action");
	var post = $("#wFrm").attr("method");
	var params = $("#wFrm").serialize();
	var targetID = "";
	var resultFn = "";

	ajaxSendParam(url, params, post, targetID, resultFn)	
}

function del(idx, Study_year) {
	if(!confirm("삭제 하시겠습니까?")) {
		return;
	}

	// ajaxSend
	var url = "Class_proc.asp";
	var params = {"mode" : "DELETE", "idx" : idx, "Study_year" : Study_year };
	var post = "POST";
	var targetID = "";
	var resultFn = "";
	ajaxSendParam(url, params, post, targetID, resultFn);
}
</script>
</head>
<body>
<div id="wrap" style="width:1000px;">
	<div class="admin_tit2">학부 및 학과 관리</div>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<colgroup>
			<col width="20%" /><col width="60%" /><col width="20%" />
		</colgroup>
		<tr>
			<td valign="bottom"><button type="button" onClick="showWrite('0');">등록</button></td>
			<td>
			<form name="frm" id="frm" post="get" action="">
				<b>모집년도: </b>
				<select name="Study_year" >
<%
For i = Year(Date())+1 To 2007 Step -1
	If StrComp(i,Study_year) = 0 Then
		Response.Write "<option value='" & i & "' selected='selected'>" & i & " 학년도</option>"
	Else
		Response.Write "<option value='" & i & "'>" & i & " 학년도</option>"
	End If
Next
%>
				</select>
				<button type="submit">검색</button>
				</form>
			</td>
			<th valign="bottom" align="right">(<%=cpage%> / <%=PageCount%> page)</th>
		</tr>
	</table>

	<table border="0" width="100%">
	<colgroup>
		<col width="40" />
		<col width="90" />
		<col width="160" />
		<col width="140" />
		<col width="*" />
		<col width="80" />
		<col width="50" />
		<col width="120" />
	</colgroup>
	<thead>
	<tr bgcolor="f5f5f5">
		<td height="5" colspan="8"></td>
	</tr>
	<tr height="24">
		<td align=middle class="admin_tit">번호</td>
		<td align=middle class="admin_tit">모집년도</td>
		<td align=middle class="admin_tit">학교</td>
		<td align=middle class="admin_tit">학부</td>
		<td align=middle class="admin_tit">학과</td>
		<td align=middle class="admin_tit">접수여부</td>
		<td align=middle class="admin_tit">정원</td>
		<td align=middle class="admin_tit">관리</td>
	</tr>
	<tr>
		<td height="1" colspan="8" bgcolor="#8bace4"></td>
	</tr>
	</thead>
	<tbody>
<%
If Not IsArray(rsList) Then 
	Response.Write "<tr height='24' align='center'><td align='center' colspan='8'>등록된 게시물이 없습니다.</td></tr>"
Else
	For i = 0 To Ubound(rsList,2)
		idx = rsList(0,i)
		Study_year = rsList(1,i)
		Sname = rsList(2,i)
		Pname = rsList(3,i)
		Hname = rsList(4,i)
		Status = rsList(5,i)
		Jungwon = rsList(6,i)
		Major = rsList(7,i)

		if Status = "1" then
			Status_Str = "접수"
		else
			Status_Str = "폐학과"
		end if		

		If Len(Major) = 0 Then
			Hname_Str = Hname
		Else
			Hname_Str = Hname & " (" & Major & ")"
		End If

		tNum = rsList(Ubound(rsList,1),i)
		tNum = CDbl(RecordCount)-CDbl(tNum)+1
%>
	<tr align="center" bgcolor=#f5f5f5>    
		<td height="24"><%=tNum%></td>
		<td><%=Study_year%>학년도</td>
		<td><%=Sname%></td>
		<td><%=Pname%></td>
		<td><%=Hname_Str%></td>
		<td><%=Status_Str%></td>
		<td><%=Jungwon%></td>
		<td align="center" bgcolor="#f7f4f4">
			<button type="button" onClick="showWrite('<%=idx%>');">수정</button>
<% if id = "kitadmin" Or id = "webmaster@" then %>
			<button type="button" onClick="del('<%=idx%>','<%=Study_year%>')">삭제</button>
<% End If %>
		</td>
	</tr>
<%
	Next
End If
%>
	<tr>
		<td height="1" colspan="8" bgcolor="#8bace4"></td>
	</tr>
	</tbody>
	</table>

<% Call PageCounterWeb(Page, PageCount, 10, "", searching) %>

</div>
</body>
</html>
