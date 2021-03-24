<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual="/_include/$dbconnect.asp" -->
<!-- #include virtual="/_include/admin_secret.asp" -->
<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)
CheckValue = replace(CheckValue, "&" , "&amp;")
CheckValue = replace(CheckValue, "<", "&lt;")
CheckValue = replace(CheckValue, ">", "&gt;")
CheckValue = replace(CheckValue, "'", "''")
CheckWord=CheckValue
End Function
</script>
<%
Function GetUniqueName(byRef strFileName, DirectoryPath)

	Dim strName, strExt
	strName = Mid(strFileName, 1, InstrRev(strFileName, ".") - 1) ' 확장자를 제외한 파일명을 얻는다.
	strExt = Mid(strFileName, InstrRev(strFileName, ".") + 1) '확장자를 얻는다

	Dim fso : Set fso = Server.CreateObject("Scripting.FileSystemObject")

	Dim bExist : bExist = True
	'우선 같은이름의 파일이 존재한다고 가정
	Dim strFileWholePath : strFileWholePath = DirectoryPath & strName & "." & strExt
	'저장할 파일의 완전한 이름(완전한 물리적인 경로) 구성
	Dim countFileName : countFileName = 0
	'파일이 존재할 경우, 이름 뒤에 붙일 숫자를 세팅함.

	Do While bExist ' 우선 있다고 생각함.
		If (fso.FileExists(server.mappath(strFileWholePath))) Then ' 같은 이름의 파일이 있을 때
			countFileName = countFileName + 1 '파일명에 숫자를 붙인 새로운 파일 이름 생성
			strFileName = strName & "(" & countFileName & ")." & strExt
			strFileWholePath = DirectoryPath & strFileName
		Else
			bExist = False
		End If
	Loop

	GetUniqueName = strFileName
End Function

'파일이상 체크
Function GetFileName()
	On Error Resume Next

	Dim filename : filename = Trim(CheckWord(abc.item("filename")))

	If Err.Number <> 0 Then
		Response.Write "<script language=javascript>"
		Response.Write "alert('업로드 파일 용량을 확인해 주세요. 업로드파일 총용량은 10M 미만 입니다.');"
		Response.Write "history.back();"
		Response.Write "</script>"
		Response.end
	End If

	GetFileName = filename
End function

'--------------------------------------------------
'	파리미터 얻기 & 변수초기화
'--------------------------------------------------
Set abc = Server.CreateObject("ABCUpload4.XForm")
abc.AbsolutePath = False
abc.Overwrite = False
abc.CodePage = 65001


'------------------------------------------------------------------
'     		     파일업로드
'------------------------------------------------------------------
'filename= Trim(CheckWord(abc.item("filename")))
filename = GetFileName()
If filename <> "" then
	filedir		= "/eng_2020/upload_files/news/"

	Set oFile = abc.item("filename")(1)

	If oFile.FileExists Then
		file = oFile.SafeFileName
		filename = GetUniqueName(file, filedir)
	else
		filename = ""
	end if

	if trim(filename) <> "" then

		Set oFile = abc.item("filename")(1)

		if oFile.Length > 10096000 then
			Response.Write "<script language=javascript>"
			Response.Write "alert('10M 이상의 사이즈인 파일은 업로드하실 수 없습니다.   ');"
			Response.Write "history.back();"
			Response.Write "</script>"
			Response.end
		else
			oFile.Save Cstr(filedir&filename)  					'파일 업로드
		End if

		Set oFile = Nothing
	end If
End If

'------------------------------------------------------------------
'     		     파일업로드2
'------------------------------------------------------------------
filename2= Trim(CheckWord(abc.item("filename2")))
If filename2 <> "" then
	filedir		= "/eng_2020/upload_files/news/"

	Set oFile = abc.item("filename2")(1)

	If oFile.FileExists Then
		file = oFile.SafeFileName
		filename2 = GetUniqueName(file, filedir)
	else
		filename2 = ""
	end if

	if trim(filename2) <> "" then

		Set oFile = abc.item("filename2")(1)

		if oFile.Length > 10096000 then
			Response.Write "<script language=javascript>"
			Response.Write "alert('10M 이상의 사이즈인 파일은 업로드하실 수 없습니다.   ');"
			Response.Write "history.back();"
			Response.Write "</script>"
			Response.end
		else
			oFile.Save Cstr(filedir&filename2)  					'파일 업로드
		End if

		Set oFile = Nothing
	end If
End If

'------------------------------------------------------------------
'     		     파일업로드3
'------------------------------------------------------------------
filename3= Trim(CheckWord(abc.item("filename3")))
If filename3 <> "" then
	filedir		= "/eng_2020/upload_files/news/"

	Set oFile = abc.item("filename3")(1)

	If oFile.FileExists Then
		file = oFile.SafeFileName
		filename3 = GetUniqueName(file, filedir)
	else
		filename3 = ""
	end if

	if trim(filename3) <> "" then

		Set oFile = abc.item("filename3")(1)

		if oFile.Length > 10096000 then
			Response.Write "<script language=javascript>"
			Response.Write "alert('10M 이상의 사이즈인 파일은 업로드하실 수 없습니다.   ');"
			Response.Write "history.back();"
			Response.Write "</script>"
			Response.end
		else
			oFile.Save Cstr(filedir&filename3)  					'파일 업로드
		End if

		Set oFile = Nothing
	end If
End If

'------------------------------------------------------------------
'     		     파일업로드4
'------------------------------------------------------------------
filename4= Trim(CheckWord(abc.item("filename4")))
If filename4 <> "" then
	filedir		= "/eng_2020/upload_files/news/"

	Set oFile = abc.item("filename4")(1)

	If oFile.FileExists Then
		file = oFile.SafeFileName
		filename4 = GetUniqueName(file, filedir)
	else
		filename4 = ""
	end if

	if trim(filename4) <> "" then

		Set oFile = abc.item("filename4")(1)

		if oFile.Length > 10096000 then
			Response.Write "<script language=javascript>"
			Response.Write "alert('10M 이상의 사이즈인 파일은 업로드하실 수 없습니다.   ');"
			Response.Write "history.back();"
			Response.Write "</script>"
			Response.end
		else
			oFile.Save Cstr(filedir&filename4)  					'파일 업로드
		End if

		Set oFile = Nothing
	end If
End If

'------------------------------------------------------------------
'     		     파일업로드5
'------------------------------------------------------------------
filename5= Trim(CheckWord(abc.item("filename5")))
If filename5 <> "" then
	filedir		= "/eng_2020/upload_files/news/"

	Set oFile = abc.item("filename5")(1)

	If oFile.FileExists Then
		file = oFile.SafeFileName
		filename5 = GetUniqueName(file, filedir)
	else
		filename5 = ""
	end if

	if trim(filename5) <> "" then

		Set oFile = abc.item("filename5")(1)

		if oFile.Length > 10096000 then
			Response.Write "<script language=javascript>"
			Response.Write "alert('10M 이상의 사이즈인 파일은 업로드하실 수 없습니다.   ');"
			Response.Write "history.back();"
			Response.Write "</script>"
			Response.end
		else
			oFile.Save Cstr(filedir&filename5)  					'파일 업로드
		End if

		Set oFile = Nothing
	end If
End If


index =Trim(CheckWord(abc.item("index")))
mode=Trim(CheckWord(abc.item("mode")))
bbscode=Trim(CheckWord(abc.item("bbscode")))
take_idx=Trim(CheckWord(abc.item("take_idx")))
'name =Trim(CheckWord(abc.item("name")))
mail =Trim(CheckWord(abc.item("mail")))
title =Trim(CheckWord(abc.item("title")))

'상단 view 소스 add
top_view = Trim(CheckWord(abc.item("top_view")))
If StrComp(top_view,1) = 0 Then
	top_view = 1
else
	top_view = 0
End if

'리스트 view 소스 add
list_view = Trim(CheckWord(abc.item("list_view")))
If StrComp(list_view,1) = 0 Then
	list_view = 1
Else
	list_view = 0
End if

pwd = "admin"

URL = Trim(CheckWord(abc.item("URL")))

if abc.item("tag") <> "" then
	content = replace(abc.item("content"),"'","''")
else
	content = CheckWord(abc.item("content"))
end if

if mode="insert" or mode="reply" Then
	GSQL = "Select MAX(numm) from news_board_eng2 where bbscode='"&bbscode&"'"
	Set GGrs = Server.CreateObject("ADODB.Recordset")
	GGrs.Open GSQL,conn

	If IsNULL(GGrs(0)) Then
		number = 1
	else
		number = GGrs(0) + 1
	End If

	GGrs.Close
	Set GGrs = Nothing

	if mode="reply" then '즉 답변쓰기라면
		myref = Cint(abc.item("ref"))
		mystep = CInt(abc.item("step"))
		mylevel = CInt(abc.item("level"))

		SQLString = "UPDATE news_board_eng2 SET step = step + 1 WHERE bbscode='board' and ref=" & myref & " AND step > " & mystep
		conn.Execute(SQLString)

		newstep = mystep + 1
		newlevel = mylevel + 1
		page = session("page")
	else ' 첨 글쓰기라면...
		myref = number
		newstep=0
		newlevel=0
	end if

	SQL = "INSERT INTO news_board_eng2 (bbscode,name,title,ref,step,re_level,numm,mail,content,readnum,pwd,URL,writeday,writer_id,filename1,filename2,filename3,filename4,filename5,top_view,list_view) VALUES "
	SQL = SQL & "('" & bbscode & "'"
	SQL = SQL & ",'" & k_name & "'"
	SQL = SQL & ",'" & title & "'"
	SQL = SQL & "," & myref & " "
	SQL = SQL & "," & newstep & " "
	SQL = SQL & "," & newlevel & " "
	SQL = SQL & "," & number & " "
	SQL = SQL & ",'" & mail & "'"
	SQL = SQL & ",'" & content & "'"
	SQL = SQL & "," & 0 & " "
	SQL = SQL & ",'" & pwd & "'"
	SQL = SQL & ",'" & URL & "'"
	SQL = SQL & ",'" & now & "'"
	SQL = SQL & ",'" & id & "'"
	SQL = SQL & ",'" & filename & "'"
	SQL = SQL & ",'" & filename2 & "'"
	SQL = SQL & ",'" & filename3 & "'"
	SQL = SQL & ",'" & filename4 & "'"
	SQL = SQL & ",'" & filename5 & "'"
	SQL = SQL & ",'" & top_view & "'"
	SQL = SQL & ",'" & list_view & "'"
	SQL = SQL & ")"
elseif mode="modi" then
	SQL = "Update news_board_eng2 set "
	SQL = SQL & " bbscode = '" & bbscode & "'"
	SQL = SQL & ", title = '" & title & "'"
	SQL = SQL & ", mail = '" & mail & "'"
	SQL = SQL & ", edit_id = '" & id & "'"
	SQL = SQL & ", edit_dt = GETDATE()"
	SQL = SQL & ", content = '" & content & "'"
	SQL = SQL & ", URL = '" & URL & "'"

	If filename <> "" then
		SQL = SQL & ", filename1 = '" & filename & "'"
	End If
	If filename2 <> "" then
		SQL = SQL & ", filename2 = '" & filename2 & "'"
	End If
	If filename3 <> "" then
		SQL = SQL & ", filename3 = '" & filename3 & "'"
	End If
	If filename4 <> "" then
		SQL = SQL & ", filename4 = '" & filename4 & "'"
	End If
	If filename5 <> "" then
		SQL = SQL & ", filename5 = '" & filename5 & "'"
	End If

	SQL = SQL & ", top_view = '" & top_view & "'"
	SQL = SQL & ", list_view = '" & list_view & "'"
	SQL = SQL & " where take_idx="&take_idx

	page = session("page")
end if

conn.Execute SQL
conn.close : Set conn = Nothing

'공지사항(메인 리스트)
Application.Lock
Application.Contents("NoticeList_Array") = ""
Application.Contents("NoticeList_Now") = ""
Application.Unlock
%>
<script language="JavaScript">
	alert("등록되었습니다.");
	location.href="list.asp?index=<%=index%>&page=<%=page%>&table=<%=table%>";
</script>
