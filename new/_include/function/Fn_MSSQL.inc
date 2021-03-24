<!--#include File= "adovbs.inc"-->
<!--#include File= "Fn_MSSQL_Value.inc"-->
<%
'-------------------------------------------------------------------------------
' DB 처리 함수
'-------------------------------------------------------------------------------
' FUNCTION GetArrayList(ByVal tempArr) => GetRows() 로 반환된 배열순서 변경
' tempArr => GetRows() 로 반환된 배열
'-------------------------------------------------------------------------------
' FUNCTION GetRowsQuery(ByVal SQL) => 일반적인 레코드 반환
' SQL => Select 구문수행 [일반적인 SQL 구문]
'-------------------------------------------------------------------------------
' FUNCTION SelectQuery(ByVal SQL) => 레코드값 반환(Top 1)
' SQL => Select 구문수행 [일반적인 Str반환, 빈값("") 이면 레코드없음, Null 이면 시스템이상]
'-------------------------------------------------------------------------------
' FUNCTION CountQuery(ByVal SQL) => Count값(숫자형태) 반환
' SQL => Count(*) 구문수행 [결과값이 1이상이면 성공, -1이면 시스템이상, 0이면 반환레코드 없음]
'-------------------------------------------------------------------------------
' FUNCTION UpdateQuery(ByVal SQL) => Update 된 레코드 갯수 반환
' SQL => Update 구문수행 [결과값이 1이상이면 성공, -1이면 시스템이상, 0이면 Update 레코드 없음]
'-------------------------------------------------------------------------------
' FUNCTION DeleteQuery(ByVal SQL) => Delete 된 레코드 갯수 반환
' SQL => Delete 구문수행 [결과값이 1이상이면 성공, -1이면 시스템이상, 0이면 Delete 레코드 없음]
'-------------------------------------------------------------------------------
' FUNCTION InsertQuery(ByVal SQL) => Insert 된 레코드 갯수 반환
' SQL => Insert 구문수행 [결과값이 1이상이면 성공, -1이면 시스템이상, 0이면 Insert 레코드 없음]
'-------------------------------------------------------------------------------
' SUB ExecuteQuery(ByVal SQL) => 일반적인 쿼리실행 [결과반납없음]
' SQL => SQL 구문수행
'-------------------------------------------------------------------------------
' FUNCTION InsertQueryArray(ByVal uTable, ByVal uValArray)
' 배열로 값받아서 Insert [uTable:테이블명, uValArray: 1-필드명, 2-값]
'-------------------------------------------------------------------------------
' FUNCTION UpdateQueryArray(ByVal uTable, ByVal uValArray, ByVal uWhere)
' 배열로 값받아서 Insert [uTable:테이블명, uValArray: 1-필드명, 2-값, uwhere:조건]
'-------------------------------------------------------------------------------

''' GetRows 배열변환 (2007. 8. 28)
FUNCTION GetArrayList(ByVal tempArr)
	Dim i, j
	Dim tempArrList()

	If Not IsArray(tempArr) Then
		GetArrayList = Null
		Exit FUNCTION
	End If

	ReDim tempArrList(UBound(tempArr,2)+1,UBound(tempArr,1)+1)

	For i = 1 To UBound(tempArrList,1)
		For j = 1 To UBound(tempArrList,2)
			tempArrList(i,j) = Trim(tempArr(j-1,i-1))
		Next
	Next

	GetArrayList = tempArrList
End Function

''' 리스트 목록 가져오기
FUNCTION GetRowsQuery(ByVal ConnStr, ByVal SQL)
	On Error Resume Next

	Dim DB, RS, arrRs
	If SQL = "" Then
		GetRowsQuery = Null
		Exit Function
	End If

	''' 쿼리문 검사
	If SQLStrCheckBOOL(SQL) = False Then
		Response.Status = 505
		Response.Write "ERROR_2"
		Response.End
	End If

	SET db = Server.CreateObject("ADODB.Connection")
	db.Open ConnStr

	Set rs = db.execute(sql)
	If Not Rs.Eof Then
		arrRs = rs.getrows()
	Else
		arrRs = Null
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	GetRowsQuery = arrRs

	''' 에러가 발생했을경우
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("GetRowsQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		GetRowsQuery = Null
		Err.Clear

		''' 에러 발생시 진행
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("GetRowsQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' Count값 가져오기 (숫자형태의 리턴값이면 사용가능)
FUNCTION CountQuery(ByVal ConnStr, ByVal sql)
	On Error Resume Next

	Dim DB, RS
	If SQL = "" then
		CountQuery = 0
		Exit Function
	End IF

	''' 쿼리문 검사
	If SQLStrCheckBOOL(SQL) = False Then
		Response.Status = 505
		Response.Write "ERROR_2"
		Response.End
	End If

	SET db = Server.CreateObject("ADODB.Connection")
	db.Open ConnStr

	set rs = db.execute(sql)
	If Not Rs.Eof Then
		CountQuery = CDbl(rs(0))
	Else
		CountQuery = 0
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	''' 에러가 발생했을경우
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("CountQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		CountQuery = -1
		Err.Clear

		''' 에러 발생시 진행
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("CountQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' 필드값 가져오기
FUNCTION SelectQuery(ByVal ConnStr, ByVal sql)
	On Error Resume Next

	Dim DB, RS
	If SQL = "" then
		SelectQuery = ""
		Exit Function
	End IF

	''' 쿼리문 검사
	If SQLStrCheckBOOL(SQL) = False Then
		Response.Status = 505
		Response.Write "ERROR_2"
		Response.End
	End If

	SET db = Server.CreateObject("ADODB.Connection")
	db.Open ConnStr

	set rs = db.execute(sql)
	If Not Rs.Eof Then
		SelectQuery = Trim(rs(0))
	Else
		SelectQuery = ""
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	''' 에러가 발생했을경우
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("SelectQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		SelectQuery = Null
		Err.Clear

		''' 에러 발생시 진행
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("SelectQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' 쿼리실행 (Update)
FUNCTION UpdateQuery(ByVal ConnStr, byval sql)
	UpdateQuery = RowCountQuery(ConnStr, sql)
End Function

''' 쿼리실행 (Delete)
FUNCTION DeleteQuery(ByVal ConnStr, byval sql)
	DeleteQuery = RowCountQuery(ConnStr, sql)
End Function

''' 쿼리 실행 (업데이트 적용여부 반납)
FUNCTION RowCountQuery(ByVal ConnStr, byval sql)
	On Error Resume Next

	If SQL = "" Then
		RowCountQuery = Null
		Exit Function
	End If

	''' 쿼리문 검사
	If SQLStrCheckBOOL(SQL) = False Then
		Response.Status = 505
		Response.Write "ERROR_2"
		Response.End
	End If

	Dim DB, RS
	SET db = Server.CreateObject("ADODB.Connection")
	db.Open ConnStr
	db.execute(sql)

	set rs = db.execute("Select @@ROWCOUNT")
	RowCountQuery = CDbl(rs(0))

	SET rs = nothing
	db.Close
	SET db = nothing

	''' 에러가 발생했을경우
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("RowCountQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		RowCountQuery = -1
		Err.Clear

		''' 에러 발생시 진행
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("RowCountQuery" & Chr(9) & SQL,1)
	End IF
End Function

'''데이타 넣기
FUNCTION InsertQuery(ByVal ConnStr, Byval sql)
	On Error Resume Next

	If SQL = "" Then
		InsertQuery = Null
		Exit Function
	End If

	''' 쿼리문 검사
	If SQLStrCheckBOOL(SQL) = False Then
		Response.Status = 505
		Response.Write "ERROR_2"
		Response.End
	End If

	Dim DB, RS
	SET db = Server.CreateObject("ADODB.Connection")
	db.Open ConnStr
	db.execute(sql)

	SET rs = db.execute("Select SCOPE_IDENTITY()")
	If isNull(rs(0)) then
		InsertQuery = 0
	Else
		InsertQuery = rs(0)
	End if

	set rs = nothing
	db.Close
	set db = nothing

	''' 에러가 발생했을경우
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("InsertQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		InsertQuery = -1
		Err.Clear

		''' 에러 발생시 진행
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("InsertQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' 쿼리 실행 (일반적인 쿼리실행 반납없음)
Sub ExecuteQuery(ByVal ConnStr, byval sql)
	On Error Resume Next

	If SQL = "" Then
		Exit Sub
	End If

	''' 쿼리문 검사
	If SQLStrCheckBOOL(SQL) = False Then
		Response.Status = 505
		Response.Write "ERROR_2"
		Response.End
	End If

	Dim DB
	SET db = Server.CreateObject("ADODB.Connection")
	db.Open ConnStr
	db.execute(sql)
	db.Close
	SET db = nothing

	''' 에러가 발생했을경우
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("ExecuteQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		Err.Clear

		''' 에러 발생시 진행
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("ExecuteQuery" & Chr(9) & SQL,1)
	End IF
End Sub

''' 배열로 값받아서 Insert [uTable:테이블명, uValArray: 1-필드명, 2-값]
function InsertQueryArray(ByVal ConnStr, ByVal uTable, ByVal uValArray)
	If Len(uTable) = 0 Or Not IsArray(uValArray) Then
		Exit Function
	End If

	Dim SQL, SQL1, SQL2, i, tempStr, tempStr2
	SQL1 = "" : SQL2 = ""
	For i = 1 To UBound(uValArray,1)
		tempStr  = Replace(uValArray(i,1),"'","''")

		If IsNull(uValArray(i,2)) Then
			tempStr2 = Null
		Else
			tempStr2 = Replace(uValArray(i,2),"'","''")
		End If

		If Len(tempStr) >= 1 Then
			If Len(SQL1) = 0 Then
				SQL1 = tempStr

				If IsNull(tempStr2) Then
					SQL2 = "NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL2 = "GETDATE()"
				Else
					SQL2 = "'" & tempStr2 & "'"
				End If
			Else
				SQL1 = SQL1 & "," & tempStr

				If IsNull(tempStr2) Then
					SQL2 = SQL2 & "," & "NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL2 = SQL2 & "," & "GETDATE()"
				Else
					SQL2 = SQL2 & "," & "'" & tempStr2 & "'"
				End If
			End If
		End IF
	Next

	If Len(SQL1) <= 1 Or Len(SQL2) <= 1 Then
		Exit Function
	End If

	SQL = "Insert Into " & uTable & "(" & SQL1 & ") Values(" & SQL2 & ")"
	InsertQueryArray = InsertQuery(ConnStr, SQL)
End function

''' 배열로 값받아서 Insert [uTable:테이블명, uValArray: 1-필드명, 2-값, uwhere:조건]
function UpdateQueryArray(ByVal ConnStr, ByVal uTable, ByVal uValArray, ByVal uWhere)
	If Len(uTable) = 0 Or Not IsArray(uValArray) Then
		Exit Function
	End If

	Dim SQL, SQL1, i, tempStr, tempStr2
	SQL1 = ""
	For i = 1 To UBound(uValArray,1)
		tempStr  = Replace(uValArray(i,1),"'","''")

		If IsNull(uValArray(i,2)) Then
			tempStr2 = Null
		Else
			tempStr2 = Replace(uValArray(i,2),"'","''")
		End If

		If Len(tempStr) >= 1 Then
			If Len(SQL1) = 0 Then
				If IsNull(tempStr2) Then
					SQL1 = tempStr & "=NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL1 = tempStr & "=" & tempStr2
				Else
					SQL1 = tempStr & "='" & tempStr2 & "'"
				End If
			Else
				If IsNull(tempStr2) Then
					SQL1 = SQL1 & ", " & tempStr & "=NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL1 = SQL1 & ", " & tempStr & "=" & tempStr2
				Else
					SQL1 = SQL1 & ", " & tempStr & "='" & tempStr2 & "'"
				End If
			End If
		End IF
	Next

	If Len(SQL1) <= 1 Then
		Exit Function
	End If

	If Len(uWhere) >= 3 Then uWhere = " Where " & uWhere

	SQL = "Update " & uTable & " Set " & SQL1 & uWhere
	UpdateQueryArray = UpdateQuery(ConnStr, SQL)
End function

''' SQL_Err Log 내용저장 (저장할 내용)
Sub LogWriteSQLErr(ByVal logtext, ByVal logtype)
	ON ERROR RESUME NEXT

	Dim strFolder, strFname
	Dim strYear, strMonth, strDay, strHour, strMinute, strSecond
	Dim sendMT, sendDT, sendHT

	Dim uDate : uDate = Now()
	strYear   = Year(uDate)
	strMonth  = Right("00" & Month(uDate),2)
	strDay    = Right("00" & Day(uDate),2)
	strHour   = Right("00" & Hour(uDate),2)
	strMinute = Right("00" & Minute(uDate),2)
	strSecond = Right("00" & Second(uDate),2)

	sendMT = strYear & strMonth
	sendDT = strYear & strMonth & strDay
	sendHT = strYear & "-" & strMonth & "-" & strDay & " " & strHour & ":" & strMinute & ":" & strSecond

	Dim objFile, outFile
	Set objFile = Server.CreateObject("Scripting.FileSystemObject")

	strFolder = Server.MapPath("/") & "\" & "Log"
	If Not objFile.FolderExists(strFolder) Then
		objFile.CreateFolder(strFolder)
	End If

	'If logtype = "0" then
	'	strFolder = strFolder & "\" & "SQL_Err"
	'Else
		strFolder = strFolder & "\" & "SQL"
	'End If

	If Not objFile.FolderExists(strFolder) Then
		objFile.CreateFolder(strFolder)
	End If

	strFolder = strFolder & "\" & sendMT
	If Not objFile.FolderExists(strFolder) Then
		objFile.CreateFolder(strFolder)
	End If

	If logtype = "0" then
		strFname = strFolder & "\" & sendDT & "_Err.log"
	ElseIf logtype = "1" then
		strFname = strFolder & "\" & sendDT & ".log"
	ElseIf logtype = "2" then
		strFname = strFolder & "\" & sendDT & "_CheckErr.log"
	Else
		strFname = strFolder & "\" & sendDT & ".log"
	End If

	If Trim(logtext) <> "" then
		Set outFile = objFile.OpenTextFile(strFname,8,true)
		outFile.Write sendHT & Chr(9) & TRIM(Request.ServerVariables("REMOTE_ADDR")) & Chr(9) & "SessionID:" & Session.SessionID & Chr(9) & LCASE(TRIM(Request.ServerVariables("SCRIPT_NAME"))) & Chr(9) & logtext & VbCrLf
		outFile.Close
		Set outFile = Nothing
	End If

	Set objFile = Nothing
End Sub

''' 쿼리유효점검(인젝션 등 검사)
Function SQLStrCheckBOOL(ByVal SQL)
	Dim i
	Dim tChar : tChar = ""
	Dim tStr : tStr = ""
	Dim tStr2 : tStr2 = ""
	Dim bStr : bStr = False
	Dim tBOOL : tBOOL = True
	Dim falseMode : falseMode = 0

	Dim SQLlen : SQLlen = Len(SQL)
	For i = 1 To SQLlen
		tChar = LCase(Mid(SQL,i,1))
		Select Case ASC(tChar)
		Case 39 ' "'"
		''' 문자열 - 문자열시작일 경우 True로 변경, 아닐경우 False
			If bStr = True Then
				bStr = False
			Else
				bStr = True
			End If
			tChar = ""
		Case 59 ' ";"
		''' 쿼리문 - 종료문자
			If bStr = False Then
				falseMode = 159
				tBOOL = False
				Exit For
			End If
		Case 45 ' "-"
		''' 쿼리문 - 주석
			If bStr = False Then
				If ASC(Mid(SQL,i-1,1)) = 45 Then
					falseMode = 145
					tBOOL = False
					Exit For
				End If
			End If
		Case 42 ' "*"
		''' 쿼리문 - 주석 (/* ... */)
			If bStr = False Then
				If ASC(Mid(SQL,i-1,1)) = 47 Then
					falseMode = 142
					tBOOL = False
					Exit For
				End If
			End If
		Case 32, 9, 60, 61, 62, 40, 41, 91, 93, 46, 44  ' " " , Tab, <, =, >, (, ), [, ], ., ,,
		''' 공백 , 탭문자 - 문자열이 아닐경우 초기화
			tStr2 = tStr
			tStr = ""
			tChar = ""
		End Select

		tStr = tStr & tChar

		''' 문자열이 아닌 명령문일경우 (SQL명령문차단)
		If bStr = False And Len(tStr2) >= 3 Then
			If Left(tStr2,3) = "xp_" Then
				'"xp_cmdshell", "xp_dirtree", "xp_regdeletekey", "xp_regenumvalues", "xp_regread", "xp_regwrite", "xp_fileexist", "xp_fixeddrives", "xp_getfiledetails", "xp_startmail", "xp_sendmail"
				falseMode = 201
				tBOOL = False
				Exit For
			ElseIf Left(tStr2,3) = "sp_" Then
				'"sp_adduser", "sp_configure", "sp_makewebtask"
				falseMode = 202
				tBOOL = False
				Exit For
			Else
				Select Case tStr2
				Case "information_schema", "reconfigure", "sysobject"
					falseMode = 203
					tBOOL = False
					Exit For
				Case "drop", "create", "alter", "declare" ', "or"
					falseMode = 204
					tBOOL = False
					Exit For
				End Select
			End If

			tStr2 = ""
		End If
	Next

	''' 문자열시작 후 종료 없을경우
	If tBOOL And bStr Then
		falseMode = 301
		tBOOL = False
	End If

	If tBOOL = False Then
		Call LogWriteSQLErr("CheckQuery" & Chr(9) & SQL & Chr(9) & "falseMode:" & falseMode,2)
		'Response.Status = 505
		'Response.Write "ERROR"
		'Response.End
	End If

	SQLStrCheckBOOL = tBOOL
End Function

''' 배열로 값받아서 Insert [uTable:테이블명, uValArray: 1-필드명, 2-값]
function InsertQueryArrayStr(ByVal uTable, ByVal uValArray)
	If Len(uTable) = 0 Or Not IsArray(uValArray) Then
		Exit Function
	End If

	Dim SQL, SQL1, SQL2, i, tempStr, tempStr2
	SQL1 = "" : SQL2 = ""
	For i = 1 To UBound(uValArray,1)
		tempStr  = Replace(uValArray(i,1),"'","''")

		If IsNull(uValArray(i,2)) Then
			tempStr2 = Null
		Else
			tempStr2 = Replace(uValArray(i,2),"'","''")
		End If

		If Len(tempStr) >= 1 Then
			If Len(SQL1) = 0 Then
				SQL1 = tempStr

				If IsNull(tempStr2) Then
					SQL2 = "NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL2 = "GETDATE()"
				Else
					SQL2 = "'" & tempStr2 & "'"
				End If
			Else
				SQL1 = SQL1 & "," & tempStr

				If IsNull(tempStr2) Then
					SQL2 = SQL2 & "," & "NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL2 = SQL2 & "," & "GETDATE()"
				Else
					SQL2 = SQL2 & "," & "'" & tempStr2 & "'"
				End If
			End If
		End IF
	Next

	If Len(SQL1) <= 1 Or Len(SQL2) <= 1 Then
		Exit Function
	End If

	SQL = "Insert Into " & uTable & "(" & SQL1 & ") Values(" & SQL2 & ")"
	InsertQueryArrayStr = SQL
End function

''' 배열로 값받아서 Insert [uTable:테이블명, uValArray: 1-필드명, 2-값, uwhere:조건]
function UpdateQueryArrayStr(ByVal uTable, ByVal uValArray, ByVal uWhere)
	If Len(uTable) = 0 Or Not IsArray(uValArray) Then
		Exit Function
	End If

	Dim SQL, SQL1, i, tempStr, tempStr2
	SQL1 = ""

	For i = 1 To UBound(uValArray,1)
		tempStr  = Replace(uValArray(i,1),"'","''")

		If IsNull(uValArray(i,2)) Then
			tempStr2 = Null
		Else
			tempStr2 = Replace(uValArray(i,2),"'","''")
		End If

		If Len(tempStr) >= 1 Then
			If Len(SQL1) = 0 Then
				If IsNull(tempStr2) Then
					SQL1 = tempStr & "=NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL1 = tempStr & "=" & tempStr2
				Else
					SQL1 = tempStr & "='" & tempStr2 & "'"
				End If
			Else
				If IsNull(tempStr2) Then
					SQL1 = SQL1 & ", " & tempStr & "=NULL"
				ElseIf StrComp(tempStr2,"GETDATE()",1) = 0 Then
					SQL1 = SQL1 & ", " & tempStr & "=" & tempStr2
				Else
					SQL1 = SQL1 & ", " & tempStr & "='" & tempStr2 & "'"
				End If
			End If
		End IF
	Next

	If Len(SQL1) <= 1 Then
		Exit Function
	End If

	If Len(uWhere) >= 3 Then uWhere = " Where " & uWhere

	SQL = "Update " & uTable & " Set " & SQL1 & uWhere

	UpdateQueryArrayStr = SQL
End Function

' 페이징 리스트
' Set_PageSize : 페이지 사이즈
' Set_PageNum : 현재페이지
' Set_Field : 필드명
' Set_Table : 테이블명
' Set_Where : 검색조건
' Set_OrderBy : 정렬조건
' Set_PageCount : 전체페이지 갯수(반환)
' Set_RecordCount : 전체리스트 갯수(반환)
function GetListPageToArray(ByVal ConnStr, ByVal Set_PageSize, ByVal Set_PageNum, ByVal Set_Field, ByVal Set_Table, ByVal Set_Where, ByVal Set_OrderBy, ByRef Set_PageCount, ByRef Set_RecordCount)
	Dim SQL, SQL_Where, SQL_OrderBy, SQL_Field, SQL_Table, SQL_In

	if StrComp(Set_PageSize,0) = 0 Then Set_PageSize = 10
	if StrComp(Set_PageNum,0) = 0 Then Set_PageNum = 1

	SQL_Field = Set_Field
	SQL_Table  = Set_Table
	SQL_Where = Set_Where
	SQL_OrderBy = Set_OrderBy

	''' 레코드 갯수
	SQL = "Select Count(*) From " & SQL_Table & " Where " & SQL_Where
	Dim tArray : tArray = GetRowsQuery(ConnStr,SQL)
	If IsArray(tArray) Then
		Set_RecordCount = tArray(0,0)
	Else
		Set_RecordCount = 0
	End If

	Set_PageCount = int((Set_RecordCount-1)/Set_pagesize) + 1

 	SQL_OrderBy = ", ROW_NUMBER() OVER(" & SQL_OrderBy & ") as RowNumber "
	SQL_In = "RowNumber Between " & ((Set_PageNum - 1) * (Set_PageSize) + 1) & " And " & (Set_PageNum * Set_PageSize)
	SQL = "Select Top " & (Set_PageNum * Set_PageSize) & " " & SQL_Field & SQL_OrderBy & " From " & SQL_Table & " Where " & SQL_Where
	SQL = "Select * From (" & SQL & ") as x Where (" & SQL_In & ")"
	
	GetListPageToArray = GetRowsQuery(ConnStr,SQL)
End Function

'리스트 뷰 (출력리스트수, 필드명, 테이블명, 조건문, 정렬방식)
Function GetListViewToArray(ByVal ConnStr, ByVal Set_Cnt, ByVal Set_Field, ByVal Set_Table, ByVal Set_Where, ByVal Set_OrderBy)
	Dim SQL : SQL = "Select Top " & Set_Cnt & " " & Set_Field & " From " & Set_Table & " Where " & Set_Where & " " & Set_OrderBy
	GetListViewToArray = GetRowsQuery(ConnStr,SQL)
End Function

'쿼리문 테스트출력 (출력리스트수, 필드명, 테이블명, 조건문, 정렬방식)
Function GetQueryStringToStr(ByVal ConnStr, ByVal Set_Cnt, ByVal Set_Field, ByVal Set_TableName, ByVal Set_Where, ByVal Set_OrderBy)
	Dim SQL
	SQL = "Select top " & Set_Cnt & " " & Set_Field & " From " & Set_TableName & " Where " & Set_Where & " " & Set_OrderBy
	GetQueryStringToStr = SQL
End function

Function GetSQLSearchSplit(ByVal asFiled, ByVal asSearchText)
	asSearchText = Replace(asSearchText,"!"," ")
	asSearchText = Replace(asSearchText,"~"," ")
	asSearchText = Replace(asSearchText,"&"," ")
	asSearchText = Replace(asSearchText,"("," ")
	asSearchText = Replace(asSearchText,")"," ")
	asSearchText = Replace(asSearchText,"|"," ")
	asSearchText = Replace(asSearchText,"["," ")
	asSearchText = Replace(asSearchText,"]"," ")
	asSearchText = Replace(asSearchText,";"," ")
	asSearchText = Replace(asSearchText,":"," ")
	asSearchText = Replace(asSearchText,""""," ")
	asSearchText = Replace(asSearchText,"'"," ")
	asSearchText = Replace(asSearchText,","," ")

	Dim returnValue : returnValue = ""
	Dim Cnt : Cnt = 1
	Dim strLength : strLength = Len(asSearchText)
	Dim tempstr1 : tempstr1 = ""
	Dim tempstr2 : tempstr2 = ""
	Dim strAscii

	Do while (Cnt <= strLength)
		tempstr1 = Mid(asSearchText,Cnt,1)
		strAscii = ASC(tempstr1)

		If (strAscii=9 or strAscii=32 or IsNull(strAscii)) Then
			If (len(tempstr2) > 1) Then
				If (len(returnValue) > 0) Then returnValue = returnValue & " or"
				returnValue = returnValue & " contains(" & asFiled & ",'" & tempstr2 & "')"
			End If

			tempstr2 = ""
		Else
			tempstr2 = tempstr2 & tempstr1
		End If

		Cnt = Cnt + 1
	Loop

	If (Len(tempstr2) > 1) Then
		If (Len(returnValue) > 0) Then returnValue = returnValue & " or"
		returnValue = returnValue & " contains(" & asFiled & ",'" & tempstr2 & "')"
	End If

	returnValue = Trim(returnValue)

	If (Len(returnValue) = 0 Or Len(returnValue) = null) Then
		returnValue = "(1=2)"
	Else
		returnValue = "(" & returnValue & ")"
	End If

	GetSQLSearchSplit = returnValue
End Function
%>