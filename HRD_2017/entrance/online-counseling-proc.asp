<!--#include virtual="/_include/Service_Inc.inc"-->

<%
Dim sccd, parentcd, sctitle, scwriter, scpwd, scissecret, scemail, scmobile, sccontents, scread, scwdate, scisanswer, scadmin, tmpcd, regip
cpage		= getQuery("cpage")
wtype		= getQuery("wtype")
sccd		= getForm("sccd")
sctitle		= getForm("sctitle")
scwriter	= getForm("scwriter")
scpwd		= getForm("scpwd")
scissecret	= getForm("scissecret")
'scemail		= getForm("e1") & "@" & getForm("e2")
scemail		= getForm("e1")
scmobile	= getForm("m1") & "-" & getForm("m2") & "-" & getForm("m3")
sccontents	= getForm("sccontents")
scode 		= getForm("scode")
regip		= Request.ServerVariables("REMOTE_ADDR")

args = "cpage=" & cpage & "&wtype=" & wtype & "&sccd=" & sccd
If wtype <> "del" And (sctitle = "" Or scwriter = "" Or scpwd = "" Or scmobile = "--" Or sccontents = "" Or scode= "") Then
%>
<script language="javascript">
	alert("입력사항이 잘못되었습니다.");
	location.replace("online-counseling-write.asp?<%=args%>");
</script>
<%
	response.End
End If

	If wtype = "in" Then
		sql = "select MAX(sccd) from TBL_SiteCounsel"
		Set rs = conn.Execute(sql)
		If Not rs.EOF And Not isnull(rs(0)) Then
			sccd = rs(0) + 1
		Else
			sccd = 1
		End If

		If scissecret <> "Y" Then	scissecret = "N"
		sql = "insert into TBL_SiteCounsel (sccd, parentcd, sctitle, scwriter, scpwd, scissecret, scemail, scmobile, sccontents, scode,regip) values ("
		sql = sql & sccd & ", " & sccd & ", N'" & sctitle & "', N'" & scwriter & "', N'" & scpwd & "', N'" & scissecret & "', N'" & scemail & "', N'" & scmobile & "', N'" & sccontents & "', '" & scode & "', '" & regip & "') "

		msg = "상담이 등록되었습니다."
		args = args & sccd
		link_file = "online-counselling-view.asp?" & args

		'접수문자 발송 - 2017.01.23
		If scode = 1 Then
			Call SendSms(SMS_INFO_PHONE, SMS_CALLBACK_PHONE, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)
			Call SendSms(SMS_INFO_PHONE_5, SMS_CALLBACK_PHONE, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)
		ElseIF scode = 2 Then
			Call SendSms(SMS_INFO_PHONE_NOWON, SMS_CALLBACK_PHONE_NOWON, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)


		ElseIF scode = 3 Then
			Call SendSms(SMS_INFO_PHONE_GURO1, SMS_CALLBACK_PHONE_GURO, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)
			Call SendSms(SMS_INFO_PHONE_GURO2, SMS_CALLBACK_PHONE_GURO, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)
			Call SendSms(SMS_INFO_PHONE_GURO3, SMS_CALLBACK_PHONE_GURO, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)
			Call SendSms(SMS_INFO_PHONE_GURO6, SMS_CALLBACK_PHONE_GURO, "[온라인상담] 페이지에 글이 등록되었습니다.", 1)

		END IF
	Else
		If sccd = "" Then	tmp = errPath("", "")

		sql = "select scpwd from TBL_SiteCounsel where sccd = " & sccd & " and scpwd = N'" & scpwd & "' "
		Set rs = conn.Execute(sql)
		If rs.EOF Or rs.BOF Then
			link_file = "online-counselling-view-write.asp?" & args
			If wtype = "del" Then	link_file = "online-counselling-view.asp?" & args
	%>
	<script language="javascript">
		alert("비밀번호가 틀립니다.");
		location.replace("<%=link_file%>");
	</script>
	<%
			response.End
		End If

		If wtype = "up" Then
			sql = "update TBL_SiteCounsel set "
			sql = sql & "sctitle = N'"		& sctitle	& "', "
			sql = sql & "scwriter = N'"		& scwriter	& "', "
			sql = sql & "scpwd = N'"		& scpwd		& "', "
			sql = sql & "scissecret = N'"	& scissecret& "', "
			sql = sql & "scemail = N'"		& scemail	& "', "
			sql = sql & "scmobile = N'"		& scmobile	& "', "
			sql = sql & "sccontents = N'"	& sccontents& "' "
			sql = sql & "where sccd = " & sccd

			msg = "상담이 수정되었습니다."
			link_file = "online-counselling-view.asp?" & args
		ElseIf wtype = "del" Then
			sql = "delete from TBL_SiteCounsel where sccd = " & sccd

			msg = "상담이 삭제되었습니다."
			link_file = "online-counselling.asp?cpage=" & cpage
		Else
			tmp = errPath("", "")
		End If
	End If

'response.write sql
'response.End
conn.Execute(sql)




%>
<script language="javascript">
	alert("<%=msg%>");
	location.replace("<%=link_file%>");
</script>
<%
response.End
%>

<%
connClose()
%>
