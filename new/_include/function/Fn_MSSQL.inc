<!--#include File= "adovbs.inc"-->
<!--#include File= "Fn_MSSQL_Value.inc"-->
<%
'-------------------------------------------------------------------------------
' DB ó�� �Լ�
'-------------------------------------------------------------------------------
' FUNCTION GetArrayList(ByVal tempArr) => GetRows() �� ��ȯ�� �迭���� ����
' tempArr => GetRows() �� ��ȯ�� �迭
'-------------------------------------------------------------------------------
' FUNCTION GetRowsQuery(ByVal SQL) => �Ϲ����� ���ڵ� ��ȯ
' SQL => Select �������� [�Ϲ����� SQL ����]
'-------------------------------------------------------------------------------
' FUNCTION SelectQuery(ByVal SQL) => ���ڵ尪 ��ȯ(Top 1)
' SQL => Select �������� [�Ϲ����� Str��ȯ, ��("") �̸� ���ڵ����, Null �̸� �ý����̻�]
'-------------------------------------------------------------------------------
' FUNCTION CountQuery(ByVal SQL) => Count��(��������) ��ȯ
' SQL => Count(*) �������� [������� 1�̻��̸� ����, -1�̸� �ý����̻�, 0�̸� ��ȯ���ڵ� ����]
'-------------------------------------------------------------------------------
' FUNCTION UpdateQuery(ByVal SQL) => Update �� ���ڵ� ���� ��ȯ
' SQL => Update �������� [������� 1�̻��̸� ����, -1�̸� �ý����̻�, 0�̸� Update ���ڵ� ����]
'-------------------------------------------------------------------------------
' FUNCTION DeleteQuery(ByVal SQL) => Delete �� ���ڵ� ���� ��ȯ
' SQL => Delete �������� [������� 1�̻��̸� ����, -1�̸� �ý����̻�, 0�̸� Delete ���ڵ� ����]
'-------------------------------------------------------------------------------
' FUNCTION InsertQuery(ByVal SQL) => Insert �� ���ڵ� ���� ��ȯ
' SQL => Insert �������� [������� 1�̻��̸� ����, -1�̸� �ý����̻�, 0�̸� Insert ���ڵ� ����]
'-------------------------------------------------------------------------------
' SUB ExecuteQuery(ByVal SQL) => �Ϲ����� �������� [����ݳ�����]
' SQL => SQL ��������
'-------------------------------------------------------------------------------
' FUNCTION InsertQueryArray(ByVal uTable, ByVal uValArray)
' �迭�� ���޾Ƽ� Insert [uTable:���̺���, uValArray: 1-�ʵ��, 2-��]
'-------------------------------------------------------------------------------
' FUNCTION UpdateQueryArray(ByVal uTable, ByVal uValArray, ByVal uWhere)
' �迭�� ���޾Ƽ� Insert [uTable:���̺���, uValArray: 1-�ʵ��, 2-��, uwhere:����]
'-------------------------------------------------------------------------------

''' GetRows �迭��ȯ (2007. 8. 28)
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

''' ����Ʈ ��� ��������
FUNCTION GetRowsQuery(ByVal ConnStr, ByVal SQL)
	On Error Resume Next

	Dim DB, RS, arrRs
	If SQL = "" Then
		GetRowsQuery = Null
		Exit Function
	End If

	''' ������ �˻�
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

	''' ������ �߻��������
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("GetRowsQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		GetRowsQuery = Null
		Err.Clear

		''' ���� �߻��� ����
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("GetRowsQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' Count�� �������� (���������� ���ϰ��̸� ��밡��)
FUNCTION CountQuery(ByVal ConnStr, ByVal sql)
	On Error Resume Next

	Dim DB, RS
	If SQL = "" then
		CountQuery = 0
		Exit Function
	End IF

	''' ������ �˻�
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

	''' ������ �߻��������
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("CountQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		CountQuery = -1
		Err.Clear

		''' ���� �߻��� ����
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("CountQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' �ʵ尪 ��������
FUNCTION SelectQuery(ByVal ConnStr, ByVal sql)
	On Error Resume Next

	Dim DB, RS
	If SQL = "" then
		SelectQuery = ""
		Exit Function
	End IF

	''' ������ �˻�
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

	''' ������ �߻��������
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("SelectQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		SelectQuery = Null
		Err.Clear

		''' ���� �߻��� ����
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("SelectQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' �������� (Update)
FUNCTION UpdateQuery(ByVal ConnStr, byval sql)
	UpdateQuery = RowCountQuery(ConnStr, sql)
End Function

''' �������� (Delete)
FUNCTION DeleteQuery(ByVal ConnStr, byval sql)
	DeleteQuery = RowCountQuery(ConnStr, sql)
End Function

''' ���� ���� (������Ʈ ���뿩�� �ݳ�)
FUNCTION RowCountQuery(ByVal ConnStr, byval sql)
	On Error Resume Next

	If SQL = "" Then
		RowCountQuery = Null
		Exit Function
	End If

	''' ������ �˻�
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

	''' ������ �߻��������
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("RowCountQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		RowCountQuery = -1
		Err.Clear

		''' ���� �߻��� ����
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("RowCountQuery" & Chr(9) & SQL,1)
	End IF
End Function

'''����Ÿ �ֱ�
FUNCTION InsertQuery(ByVal ConnStr, Byval sql)
	On Error Resume Next

	If SQL = "" Then
		InsertQuery = Null
		Exit Function
	End If

	''' ������ �˻�
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

	''' ������ �߻��������
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("InsertQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		InsertQuery = -1
		Err.Clear

		''' ���� �߻��� ����
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("InsertQuery" & Chr(9) & SQL,1)
	End IF
End Function

''' ���� ���� (�Ϲ����� �������� �ݳ�����)
Sub ExecuteQuery(ByVal ConnStr, byval sql)
	On Error Resume Next

	If SQL = "" Then
		Exit Sub
	End If

	''' ������ �˻�
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

	''' ������ �߻��������
	If Err.Number <> 0 Then
		Call LogWriteSQLErr("ExecuteQuery" & Chr(9) & SQL & Chr(9) & Err.Number & Chr(9) & Err.Source & Chr(9) & Err.Description,0)
		Err.Clear

		''' ���� �߻��� ����
		If DB_SQL_ERROR_NEXT = FALSE Then
			Response.Status = 505
			Response.Write "ERROR"
			Response.End
		End If
	ElseIf DB_SQL_LOG_WRITE = TRUE Then
		Call LogWriteSQLErr("ExecuteQuery" & Chr(9) & SQL,1)
	End IF
End Sub

''' �迭�� ���޾Ƽ� Insert [uTable:���̺���, uValArray: 1-�ʵ��, 2-��]
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

''' �迭�� ���޾Ƽ� Insert [uTable:���̺���, uValArray: 1-�ʵ��, 2-��, uwhere:����]
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

''' SQL_Err Log �������� (������ ����)
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

''' ������ȿ����(������ �� �˻�)
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
		''' ���ڿ� - ���ڿ������� ��� True�� ����, �ƴҰ�� False
			If bStr = True Then
				bStr = False
			Else
				bStr = True
			End If
			tChar = ""
		Case 59 ' ";"
		''' ������ - ���Ṯ��
			If bStr = False Then
				falseMode = 159
				tBOOL = False
				Exit For
			End If
		Case 45 ' "-"
		''' ������ - �ּ�
			If bStr = False Then
				If ASC(Mid(SQL,i-1,1)) = 45 Then
					falseMode = 145
					tBOOL = False
					Exit For
				End If
			End If
		Case 42 ' "*"
		''' ������ - �ּ� (/* ... */)
			If bStr = False Then
				If ASC(Mid(SQL,i-1,1)) = 47 Then
					falseMode = 142
					tBOOL = False
					Exit For
				End If
			End If
		Case 32, 9, 60, 61, 62, 40, 41, 91, 93, 46, 44  ' " " , Tab, <, =, >, (, ), [, ], ., ,,
		''' ���� , �ǹ��� - ���ڿ��� �ƴҰ�� �ʱ�ȭ
			tStr2 = tStr
			tStr = ""
			tChar = ""
		End Select

		tStr = tStr & tChar

		''' ���ڿ��� �ƴ� ���ɹ��ϰ�� (SQL���ɹ�����)
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

	''' ���ڿ����� �� ���� �������
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

''' �迭�� ���޾Ƽ� Insert [uTable:���̺���, uValArray: 1-�ʵ��, 2-��]
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

''' �迭�� ���޾Ƽ� Insert [uTable:���̺���, uValArray: 1-�ʵ��, 2-��, uwhere:����]
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

' ����¡ ����Ʈ
' Set_PageSize : ������ ������
' Set_PageNum : ����������
' Set_Field : �ʵ��
' Set_Table : ���̺���
' Set_Where : �˻�����
' Set_OrderBy : ��������
' Set_PageCount : ��ü������ ����(��ȯ)
' Set_RecordCount : ��ü����Ʈ ����(��ȯ)
function GetListPageToArray(ByVal ConnStr, ByVal Set_PageSize, ByVal Set_PageNum, ByVal Set_Field, ByVal Set_Table, ByVal Set_Where, ByVal Set_OrderBy, ByRef Set_PageCount, ByRef Set_RecordCount)
	Dim SQL, SQL_Where, SQL_OrderBy, SQL_Field, SQL_Table, SQL_In

	if StrComp(Set_PageSize,0) = 0 Then Set_PageSize = 10
	if StrComp(Set_PageNum,0) = 0 Then Set_PageNum = 1

	SQL_Field = Set_Field
	SQL_Table  = Set_Table
	SQL_Where = Set_Where
	SQL_OrderBy = Set_OrderBy

	''' ���ڵ� ����
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

'����Ʈ �� (��¸���Ʈ��, �ʵ��, ���̺���, ���ǹ�, ���Ĺ��)
Function GetListViewToArray(ByVal ConnStr, ByVal Set_Cnt, ByVal Set_Field, ByVal Set_Table, ByVal Set_Where, ByVal Set_OrderBy)
	Dim SQL : SQL = "Select Top " & Set_Cnt & " " & Set_Field & " From " & Set_Table & " Where " & Set_Where & " " & Set_OrderBy
	GetListViewToArray = GetRowsQuery(ConnStr,SQL)
End Function

'������ �׽�Ʈ��� (��¸���Ʈ��, �ʵ��, ���̺���, ���ǹ�, ���Ĺ��)
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