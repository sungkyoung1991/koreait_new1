<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual="/_include/$dbconnect.asp" -->
<!-- #include virtual="/_include/admin_secret.asp" -->
<% Response.Expires=0 %>
<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)
CheckValue = replace(CheckValue, "&lt;", "<")
CheckValue = replace(CheckValue, "&gt;", ">")
CheckValue = replace(CheckValue, "&quot;","'")
CheckValue = replace(CheckValue, "&amp;", "&" )

CheckWord = CheckValue
End Function

</script>
<%
  take_idx = request("take_idx")
  '�˻�
  find = request("find")
  search = request("search")
  if find <> "" then
    searching="&search=" & search & "&find=" & find
  end if

  '������

  sql = "select Top 1 * from news_board_eng2 where take_idx="&take_idx
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
    filename1=rs("filename1")
		filename2=rs("filename2")
		filename3=rs("filename3")
		filename4=rs("filename4")
		filename5=rs("filename5")
    title = replace(title,"&quot;","'")
    content =CheckWord(rs("content"))
	top_view=rs("top_view")
	list_view=rs("list_view")
	writer_id=rs("writer_id")
  end if

  UpdateSQL = "Update news_board_eng2 Set readnum = readnum+1 where take_idx = " & take_idx
  conn.Execute UpdateSQL
  rs.close
  set rs = nothing
%>
<!DOCTYPE html>
<html>
<head>
<!-- #include virtual="/_admin/inc/inc_head_euckr.inc" -->

<link href="./ckeditor_contents.css" rel="stylesheet" type="text/css">

<script language="javascript">
function del() {
	if(confirm("are you sure?")){
		location.href="del.asp?take_idx=<%=take_idx%>";
	}
}

$(document).ready(function() {
	$(".contents-area img").css("width","").attr("width","");
	$(".contents-area img").css("height","").attr("height","");
});
</script>
<head>
<body>
<table>
  <tr>
    <td style="padding:20 0 0 15">
      <table width="800" cellpadding="5">
        <tr>
          <td colspan="2" align="left" class="admin_tit2">notice</td>
        </tr>
        <tr bgcolor="#663300">
                  <td height="3" colspan=2></td>
        </tr>
		<tr>
          <td>
          <table width="100%" border=0 cellpadding="5" bgcolor="#f0f0f0" cellspacing="1">




			 <tr bgcolor="#ffffff">
                <td align="center" width="23%" class="entitle"><font class=admin_tit>Top View</font></td>
                <td width="30%" ><%If top_view=1 then%>Yes<%else%>No<%End if%></td>
                <td align="center" width="24%" class="entitle"><font class=admin_tit>List View</font></td>
                <td width="23%"><%If list_view=1 then%>Yes<%else%>No<%End if%></td>
              </tr>
			 <tr bgcolor="#ffffff">
                <td align="center" width="24%" class="entitle"><font class=admin_tit>writer_id</font></td>
                <td colspan="3"><%=name%>(<%=writer_id%>)</td>
              </tr>
			  <tr bgcolor="#ffffff">
                <td align="center" class="entitle"><font class=admin_tit>title</font></td>
                <td colspan="3" style="padding:0 0 0 10"><%=title%></td>
              </tr>
              <tr bgcolor="#ffffff">
                <td align="center" width="23%" class="entitle"><font class=admin_tit>writeday</font></td>
                <td width="30%" ><%=writeday%></td>
                <td align="center" width="24%" class="entitle"><font class=admin_tit>readnum</font></td>
                <td width="23%"><%=readnum%></td>
              </tr>
              <tr bgcolor="#ffffff">
                <td colspan="4" style="padding:20px 10px 20px">


                    <% if filename5 <> "" then%>
                    <img src="/eng_2020/upload_files/news/<%=filename5%>"/>
                    <%end if%>
					<div class="contents-area"><%=content%></div>

				<%If filename1<>"" then%>file : <a href="../../common/download.asp?folder=news&file=<%=filename1%>"><%=filename1%></a><%End if%>
				<%If filename2<>"" then%>, <a href="../../common/download.asp?folder=news&file=<%=filename2%>"><%=filename2%></a><%End if%>
				<%If filename3<>"" then%>, <a href="../../common/download.asp?folder=news&file=<%=filename3%>"><%=filename3%></a><%End if%>
				<%If filename4<>"" then%>, <a href="../../common/download.asp?folder=news&file=<%=filename4%>"><%=filename4%></a><%End if%>
				<%If filename5<>"" then%>img file : <a href="../../common/download.asp?folder=news&file=<%=filename5%>"><%=filename5%></a><%End if%>
				</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td colspan="2" align="right">
<div class="btn-area">
			<a href="insert.asp?mode=modi&take_idx=<%=take_idx%>">update</a>
            <a href="javascript:del()">delete</a>
			<a href="list.asp?page=<%=session("page")%><%=searching%>">List</a>
</div>
          </td>
        </tr>
      </table>

    </td>
  </tr>
</table>
</body>
</html>
<% conn.Close :  Set conn = Nothing %>
