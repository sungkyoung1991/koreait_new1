<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->

<!--2020-->
<!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->
<!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->

<!-- #include virtual="/inc/2017/subHeader.asp" -->


<%
'원서접수 일자
Function GetSelectionDateAry(ByVal sch, ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

'	sql = " HAkSA_원서접수일정_조회_L @mode='" & sch & "', @type='" & Set_type & "' "
	sql = " HAkSA_원서접수일정_조회_L @mode='test2', @type='" & Set_type & "' "
	'Response.Write sql
	GetSelectionDateAry = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

'Dim ArySelection : ArySelection = GetSelectionDateAry("test", 102)
ArySelection = GetSelectionDateAry("Selection", 102) 'sk

regyear = "2022"




IF isArray(ArySelection) Then
	IF regyear = "" Then
		regyear = ArySelection(0).item("Study_year")
	END IF

	For i = 0 TO UBound(ArySelection)
		IF StrComp(ArySelection(i).item("Study_year"),regyear) = 0 Then
			interviewtype = ArySelection(i).item("selection")
			If Left(interviewtype,2)="수시" Then
				selection=Replace(interviewtype,"수시","예비")
			ElseIf Left(interviewtype,2)="정시" Then
				selection=Replace(interviewtype,"정시","")
			End If
			regtype = ArySelection(i).item("regtype")
		END IF
	NEXT

END IF



Dim addStr

' 0 : Pname, Course
'희망학과(part)
Function GetPartListToArray(ByVal regyear)
	Dim SQL : SQL = "select distinct replace(Pname,'스쿨', '계열') as Pname , Course, c.Study_year "
	sql = sql & " from dbo.ClassName c "
	Sql = sql & " inner join Selection s "
	'sql = sql & " on convert(char(10),getdate(),23) between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	'sql = sql & " on convert(char(10),getdate(),23) between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	sql = sql & " on '" & regyear & "-01-01' between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	sql = sql & " where scode='5' and Status='1' order by Course"



	Dim db : SET db = Server.CreateObject("ADODB.Connection")
	db.Open takedriver

	Dim rs : Set rs = db.execute(sql)
	If Not Rs.Eof Then
		arrRs = rs.getrows()
	Else
		arrRs = Null
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	GetPartListToArray = arrRs
End Function

'희망학과(part)
Function GetPartListToArray2(ByVal regyear)
	Dim SQL : SQL = "select distinct replace(Pname,'스쿨', '계열') as Pname , Course, c.Study_year "
	sql = sql & " from dbo.ClassName c "
	Sql = sql & " inner join Selection s "
	sql = sql & " on '2021-01-01' between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	sql = sql & " where scode='5' and Status='1' order by Course"

	Dim db : SET db = Server.CreateObject("ADODB.Connection")
	db.Open takedriver

	Dim rs : Set rs = db.execute(sql)
	If Not Rs.Eof Then
		arrRs = rs.getrows()
	Else
		arrRs = Null
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	GetPartListToArray2 = arrRs
End Function

Dim ddate,dd1,dd2,dd3
ddate = date()
dd1 = split(ddate,"-")(0)'연
dd2 = split(ddate,"-")(1)'월
dd3 = split(ddate,"-")(2)'일

' 0 : PName, Hname
'희망학과(Course)
Function GetCourseListToArray(ByVal regyear)
	Dim SQL : SQL = "select replace(Pname,'스쿨', '계열') as Pname, Hname, c.Study_year "
	sql = sql & " from ClassName c "
	Sql = sql & " inner join Selection s "
	sql = sql & " on '" & regyear & "-01-01'" & " between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	sql = sql & " where scode='5' and Status='1' Order by orderby"

	Dim db : SET db = Server.CreateObject("ADODB.Connection")
	db.Open takedriver

	Dim rs : Set rs = db.execute(sql)
	If Not Rs.Eof Then
		arrRs = rs.getrows()
	Else
		arrRs = Null
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	GetCourseListToArray = arrRs
End Function

'희망학과(Course)
Function GetCourseListToArray2(ByVal regyear)
	Dim SQL : SQL = "select replace(Pname,'스쿨', '계열') as Pname, Hname, c.Study_year "
	sql = sql & " from ClassName c "
	Sql = sql & " inner join Selection s "
	sql = sql & " on '2021-01-01'" & " between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	sql = sql & " where scode='5' and Status='1' Order by orderby"

'	Response.Write sql


	Dim db : SET db = Server.CreateObject("ADODB.Connection")
	db.Open takedriver

	Dim rs : Set rs = db.execute(sql)
	If Not Rs.Eof Then
		arrRs = rs.getrows()
	Else
		arrRs = Null
	End If

	SET rs = nothing
	db.Close
	SET db = nothing

	GetCourseListToArray2 = arrRs
End Function

%>


<script language="javascript" type="text/javascript">
<!--
function FocusMov(nextField,Ilength,value) {
   	if (value.length >= Ilength) {
   		obj = eval("document.theForm." + nextField);
   		obj.focus();
   	}
	//}
}

function Shift() {
	if (document.theForm.jumin1.value.length >= 6) {
		docuement.theForm.jumin2.focus();
		return;
	}
}

function onlyNumber(e) {
	var keynum, check = false;

	var evt = e || window.event;
	var keynum = evt.keyCode || evt.which;
	//if (e.keyCode) { keynum = e.keyCode; } else { keynum = e.which; }

	if (keynum >= 48 && keynum <= 57) { check = true; }       //숫자
	else if (keynum >= 37 && keynum <= 40) { check = true; }       //화살표키
	else if (keynum == 8 || keynum == 9 || keynum == 13) { check = true; }	  //백스페이스, 탭, 엔터

	if (!check) { if (evt.preventDefault) { evt.preventDefault(); } else { evt.returnValue = false; } }
}

function onlyPhoneNumber(e) {
	var keynum, check = false;

	var evt = e || window.event;
	var keynum = evt.keyCode || evt.which;
	//if (e.keyCode) { keynum = e.keyCode; } else { keynum = e.which; }

	if (keynum >= 48 && keynum <= 57) { check = true; }       //숫자
	else if (keynum == 45 ) { check = true; }       // -
	else if (keynum >= 37 && keynum <= 40) { check = true; }       //화살표키
	else if (keynum == 8 || keynum == 9 || keynum == 13) { check = true; }	  //백스페이스, 탭, 엔터

	if (!check) { if (evt.preventDefault) { evt.preventDefault(); } else { evt.returnValue = false; } }
}

// 새로운  윈도우띄우는함수
function sub(url, field, width,height) {
	var opt = "toolbar=no,resizable=yes,scrollbars=yes,location=no,resize=no,menubar=no,directories=no,copyhistory=0,width="+width+",height="+height+",top= 540,left = 370";
	window.open(url, 'zipfinder', opt);
}

function jaksungja() {
	document.theForm.who.value=document.theForm.name.value;
}

function checknum() {
	if(document.theForm.serial.value.length==13) {
		document.theForm.post_search.focus()
  }
}

function jumin() {
	alert('우편번호조회 버튼을 눌러 거주지 동을 입력해 주세요!');
}

function unCheckObj(obj) {
	$("#"+obj).addClass("blink");
	$("html, body").delay(100).animate({scrollTop: $("#"+obj).offset().top-120 }, 1000);
	$("#"+obj).focus();
}

function check_theForm() {
	with(document.theForm) {
		if(privacyCk.checked == false) {
			if (!confirm("개인정보보호정책 및 이용에 동의를 하지 않았습니다.\n\n동의하고 진행하시겠습니까?")) {
				privacyCk.focus();
				return;
			} else {
				privacyCk.checked = true;
			}
		}

		if (course1.selectedIndex == 0) {
			alert ("1지망을 반드시 선택해 주세요");
			unCheckObj("course1");
			//course1.focus();
			return;
		}

		if (course2.selectedIndex == 0) {
			alert ("2지망을 반드시 선택해 주세요");
			unCheckObj("course2");
			//course2.focus();
			return;
		}

		if (name.value.length == 0) {
			alert ("지원자의 성명을 반드시 입력해 주세요");
			unCheckObj("name");
			//name.focus();
			return;
		}

		if (jumin1.value.length == 0) {
			alert ("생년월일을 반드시 입력해 주세요");
			unCheckObj("jumin1");
			//jumin1.focus();
			return;
		}

		if (mobile2.value.length == 0) {
			alert ("지원자의 휴대번호를 반드시 입력해 주세요");
			unCheckObj("mobile2");
			//mobile2.focus();
			return;
		}

		if (mobile3.value.length == 0) {
			alert ("지원자의 휴대번호를 반드시 입력해 주세요");
			unCheckObj("mobile3");
			//mobile3.focus();
			return;
		}

		if (Hname.value.length == 0 ) {
			alert ("고등학교 명 (검정고시 포함) 년도를 입력해 주세요");
			$("html, body").delay(100).animate({scrollTop: $("#Hname").offset().top-120 }, 1000);
			Hname.focus();
			searchSchool();
			return;
		}


		action = "write_ok_ms.asp";
		submit();
	}
}

function juminError(n1,n2) { // 주민번호 에러
	if(badYMD(n1) || n2.length != 7 || n2.charAt(6) != (11 - (checkSum(n1,6,2) + checkSum(n2,6,8)) % 11) % 10) {
		return true;
	}
	return false;
}
//-->
</script>
<script language="javascript">
var stmnGAP1 = 10; // 페이지 헤더부분의 여백 (이보다 위로는 올라가지 않음)
var stmnGAP2 = 10; // 스크롤시 브라우저 상단과 약간 띄움. 필요없으면 0으로 세팅
var stmnBASE = 10; // 스크롤메뉴 초기 시작위치 (아무렇게나 해도 상관은 없지만 stmnGAP1과 약간 차이를 주는게 보기 좋음)
var stmnActivateSpeed = 1; // 움직임을 감지하는 속도 (숫자가 클수록 늦게 알아차림)
var stmnScrollSpeed = 1; // 스크롤되는 속도 (클수록 늦게 움직임)
var stmnTimer;

// 쿠키 읽기
function ReadCookie(name) {
	var label = name + "=";
	var labelLen = label.length;
	var cLen = document.cookie.length;
	var i = 0;

	while (i < cLen) {
		var j = i + labelLen;
		if (document.cookie.substring(i, j) == label) {
			var cEnd = document.cookie.indexOf(";", j);
			if (cEnd == -1) cEnd = document.cookie.length;
			return unescape(document.cookie.substring(j, cEnd));
		}
		i++;
	}
	return "";
}

// 쿠키 저장
function SaveCookie(name, value, expire) {
	var eDate = new Date();
	eDate.setDate(eDate.getDate() + expire);
	document.cookie = name + "=" + value + "; expires=" +  eDate.toGMTString()+ "; path=/";
}

// 스크롤 메뉴의 위치 갱신
function RefreshStaticMenu() {
	var stmnStartPoint, stmnEndPoint, stmnRefreshTimer;

	stmnStartPoint = parseInt(STATICMENU.style.top, 10);
	stmnEndPoint = document.body.scrollTop + stmnGAP2;

	if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1;

	stmnRefreshTimer = stmnActivateSpeed;

	if ( stmnStartPoint != stmnEndPoint ) {
		stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 );

		STATICMENU.style.top = parseInt(STATICMENU.style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount );
    stmnRefreshTimer = stmnScrollSpeed;
	}

	stmnTimer = setTimeout ("RefreshStaticMenu();", stmnRefreshTimer);
}

// 메뉴 ON/OFF 하기
function ToggleAnimate() {
	if (document.all.ANIMATE.checked) { // 이동하기 버튼이 체크되었다면
		RefreshStaticMenu(); // 메뉴위치를 다시 조정
		SaveCookie("ANIMATE", "true", 300); // 이동이 ON 상태라고 쿠키를 설정
	} else { // 아니라면... (이동하기 버튼이 체크되어 있지 않으면)
		clearTimeout(stmnTimer); // 이동용 타이머 해제
		STATICMENU.style.top = stmnGAP1; // 메뉴의 위치를 상단으로 옮긴다.
		SaveCookie("ANIMATE", "false", 300); // 이동상태가 "OFF" 임
	}
}

// 메뉴 초기화
function InitializeStaticMenu() {
	if (ReadCookie("ANIMATE") == "false") { // 이동상태가 off 상태라면
		document.all.ANIMATE.checked = false; // 체크표시를 지우고
		STATICMENU.style.top = document.body.scrollTop + stmnGAP1; // 맨 위에 들러 붙는다.
	} else { // 이동 on 상태라면
		document.all.ANIMATE.checked = true; // 체크표시를 하고
		STATICMENU.style.top = document.body.scrollTop + stmnBASE; // 기본위치로 이동한다.
		RefreshStaticMenu(); // 스크립트 가동
  }
}

function searchSchool(e) {
	try	{
		var evt = e || window.event;
		evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;
	} catch (e) { }

	var Hschool = window.open("HfindSchool.asp","Hschool","top=0,left=0,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=0,copyhistory=0,width=540,height=120");
	Hschool.focus();
}

$(document).ready(function() {






	$("#btn-submit").on("click", function(e) {
		e.preventDefault();
		check_theForm();
	});

	//계열선택
	$("select.select-part-course").change(function() {

		$(this).removeClass("blink");

		var index = $("select.select-part-course").index(this);
		var val = "";
		var $obj = $("option:selected", this).closest("optgroup");
		if ($obj.length == 1) {
			val = $obj.attr("label");
		}
		$("input.input-part").eq(index).val(val);
	}).trigger("change");

});
</script>




<img src="/new/ad_lead/ms1/images/bg.png"/>
<form name="theForm" method="post">

	<table class="contentsTable inputForm">

	<caption>
		<strong>지원자 정보</strong>
		<p>지원자 정보: 성명, 생년월일, 성별, 휴대전화, 자택번호, 이메일을 입력</p>
	</caption>

	<colgroup>
		<col width="15%">
			<col width="*">
	</colgroup>
	<tbody>

    <tr>
			<th class="txtLeft">지원계열</th>
			<td class="txtLeft">
				<label for="course1" style="display: none;">*1지망</label>
<%
'지원학과 값 불러오기 - 2016.04.19
PartListArray = GetPartListToArray(regyear) : CourseListArray = GetCourseListToArray(regyear)
PartListArray2 = GetPartListToArray2(regyear) : CourseListArray2 = GetCourseListToArray2(regyear)
Dim rs_year, rs_year2, rs_class
Response.Write "<input type=""hidden"" name=""part1"" id=""part1"" class=""input-part"" value="""" />"
Response.Write "<select name=""course1"" id=""course1"" class=""select-part-course"">"
Response.Write "<option value="""">1지망선택...</option>"
Response.Write getCourse(regyear)
Response.Write "</select>"
%>
	<label for="course2" style="display: none;">*2지망</label>

<%
Response.Write "<input type=""hidden"" name=""part2"" id=""part2"" class=""input-part"" value="""" />"
Response.Write "<select name=""course2"" id=""course2"" class=""select-part-course"">"
Response.Write "<option value="""">2지망선택...</option>"
Response.Write getCourse(regyear)
Response.Write "</select>"
%>
			</td>
		</tr>


		<tr>
			<th class="txtLeft"><label for="name">성명<span class="star">*</span></label></th>
			<td class="txtLeft">
				<input name="name" type="text" id="name"  style="ime-mode:active;" maxlength="15">
			</td>
		</tr>
		<tr>
			<th class="txtLeft"><label for="jumin1">생년월일<span class="star">*</span></label></th>
			<td class="txtLeft">
				<input name="jumin1" type="text" class="in_talk" id="jumin1" style="ime-mode:disabled" maxlength="6" onKeyPress="onlyNumber(event);"> (주민등록번호 앞 6자리)
			</td>
		</tr>

		<tr>
			<th class="txtLeft"><label for="mobile1">휴대전화<span class="star">*</span></label></th>
			<td class="txtLeft">
				<select name="mobile1" id="mobile1" class="w10">
					<option value="010" selected>010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				-
				<input name="mobile2" type="text" class="w10" id="mobile2" style="ime-mode:disabled" maxlength="4" onKeyPress="onlyNumber(event);" title="휴대전화(중간자리)" />
				-
				<input name="mobile3" type="text" class="w10" id="mobile3" style="ime-mode:disabled" maxlength="4" onKeyPress="onlyNumber(event);" title="휴대전화(끝자리)" />
			</td>
		</tr>

        <tr>

			<th width="151" class="txtLeft"><label for="Hname">고등학교<span class="star">*</span></label></th>
			<td class="txtLeft">
				<input name="Hname" id="Hname" type="text" class="w35" maxlength="100" value="" />
			</td>



		</tr>

         <tr>

			<th width="151" class="txtLeft"><label for="Hgrade">학년<span class="star">*</span></label></th>
			<td class="txtLeft">
            	<select name="Hgrade" id="Hgrade" class="w30">
					<option value="">선택</option>
                    <option value="1학년">1학년</option>
                    <option value="2학년">2학년</option>
                    <option value="3학년">3학년</option>
				</select>
			</td>
		</tr>
	</tbody>
	</table>



<div class="checkBox">
	1. 개인정보 활용 정보항목<br>
		합격안내 문자서비스, 원서접수 및 상담, 각종공지, 본인확인, 고지서등을 위해 성명, 핸드폰, 이메일 주소를 활용합니다.
		<br><br>
		2. 원서정보는 개인정보취급방침에 따라 안전하게 보호되며, 본인의 명백한 동의 없이 공개 및 제3자에게 제공되지 않습니다.
		<br><br>
			<a style="color:#1C43B7;" href="/new/mypage/privacy_contest.asp" target="_blank">개인정보취급방침</a>을 자세히 보려면 클릭하세요.

</div>
<div class="privacyCheck"><label><input type="checkbox" name="privacyCk" id="privacyCk" value="1" class="input-check"> 예, 개인정보보호정책 및 이용에 동의합니다.</label></div>


	<div class="btnWrap">
		<!--<div class="font-bold">본인은 한국IT직업전문학교에 입학하고자 소정의 서류를 갖추어 지원합니다.<br />
		<%=year(now)%>년 <%=month(now)%>월 <%=day(now)%>일</div><br />-->
		<a href="#" title="다음" class="btnReceipt blue" id="btn-submit">다음</a>

	</div>

</form>


<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>

<%
	Function getCourse(syear) ''sksk


		addStr = ""

		If IsArray(PartListArray) Then
			For i = 0 To Ubound(PartListArray,2)
				' 0 : Pname, Course
				rs_pname = PartListArray(0,i)
				' 추가 내용
				rs_year	  = PartListArray(2,i)
				IF  StrComp(rs_year, syear) = 0 Then
				addStr = addStr & "<optgroup label='" & rs_pname & "' >"

				If IsArray(CourseListArray) Then
					For j = 0 To Ubound(CourseListArray,2)
						' 0 : PName, Hname
						rs_pname2 = CourseListArray(0,j)
						rs_hname2 = CourseListArray(1,j)
						' 추가 내용
						rs_year2	  = CourseListArray(2,j)

						If StrComp(rs_pname, rs_pname2) = 0  AND StrComp(rs_year, rs_year2) = 0 Then
							'Response.Write "<option value=""" & rs_hname2 & """> - " & Replace(rs_hname2,"전공","") & "</option>"
							addStr = addStr&  "<option value='" & rs_hname2 & "' > - " & Replace(Replace(rs_hname2,"시각디자인전공(3년제)","시각디자인"),"전공","") & "</option>"
						End If
					Next
				End If

				addStr = addStr&   "</optgroup>"

				END IF
			Next
		End If
		getCourse = addStr
	END Function



	Function getCourse2(syear) ''sksk
			addStr = ""

		If IsArray(PartListArray2) Then
			For i = 0 To Ubound(PartListArray2,2)
				' 0 : Pname, Course
				rs_pname = PartListArray2(0,i)
				' 추가 내용
				rs_year	  = PartListArray2(2,i)
				IF  StrComp(rs_year, syear) = 0 Then
				addStr = addStr & "<optgroup label='" & rs_pname & "' >"

				If IsArray(CourseListArray2) Then
					For j = 0 To Ubound(CourseListArray2,2)
						' 0 : PName, Hname
						rs_pname2 = CourseListArray2(0,j)
						rs_hname2 = CourseListArray2(1,j)
						' 추가 내용
						rs_year2	  = CourseListArray2(2,j)

						If StrComp(rs_pname, rs_pname2) = 0  AND StrComp(rs_year, rs_year2) = 0 Then
							addStr = addStr&  "<option value='" & rs_hname2 & "' > - " & Replace(Replace(rs_hname2,"시각디자인전공(3년제)","시각디자인"),"전공","") & "</option>"
						End If

					Next
				End If

				addStr = addStr&   "</optgroup>"

				END IF
			Next
		End If
		getCourse2 = addStr
	END Function

%>
<%
	'토요일 접수 기간
	Function setDate1()
		Dim weekDate:weekDate = weekDay(now())
		Dim chkMonth, str
		IF weekDate = 6 Then
		  'weekDate = -1
		ELSEIF weekDate = 7 Then
		   weekDate = 0
		END IF
		str = FormatDateTime(DateAdd("w",7-weekDate,now()),2)
		setDate1 = str
	End Function
	'토요일 접수 기간
	Function setDate2()
		Dim weekDate:weekDate = weekDay(now())
		Dim chkMonth, str
		IF weekDate = 6 Then
		   weekDate = -1
		ELSEIF weekDate = 7 Then
		   weekDate = 0
		END IF
		str = FormatDateTime(DateAdd("w",14-weekDate,now()),2)
		setDate2 = str
	End Function

	Function getMeetingDate(week)
		Dim weekDate,startDate,weekInt,str
		If ubound(ArySelection)>0 then
			startDate = Cdate(Replace(ArySelection(0).item("From_Date"),".","-"))
			weekInt = 7-weekDay(startDate)
			str = FormatDateTime(DateAdd("w",(week*7)+weekInt,startDate),2)
		Else
			startDate = now()
			weekDate = weekDay(startDate)
			If weekDate = 7 Then		'토요일인경우
				week = week + 1
				str = FormatDateTime(DateAdd("w",(week*7),startDate),2)
			Else
				weekInt = 7-weekDay(startDate)
				str = FormatDateTime(DateAdd("w",(week*7)+weekInt,startDate),2)
			End If
		End If
		getMeetingDate = str
	End Function
%>


<script language="javascript">


function setseleteDate(){
		var today = new Date();
		var dateString = "2018-08-28";
		var dateArray = dateString.split("-");
		var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);

		var betweenDay = parseInt(dateObj.getTime()-today.getTime())/1000/60/60/24;
		//console.log(betweenDay);
		return betweenDay

}

$(document).ready(function(){


    var week = 4;
	var addDates = week * 7;
	//var idate = "20170919"
	var d = new Date()
	var dy = d.getFullYear();
	var dm = (d.getMonth()+1);

	var idate = DateFormat(d)
	var calendar = [];

	if(week == 4){
		addDates = setseleteDate();
	}

	init();

    $("input[name=hopestatus]").change(function() {
    	var radioValue = $(this).val();
		if(radioValue == 52){
       	 	week = radioValue;
        	addDates = week * 7;
		}else{
			addDates = setseleteDate();
		}
		init();
	});

	$("input[name=checkyear]").change(function() { /*sksksksksksksk*/
	console.log("sk");
			var radioValue = $(this).val();
			$(".select-part-course > optgroup").remove();
			$("input[name=regyear]").val(radioValue);
		if(radioValue == "2020"){
			addstr ="<%=getCourse("2020")%>";
			$("input[name=interviewtype]").val("<%=GetInterviewtype(2020)%>");
			$("input[name=regtype]").val("<%=GetRegtype(2020)%>");
  			 init();
		}else if (radioValue == "2021"){
			addstr = "<%=getCourse2("2021")%>";
			$("input[name=interviewtype]").val("수시 1차");
			$("input[name=regtype]").val("1");
		}

		$('.select-part-course').append(addstr);

		});


    <%
		Function GetInterviewtype(ByVal schYear)

			For i = 0 To UBound(ArySelection)
				IF StrComp(ArySelection(i).item("Study_year"), schYear) = 0 Then
					GetInterviewtype = ArySelection(i).item("selection")
				END IF
			NEXT

		END Function
		Function GetRegtype(ByVal schYear)

			For i = 0 To UBound(ArySelection)
				IF StrComp(ArySelection(i).item("Study_year"), schYear) = 0 Then
					GetRegtype = ArySelection(i).item("regtype")
				END IF
			NEXT

		END Function
	%>

	/* initial */
	function init() {
		var r = getTermToSaturday(idate)
		calendar = getPeriod(idate, addDates , r );
		//console.log(calendar);
		//makeYear(dy,dm)
		makeDate()
	}
	function makeDate(){
		var radioValue = $("input[name=regyear]").val();
		$("#hopedate").find("option").remove().end();
		var week = ['일', '월', '화', '수', '목', '금', '토'];
		var dayOfWeek = week[new Date().getDay()];
		if("<%=ArySelection(0).item("Study_year")%>" == radioValue){
		//console.log(dayOfWeek);
		if(dayOfWeek != "토" && idate.toString() == "2019-02-15"){
				$('<option>').val('<%=setDate1()%>').text('<%=setDate1()%>').appendTo($('#hopedate'));
				$('<option>').val('<%=setDate2()%>').text('<%=setDate2()%>').appendTo($('#hopedate'));
			}else if(idate.toString() > "2019-02-15" && idate.toString() < "2019-02-23" ){
				//$('<option>').val("2019-02-23").text("2019-02-23").appendTo($('#hopedate'));
			}else if(idate.toString() > "2019-02-28"){
				if(dayOfWeek != "토"){
					$('<option>').val('<%=getMeetingDate(0)%>').text('<%=getMeetingDate(0)%>').appendTo($('#hopedate'));
				}
				$('<option>').val('<%=getMeetingDate(1)%>').text('<%=getMeetingDate(1)%>').appendTo($('#hopedate'));
			}
			$('<option>').val("").text("개별면접").appendTo($('#hopedate'));
		}else{
			$("#hopedate").find("option").remove().end();
			$("#hopedate").append("<option value='2019-03-02'>2019-03-02</option>");
			$("#hopedate").append("<option value=''>개별면접</option>");
		}

	}
	function makeYear(year,month) {
    	$("#hopedate1").find("option").remove().end();
		for(i=0;i<calendar.length;i++) {
			var j = calendar[i]
			for(var k in j) {
				if (k=="year") {
					if (!$("#hopedate1 option[value='" + j[k] +"']").length) {
						$('<option>').val(j[k]).text(j[k]).appendTo($('#hopedate1'));
					}
				}
			}
		}
		makeMonth(year,month);
	}

	function makeMonth(year,month) {
		var temyear = $("input[name=regyear]").val();
		$("#hopedate2").find("option").remove().end();

		for(i=0;i<calendar.length;i++) {
			var j = calendar[i]
			for(var k in j) {
				if (j["year"]==year) {
					if (!$("#hopedate2 option[value='" + j["month"] +"']").length) {
							$('<option>').val(j["month"]).text(j["month"]).appendTo($('#hopedate2'));

					}
				}
			}
		}

		makeDay(year,month);
	}

	function makeDay(year,month) {
		var temyear = $("input[name=regyear]").val();
		$("#hopedate3").find("option").remove().end();

		for(i=0;i<calendar.length;i++) {
			var j = calendar[i]
			for(var k in j) {
				if (j["year"]==year && j["month"]==month) {
					if (!$("#hopedate3 option[value='" + j["day"] +"']").length) {
							$('<option>').val(j["day"]).text(j["day"]).appendTo($('#hopedate3'));
					}
				}
			}
		}

	}
	/* End Initial */

	$(document).on("change","#hopedate1",function(e) {
		var val = $("option:selected",$(this)).val()
		makeMonth(val ,getInitMonth(val))
	});

	$(document).on("change","#hopedate2",function(e) {
		makeDay($("#hopedate1 option:selected").val(),$("option:selected",$(this)).val())
	});

	$(document).on("change","#hopedate3",function(e) {
		console.log($("#hopedate1 option:selected").val()+","+$("#hopedate2 option:selected").val()+","+$("option:selected",$(this)).val())
	});

	/* Common Function */
	function getInitMonth(year) {
		var n = ""
		for(i=0;i<calendar.length;i++) {
			var j = calendar[i]
			for(var k in j) {
				if (String(j["year"])==String(year)) {
					n = j["month"];
					break;
				}
			}
			if (n!="") { break;}
		}
		return n
	}


	function DateFormat(obj) {
		var yy = String(obj.getFullYear());
		var mm = pad(String(obj.getMonth()+1), 2)
		var dd = pad(String(obj.getDate()), 2)
		var date = yy + "-" + mm + "-" + dd
		return date;
	}

	function pad(n, width) {
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}

	function getTermToSaturday(date) {
		var ret = new Date(date)
		//console.log("토요일까지 남은 날 : "+ret.getDay())
		return (6 - 1 - ret.getDay() + 7) % 7 + 1
	}

	function dateAdd(sDate, v, t) {
		var yy = parseInt(sDate.substr(0, 4), 10);
		var mm = parseInt(sDate.substr(5, 2), 10);
		var dd = parseInt(sDate.substr(8), 10);

		switch (t) {
			case "d"	:	d = new Date(yy, mm - 1, dd + v);break;
			case "m"	:	d = new Date(yy, mm - 1 + v, dd);break;
			case "y"	:	d = new Date(yy + v, mm - 1, dd);break;
			default		:	d = new Date(yy, mm - 1, dd + v);break;
		}

		yy = d.getFullYear();
		mm = d.getMonth() + 1; mm = pad(mm,2);
		dd = d.getDate(); dd = pad(dd,2);

		return '' + yy + '-' +  mm  + '-' + dd;
	}

	function getPeriod(sdate,dates,addValue) {
		var n = dates + addValue;
		var obj = [];
		for (i=0;i<=n;i++) {
			var strDate = dateAdd(sdate, i, "d")
			obj.push({"year":strDate.substr(0, 4), "month":strDate.substr(5, 2), "day":strDate.substr(8)})
			//console.log(i+" : "+dateAdd(sdate, i, "d"))
		}
		return obj;
	}
});
</script>

<!--#include Virtual= "/inc/2017/subFooter.asp"-->
<!-- footer (하단) -->
<!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
</body>
</html>
