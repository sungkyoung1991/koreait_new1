<!-- #include virtual = "/inc/Admin_Inc_Ajax_utf8.inc" -->
<%
' 파일 중복을 제거 하기 위해 고정 사이트 만큼 특정 문자를 채워 주는 함수
Public Function LeftFillString ( strValue, fillChar, makeLength )
	Dim strRet
	Dim strLen, diff, i

	strRet  = ""
	strLen  = Len(strValue)
	diff    = CInt(makeLength) - strLen

	if diff > 0 then
		for i=1 to diff
			strRet = strRet & CStr(fillChar)
		next
	end if

	LeftFillString = strRet & CStr(strValue)
End Function

'유니크한 파일명 만들기
Public Function MakeUniqueFileName( strPrename )
	Dim strFilename
	Dim dtNow : dtNow = now()

	Randomize()
	strFilename = strPrename
	strFilename = strFilename & Year(dtNow)
	strFilename = strFilename & LeftFillString( Month(dtNow),   "0", 2 )
	strFilename = strFilename & LeftFillString( Day(dtNow),     "0", 2 )
	strFilename = strFilename & "_"
	strFilename = strFilename & LeftFillString( Hour(dtNow),    "0", 2 )
	strFilename = strFilename & LeftFillString( Minute(dtNow),  "0", 2 )
	strFilename = strFilename & LeftFillString( Second(dtNow),  "0", 2 )
	strFilename = strFilename & "_" 
	strFilename = strFilename & LeftFillString ( Int(Rnd * 1000000), "0", 7 )

	MakeUniqueFileName = strFilename
End Function

' 파일 확장자 추출
Function GetFileExt( strFilename )
	Dim strExt : strExt = ""
	Dim nPos
	nPos = InStrRev( strFilename, ".", -1, 1 ) '// Text Compare

	if nPos > 0 then
		strExt = Mid( strFilename, nPos+1 )
	end if

	GetFileExt = LCase(strExt)
End Function

'업로드 확인용 파일명 가져오기
Function GetUploadFileName()
	On Error Resume Next
	Dim upload_filename : upload_filename = Upload("upload").Filename

	If Err.Number <> 0 Then
		upload_filename	= ""
	End If

	GetUploadFileName = upload_filename
End Function

' 변수들은 위에서 말한 개발자 가이드 문서에서 뽑았습니다.
' Required: anonymous function number as explained above.
Dim funcNum : funcNum = Request("CKEditorFuncNum")
'Optional: instance name (might be used to load specific configuration file or anything else)
Dim CKEditor : CKEditor = Request("CKEditor")
' Optional: might be used to provide localized messages
Dim langCode : langCode = Request("langCode")
' Check the $_FILES array and save the file. Assign the correct path to some variable ($url).
Dim fileUrl : fileUrl = ""
' Usually you will assign here something only if file could not be uploaded.
Dim message : message = ""

'파일타입
Dim uploadType : uploadType = LCase(Request("type"))


Dim defaultPath : defaultPath = "/upload_files/news/" & uploadType & "/"

' DEXT Upload를 사용하고 있습니다.
Set Upload = Server.CreateObject("DEXT.FileUpload")
Upload.AutoMakeFolder = true
Upload.DefaultPath = Server.MapPath ("/upload_files/news")
Upload.CodePage = 65001

Dim FileBool : FileBool = false
Dim folderPath : folderPath = Server.MapPath(defaultPath)

'upload_filename = Upload("upload").Filename
upload_filename = GetUploadFileName()

If Len(upload_filename) <= 3 Then
	upload_filename = ""
	img_filesize = 0
	message = "업로드 파일이 존재하지 않습니다."
ElseIf IsNull(Upload("upload")) or Upload("upload").FileLen <= 0 then
	upload_filename = ""
	img_filesize = 0
	message = "업로드 파일이 존재하지 않습니다."
Else
	FileNameExt = GetFileExt(upload_filename)
	upload_filename = MakeUniqueFileName("") & "." & FileNameExt
	img_filesize = Upload("upload").FileLen

	If img_filesize > 0 then
		' 확장자 체크 해야 하는데 귀찮아서
		' Request("type") 으로 Images / Flash 구별해서 확장자 추출함수인 GetFileExt(upload_filename) 이걸로 체크하면 되겠죠
		' 이미지는 jpg, gif, png..   플래쉬는 swf 파일만.. ㅎㅎㅎ

		Select Case UCase(uploadType) 
		Case "IMAGES"
			''' 이미지 파일 검사 (bmp|gif|jpg|jpeg|png)
			If Not (StrComp(FileNameExt,"bmp") = 0 Or StrComp(FileNameExt,"gif") = 0 Or StrComp(FileNameExt,"jpg") = 0  Or StrComp(FileNameExt,"jpeg") = 0  Or StrComp(FileNameExt,"png") = 0) Then
				message = "이미지 파일이 아닙니다."
			Else
				FileBool = true
				message = "정상적으로 파일을 업로드했습니다."
			End If
		Case "FLASH"
			If Not (StrComp(FileNameExt,"swf") = 0) Then
				message = "플래시 파일이 아닙니다."
			Else
				FileBool = true
				message = "정상적으로 파일을 업로드했습니다."
			End If
		Case "FILES"
			If (StrComp(FileNameExt,"asp") = 0 Or StrComp(FileNameExt,"php") = 0 Or StrComp(FileNameExt,"jsp") = 0 Or StrComp(FileNameExt,"js") = 0 Or StrComp(FileNameExt,"html") = 0 Or StrComp(FileNameExt,"htm") = 0) Then
				message = "일반적인 파일이 아닙니다."
			Else
				FileBool = true
				message = "정상적으로 파일을 업로드했습니다."
			End If
		Case Else
				message = "정상적인 파일이 아닙니다."
		End Select
	Else
		message = "업로드 파일 사이즈가 0입니다."
	end if
end If

'파일저장
If fileBool Then
	upload_filename = Upload("upload").SaveAs(folderPath & "\" & upload_filename, false)
	upload_filename = Mid(upload_filename, InstrRev(upload_filename,"\")+1)
	fileUrl = defaultPath & upload_filename
End If
%>
<script type="text/javascript">
    // 가장 중요한 부분인것 같군요
    // ckeditor의 순번과 유효한 파일 경로만 넘기면 자동으로 이미지나 플래쉬 속성 변경 탭으로 이동합니다.
    window.parent.CKEDITOR.tools.callFunction(<%=funcNum %>, '<%=fileUrl %>', '<%=message %>');
    //history.go(-1);
</script>