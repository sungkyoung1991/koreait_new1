<!-- #include virtual="/inc/Service_Inc.inc" -->

<%
Function GetRegYear ()
	Dim regyearStr
	Dim YYYY : YYYY = Year(Date())
	Dim MMDD : MMDD = CDbl(right(Replace(Left(now(),10),"-",""),4))
	If MMDD > CDbl(REG_YEAR_LIMIT_1) Then
		If MMDD > CDbl(REG_YEAR_LIMIT_2) Then
			regyearStr = YYYY + 1

		Else
			regyearStr = YYYY + 1

		End If
	Else
		regyearStr = YYYY

	End If
	GetRegYear = regyearStr
END Function

'입력정보
Dim studentnum : studentnum = request("studentnum")
Dim name : name = XssFilter(request("name"))
'Dim idx : idx	= XssFilter(request("index"))
Dim regyear : regyear = GetRegYear()
name = Replace(name,"'","")
name = Replace(name,"""","")
Dim sql, db, rs
Dim regCost, CostType

SET db = Server.CreateObject("ADODB.Connection")
	db.Open CONNSTRING_WEB

Dim regyearChk  :regyearChk = GetSelectionDateArrayToStr(0)

'완납 분납 체크
sql = "Select config_value From TBL_SIteConfig where gubun = 'haksa' AND config_nm = 'regcost' "

set rs = db.execute(sql)

if NOT rs.bof or NOT rs.eof Then
	regCost = rs("config_value")
END IF

'IF idx = "" Then
'	idx = 0
'END IF
Dim tStr : tStr = ""
 sql = "exec TBL_Accepted_L @StudentNum='" & Trim(studentnum) & "' ,@name='" & Trim(name) & "', @regyear='" & regyear & "'"

' response.write SQL
' response.END

Set rs = db.execute(sql)
If rs.EOF Then
	tStr = "학생의 작성 완료된 원서가 없습니다.\n다시한번 확인하시고 원서를 작성해 주시기 바랍니다.\n감사합니다."
	result = 1
Else
	name 				= rs("name")
	Dim interviewresult 	: interviewresult 	= rs("interviewresult")
	Dim	regcostsdate 		: regcostsdate 		= rs("regcostsdate")
	Dim	regcostedate  		: regcostedate 		= rs("regcostedate")
	Dim	part1 				: part1 			= rs("part1")
	Dim	course1  			: course1 			= rs("course1")
	Dim	interviewdate 		: interviewdate 	= rs("interviewdate")
	Dim	regcoststatus  		: regcoststatus 	= rs("regcoststatus")
	Dim	regcostdate  		: regcostdate 		= rs("regcostdate")
	Dim	inpMoney  			: inpMoney 			= rs("inpMoney")
		regyear		= rs("regyear")
	 	result			= rs("result")
	IF idx = 0 Then   '합격자 조회
		If interviewresult = "미발표" Or (interviewresult = "합격" And regcostsdate = "") then
			If interviewresult = "합격" And regcostsdate = "" Then
				tStr = "학생은 합격여부를 심사중입니다.\n"
				tStr = tStr & "다른문의사항은 입학처(02-578-5551)로 연학주시기바랍니다.\n감사합니다."
			Else
				'<!-- 명단에 없을경우 -->
				tStr = "" & name & "학생은 면접예정자입니다.\n"
				tStr = "다른문의사항은 입학처(02-578-5551)로 연학주시기바랍니다\n감사합니다."
			End If
		ElseIf interviewresult = "합격" And regcostsdate <> "" And regcostedate <> "" Then
			  'KOREA_IT_STUDENT_RESERVE_MONEY	150만원
			  'KOREA_IT_STUDENT_TOTAL_MONEY	450만원
			  tStr = "합격을 축하 드립니다.\n"
			  tStr = tStr & "" & name & "학생은 " & part1 & "" & course1 & "에 합격하셨습니다.\n"
			  tStr = tStr & ""

			  IF regcoststatus = "미납" Then
				  IF CSTR(regyear) = regyearChk Then
					IF STRCOMP(regCost,"완납") = 0 Then
						CostType = "등록금"
						regViewMoney3 = KOREA_IT_STUDENT_TOTAL_MONEY
					  Else
					  	CostType = "분납금"
						regViewMoney3 = KOREA_IT_STUDENT_RESERVE_MONEY
					END IF
				  Else
					 CostType = "등록금"
					 regViewMoney3 = KOREA_IT_STUDENT_TOTAL_MONEY
				  END IF
			  ElseIF regcoststatus = "분납" Then
			  	CostType = "분납금"
			  	IF CSTR(regyear) = regyearChk Then
					IF STRCOMP(regCost,"완납") = 0 Then
						regViewMoney1 = KOREA_IT_STUDENT_TOTAL_MONEY
						regViewMoney2 = inpMoney
						regViewMoney3 = CDbl(regViewMoney1) - CDbl(regViewMoney2)

					Else
						regViewMoney3 = KOREA_IT_STUDENT_RESERVE_MONEY
					END IF
				Else
					regViewMoney1 = KOREA_IT_STUDENT_TOTAL_MONEY
					regViewMoney2 = inpMoney
					regViewMoney3 = CDbl(regViewMoney1) - CDbl(regViewMoney2)
				END IF
			  END IF
			  ' tStr = tStr & "" & name & "학생이 납부하셔야 할 " & CostType & "은 " & FormatNumber(regViewMoney3,0) & "원 이며\n"
				tStr = tStr & "" & name & "학생이 납부하셔야 할 완납 4,500,000은 " & FormatNumber(regViewMoney3,0) & "원 이며\n"
'			  tStr = tStr & "<strong class='blue'>" & name & "학생이 납부하셔야 할 납부금은 <b class='blue'> 4,100,000</b>원 이며<br />"
			  tStr = tStr & "" & regcostsdate & " ~ " & regcostedate & " 까지 아래에 있는 계좌로 입금 하시면 됩니다."
			  tStr = tStr & ""
			  tStr = tStr & ""
			  tStr = tStr & "\n\n계좌번호\n"
			  tStr = tStr & ""
			  tStr = tStr & ""
			  tStr = tStr & "" & KOREA_IT_BANK1_NUMBER & " (" & KOREA_IT_BANK1_NAME & ")\n"

			  If Len(KOREA_IT_BANK2_NUMBER) >= 1 Then
				  tStr = tStr & "" & KOREA_IT_BANK2_NUMBER & " (" & KOREA_IT_BANK2_NAME & ")\n\n"
			  End If


			  ' tStr = tStr & "예금주\n" & KOREA_IT_BANK1_PERSON & "\n\n"
				 tStr = tStr & "예금주\n 한국IT교육재단 \n\n"
			  tStr = tStr & "다시 한번 합격을 진심으로 축하 드립니다. 감사합니다.\n"
		  '==========================================예비합격=======================================================
		  ElseIf interviewresult = "예비합격" Then
			  tStr = "" & name & "학생은 예비합격자 대상자입니다.\n"
			  tStr = tStr & "현재 담당 학부에서 합격유무를 검토중입니다.\n합격생발표는 개별통보 드리도록 하겠습니다.\n감사합니다."
		  '==========================================불합격=======================================================
		  ElseIf interviewresult = "불합격" Then
			  tStr = "" & name & "학생은 아쉽게도 합격자 명단에 성함이 없습니다.\n"
			  'tStr = tStr & "추후진행되는 전형에 다른스쿨로의 재지원이 가능합니다.\n감사합니다."
		  End If
	Else  '등록금 납부확인

		If regcoststatus = "미납" And interviewresult <> "불합격" Then '미등록일경우
			If interviewresult = "미발표" Then
				tStr = "" & name & "학생은 면접예정자입니다.\n"
				tStr = tStr & "등록금 납입후에 확인이 가능 합니다."
			ElseIf interviewresult = "합격" And regcostsdate = "" Then
				tStr = "" & name & "학생은 합격여부를 심사중입니다.\n"
				tStr = tStr & "등록금 납입후에 확인이 가능 합니다."
			Else
				tStr = "등록금 납부현황\n"
				tStr = tStr & "등록금 납부현황: 납부상태, 등록금, 비고 를 제공합니다.\n"
				'tStr = tStr & "등록금" & FormatNumber(KOREA_IT_STUDENT_TOTAL_MONEY,0) & "원"

				tStr = tStr & "등록금" & FormatNumber(KOREA_IT_STUDENT_RESERVE_MONEY,0) & "원\n"
				tStr = tStr & "비고등록금 납부시 보내는 분의 성함을\n지원자명, 보호자1, 보호자2의 성함으로 적어주시기 바랍니다.\n"
			END IF
		ElseIf regcoststatus = "분납"  And regcostdate <> "" Then

			regViewMoney1 = KOREA_IT_STUDENT_TOTAL_MONEY
			regViewMoney2 = inpMoney
			regViewMoney3 = CDbl(regViewMoney1) - CDbl(regViewMoney2)

			tStr = "등록금 납부현황\n"
			tStr = tStr & "등록금 납부현황: 납부상태, 등록금, 비고 를 제공합니다.\n"

		ElseIf regcoststatus = "완납"  And regcostdate <> "" Then

			tStr = "등록금 납부현황\n"
			tStr = tStr & "등록금 납부현황: 납부상태, 등록금, 비고 를 제공합니다.\n"
			tStr = tStr & "납부상태완납\n"
			tStr = tStr & "비고등록금 납부가 완료되었습니다."
			tStr = tStr & ""
		ElseIf interviewresult = "불합격"  Then
			tStr = "" & name & "학생은 등록금 납부 대상자가 아닙니다.\n감사합니다.\n"
		Else
			tStr = tStr & " 문의사항은 입시홍보실 (02-578-5551)에 문의하시기 바랍니다."
		End If


	End If

END IF
%>
<script>
		var obj = {"result" : "<%=result%>", "result_msg" : "<%=tStr%>"};

		alert("<%=tStr%>");

		/*result_Accepted(obj);*/
/*	function result_Accepted(obj){
		var Accepted = obj;

		$("div.accepted_t > ul > li").css("display", "none");
		$("div.accepted_t > ul > li").eq(2).css("display", "block");
		$("div.accepted_t > ul > li > div.ci_wrap").get(2).innerHTML= Accepted["result_msg"];

		$("form[name=theForm]")[0].reset();
		$("form[name=theForm]")[1].reset();
	}*/
</script>
<%
Set rs = nothing
Response.end
%>
