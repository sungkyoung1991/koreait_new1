<!-- #include virtual="/_include/$dbconnect.asp" -->
<!-- #include virtual="/_include/admin_secret.asp" -->
<%
take_idx = request("take_idx")

sql = "select ref,step from news_board_eng2 where take_idx="&take_idx
set rs = conn.execute(sql)

if not rs.eof then
	ref = rs(0)
	stp = rs(1)
end if

rs.close : set rs = nothing

if stp = 0 then
	'sql = "delete from news_board_eng2 where ref="&ref
	sql = "update news_board_eng2 set list_view=10, edit_id='" & id & "', edit_dt=GETDATE() where ref="&ref
else
	'sql = "delete from news_board_eng2 where take_idx="&take_idx
	sql = "update news_board_eng2 set list_view=10, edit_id='" & id & "', edit_dt=GETDATE() where take_idx="&take_idx
end if
conn.execute(sql)


'공지사항(메인 리스트)
Application.Lock
Application.Contents("NoticeList_Array") = ""
Application.Contents("NoticeList_Now") = ""
Application.Unlock
%>
<script language="JavaScript">
<!--
  location.href = "list.asp?page=<%=session("page")%>";
//-->
</script>
