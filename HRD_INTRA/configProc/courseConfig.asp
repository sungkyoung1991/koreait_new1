<%
Class CourseConfig

	Private Sub Class_Initialize  '클래스 초기화
	END sub
	
	Private Sub Class_Terminate   '클래스 종료
		adminDBClose()
	END sub
	
	public Function getCourseClassList()

		sql = "SELECT clscd, clsname FROM TBL_CourseClass Where status=1 order by clsname"
		
		'Response.Write sql
			
		Set rs = adminDB.Execute(sql)
		If Not rs.EOF Then			
			Dim tmpArray
			Dim arrCourseClassList()
			i = 0
			do until rs.eof
				ReDim Preserve arrCourseClassList(i) 
				Set tmpArray = New CourseClassList
				tmpArray.Clscd				= rs("clscd")
				tmpArray.Clsname			= rs("clsname")
				Set arrCourseClassList(i) = tmpArray
				  i = i + 1
			 		rs.movenext
			loop
		Else
			arrCourseClassList = NULL
		END IF
		rs.Close
        Set rs = nothing
		getCourseClassList = arrCourseClassList
	END Function
	
	public Function getCourseDivList()
		sql = "SELECT divcd, divname FROM TBL_CourseDiv Where status=1 order by divname"
		
		'Response.Write sql
			
		Set rs = adminDB.Execute(sql)
		If Not rs.EOF Then			
			Dim tmpArray
			Dim arrCourseDivList()
			i = 0
			do until rs.eof
				ReDim Preserve arrCourseDivList(i) 
				Set tmpArray = New CourseDivList
				tmpArray.Divcd				= rs("divcd")
				tmpArray.DivName			= rs("divname")
				Set arrCourseDivList(i) = tmpArray
				  i = i + 1
			 		rs.movenext
			loop
		Else
			arrCourseDivList = NULL
		END IF
		rs.Close
        Set rs = nothing
		getCourseDivList = arrCourseDivList
	
	END Function
	
	public Function getSchoolList()
	
		sql = "SELECT sName, scode FROM TBL_AdminSchool Where status=1 and scode != 0  order by scode asc"
		
		'Response.Write sql
			
		Set rs = adminDB.Execute(sql)
		If Not rs.EOF Then			
			Dim tmpArray
			Dim arrSchoolList()
			i = 0
			do until rs.eof
				ReDim Preserve arrSchoolList(i) 
				Set tmpArray = New SchoolList
				tmpArray.Scode				= rs("scode")
				tmpArray.Sname			= rs("sName")
				Set arrSchoolList(i) = tmpArray
				  i = i + 1
			 		rs.movenext
			loop
		Else
			arrSchoolList = NULL
		END IF
		rs.Close
        Set rs = nothing
		getSchoolList = arrSchoolList
	
	END Function
	
	Function getTeacherList()
		
		sql = "select admincd, adminname, adminstatus from TBL_AdminList where adminduty in ('전임강사','시간강사') order by adminduty, adminname"
		
		Set rs = adminDB.Execute(sql)
		
		If Not rs.EOF Then
			Dim tmpArray
			Dim arrTeacherList()
			i = 0
			do until rs.eof
				ReDim Preserve arrTeacherList(i) 
				Set tmpArray = New TeacherList
				tmpArray.Admincd			= rs("admincd")
				tmpArray.AdminName			= rs("adminname")
				tmpArray.AdminStatus		= rs("adminstatus")
				Set arrTeacherList(i) = tmpArray
				  i = i + 1
			 		rs.movenext
			loop
		Else
			getTeacherList = NULL
		END IF
		getTeacherList = arrTeacherList
	End Function 


	public function getCrcdList()

		sql = "Select r.crcd, r.crtitle, r.crinning, convert(nchar(10), r.edusdate, 23) as edusdate, "
		sql = sql & "  convert(nchar(10), r.eduedate, 23) as eduedate, r.clscd, c.clsname FROM TBL_CourseReal r "
		sql = sql & " inner join TBL_CourseClass c on c.clscd = r.clscd "
		sql = sql & " and r.scode like  '" & replace(ADMIN_SCODE, 0 , "%") & "%' "
		sql = sql & " and (r.crstatus = 'A' or r.crstatus = 'B') order by c.clsname asc, r.crcd desc "
		IF ADMIN_CD = 1 Then 
			'Response.Write sql 
			'Response.end
		END IF
		
		Set rs = adminDB.Execute(sql)
		
		If Not rs.EOF Then
			Dim tmpArray
			Dim arrCrcdList()
			i = 0
			do until rs.eof
				ReDim Preserve arrCrcdList(i) 
				Set tmpArray = New CourseList
				tmpArray.Crcd				= rs("crcd")
				tmpArray.crtitle			= rs("Crtitle")
				tmpArray.crinning			= rs("Crinning")
				tmpArray.Edusdate			= rs("edusdate")
				tmpArray.Eduedate			= rs("eduedate")
				tmpArray.Clscd				= rs("clscd")
				tmpArray.ClsName			= rs("clsname")
				Set arrCrcdList(i) = tmpArray
				i = i + 1
			 	rs.movenext
			loop
		Else
			getCrcdList = NULL
		
		END IF
			getCrcdList = arrCrcdList
	End Function
END Class
%>