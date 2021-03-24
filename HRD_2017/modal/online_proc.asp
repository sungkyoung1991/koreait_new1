<!--#include virtual="/_include/Service_Inc.inc"-->
<%

'--------------------------------------------------
'	파리미터 얻기 & 변수초기화
'--------------------------------------------------
	Dim regip : regip		= Request.ServerVariables("REMOTE_ADDR")

	Dim abc
	Set abc = Server.CreateObject("ABCUpload4.XForm")
	abc.AbsolutePath = False
	abc.Overwrite = False
	abc.CodePage = 65001 
	
	Dim gubun 		: gubun			= abc.item("gubun")(1)
	scode			= abc.item("scode")(1)
	Dim toname 		: toname		= abc.item("toname")(1)
	Dim tomobile 	: tomobile		= abc.item("m1")(1) & "-" & abc.item("m2")(1) & "-"& abc.item("m3")(1)
	Dim divGroup 	: divGroup		= abc.item("todiv")(1)
	
	
	Dim AryResult, setOnline 
	Set setOnline = New Online
	
	AryResult = setOnline.setSimpleOnline(scode, toname, tomobile, divGroup, regip)
	
	IF isArray(AryResult) Then
		IF StrComp(AryResult(0).item("result"),0) = 0 Then
			'접수문자 발송 - 2017.01.23
			Call SendSms(SMS_INFO_PHONE_MARKETING, SMS_CALLBAK_PHONE_MARKETING, "[온라인접수] 페이지에 글이 등록되었습니다.", 1)
			%>
            	<script language="javascript">
					formReset("접수완료되었습니다.");
				</script>		
			<%
		END IF	
	Else 
	%>
    	<script language="javascript">
			formReset("오류가 발생했습니다. 잠시 후 다시 시도하세요.");
		</script>
	<%	
	END IF
	
	
%>
