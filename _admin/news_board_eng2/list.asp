<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual="/_include/$dbconnect.asp" -->
<!-- #include virtual="/_include/admin_secret.asp" -->
<link rel="stylesheet" type="text/css" href="/text.css">
<%
find = request("find")
search = request("search")
bbscode=request("bbscode")

subsql = " list_view in (0,1) "

' 과종목 선택후 검색시 에러 디버그************
If bbscode <> "" then
	subsql = subsql & " and bbscode = '" & bbscode & "'"
End IF

if find <> "" then
	if search = "content" then
		subsql = subsql & " and " & search&" LIKE '%" & find & "%'"
	else
		subsql = subsql & " and Lower(" & search&") LIKE '%" & LCase(find) & "%'"
	end if

	searching="&search=" & search & "&find=" & find
end If
'************************************************


if request("page")="" then
	page=1
else
	page = request("page")
end if

session("page")=page

If page <> "" Then
	cPage = page
	If cPage < 1 Then
		cPage = 1
	End If
Else
	cPage = 1
End If

pagesize=15
sql = "select count(*) from news_board_eng2 where " & subsql & " and bbscode <> '뉴스레터' "


set rs = conn.execute(sql)
totalrecord = cint(rs(0))
totalpage   = int(rs(0)/ pagesize * -1) * -1
rs.close

Set rs = Server.Createobject("ADODB.Recordset")
rs.CursorLocation = 3
rs.CacheSize  = pagesize

rssql = "SELECT * FROM news_board_eng2 where " & subsql & "  and bbscode <> '뉴스레터' order by top_view desc, take_idx desc "
rs.PageSize=15

rs.Open rssql, conn, 1

page_count=10
totalpage=rs.PageCount

Set rs.ActiveConnection = Nothing
%>
<link href="/_admin/common/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
function del(idx)
{

	if(confirm("정말로 삭제 하시기를 원하십니까?")) {
    location.href = "del.asp?take_idx="+idx
	}
	return;
}
//-->
</script>
<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)
	CheckValue = replace(CheckValue, "&lt;", "<")
	CheckValue = replace(CheckValue, "&gt;", ">")
	CheckValue = replace(CheckValue, "&quot;", "'")
	CheckValue = replace(CheckValue, "&amp;", "&" )

	CheckWord = CheckValue
End Function
</script>
<table>
<tr>
  <td style="padding:20 0 0 15">
<table>
  <tr>
    <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td class="admin_tit2">공지사항</td>
        </tr>
                 <tr bgcolor="#663300">
                  <td height="3" colspan=3></td>
                </tr>
		<tr>
          <td valign="bottom" width="213"><font class="admin_tit btn-area"><a href="insert.asp?mode=insert">글쓰기</a></td>
          <td valign="bottom" align="right" width="310"> <BR>
          <form action="list.asp" Method="POST" id="form1" name="form1">
          <input type="hidden" name="bbscode" value="<%=bbscode%>">
		        <table border="0" cellspacing="0" width="200">
              <tr>
                <td>
                  <select name="search" size="1" style="font-family: 돋움체">
                    <option value="title" <%if search="title" then response.write "selected"%>>제목</option>
					<option value="title" <%if search="name" then response.write "selected"%>>글쓴이</option>
                    <option value="content" <%if search="content" then response.write "selected"%>>글 내용</option>
                  </select>&nbsp;&nbsp;&nbsp;
                  <input type="text" name="Find" value="<%=find%>" size="20" style="border: 1px dashed">&nbsp;
                  <input type="submit" value=" 검 색 " name="btn">
                </td>
              </tr>
            </table>
          </form>
		      </td>
	        <td valign="bottom" align="right"><font size="2" style="굴림체" color="#000033"><strong>(<font size="2" style="굴림체" color="#963d55"><%=cpage%></font>/<%=totalpage%>page)</strong></font></div></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td>
	    <form name=articles>
	          <table border="0" width="700">
                 <tr bgcolor="f5f5f5">
                  <td height="5" colspan="10"></td>
                </tr>
				<tr>
                  <td align=middle width=49 height="24" class="admin_tit">번호</td>
                  <td align=middle width=363 class="admin_tit">제목</td>
				  <td align=middle width=80 class="admin_tit">글쓴이</td>
                  <td align=middle width=80 class="admin_tit">날짜</td>
                  <td align=middle width=47 class="admin_tit">조회</td>
                  <td align=middle class="admin_tit">삭제</td>
                </tr>
                <tr>
                  <td height="1" colspan="10" bgcolor="#8bace4"></td>
                </tr>

				<%
  if rs.eof then
%>
                <tr height="24" align="center">
                  <td align="center" colspan="7">등록된 게시물이 없습니다.</td>
                </tr>
                <%
    else
    i = 1
    rs.AbsolutePage=cPage
    do until rs.EOF or i>rs.PageSize
        width=""
        news=""
        name = rs("name")
        wdate = left(rs("writeday"),10)
        title = replace(trim(rs("title")),"&quot;","'")
        readnum = rs("readnum")
        power=rs("bbscode")
		top_view=rs("top_view")
		list_view=rs("list_view")
		writer_id=rs("writer_id")
        If Len(title) > 45 Then
          title = Mid(title,1,43) & ".."
        End If
        if rs("re_level") > 0 then
          wid = rs("re_level")
          for k=1 to wid
            width=width&"&nbsp;"
          next
          reply = width&"<img src='/information/images/ico_re.gif'>&nbsp;"
        else
          reply = ""
        end if

        if DateDiff("h",rs("writeday"),Now()) < 24 then
          news = "&nbsp;&nbsp;<font color='#ff9900'>new</font>"
        end if
%>
                <tr bgcolor=#f5f5f5>
                  <td align="center" height="24"><%If list_view=0 Then%>※<%End If%><%=totalrecord-((page-1)*pagesize)-i+1%></td>
                  <td style="padding:0 0 0 10px"><%=reply%><a href="view.asp?take_idx=<%=rs("take_idx")%>"><%If top_view=1 then%><b><%End if%><%=title%><%If top_view=1 then%></b><%End if%><%=news%></a>
                  <td align="center"><%=name%>(<%=writer_id%>)</td>
				  <td align="center"><%=wdate%></td>

                  <td align="center"><%=readnum%></td>
                  <td align=middle bgcolor=#f7f4f4 width=47>
                    <input type="button" value="삭제" onclick="del('<%=rs("take_idx")%>')">
                  </td>
                </tr>
                <%
     rs.Movenext
     i = i + 1
     Loop
%>
                 <tr>
                  <td height="1" colspan="10" bgcolor="#8bace4"></td>
                </tr>
			  </table>
    </form>
    </td>
  </tr>
  <tr>
    <td align="center">
<%
  If cPage/PAGE_COUNT = Int(cPage/PAGE_COUNT) Then
    BlockStart = cPage - PAGE_COUNT + 1
  Else
    BlockStart = Int(cPage/PAGE_COUNT) * PAGE_COUNT + 1
  End If


  BlockEnd = BlockStart + (PAGE_COUNT-1)
  If BlockEnd > totalpage then
    BlockEnd = totalpage
  End If

  if page=1 then
    response.write "<<"
  else
    Response.Write "<a href='list.asp?page=" & page-1 &searching& "'><<</a></small>"
  end if

  for j = BlockStart to BlockEnd
    If j = CInt(cPage) and BlockEnd <> 0 Then
      Response.Write "&nbsp;<font color=silver>" & j & "</font>&nbsp;"
    Elseif BlockEnd = 0 Then
      Response.Write ""
      Else
      Response.Write "&nbsp;<a href='list.asp?page=" & j &searching& "'>" & j & "</a>&nbsp;"
    End If
  Next

  If cint(page) < cint(totalpage) Then
    Response.Write "&nbsp;<a href='list.asp?page=" & page+1 &searching& "&'><i class='fa fa-caret-right'></i></a>"
  else
    Response.Write "<i class='fa fa-caret-left'></i>"
  End If
    response.write "&nbsp;[총 "&totalpage&" page]"
%>
    </td>
  </tr>
</table>
    </td>
  </tr>
</table>
<% end if '게시판 소스의 끝 %>
<%
   rs.Close
   conn.Close
   Set rs = Nothing
   Set conn = Nothing
%>
