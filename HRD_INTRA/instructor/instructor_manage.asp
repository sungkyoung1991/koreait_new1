<!-- #include virtual="/_include/inchead.asp"-->
<!-- #include virtual="/_include/inc_calender.asp" -->
<!-- #include virtual="/instructor/head/instructor_proc.asp"-->
<!-- #include virtual="/instructor/head/instructor_form.asp"-->
<!-- #include virtual="/instructor/head/instructor_data.asp"-->
<!-- #include virtual="/instructor/instructor_db_exec.asp"-->
<%

If Not(chkPermission(mno, VIEW)) Then
	tmp = errPath(msg_nopermission, "/")
End If

Dim InstructorExec
Set InstructorExec = NEW InstructorDBExec

Dim AryDiv, AryCls, AryYear, ChkSchool

Dim AryWorkWeek, AryInstructor, ArySchool, AryCrcd, AryWorkDays
Dim overTime(7)
'추가 
Dim vType, week, IsPrincipal
Dim admincd

'강의일지 검토
Dim isStatus 

'강의일지 작성
Dim min_date, max_date

'과정 조회
Dim arrCurseList, getCourse2


' tbl_coursereal & tbl_courseclass
Dim clscd, divcd, crtitle, crinning, edusdate, eduedate, edustime, eduetime, edudays, eduhours, isimg, isncs, ncscd, occcd, edupay, govpay, selfpay, teacher, eduplace
Dim isview, crstatus, appcnt, isadtest, basictest, counseltest, educheck, testcnt, regdate, regadmin, lastupdate, lastupdater, clsname, divname

' tbl_cousencs, tbl_couseocccode, tbl_couseedubr, tbl_couseeduplace, tbl_cousetest
Dim ncscode, ncsname, occcode, occname, cebcd, cebname, cebpgnames, cepcd, cepname, ctcd, ctname, ctmethod

Dim isCopy, copycd, copyCls, kind, realcnt, dropcnt, eajobcnt, curcnt, enrollper, recrper, uncompcnt, crtitle2
Dim compcnt, compcnt2, jobcnt, jobcnt2, compper, jobper, jobper2, jobper3, schsdate, schedate, rst2
Dim teacherGroup, teacherGroupArray, teacherArray


' 강의일지 작성
Dim arrCrcd, arrIDList
Dim sub_sql,  isSubmit, isAgree, isSubmit_tx, isAgree_tx, submit_idx, agree_date, submit_date
Dim crcd, stime, etime, hours, bigo, tmp_wdate
DIm id_idx, li_list, adcd, adname, strEnabled, wdate_type
Dim arrStatus, arrUserList


'강의일지 조회용
Dim sum, p
Dim sql_Days, nDay
'캘린더 
Dim nowDay, nowDate, nowMonth, nowYear, NowWeek
Dim tmpDate, tmpMonth, tmpYear, tmpDay, tmpDateSplit
Dim firstDay, firstDayFlag, dates, today, hday
Dim py, pm, pd, ny, nm, nd
Dim showprev, shownext, btn_prev, btn_next
Dim days, months, days_color, days_bg
Dim gPathinfo : gPathinfo = Request.ServerVariables("PATH_INFO")
Dim cW, dH
Dim style, tb_event, tb_onclick

Dim l_submit_tx
'---------------------------------------------------------------------------
' 사용자 정의 값 // 추가, 수정, 삭제 가능
'---------------------------------------------------------------------------
'요일, 글자색, 배경색
days = Array("0", "일", "월", "화", "수", "목", "금", "토")
days_color = Array("0", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF")
days_bg = Array("0", "#ffcc00", "#A9CFEC", "#A9CFEC", "#A9CFEC", "#A9CFEC", "#A9CFEC", "#BBB")

'월 표시문구
months = Array("0", "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월")


'---------------------------------------------------------------------------
' 필수 설정 값
'---------------------------------------------------------------------------
NowDate = getQuery("wdate")
IF NowDate = "" Then
	NowDate = Request.form("wdate")
END IF
max_date =  Date()
If Not IsDate(NowDate) Then

	IF NowDate <> "" Then
		tmpDate = NowDate
		tmpDateSplit = split(tmpDate,"-")
		tmpDay = Day(DateSerial(tmpDateSplit(0), tmpDateSplit(1) + 1, 1 - 1))
		tmpDate = tmpDateSplit(0) & "-" & tmpDateSplit(1) & "-" & tmpDay
	END IF
	IF NOT IsDate(tmpDate) Then 
	
		NowDate = Date()	
	
	ELSE
		NowDate = tmpDate
	END IF
End If

NowYear = year(NowDate)
NowMonth = getCipher(month(NowDate),2)
NowDay = getCipher(day(NowDate),2)
NowWeek = Weekday(NowDate)
Dim MaxYear : MaxYear = year(Date())
Dim MinYear : MinYear = 2017

Dim wdate : wdate = NowYear & "-" & Right("00" & NowMonth,2) & "-" & Right("00" & NowDay,2)
Dim tDay, t2_class
Dim CalArray : CalArray = fn_CalMain(NowYear, NowMonth)
'이번달 1일의 요일구하기
firstDay  = WeekDay(DateSerial(nowYear,nowMonth,1)) - 1 ' 이번달 1일의 요일 1~7 일~토

'윤년일경우 2월달 29일까지표시
If nowYear Mod 4 <> 0 Then
	dates = Array(0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
Else
	dates = Array(0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
End If

'첫번째날 시작을 체크하기위한 값
firstDayFlag = 0

mode = getQuery("mode")
self = "instructor_manage.asp?mno=" & mno
tb = "TBL_Instructor_Diary"
width = "1000"
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=uft-8">
<%If mode <> "excel" Then%>
<link rel="stylesheet" href="./css/instructor.css" />
<%END IF%>

</head> 


<%
If mode <> "print" Then
%>
<body onLoad="window.resizeTo(500, 500);">
<%END IF%>
<%
If mode = "proc" Then
%>
<!--#include virtual="/instructor/instructor_proc.asp"-->
<%
ElseIf mode = "list" Then
%>
<!--#include virtual="/instructor/instructor_list.asp"-->
<%
ElseIf mode = "adlist" Then
%>
<!--#include virtual="/instructor/instructor_list_admin.asp"-->
<%
ElseIf mode = "form" Then
%>
<!--#include virtual="/instructor/instructor_form.asp"-->
<%
ElseIf mode = "alist" Then
%>
<!--#include virtual="/instructor/instructor_agree_list.asp"-->
<%
ElseIf mode = "aform" Then
%>
<!--#include virtual="/instructor/instructor_agree_form.asp"-->
<%
ElseIf mode = "print" Then
%>
<!--#include virtual="/instructor/instructor_print.asp"-->
<%
ElseIf mode = "lprint" Then
%>
<!--#include virtual="/instructor/instructor_list_print.asp"-->
<%
ElseIf mode = "excel" Then
%>
<!--#include virtual="/instructor/excel_attendance_record.asp"-->
<%
ElseIf mode = "form2" Then
%>
<!--#include virtual="/instructor/instructor_form_admin.asp"-->
<%
ElseIf mode = "aform2" Then
%>
<!--#include virtual="/instructor/admin_instructor_agree_form.asp"-->
<%
ElseIf mode = "week" Then 
%>
<!--#include virtual="/instructor/instructor_week.asp"-->
<%
ElseIf mode = "cweek" Then 
%>
<!--#include virtual="/instructor/instructor_crcd_week.asp"-->
<%
End If
%>


<script type="text/javascript">
 $(function() {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		//buttonImage: "/images/kr/create/btn_calendar.gif",
		buttonImageOnly: true,
		// showOn :"both",
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		duration:200,
		showAnim:'show',
		showMonthAfterYear: false
		// yearSuffix: '년'
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$( ".datepicker" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#eday" ).datepicker( "option", "minDate", selectedDate );
		}
	});
});

</script>
<%IF mode = "sam" Then %>
<script src="./js/instructor.js"></script>
<%END IF%>
</body>
</html>

<!--#include virtual="/_include/inctail.asp"-->
