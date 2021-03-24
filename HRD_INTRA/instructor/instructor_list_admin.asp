<%
	crcd = getQuery("crcd")
    adcd = getQuery("id")
	IF ADMIN_CD = 1 OR ADMIN_CD = 20 Then
		wdate_type = "form2"
	Else
		wdate_type = "aform"
	End IF
	wdate_type = "aform"
	If crcd <> "" Then
		sub_sql = " and d.crcd = '" & crcd & "' "
	END IF

	FOR i = 1 to 31
    	IF Day(DateSerial(NowYear, NowMonth + 1, 1 - 1)) > i Then
			sql_Days = sql_Days  & "[day_" & i & "], "
		ElseIF  Day(DateSerial(NowYear, NowMonth + 1, 1 - 1)) = i Then
			sql_Days = sql_Days  & "[day_" & i & "]"
		END IF
	NEXT

	sql = "select rtrim(crcd) as crcd, crtitle +' ' +convert(varchar,crinning) +'회차' as title "
	sql = sql & " from TBL_CourseReal r where convert(varchar(6),edusdate,112) <= '"& NowYear & getCipher(NowMonth, 2) &"' "
	sql = sql & " and convert(varchar(6),eduedate,112) >= '"& NowYear & getCipher(NowMonth, 2) &"' "
	sql = sql & " and crstatus != 'E' and r.scode like '" & ADMIN_SCODE & "%'"

	Set rs = adminDB.Execute(sql)
	If Not rs.EOF Then
		arrCrcd = rs.getrows()
	END IF

	sql = "select ROW_NUMBER() over(order by crcd, admincd asc) as num, * "
	sql = sql & " from (select  d.admincd, al.adminname, d.crcd, d2.rowspan, r.crtitle +' ' +convert(varchar,r.crinning) +'회차' as title, "
	sql = sql & " SUBSTRING(convert(varchar(10),r.edusdate,102),3,10) + ' ~ '+ "
	sql = sql & " SUBSTRING(convert(varchar(10),r.eduedate,102),3,10) as edudate, "
	sql = sql & " ('day_'+ convert(varchar,DATEPART (day, d.date))) as date, d.hours "
	sql = sql & " from TBL_Instructor_Diary d "
	sql = sql & " inner join TBL_CourseReal r on d.crcd = r.crcd "
	sql = sql & " inner join TBL_AdminList AL on d.admincd = al.admincd  "
	sql = sql & " inner join ( select row_number() over (order by crcd asc) as id, count (crcd) as rowspan, crcd from ( "
	sql = sql & " select distinct admincd, crcd from TBL_Instructor_Diary where convert(varchar(6), date,112) = '"& NowYear & getCipher(NowMonth, 2) & "' "
	sql = sql & " group by admincd, crcd) as dcnt group by crcd ) as d2 on  d.crcd = d2.crcd "
	sql = sql & " where convert(varchar(6),d.date,112) =  '"& NowYear & getCipher(NowMonth, 2) & "' "
	sql = sql & " and d.admincd like ( case when '" & adcd & "' = '' then '%' else '" & adcd & "' END ) "
	sql = sql & " and d.scode like '"& ADMIN_SCODE &"%'" & sub_sql & ") A "
	sql = sql & " PIVOT ( sum(A.hours) FOR date IN (" & sql_Days & ") ) pv "

	IF ADMIN_CD = 1 Then
	'	Response.Write sql
	' Response.End
	END IF
	Set rs = adminDB.Execute(sql)
	If Not rs.EOF Then
		arrIDList = rs.getrows()
	END IF

	arrUserList = getUserList()
%>
<style>
.list_calender {
	text-align:center;
}
small {
	font-size:10px;
}
.red { color:red }
.blue { color:blue }
</style>
<script>
	function setWdate(){

		var year = document.getElementsByName("year").item(0).value;
		var month = document.getElementsByName("month").item(0).value;
		//var day =  date.getDate();
		var wdate = year + "-" + month + "-" + <%=NowDay%>;

		document.location.href="<%=self%>&mode=adlist&wdate="+wdate;
	}

	function setCrcd(crcd){

			document.location.href="<%=self%>&mode=adlist&wdate=<%=NowDate%>&crcd="+crcd;
	}

	function setUser(user){
		var user = user;
		document.location.href="<%=self%>&mode=adlist&wdate=<%=NowDate%>&crcd=<%=crcd%>&id="+user;
	}
</script>

<table width="<%=width%>" border="0" cellspacing="1" cellpadding="3" bgcolor="<%=fptbg%>">
<tr height="40"><td style="color:<%=fptfg%>; font-size:11pt; font-weight:bold;">&nbsp;:: 강의일지 조회 </td>
        <td style="float:right;">
        	<form target="_blank" action="?mno=<%=mno%>&mode=excel&wdate=<%=wdate%>" method="post">
            <%IF ADMIN_SCODE = "0" THEN %>
            	<a href="?mode=lprint&wdate=<%=wdate%>" >출력</a>
                <input type="submit" value="출력">
            <%END IF%>
            	<input type="submit" class="btn" value="엑셀 저장">
                <input type="hidden" name="crcd" value="<%=crcd%>">
            </form>
        </td>
        </tr>
</table>

<table width="<%=width%>" border="0" cellspacing="1" cellpadding="3" bgcolor="<%=lsbg%>">
	<tr>
    	<td>
        	<select name="year" onChange="setWdate();">
            <%For i = 2017 to Cint(NowYear) %>
            <option value="<%=i%>" <%IF NowYear = i Then%> selected <% END IF %>><%=i%>년</option>
            <% NEXT %>
            </select>
            <select name ="month" onChange="setWdate();">
            <% FOR i = 0 to UBound(MonthList) %>
            <option value="<%=MonthList(i)%>" <% IF cstr(NowMonth) = MonthList(i) Then%> selected <%END IF%>><%=i+1%>월</option>
            <% NEXT %>
            </select>
        </td>
    	<td>
        	<select name="crcd" onChange="setCrcd(this.value);"><option value="">교육과정</option>

            		<%
						IF isArrsyNullChk(arrCrcd) <> "NULL" THEN
							for i = 0 to Ubound(arrCrcd,2)
						 %>
                    	<option value="<%=arrCrcd(0,i)%>" <%IF arrCrcd(0,i) = crcd Then %> selected <%END IF%> ><%=arrCrcd(1,i)%></option>
                    <%
						Next
						END IF
					%>
            </select>
        </td>
        <td>
        	<select name="adcd" onChange="setUser(this.value)" >
            	<option value="">전임/시간 강사</option>
                <%
					IF isArrsyNullChk(arrUserList) <> "NULL" Then
						For i = 0 To UBound(arrUserList, 2)
				%>
            			<option value="<%=arrUserList(0,i)%>" <%IF adcd = CStr(arrUserList(0,i)) Then %>selected <%END IF%> ><%=arrUserList(1,i)%></option>
                <%
						Next
					END IF
				%>
            </select>

        </td>

	</tr>
</table>
<div style="width:<%=width%>px; text-align:center;"><h2> <%=NowYear & "년 " & NowMonth%> 월 교강사 출강부</h2></div>

<table class="list_calender"width="<%=width%>" border="1" cellspacing="1" cellpadding="0">
	<tbody>
    	<tr>
        	<td width="110px;" rowspan="3">
            	회차 / <br>
                훈련과정
            </td>
            <td width="80px;" rowspan="2">
            	실직자/<br>재직자
            </td>
            <td width="710px" colspan="32">
            	한국IT 아카데미
            </td>
        </tr>
        <tr>
        	<% FOR i = 1 to 32 %>
            	<% IF i = 32 Then%>
            		<td width="25px" rowspan="2">합계</td>
                	<% Else %>
                    	<% IF Day(DateSerial(NowYear, NowMonth + 1, 1 - 1)) >= i Then %>
							<% IF weekday(NowYear&"-"&NowMonth&"-"&i) = 1 Then %>
                            <td width="20px;" style="color:red; background:#EAEAEA;"><%=days(weekday(NowYear&"-"&NowMonth&"-"&i))%></td>
                            <% ELSEIF weekday(NowYear&"-"&NowMonth&"-"&i) = 7 Then %>
                            <td width="20px;" style="color:blue; background:#EAEAEA;"><%=days(weekday(NowYear&"-"&NowMonth&"-"&i))%></td>
                            <% ELSE %>
                            <td width="20px;" style=""><%=days(weekday(NowYear&"-"&NowMonth&"-"&i))%></td>
                            <% END IF%>
                         <%ELSE%>
                           <td width="20px;" style="background:#EAEAEA;"> </td>
                        <%END IF%>
                <%End IF%>
            <%NEXT%>
        </tr>
    	<tr>
        	<td>
            	교강사명
            </td>
            <% FOR i = 1 to 32-1 %>
            	<% IF Day(DateSerial(NowYear, NowMonth + 1, 1 - 1)) >= i Then %>
					<% IF weekday(NowYear&"-"&NowMonth&"-"&i) = 1 THen %>
                    <td style="color:red; background:#EAEAEA;"><%=i%></td>
                    <% ELSEIF weekday(NowYear&"-"&NowMonth&"-"&i) = 7 Then %>
                    <td  style="color:blue; background:#EAEAEA;"><%=i%></td>
                    <% ELSE %>
                    <td style=""><%=i%></td>
                    <% END IF%>
                <%ELSE%>
                   <td width="20px;" style="background:#EAEAEA;"> </td>
                <%END IF%>
            <%NEXT%>
        </tr>

        <%

			IF isArrsyNullChk(arrIDList) <> "NULL" THEN

				id_idx = 0
				for i = 0 to UBound(arrIDList,2)
					sum = 0
					IF i = 0 OR arrIDList(3,i) <> arrIDList(3,id_idx) Then
						Response.Write "<tr>"
						IF adcd = "" Then
						Response.Write "<td rowspan="&arrIDList(4,i)&">" & arrIDList(5,i) & "<br><small> " & arrIDList(6,i) & "</small> </td>"
						Else
						Response.Write "<td>" & arrIDList(5,i) & "<br><small> " & arrIDList(6,i) & "</small> </td>"
						END IF
						Response.Write "<td><a href='"&self&"&mode="& wdate_type &"&wdate="&wdate&"&id="& arrIDList(1,i) &"'>" & arrIDList(2,i) & "</a></td>"
						id_idx = i
					Else
						Response.Write "<tr>"
						Response.Write "<td><a href='"&self&"&mode="&wdate_type&"&wdate="&wdate&"&id="& arrIDList(1,i) &"'>" & arrIDList(2,i)&"</a></td>"
					END IF
					For j = 1 to 32
						IF Day(DateSerial(NowYear, NowMonth + 1, 1 - 1)) >= j Then
							nDay = j + 6
							IF arrIDList(nDay,i) > 0 Then
								sum = sum + Cint(arrIDList(nDay,i))
							END IF

							IF weekday(NowYear&"-"&NowMonth&"-"&j) = 1 Then
								Response.Write "<td style='color:red; background:#EAEAEA;'>" & arrIDList(nDay,i) & "</td>"
							ELSEIF weekday(NowYear&"-"&NowMonth&"-"&j) = 7 Then
								Response.Write "<td style='color:blue; background:#EAEAEA;'>" & arrIDList(nDay,i) & "</td>"
							ELSE
								Response.Write "<td>" & arrIDList(nDay,i) & "</td>"
							END IF

						ElseIF j = 32 Then
							Response.Write "<td>" & sum &"</td>"
						ELse
							Response.Write "<td style='background:#EAEAEA;'> </td>"
						End IF
					Next
				Next

			END IF
		%>
    </tbody>
</table>
<div style="padding:30px;"></div>
