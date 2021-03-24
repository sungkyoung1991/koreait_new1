<!--METADATA TYPE= "typelib"  NAME= "ADODB Type Library"  FILE="c:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"  -->
<%
'실섭
DIM dh_koreait
	dh_koreait = "Provider=SQLOLEDB.1;Password=junds960&;Persist Security Info=True;USER ID=seicaweb; Initial Catalog=seica; Data Source=mssql6.bora.net"
Class clsDBHelper
	Private DefaultConnString
	Private DefaultConnection
		
	Private sub Class_Initialize()
		DefaultConnString		= "Provider=SQLOLEDB.1;Password=junds960&;Persist Security Info=True;USER ID=seicaweb; Initial Catalog=seica; Data Source=mssql6.bora.net"
		Set DefaultConnection	= Nothing
	End Sub

	'---------------------------------------------------
	' SP를 실행하고, RecordSet을 반환한다.
	'---------------------------------------------------
	Public Function ExecSPReturnRS(spName, params, connectionString)
		If IsObject(connectionString) Then
			If connectionString is Nothing Then
				If DefaultConnection is Nothing Then
					Set DefaultConnection = CreateObject("ADODB.Connection")
					DefaultConnection.Open DefaultConnString        
				End If      
				Set connectionString = DefaultConnection
			End If
		End If
	  
		Dim rs,cmd
		Set rs	= CreateObject("ADODB.RecordSet")
		Set cmd = CreateObject("ADODB.Command")

		cmd.ActiveConnection	= connectionString
		cmd.CommandText			= spName
		cmd.CommandType			= adCmdStoredProc
		Set cmd					= CollectParams(cmd, params)
		'cmd.Parameters.Refresh

		rs.CursorLocation = adUseClient
		rs.Open cmd, ,adOpenStatic, adLockReadOnly
		
		Dim i
		For i = 0 To cmd.Parameters.Count - 1	  
			If	cmd.Parameters(i).Direction = adParamOutput OR _
				cmd.Parameters(i).Direction = adParamInputOutput OR _
				cmd.Parameters(i).Direction = adParamReturnValue Then
				If IsObject(params) Then	    
					If params is Nothing Then
						Exit For	        
					End If	      
				Else
					params(i)(4) = cmd.Parameters(i).Value
				End If
			End If
		Next	

		Set cmd.ActiveConnection	= Nothing
		Set cmd						= Nothing
		Set rs.ActiveConnection		= Nothing

		Set ExecSPReturnRS			= rs
	End Function

	'---------------------------------------------------
	' SQL Query를 실행하고, RecordSet을 반환한다.
	'---------------------------------------------------
	Public Function ExecSQLReturnRS(strSQL, params, connectionString)
		If IsObject(connectionString) Then
			If connectionString is Nothing Then
				If DefaultConnection is Nothing Then
					Set DefaultConnection = CreateObject("ADODB.Connection")
					DefaultConnection.Open DefaultConnString        
				End If      
				Set connectionString = DefaultConnection
			End If
		End If
	  
		Dim rs,cmd
		Set rs	= CreateObject("ADODB.RecordSet")
		Set cmd = CreateObject("ADODB.Command")

		cmd.ActiveConnection	= connectionString
		cmd.CommandText			= strSQL
		cmd.CommandType			= adCmdText
		Set cmd					= CollectParams(cmd, params)	
		rs.CursorLocation		= adUseClient
		rs.Open cmd, , adOpenStatic, adLockReadOnly
		
		Set cmd.ActiveConnection	= Nothing
		Set cmd						= Nothing
		Set rs.ActiveConnection		= Nothing
		
		Set ExecSQLReturnRS			= rs
	End Function

	'---------------------------------------------------
	' SP를 실행한다.(RecordSet 반환없음)
	'---------------------------------------------------
	Public Sub ExecSP(strSP,params,connectionString)
		If IsObject(connectionString) Then
			If connectionString is Nothing Then
				If DefaultConnection is Nothing Then
					Set DefaultConnection = CreateObject("ADODB.Connection")
					DefaultConnection.Open DefaultConnString        
				End If      
				Set connectionString = DefaultConnection
			End If
		End If
	  
		Dim cmd
		Set cmd					= CreateObject("ADODB.Command")
		cmd.ActiveConnection	= connectionString
		cmd.CommandText			= strSP
		cmd.CommandType			= adCmdStoredProc
		Set cmd					= CollectParams(cmd, params)
		cmd.Execute , , adExecuteNoRecords
		
		Dim i
		For i = 0 To cmd.Parameters.Count - 1	  
			If cmd.Parameters(i).Direction = adParamOutput OR _
				cmd.Parameters(i).Direction = adParamInputOutput OR _
				cmd.Parameters(i).Direction = adParamReturnValue Then
				If IsObject(params) Then	    
					If params is Nothing Then
						Exit For	        
					End If	      
				Else
					params(i)(4) = cmd.Parameters(i).Value
				End If
			End If
		Next	

		Set cmd.ActiveConnection = Nothing
		Set cmd = Nothing
	End Sub

	'---------------------------------------------------
	' SP를 실행한다.(RecordSet 반환없음)
	'---------------------------------------------------
	Public Sub ExecSQL(strSQL, params, connectionString)      
		If IsObject(connectionString) Then
			If connectionString is Nothing Then
				If DefaultConnection is Nothing Then
					Set DefaultConnection = CreateObject("ADODB.Connection")
					DefaultConnection.Open DefaultConnString        
				End If      
				Set connectionString = DefaultConnection
			End If
		End If
	  
		Dim cmd
		Set cmd					= CreateObject("ADODB.Command")
		cmd.ActiveConnection	= connectionString
		cmd.CommandText			= strSQL
		cmd.CommandType			= adCmdText
		Set cmd					= CollectParams(cmd, params)
		cmd.Execute , , adExecuteNoRecords

		Set cmd.ActiveConnection	= Nothing
		Set cmd						= Nothing
	End Sub






	'---------------------------------------------------
	' 트랜잭션을 시작하고, Connetion 개체를 반환한다.
	'---------------------------------------------------
	Public Function BeginTrans(connectionString)
		If IsObject(connectionString) Then
			If connectionString is Nothing Then
				connectionString = DefaultConnString
			End If
		End If

		Dim conn
		Set conn = Server.CreateObject("ADODB.Connection")
		conn.Open connectionString
		conn.BeginTrans
		Set BeginTrans = conn
	End Function

	'---------------------------------------------------
	' 활성화된 트랜잭션을 커밋한다.
	'---------------------------------------------------
	Public Sub CommitTrans(connectionObj)
		If Not connectionObj Is Nothing Then
			connectionObj.CommitTrans
			connectionObj.Close
			Set ConnectionObj = Nothing
		End If
	End Sub

	'---------------------------------------------------
	' 활성화된 트랜잭션을 롤백한다.
	'---------------------------------------------------
	Public Sub RollbackTrans(connectionObj)
		If Not connectionObj Is Nothing Then
			connectionObj.RollbackTrans
			connectionObj.Close
			Set ConnectionObj = Nothing
		End If
	End Sub

	'---------------------------------------------------
	' 배열로 매개변수를 만든다.
	'---------------------------------------------------
	Public Function MakeParam(PName, PType, PDirection, PSize, PValue)
		MakeParam = Array(PName, PType, PDirection, PSize, PValue)
	End Function

	'---------------------------------------------------
	' 매개변수 배열 내에서 지정된 이름의 매개변수 값을 반환한다.
	'---------------------------------------------------		
	Public Function GetValue(params, paramName)
		Dim param
		For Each param in params
			If param(0) = paramName Then
				GetValue = param(4)
				Exit Function
			End If
		Next
	End Function

	Public Sub Dispose
		If Not DefaultConnection is Nothing Then 
			If DefaultConnection.State = adStateOpen Then 
				DefaultConnection.Close
			End If
			Set DefaultConnection = Nothing
		End if
	End Sub

	'---------------------------------------------------------------------------
	'Array로 넘겨오는 파라메터를 Parsing 하여 Parameter 객체를
	'생성하여 Command 객체에 추가한다.
	'---------------------------------------------------------------------------
	Private Function CollectParams(cmd, argparams)
		Dim params, i, l, u, v

		If VarType(argparams) = 8192 or VarType(argparams) = 8204 or VarType(argparams) = 8209 then 
			params = argparams
			For i = LBound(params) To UBound(params)
				l = LBound(params(i))
				u = UBound(params(i))
				' Check for nulls.
				If u - l = 4 Then	
					If VarType(params(i)(4)) = vbString Then
						If params(i)(4) = "" Then
							v = Null
						Else
							v = params(i)(4)
						End If
					Else
						v = params(i)(4)
					End If
					cmd.Parameters.Append cmd.CreateParameter(params(i)(0), params(i)(1), params(i)(2), params(i)(3), v)
				End If
			Next
			Set CollectParams = cmd
			Exit Function
		Else
			Set CollectParams = cmd
		End If
	End Function

End Class
%>
