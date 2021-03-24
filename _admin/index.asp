<%
id = Request.Cookies("koreait")("id")
k_name = Request.Cookies("koreait")("name")
power = Request.Cookies("koreait")("posit_code")

'If id <> "" then
'	Response.Write "<script language='javascript'>"
'	Response.Write "parent.document.location.href = 'https://koreait.ac.kr:444/_admin/admin_all.asp';"
'	Response.Write "</script>"
'Else
'	If Request.ServerVariables("SERVER_PORT")="80" then
'		response.redirect "https://koreait.ac.kr:444/_admin/"
'		response.End
'	End if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>한국IT전문학교- Administrator</title>
<link href="common/style.css" rel="stylesheet" type="text/css">

<!-- jquery file -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js" integrity="sha256-SOuLUArmo4YXtXONKz+uxIGSKneCJG4x0nVcA0pFzV0=" crossorigin="anonymous" charset="utf-8"></script>

<!-- jquery ajax loader -->
<link rel="stylesheet" href="/new/css/jquery.ajax.css" />
<script src="js/jquery.ajax.js" ></script>

<script src="./Login_Rsa/login.js?20161122"></script>
<script src="./Login_Rsa/RSA.Module.js" charset="utf-8"></script>
</head>
<body>
<form name="frmLogin" id="frmLogin" action="./login_rsa/login_proc.asp" method="post">
<input type="hidden" name="authrsa" id="authrsa" value="2">
<input type="hidden" name="path" value="/">
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<table width="455" border="0" align="center" cellpadding="0" cellspacing="0" background="./images/bg_login.gif">
				<tr>
					<td height="160">&nbsp;</td>
				</tr>
				<tr>
					<td height="106" align="right">

						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="136" height="23" valign="top">              
									<!------ 아이디 입력 ------>
									<input name="authid" type="text" class="in" id="authid" style="width:136px" tabindex="1" />
								</td>                
								<td width="10" rowspan="2">&nbsp;</td>              
								<!------ 로그인 버튼 ------>
								<td width="59" rowspan="2"><a href="#" id="mem-login" tabindex="3"><img src="./images/bt_login.gif" border=0></a></td>              
								<td width="40" rowspan="2">&nbsp;</td>
							</tr>
							<tr>
								<td height="23" valign="bottom">              
									<!------ 비번 입력 ------>
									<input name="authpasswd" TYPE="password" class="in" id="authpasswd" style="width:136px" tabindex="2" />
								</td>                
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</body>
</html>
<%
'End if
%>