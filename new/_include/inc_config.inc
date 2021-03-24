<%
'캡차
function TestCaptcha(byval valSession, byval valCaptcha)
	Dim tmpSession
	valSession = Trim(valSession)
	valCaptcha = Trim(valCaptcha)
	If (valSession = vbNullString) or (valCaptcha = vbNullString) Then
		TestCaptcha = false
	Else
		tmpSession = valSession
		valSession = Trim(Session(valSession))
		Session(tmpSession) = vbNullString
		If valSession = vbNullString Then
			TestCaptcha = false
		Else
			valCaptcha = Replace(valCaptcha,"i","I")
			If StrComp(valSession,valCaptcha,1) = 0 Then
				TestCaptcha = true
			Else
				TestCaptcha = false
			End If
		End If 
	End If
End Function

Function CheckWord(CheckValue)
	CheckValue = replace(CheckValue, "&lt;", "<")
	CheckValue = replace(CheckValue, "&gt;", ">")
	CheckValue = replace(CheckValue, "&quot;","'")
	CheckValue = replace(CheckValue, "&amp;", "&" )
	CheckWord = Trim(CheckValue)
End Function

''' 리스트 목록 가져오기
FUNCTION GetRowsQueryArray(ByVal SQL)
	On Error Resume Next

	Dim ConnStr : ConnStr = CONNSTRING_WEB
	If Len(ConnStr) = 0 Then ConnStr = takedriver
	If Len(ConnStr) = 0 Then ConnStr = dh_koreait
	If Len(ConnStr) = 0 Or Len(SQL) = 0 Then
		GetRowsQueryArray = Null : Exit Function
	End If

	Dim arrRs : arrRs = Null
	Dim db : SET db = Server.CreateObject("ADODB.Connection") : db.Open ConnStr
	Dim rs : Set rs = db.execute(sql) : If Not Rs.Eof Then arrRs = rs.getrows()
	SET rs = Nothing : db.Close : SET db = nothing

	GetRowsQueryArray = arrRs
End Function

'Menu List - 2016.08.12
' 0 : ID, SEQ_NO, TITLE, URL, TARGET, CATEGORY0, CATEGORY1, CATEGORY2 [7]
Const GLOBAL_CATEGORY_INDATE = 20160816
Function GetGlobalCategoryToArray()

	If IsArray(Application.Contents("GLOBAL_CATEGORY3")) And StrComp(Application.Contents("GLOBAL_CATEGORY3_INDATE"),GLOBAL_CATEGORY_INDATE) = 0 Then
		GetGlobalCategoryToArray = Application.Contents("GLOBAL_CATEGORY3")
		Exit function
	End If

	Dim sql : sql = "Select ID, SEQ_NO, TITLE, URL, TARGET, CATEGORY0, CATEGORY1, CATEGORY2 FROM GLOBAL_CATEGORY3 where USE_CH='1' And CATEGORY2=''  order by CATEGORY0, CATEGORY1, sLevel, SEQ_NO "
	Dim arrRs : arrRs = GetRowsQueryArray(sql)

	Application.Lock
	Application.Contents("GLOBAL_CATEGORY3") = arrRs
	Application.Contents("GLOBAL_CATEGORY3_INDATE") = GLOBAL_CATEGORY_INDATE
	Application.Unlock

	GetGlobalCategoryToArray = arrRs
End Function

'원서접수일정 ( 0:년도, 1:일정[L], 2:일정[S] ) - 2016.08.19
Function GetSelectionDateArrayToStr(ByVal Set_Type)

	If IsArray(Application.Contents("SelectionDate_Array")) And IsDate(Application.Contents("SelectionDate_Now")) Then
		If DatePart("h",Application.Contents("SelectionDate_Now")) = DatePart("h",Now()) Then
			GetSelectionDateArrayToStr = unescape(Application.Contents("SelectionDate_Array")(Set_Type))
			Exit Function
		End If
	End If

	Dim tArray(2)
	Dim YYYY : YYYY = Year(Date())
	Dim MM : MM = Month(Date())
	Dim DD : DD = Day(Date())
	Dim MMDD : MMDD = CInt(MM) * 100 + CInt(DD)

	If MMDD > CDbl(REG_YEAR_LIMIT) Then
		Study_year = Cstr(YYYY+1)
	Else
		Study_year = Cstr(YYYY)
	End If

	tArray(0) = Study_year
	tArray(1) = ""
	tArray(2) = ""

	Dim FD, TD, From_Date, To_Date
	Dim From_Date1, To_Date1, From_Date2, To_Date2
	Dim From_To1, From_To2

	Dim sql : sql = "Select Top 1 Study_year, From_Date, To_Date from Selection where convert(varchar(10), Getdate(),120) between From_Date and To_Date Order By idx Asc"
	Dim arrRs : arrRs = GetRowsQueryArray(sql)

	If IsArray(arrRs) Then
		Study_year = arrRs(0,0)
		From_Date = arrRs(1,0)
		To_Date = arrRs(2,0)

		FD = split(From_Date,"-")
		TD = split(To_Date,"-")

		From_Date1 =  Cint(FD(1)) &"M " & Cint(FD(2)) & "D"
		From_Date2 =  Cint(FD(1)) & "." & Right("0" & Cint(FD(2)),2)

		If FD(0) <> TD(0) Then
			To_Date1 =  TD(0) & "Y "& Cint(TD(1)) & "M " & Cint(TD(2)) & "D"		
			To_Date2 =  TD(0) & "." & Cint(TD(1)) & "." & Right("0" & Cint(TD(2)),2)
		Else
			To_Date1 =  Cint(TD(1)) & "M " & Cint(TD(2)) & "D"		
			To_Date2 =  Cint(TD(1)) & "." & Right("0" & Cint(TD(2)),2)
		End If

		From_To1 = From_Date1 &" ~ "& To_Date1
		From_To2 = From_Date2 &"~"& To_Date2

		'임시 줄임 - 2017.02.23
		If CDbl(FormatCheckNumZero(Date())) >= 20170225 And CDbl(FormatCheckNumZero(Date())) <= 20170305 Then
			From_To1 = " ~ " & To_Date1
			From_To2 = " ~ " & To_Date2
		End If

		tArray(0) = escape(Study_year)
		tArray(1) = escape(From_To1)
		tArray(2) = escape(From_To2)

		Application.Lock
		Application.Contents("SelectionDate_Array") = tArray
		Application.Contents("SelectionDate_Now") = Now()
		Application.Unlock
	End If

	GetSelectionDateArrayToStr = unescape(tArray(Set_Type))
End Function

'이메일 - 2016.08.12
email_list_array = Split("chol.com,dreamwiz.com,empal.com,hanmir.com,hanafos.com,hotmail.com,lycos.co.kr,nate.com,naver.com,daum.net,hanmail.net,netian.com,paran.com,yahoo.co.kr,gmail.com",",")

user_id = Request.Cookies("koreait")("user_id")
user_name = Request.Cookies("koreait")("user_name")
user_email = Request.Cookies("koreait")("user_email")
user_prestudy_ck = Request.Cookies("koreait")("user_prestudy_ck")
If user_id <> ""  Then
	login_chk="_logout"
End if

template_directory="/new"
If page="main" Then
	'header_logo="main_"
	category_bg="main_bg"
End If

' 2016.08.12 현재
'1	학교소개
'2	PRIDE IT
'3	학교생활
'4	학사안내
'5	학생서비스
'6	계열소개
'7	입학안내
'9	JOIN US
Select Case CStr(category)
	Case "1" : category_bg="about_us"
	Case "2" : category_bg="pride_it"
	Case "3" : category_bg="working_intro"
	Case "4" : category_bg="edu_intro"
	Case "5" : category_bg="stu_service"
	Case "6" : category_bg="community"
	Case "7" : category_bg="school"
	Case "8" : category_bg="ad_lead"
	Case "9" : category_bg="mypage"
End Select

'등록금 총액
Const KOREA_IT_STUDENT_TOTAL_MONEY = 3980000

'은행계좌#1
Const KOREA_IT_BANK1_NAME = "우리은행"
Const KOREA_IT_BANK1_NUMBER = "641-028873-13-101"
Const KOREA_IT_BANK1_PERSON = "(재)다산인재개발원"
'은행계좌#2
Const KOREA_IT_BANK2_NAME = "KEB하나은행"
Const KOREA_IT_BANK2_NUMBER = "630-006752-196"
Const KOREA_IT_BANK2_PERSON = "(재)다산인재개발원"

'다음 학년구분 기준일(모집기준)
'Dim REG_YEAR_LIMIT : REG_YEAR_LIMIT = 229
Dim REG_YEAR_LIMIT : REG_YEAR_LIMIT = 305

'다음 학년구분 기준일(모집기준 - 원서조회기준 중복기간)
Dim REG_YEAR_LIMIT_1 : REG_YEAR_LIMIT_1 = 220
Dim REG_YEAR_LIMIT_2 : REG_YEAR_LIMIT_2 = 314
%>