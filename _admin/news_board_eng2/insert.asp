<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual="/_include/$dbconnect.asp" -->
<!-- #include virtual="/_include/admin_secret.asp" -->


<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)
	CheckValue = replace(CheckValue, "&lt;", "<")
	CheckValue = replace(CheckValue, "&gt;", ">")
	CheckValue = replace(CheckValue, "&quot;", "'")
	CheckValue = replace(CheckValue, "&amp;", "&" )
	CheckWord = CheckValue
End Function
</script>
<%
mode = request("mode")
take_idx = request("take_idx")

If Not isNumeric(take_idx) And Len(take_idx) = 0 Then mode = ""

if mode="modi" then
    sql = " select top 1 * from news_board_eng2 where take_idx="&take_idx
    set rs = conn.execute(sql)

	if not rs.eof then
		bbscode = rs("bbscode")
		name = rs("name")
		title = rs("title")
		mail = rs("mail")
		url = rs("url")
		writeday = rs("writeday")
		pwd = rs("pwd")
		ref = rs("ref")
		stp = rs("step")
		re_level = rs("re_level")
		readnum = rs("readnum")
		numm = rs("numm")
		content = CheckWord(rs("content"))
		filename1=rs("filename1")
		filename2=rs("filename2")
		filename3=rs("filename3")
		filename4=rs("filename4")
		filename5=rs("filename5")
		top_view=rs("top_view")
		list_view=rs("list_view")
	end if

	menu = "수정"
	rs.close : set rs = Nothing
elseif mode="reply" then
	sql = " select Top 1 title,ref,step,re_level,content from news_board_eng2 where take_idx="&take_idx
	set rs = conn.execute(sql)

	if not rs.eof then
		title     = "Re: "&rs("title")
		r_content = rs("content")
		ref = rs("ref")
		stp = rs("step")
		re_level = rs("re_level")
	end If

	rs.close : set rs = Nothing

	menu = "답변"
	list_view = 1
else
	menu = "쓰기"
	list_view = 1
end If
%>
<!DOCTYPE html>
<html>
<head>

<!-- #include virtual="/_admin/inc/inc_head.inc" -->

<style type="text/css">
#wrap { width:860px; padding:30px 0 0 15px; }
.button-area { text-align:center; margin:20px auto 30px; }
textarea { font-size:12px; line-height:1.4; }

.admin_tit2 {
    color: #000000;
    font-size: 22px;
    font-weight: bold;
	border-bottom:3px solid #663300;
	margin-bottom:10px;
	line-height:30px;
}

td, th { height: 30px; color: #000000; font-size: 12px; line-height: 22px; }

td {
	color: #000000;
	border: 1px solid #FFFFFF;
	background-color: #F5F5F5;
	font-size: 12px;
	padding-left: 3px;
	line-height: 22px;
	text-align: left;
}

th {
	color: #000000;
	border: 1px solid #FFFFFF;
	background-color: #CEDAEE;
	font-size: 12px;
	padding-right: 3px;
	line-height: 22px;
	text-align: center;
	font-weight: bold;
}

#submit_progress { position:relative; width:550px; border: 1px solid #ddd; padding: 1px; }
#submit_bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
#submit_percent { position:absolute; display:inline-block; top:3px; left:48%; }
</style>

<!-- ckeditor file -->
<!-- #include virtual="/eng_2020/ckeditor/inc_ckeditor.js.asp" -->

<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace('content', {
		customConfig: '<%=Left(request.servervariables("PATH_INFO"), InStrRev(request.servervariables("PATH_INFO"),"/"))%>ckeditor_config.js',
		width: "770px",
		height: "600px"
	});


	$("#frmSubmit").click(function(e) {
		e.preventDefault();
		sendit();
	});

});
</script>
<script type="text/javascript">
function sendit() {
	var frm = document.insert_form;

	if(frm.bbscode.value=="") {
		alert("공지사항을 등록할 학교를 선택하세요");
		frm.bbscode.focus();
		return;
	}

	if(frm.title.value=="") {
		alert("Title..");
		frm.title.focus();
		return;
	}

	var contents = CKEDITOR.instances.content.getData();
	if (contents.length < 10) {
		window.alert("10 letters..");
		CKEDITOR.instances.content.focus();
		return;
	} else if(contents.length > 600000) {
		alert("Over length... (Max length 600,000)");
		CKEDITOR.instances.content.focus();
		return;
	}

	frm.action = "save.asp";
	frm.submit();
}
</script>
</head>
<body>

<form name="insert_form" method="post" action="save.asp" enctype="multipart/form-data">
<input type="hidden" name="mode" value="<%=mode%>" />
<input type="hidden" name="take_idx"  value="<%=take_idx%>" />
<input type="hidden" name="ref" value="<%=ref%>" />
<input type="hidden" name="step" value="<%=stp%>" />
<input type="hidden" name="level" value="<%=re_level%>" />

<div id="wrap">

	<div class="admin_tit2">notice</div>
	<table border="0" cellspacing="1" width="100%" cellpadding="0">
		<colgroup>
			<col width="80" /><col width="*" />
		</colgroup>
		<tr>

<%if mode="reply" then%>
		<tr>
			<th>content</th>
			<td><%=r_content%></td>
		</tr>
<%end if%>
		<tr>
			<th><font class=admin_tit>college</th>
			<td>
<%
MMDD = right(Replace(Left(now(),10),"-",""),4)
if MMDD > "0305" then
	study_year = Cstr(year(now)+1)
else
	study_year = Cstr(year(now))
end if

SQL = "select distinct Sname from dbo.ClassName"
SQL = SQL & " where study_year = '"& study_year &"' and Status = '1'"
SQL = SQL & " order by Sname desc"

'Response.Write sql

set rs = conn.execute(SQL)
%>
				<select name="bbscode">

                    <option value="notice_eng" selected >notice_eng</option>

				</select>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font class=admin_tit>top view :</font><input type="checkbox" name="top_view" value="1" <%If top_view=1 then%>checked<%End if%>>
				 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font class=admin_tit>list view :</font><input type="checkbox" name="list_view" value="1" <%If list_view=1 then%>checked<%End if%>>
			</td>
		</tr>
		<tr>
			<th>Title</th>
			<td><input type="text" name="title" value="<%=title%>" maxlength="100" size="45" style="width:700px;" /></td>
		</tr>

		<tr>
			<th>content</th>
			<td><textarea wrap="hard" rows="40" name="content" cols="90" id="content"><%=content%></textarea></td>
		</tr>

		<tr>
			<th>File Attachment</th>
			<td>
	            <input name="filename" type="file" class="select" />
				<%If filename1 <> "" then%><a href="../../common/download2.asp?folder=news&file=<%=filename1%>"><%=filename1%></a><%End if%>
				<br>
				<input name="filename2" type="file" class="select" />
				<%If filename2 <> "" then%><a href="../../common/download2.asp?folder=news&file=<%=filename2%>"><%=filename2%></a><%End if%>
				<br>
				<input name="filename3" type="file" class="select" />
				<%If filename3 <> "" then%><a href="../../common/download2.asp?folder=news&file=<%=filename3%>"><%=filename3%></a><%End if%>
				<br>
				<input name="filename4" type="file" class="select" />
				<%If filename4 <> "" then%><a href="../../common/download2.asp?folder=news&file=<%=filename4%>"><%=filename4%></a><%End if%>
				<br>
				이미지 등록 : <input name="filename5" type="file" class="select" />
				<%If filename5 <> "" then%><a href="../../common/download2.asp?folder=news&file=<%=filename5%>"><%=filename5%></a><%End if%>
			</td>
		</tr>
	</table>

	<div class="button-area">
		<button type="button" id="frmSubmit">Submit</button>
		<button type="button" onClick="history.back();">Back</button>
	</div>

</div>

</form>

<!-- SUBMIT IFRAME  시작 -->
<iframe name="ifm_submit" style="width:0px; height:0px;" frameborder="0" ></iframe>
<!-- SUBMIT IFRAME  끝 -->
</body>
</html>
<%
conn.Close : Set conn = Nothing
%>
