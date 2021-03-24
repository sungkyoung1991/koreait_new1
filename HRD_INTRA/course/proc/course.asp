<%
Class Course
	
	private mTable

	Private Sub Class_Initialize  '클래스 초기화
			mTable = "TBL_CourseReal"
	END sub
	
	Private Sub Class_Terminate   '클래스 종료
		adminDBClose()
	END sub
	
	public Function getCourseList(whsql, cpage, psize)

		sql = "SELECT TOP(" & psize & ") r.crcd, r.crtitle, r.crinning, r.clscd, c.clsname, r.divcd, d.divname, "
		sql = sql & " convert(nchar(10),r.edusdate,23) as edusdate,  convert(nchar(10),r.eduedate,23) as eduedate, r.appcnt, " 							
		sql = sql & " convert(char(5), STUFF(STUFF(edustime+'00', 3, 0, ':'), 6, 0, ':'),108) as edustime, "
		sql = sql & " convert(char(5), STUFF(STUFF(eduetime+'00', 3, 0, ':'), 6, 0, ':'),108) as eduetime, "
		sql = sql & " case when edustime >= '1800' then '야간' else '주간' end edugubun, "
		sql = sql & " case  when r.crstatus = 'A' then '모집중' when r.crstatus = 'b' then '진행중' "
		sql = sql & " when r.crstatus = 'c' then '종료' when r.crstatus = 'd' then '사후관리종료' "
		sql = sql & " when r.crstatus = 'e' then '과정보류' end crstatus, r.isncs, s.sName "
		sql = sql & " FROM TBL_CourseReal r "
		sql = sql & " inner join TBL_AdminSchool s on r.scode = s.scode "
		sql = sql & " inner join TBL_CourseClass c on r.clscd = c.clscd "
		sql = sql & " inner join TBL_CourseDiv d on r.divcd = d.divcd "
		sql = sql & " WHERE crcd NOT IN (SELECT TOP((" & cpage & " - 1) * " & psize
		sql = sql & ") crcd FROM TBL_CourseReal r WHERE 1=1  " & whsql & " ORDER BY r.edusdate DESC) " & whsql & "  "
		sql = sql & " ORDER BY r.edusdate DESC"
		
		If ADMIN_CD = 1 Then 
			'Response.Write sql
			'Response.end
		END IF
			
		Set rs = adminDB.Execute(sql)
		If Not rs.EOF Then			
			Dim tmpArray
			Dim arrCourseList()
			i = 0
			do until rs.eof
				ReDim Preserve arrCourseList(i) 
				Set tmpArray = New CourseList
				tmpArray.Crcd				= rs("crcd")
				tmpArray.Crtitle			= rs("crtitle")
				tmpArray.Crinning			= rs("crinning")
				tmpArray.Clscd				= rs("clscd")
				tmpArray.ClsName			= rs("clsname")
				tmpArray.Divcd				= rs("divcd")
				tmpArray.DivName			= rs("divname")
				tmpArray.Edusdate			= rs("edusdate")
				tmpArray.Eduedate			= rs("eduedate")
				tmpArray.Edustime			= rs("edustime")
				tmpArray.Eduetime			= rs("eduetime")
				tmpArray.Edugubun			= rs("edugubun")
				tmpArray.Appcnt				= rs("appcnt")
				tmpArray.CrStatus			= rs("crstatus")
				tmpArray.IsNcs				= rs("isncs")
				tmpArray.SName				= rs("sName")
				tmpArray.LinkHead			= "<a href='" & self & args & "&mode=form&wtype=up&psize=" & psize & "&cpage=" & cpage & "&crcd=" & rs("crcd") & "'>"
				tmpArray.LinkTail			= "</a>"
				Set arrCourseList(i) = tmpArray
				  i = i + 1
			 		rs.movenext
			loop
		Else
			arrCourseList = NULL
		END IF
		rs.Close
        Set rs = nothing
		getCourseList = arrCourseList
	END Function
	
	public Function getCourseView(admincd, sYear, sMonth)

		sql = "select rtrim(r.crcd) as crcd, r.crtitle +' ' +convert(varchar,r.crinning) +'회차' as title"	
		sql = sql & " from TBL_CourseReal r inner join TBL_Adminlist a "
		sql = sql & " on  a.admincd = '" & admincd & "' "
		'sql = sql & " on  a.admincd = '13' "
		sql = sql & " where (convert(varchar(6) , r.edusdate,112) <= '" & sYear & getCipher(sMonth, 2)  & "' "
		sql = sql & " and convert(varchar(6) , r.eduedate,112) >= '" & sYear & getCipher(sMonth, 2) & "') "
		sql = sql & " and a.scode like  '" & ADMIN_SCODE & "%' "
		sql = sql & " and r.scode = a.scode "
		sql = sql & " and r.crstatus != 'E' "
		sql = sql & " and (r.teacher = '" & admincd  & "' or charindex('[" & admincd & "]',r.teacherGroup) >= 1)" 
		'sql = sql & " and (r.teacher = '13' or charindex('[13]',r.teacherGroup) >= 1)" 
		
		'Response.Write sql
			
		Set rs = adminDB.Execute(sql)
		If Not rs.EOF Then			
			Dim tmpArray
			Dim arrCourseList()
			i = 0
			do until rs.eof
				ReDim Preserve arrCourseList(i) 
				Set tmpArray = New CourseList
				tmpArray.Crcd			= rs("crcd")
				tmpArray.Title			= rs("title")
				Set arrCourseList(i) = tmpArray
				  i = i + 1
			 		rs.movenext
			loop
		Else
			arrCourseList = NULL
		END IF
		rs.Close
        Set rs = nothing
		getCourseList = arrCourseList
	END Function
	
	public Function getListCnt(whsql)
	
		sql = "SELECT COUNT(crcd) recCount FROM " & mTable & " as r WHERE 1=1 " & whsql
		Set rs = adminDB.Execute(sql)
		getListCnt = rs("recCount")

	End Function 
END Class
%>