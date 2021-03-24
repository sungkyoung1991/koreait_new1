<%@ language="VBScript" %>
<%
  Option Explicit

  Const lngMaxFormBytes = 200

  Dim objASPError, blnErrorWritten, strServername, strServerIP, strRemoteIP
  Dim strMethod, lngPos, datNow, strQueryString, strURL, http_result, DbCon
  Dim asp_FileName

  If Response.Buffer Then
    Response.Clear
    Response.Status = "500 Internal Server Error"
    Response.ContentType = "text/html"
    Response.Expires = 0
  End If

	SET DbCon = Server.CreateObject("ADODB.Connection")
	DbCon.open "DSN=KIT_LOG;UID=kitlog;PWD=dasan2011&"

  Set objASPError = Server.GetLastError
%>
<%
  'Response.Write objASPError.Category
  If objASPError.ASPCode > "" Then 
  'Response.Write ", " & objASPError.ASPCode
  End If
  'Response.Write " (0x" & Hex(objASPError.Number) & ")" & "<br>"

  'Response.Write "<b>" & objASPError.Description & "</b><br>"

  If objASPError.ASPDescription > "" Then 
  'Response.Write objASPError.ASPDescription & "<br>"
  End If

  blnErrorWritten = False

  ' Only show the Source if it is available and the request is from the same machine as IIS
  If objASPError.Source > "" Then
    strServername = LCase(Request.ServerVariables("SERVER_NAME"))
    strServerIP = Request.ServerVariables("LOCAL_ADDR")
    strRemoteIP =  Request.ServerVariables("REMOTE_ADDR")
    If (strServername = "localstr_Local_Addr" Or strServerIP = strRemoteIP) And objASPError.File <> "?" Then
      'Response.Write objASPError.File 
      If objASPError.Line > 0 Then 
	  'Response.Write ", line " & objASPError.Line
		http_result = ", line " & objASPError.Line
		http_result = objASPError.Description & " " & http_result
		http_result=Replace(http_result,"'", "''")
		asp_FileName = Replace(Request.ServerVariables("SCRIPT_NAME") & "<br/>[ErrFile: " & objASPError.File&"]","'","''")

		  DbCon.Execute("Insert into tb_Error_Table (Err_Content,FileName,Part,str_Query,str_Refferer,str_Remote_Addr,str_Server_Name,str_Local_Addr) values ('"&http_result&"','"&asp_FileName&"','Sever 오류','"& Replace(Request.ServerVariables("QUERY_STRING"),"'", "''") &"','"& Replace(Request.ServerVariables("HTTP_REFERER"),"'", "''") &"','"& Request.ServerVariables("REMOTE_ADDR") &"','"& Request.ServerVariables("SERVER_NAME") &"','"& Request.ServerVariables("LOCAL_ADDR") &"')")
		End IF
      If objASPError.Column > 0 Then 
	  'Response.Write ", column " & objASPError.Column
		http_result = ", column " & objASPError.Column
		http_result = objASPError.Description & " " & http_result
		http_result=Replace(http_result,"'", "''")
		asp_FileName = Replace(Request.ServerVariables("SCRIPT_NAME") & "<br/>[ErrFile: " & objASPError.File&"]","'","''")

		  DbCon.Execute("Insert into tb_Error_Table (Err_Content,FileName,Part,str_Query,str_Refferer,str_Remote_Addr,str_Server_Name,str_Local_Addr) values ('"&http_result&"','"&asp_FileName&"','Sever 오류','"& Replace(Request.ServerVariables("QUERY_STRING"),"'", "''") &"','"& Replace(Request.ServerVariables("HTTP_REFERER"),"'", "''") &"','"& Request.ServerVariables("REMOTE_ADDR") &"','"& Request.ServerVariables("SERVER_NAME") &"','"& Request.ServerVariables("LOCAL_ADDR") &"')")
		End If
      'Response.Write "<br>"
      'Response.Write "<font style=""COLOR:000000; FONT: 9pt/11pt 굴림""><b>"
      'Response.Write Server.HTMLEncode(objASPError.Source) & "<br>"
      If objASPError.Column > 0 Then 
	  'Response.Write String((objASPError.Column - 1), "-") & "^<br>"
	  End If
      'Response.Write "</b></font>"
      blnErrorWritten = True
    End If
  End If

  If Not blnErrorWritten And objASPError.File <> "?" Then
    'Response.Write "<b>" & objASPError.File
    If objASPError.Line > 0 Then 
	'Response.Write ", line " & objASPError.Line
		http_result = ", line " & objASPError.Line
		http_result = objASPError.Description & " " & http_result
		http_result=Replace(http_result,"'", "''")
		asp_FileName = Replace(Request.ServerVariables("SCRIPT_NAME") & "<br/>[ErrFile: " & objASPError.File&"]","'","''")

		  DbCon.Execute("Insert into tb_Error_Table (Err_Content,FileName,Part,str_Query,str_Refferer,str_Remote_Addr,str_Server_Name,str_Local_Addr) values ('"&http_result&"','"&asp_FileName&"','Sever 오류','"& Replace(Request.ServerVariables("QUERY_STRING"),"'", "''") &"','"& Replace(Request.ServerVariables("HTTP_REFERER"),"'", "''") &"','"& Request.ServerVariables("REMOTE_ADDR") &"','"& Request.ServerVariables("SERVER_NAME") &"','"& Request.ServerVariables("LOCAL_ADDR") &"')")
		End If
    If objASPError.Column > 0 Then 
	'Response.Write ", column " & objASPError.Column
		http_result = ", column " & objASPError.Column
		http_result = objASPError.Description & " " & http_result
		http_result=Replace(http_result,"'", "''")
		asp_FileName = Replace(Request.ServerVariables("SCRIPT_NAME") & "<br/>[ErrFile: " & objASPError.File&"]","'","''")

		  DbCon.Execute("Insert into tb_Error_Table (Err_Content,FileName,Part,str_Query,str_Refferer,str_Remote_Addr,str_Server_Name,str_Local_Addr) values ('"&http_result&"','"&asp_FileName&"','Sever 오류','"& Replace(Request.ServerVariables("QUERY_STRING"),"'", "''") &"','"& Replace(Request.ServerVariables("HTTP_REFERER"),"'", "''") &"','"& Request.ServerVariables("REMOTE_ADDR") &"','"& Request.ServerVariables("SERVER_NAME") &"','"& Request.ServerVariables("LOCAL_ADDR") &"')")
		End If
    'Response.Write "</b><br>"
  End If


  strMethod = Request.ServerVariables("REQUEST_METHOD")

  'Response.Write strMethod & " "

  If strMethod = "POST" Then
    'Response.Write Request.TotalBytes & " bytes to "
  End If

  'Response.Write Request.ServerVariables("SCRIPT_NAME")

  lngPos = InStr(Request.QueryString, "|")

  If lngPos > 1 Then
    'Response.Write "?" & Server.HTMLEncode(Left(Request.QueryString, (lngPos - 1)))
  End If

  'Response.Write "</li>"

  If strMethod = "POST" Then
    'Response.Write "<p><li>POST Data:<br>"
    If Request.TotalBytes > lngMaxFormBytes Then
		  http_result=Replace(http_result,"'", "''")
		  asp_FileName = Replace(Request.ServerVariables("SCRIPT_NAME") & "<br/>[ErrFile: " & objASPError.File&"]","'","''")

		  DbCon.Execute("Insert into tb_Error_Table (Err_Content,FileName,Part,str_Query,str_Refferer,str_Remote_Addr,str_Server_Name,str_Local_Addr) values ('"&http_result&"','"&asp_FileName&"','Sever 오류','"& Replace(Request.ServerVariables("QUERY_STRING"),"'", "''") &"','"& Replace(Request.ServerVariables("HTTP_REFERER"),"'", "''") &"','"& Request.ServerVariables("REMOTE_ADDR") &"','"& Request.ServerVariables("SERVER_NAME") &"','"& Request.ServerVariables("LOCAL_ADDR") &"')")

       'Response.Write Server.HTMLEncode(Left(Request.Form, lngMaxFormBytes)) & " . . ."
    Else
      'Response.Write Server.HTMLEncode(Request.Form)
    End If
    'Response.Write "</li>"
  End If

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<head>
<META NAME="ROBOTS" CONTENT="NOINDEX">
<title>에러페이지</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
<table align="center">
	<tr>
		<td>
			<img src="/images/err_text.gif"><br><br>
			요청하신 페이지에서 문제가 발생했습니다<br><br>
			서비스 사용에 불편을 끼쳐드려서 대단히 죄송합니다.<br>
			전산요청 게시판에 올려주시거나 교학부 전산담당자에게 연락주십시요.<br>
			빠른 시간내에 문제를 처리하겠습니다. 감사합니다.
		</td>
	</tr>
</table>			
</body>
</html>
<%

	'----- DB접속 끊기 --;;;;
	DbCon.close : SET DbCon=nothing
%>