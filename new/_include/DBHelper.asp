<!--METADATA TYPE= "typelib"  NAME= "ADODB Type Library"  FILE="c:\Program Files\Common Files\SYSTEM\ADO\msado15.dll"  -->
<%
'�Ǽ�
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
	' SP�� �����ϰ�, RecordSet�� ��ȯ�Ѵ�.
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
	' SQL Query�� �����ϰ�, RecordSet�� ��ȯ�Ѵ�.
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
	' SP�� �����Ѵ�.(RecordSet ��ȯ����)
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
	' SP�� �����Ѵ�.(RecordSet ��ȯ����)
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
	' Ʈ������� �����ϰ�, Connetion ��ü�� ��ȯ�Ѵ�.
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
	' Ȱ��ȭ�� Ʈ������� Ŀ���Ѵ�.
	'---------------------------------------------------
	Public Sub CommitTrans(connectionObj)
		If Not connectionObj Is Nothing Then
			connectionObj.CommitTrans
			connectionObj.Close
			Set ConnectionObj = Nothing
		End If
	End Sub

	'---------------------------------------------------
	' Ȱ��ȭ�� Ʈ������� �ѹ��Ѵ�.
	'---------------------------------------------------
	Public Sub RollbackTrans(connectionObj)
		If Not connectionObj Is Nothing Then
			connectionObj.RollbackTrans
			connectionObj.Close
			Set ConnectionObj = Nothing
		End If
	End Sub

	'---------------------------------------------------
	' �迭�� �Ű������� �����.
	'---------------------------------------------------
	Public Function MakeParam(PName, PType, PDirection, PSize, PValue)
		MakeParam = Array(PName, PType, PDirection, PSize, PValue)
	End Function

	'---------------------------------------------------
	' �Ű����� �迭 ������ ������ �̸��� �Ű����� ���� ��ȯ�Ѵ�.
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
	'Array�� �Ѱܿ��� �Ķ���͸� Parsing �Ͽ� Parameter ��ü��
	'�����Ͽ� Command ��ü�� �߰��Ѵ�.
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
