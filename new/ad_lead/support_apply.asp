<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->
<%
'If Request.ServerVariables("SERVER_PORT")="80" then
'	response.redirect "https://koreait.ac.kr:444/new/ad_lead/support_apply.asp"
'	response.End
'End If

category="3"
menu="2"
sub_menu="1"
title="s07_002"
%>
    <!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
    <!-- S: header 시작 -->
    <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
    <!-- E: header 종료 -->

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

' regyear = Request("year")




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

regyear = "2022"





Dim addStr

' 0 : Pname, Course
'희망학과(part)
Function GetPartListToArray(ByVal regyear)
	Dim SQL : SQL = "select distinct replace(Pname,'스쿨', '계열') as Pname , Course, c.Study_year "
	sql = sql & " from dbo.ClassName c "
	Sql = sql & " inner join Selection s "
	sql = sql & " on '" & regyear & "-01-01' between s.From_Date and s.To_Date AND c.Study_year = s.Study_year"
	sql = sql & " where scode='5' and Status='1' order by Course"

	'response.write sql

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

'    response.write "sql : " & sql

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

    'response.write "sql : " & sql

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
<%
'regyear = GetSelectionDateArrayToStr(0)
'date_compare = Left(now,10)

'sql = "select top 1 * from Selection where Study_year = '"& regyear &"' and '"& date_compare &"' between From_Date and To_Date order by idx"
'response.write sql
'response.end
'set rs = conn.execute(sql)

'if not rs.eof then
	'interviewtype = rs("selection")
	'If Left(interviewtype,2)="수시" Then
	'	selection=Replace(interviewtype,"수시","예비")
	'ElseIf Left(interviewtype,2)="정시" Then
	'	selection=Replace(interviewtype,"정시","")
	'End If
	'regtype = selection("regtype")
'end if
'response.write interviewtype

'2018.03.09 - 임시
'If StrComp(Request("y"),2018) = 0 Or DateDiff("d",date(),chkDate) >= 0  Then
'	regyear = 2018
'else
'	regyear = 2019
'End IF
%>

<script language="javascript" type="text/javascript">
<!--
function FocusMov(nextField,Ilength,value) {
	//if ( event.keyCode<48 || event.keyCode>57 ) {
	//	event.returnValue=false;
	//} else {
  	//alert(value.length);
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

        if($("#privacyCk2_chk").val()==4){
			if(privacyCk2.checked == false) {
				if (!confirm("외국계 관련 안내문을 숙지하였고 이에 동의합니까?")) {
					privacyCk2.focus();
					return;
				} else {
					privacyCk2.checked = true;
				}
			}
		}

        if (!$('input:radio[name=checkyear]').is(':checked')) {
			alert( "학년도 구분을 선택해 주세요" );
			$("#checkyear").addClass("blink");
			return;
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

		if (Hgdate1.value.length == 0 ) {
			alert ("고등학교 졸업(예정/검정고시) 년도를 입력해 주세요");
			unCheckObj("Hgdate1");
			//Hgdate1.focus();
			return;
		}

		if (Hgdate2.value.length == 0) {
			alert ("고등학교 졸업(예정/검정고시) 월 을 입력해 주세요");
			unCheckObj("Hgdate2");
			//Hgdate2.focus();
			return;
		}

		for(i=0;i<5;i++) {
			if(school_gubun[i].checked) {
				var sel = "OK";
			}
		}

		if (sel != "OK") {
			alert( "고교구분을 선택해 주세요" );
			$("#school_gubun_wrapper").addClass("blink");
			$("html, body").delay(100).animate({scrollTop: $("#school_gubun_wrapper").offset().top-120 }, 1000);
			//school_gubun[0].focus();
			return;
		}

		if (!$('input:radio[name=Imotivation]').is(':checked')) {
			alert( "지원경로를 선택해 주세요" );
			$("#ImotivationWrap").addClass("blink");
			return;
		}

		if (address1.value.length == 0) {
    		alert ("지원자의 주소를 반드시 입력해 주세요");
			$("html, body").delay(100).animate({scrollTop: $("#address1").offset().top-120 }, 1000);
			goJusoPopup();
			return;
		}

		if (address2.value.length == 0) {
			alert ("지원자의 상세주소를 반드시 입력해 주세요");
			unCheckObj("address2");
			//address2.focus();
			return;
		}

		if (email.value.length == 0) {
			alert ("이메일을 반드시 입력해 주세요");
			unCheckObj("email");
			return;
		}

		if (!$('input:radio[name=recommend2]').is(':checked')) {
			alert( "면접유형 선택해 주세요" );
			$("#recommend2").addClass("blink");
			return;
		}

		if (!$('input:radio[name=carea]').is(':checked')) {
			alert( "면접구분 선택해 주세요" );
			$("#carea").addClass("blink");
			return;
        }





		/*
		if (name1.value.length == 0) {
			alert ("보호자 성명은 반드시 입력해주세요");
			name1.focus();
			return;
		}

		if (relation1.value.length == 0) {
			alert ("보호자와의 관계는 반드시 입력해주세요");
			relation1.focus();
			return;
		}

		if (parent_tel1.value.length == 0) {
			alert ("보호자 연락처를 반드시 입력해주세요");
			parent_tel1.focus();
			return;
		}
		*/

		/*
		if($("#introduction").val().length == 0 ){
			alert ("자기소개서를 반드시 입력해주세요");
			$("#introduction").focus();
			return;
		}
		*/


		action = "write_ok.asp";
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
	$("#zipcode").on("click", function(e) {
		goJusoPopup();
	});

	$("#zip_btn").on("click", function(e) {
		e.preventDefault();
		goJusoPopup();
	});

	$("#name, #jumin1, #mobile2, #mobile3, #Hname, #Hgdate1, #Hgdate2, #address2").on("propertychange change keyup paste input", function() {

		$(this).removeClass("blink");
	});


	$("#name, #jumin1, #mobile2, #mobile3, #Hname, #Hgdate1, #Hgdate2, #address2").on("focus",function(){
		//$(this).removeClass("blink");
	})

	$("input:radio[name=Imotivation]").click(function(e) {
		$("#ImotivationWrap").removeClass("blink");
	});

	$("#name, #mobile2, #mobile3").on("focusout", function(e) {
		if (!!$(document).data("send")) { return; }

		var js_name = $.trim($("#name").val());
		var js_mobile2 = $.trim($("#mobile2").val());
		var js_mobile3 = $.trim($("#mobile3").val());

		if (!(js_name.length >= 1 && js_mobile2.length >= 3 && js_mobile3.length >= 4)) { return; }

		$(document).data("send", true);
		var $frm = $(document.theForm);
		var url = "write_temp_list_ok.asp";
		var param = $frm.serialize();
		$.post(url, param);
	});

	$("#address2").on("focusout", function(e) {
		if (!!$(document).data("addr")) { return; }

		var js_name = $.trim($("#name").val());
		var js_mobile2 = $.trim($("#mobile2").val());
		var js_mobile3 = $.trim($("#mobile3").val());

		if (!(js_name.length >= 1 && js_mobile2.length >= 3 && js_mobile3.length >= 4)) { return; }

		$(document).data("send", true);
		$(document).data("addr", true);
		var $frm = $(document.theForm);
		var url = "write_temp_list_ok.asp";
		var param = $frm.serialize();
		$.post(url, param);
	});

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

	//고등학교 구분
	$("input:radio[name='school_gubun']").click(function(e) {
		$("#school_gubun_wrapper").removeClass("blink");
	});

	//타대학 지원현황
	$("input:radio[name='ocs_status']").click(function(e) {

		var disable = $(this).val()=="" ? true : false;

		$("#ocs_major").prop("disabled",disable);
		$("#ocs_name").prop("disabled",disable);

		if (disable) {
			$("#ocs_major").val("");$("#ocs_name").val("");
			$("#ocs_major").addClass("input-disabled");$("#ocs_name").addClass("input-disabled");
		} else {
			$("#ocs_name").focus();
			$("#ocs_major").removeClass("input-disabled");$("#ocs_name").removeClass("input-disabled");
		}

	});



	//고교위탁
	$("input:radio[name='phigh']").click(function(e) {

		var disable = $(this).val()=="없음" ? true : false;

		$("#phigh_name").prop("disabled",disable);


		if (disable) {
			$("#phigh_name").val("");
			$("#phigh_name").addClass("input-disabled");
		} else {
			$("#phigh_name").focus();
			$("#phigh_name").removeClass("input-disabled");
		}

	});



	//지원동기
	$("input:radio[name='Imotivation']").click(function(e) {
		var imotivation = $(this).data("imotivation");
		console.log(imotivation);
		if (imotivation=="etc") {
			$("#ImotivationEtcWrap").removeClass("blind");
			$("#ImotivationEtcWrap").addClass("block")	;
		} else {
			$("#ImotivationEtcWrap").removeClass("block")	;
			$("#ImotivationEtcWrap").addClass("blind");
		}
	});
});
</script>

<script type="text/javascript">
$(document).ready(function(){
	//textbox 포커싱 색 변화
	$('input').focus(function(){
		$(this).addClass("input-focus");
	}).blur(function(){
		$(this).removeClass("input-focus");
	});
});
</script>
<style type="text/css">
	ul.list { margin-left:20px; }
	ul.list li { list-style: initial; }

	ul.privacy { margin-left:20px; line-height:1.6;}
	ul.privacy li { list-style: decimal; }

	.privacy-area {background:#EEE; color:#333; border: solid 2px #0076a3; padding:15px 10px;}
	.privacy-btn { background:#0076a3; height:40px; line-height:40px; text-align:center; color:#FFF; }

	.privacy-area a { color:#333; }
	.privacy-area a:hover { color:#000; text-decoration:underline; }
	.privacy-area a:focus, .privacy-area a:active{text-decoration:none; color:#333;}

	.star { text-align:right;}

	.input-focus { border:1px #0076a3 solid; }
	select.select-part-course { width:200px; }
	select.select-part-course option { padding:2px 10px; }
	.ImotivationWrap{display:block;}
	.ImotivationWrap li {float:left; width:20%;}
	.ImotivationWrap li input{margin-right:5px;}
	.input-disabled{background-color:#EBEBE4 !important;border:1px solid #ABADB3 !important;padding:2px 1px !important;}

	.blink {
		-webkit-animation: blink 2.0s linear infinite;
		-moz-animation: blink 2.0s linear infinite;
		-ms-animation: blink 2.0s linear infinite;
		-o-animation: blink 2.0s linear infinite;
		animation: blink 2.0s linear infinite;
		border:1px solid rgba(81, 203, 238, 1);
	}

	@keyframes blink {
		0% { box-shadow: 0 0 15px rgba(81, 203, 238, 1); }
		50% { box-shadow: none; }
		100% { box-shadow: 0 0 15px rgba(81, 203, 238, 1); }
	}

	@-webkit-keyframes blink {
		0% { box-shadow: 0 0 15px rgba(81, 203, 238, 1); }
		50% { box-shadow: 0 0 0; }
		100% { box-shadow: 0 0 15px rgba(81, 203, 238, 1); }
	}
</style>

<%
admission = 1 : admission_title = "신입생"
If StrComp(request("type"),2) = 0 Then
	admission = 2 : admission_title = "편입학"
End If
%>

<form name="theForm" method="post">
<input type="hidden" name="tempPhoto" />
<input type="hidden" name="regyear" value="<%=regyear%>" />
<input type="hidden" name="interviewtype" value="<%=interviewtype%>" />
<input type="hidden" name="regtype" value="<%=regtype%>" />
<input type="hidden" name="admission" value="1" />

<input type="hidden" id="privacyCk2_chk" value="" />

<!-- <div class="acenter font-bold font-18 pb30">
	<h1 class="font-bold font-24 pt30 pb5">입학원서</h1>
	 - <%=regyear%>학년도 <span id="admission_title"><%=admission_title%></span> 지원 -
</div>
 -->
<%IF isArray(ArySelection) Then
	'IF  Ubound(ArySelection) > 0 Then %>
<h3 class="title02">학년 선택</h3>
	<table class="contentsTable inputForm">

	<caption>
		<strong>학년 선택</strong>
		<p>고3(19학번), 예비 고3(20학번) 선택</p>
	</caption>

	<colgroup>
		<col width="15%">
			<col width="*">
	</colgroup>
	<tbody>
		<tr>
			<th class="txtLeft">학년도 구분<span class="star">*</span></th>
            <td class="txtLeft">
            <!--<label><input type="radio" name="checkyear" <%IF StrComp(regyear,"2021") = 0 Then %>checked="checked"<%END IF%> value="2021"> 2021학년도 </label>-->
            	<!-- <label><input type="radio" id="checkyear" name="checkyear"  value="2021"> 2021학년도 </label> -->
				<label ><input type="radio" name="checkyear" class="ml15" value="2022" checked> 2022학년도</label>
            </td>
        </tr>
    </tbody>
    </table>
  <%
  '	END IF
  END IF%>
	<h3 class="title02">지원 전형 및 계열 선택</h3>
	<p class="">※ 표시가 있는 항목은 필수항목입니다.</p>
	<table class="contentsTable inputForm">
	<caption>
		<strong>지원구분</strong>
		<p>지원구분: 지원전형(일반전형, 특별전형), 지원학과(1지망, 2지망)을 제공</p>
	</caption>
	<colgroup>
		<col width="15%">
		<col width="*">
	</colgroup>
	<tbody>
		<tr>
			<th class="txtLeft">전형구분<span class="star">*</span></th>
			<td class="txtLeft">
				<label><input type="radio" name="interviewmemo" checked="checked" value="[일반전형]"> 일반전형</label>
				<label ><input type="radio" name="interviewmemo"  class="ml15" value="[특별전형]"> 특별전형</label>
				<label ><input type="radio" name="interviewmemo"  class="ml15" value="[편입학전형]"> 편입학전형</label>

<!--				<div style="padding:5px 5px 0;font-weight:bold;">※ 타대학 수시 / 정시 합격자도 지원(중복지원) 가능</div> -->
			</td>
		</tr>
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
	</tbody>
	</table>


	<!--h1 class="tit01 hidden">지원자 정보</h1-->
	<h3 class="title02">지원자 정보</h3>
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
			<th class="txtLeft">성별<span class="star">*</span></th>
			<td class="txtLeft">
				<label><input type="radio" name="sex" checked="checked" value="1">  <strong class="point">남</strong></label>
				<label ><input class="ml15" type="radio" name="sex" value="2">  <strong class="point">여</strong></label>
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
			<th class="txtLeft"><label for="tel1">자택번호</label></th>
			<td class="txtLeft">
				<select name="tel1" id="tel1" class="w10">
					<option value="02" selected>02</option>
					<option value="031">031</option>
					<option value="032">032</option>
					<option value="033">033</option>
					<option value="041">041</option>
					<option value="042">042</option>
					<option value="043">043</option>
					<option value="051">051</option>
					<option value="052">052</option>
					<option value="053">053</option>
					<option value="054">054</option>
					<option value="055">055</option>
					<option value="061">061</option>
					<option value="062">062</option>
					<option value="063">063</option>
					<option value="064">064</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
					<option value="070">070</option>
				</select>
				-
				<input name="tel2" type="text" class="w10" id="tel2" maxlength="4" onKeyPress="onlyNumber(event);" title="자택번호(중간자리)" />
				-
				<input name="tel3" type="text" class="w10" id="tel3" maxlength="4" onKeyPress="onlyNumber(event);" title="자택번호(끝자리)" />
			</td>
		</tr>

		<tr>
			<th  class="txtLeft"><label for="email">이메일<span class="star">*</span></label></th>
			<td  class="txtLeft">
				<input name="email" type="text" id="email" class="w35" maxlength="100">
			</td>
		</tr>
		<tr>
				<th class="txtLeft"><label for="address1">주소<span class="star">*</span></label></th>
				<td class="txtLeft">
					<input name="zipcode" type="text" id="zipcode" readonly class="w20" maxlength="7" title="우편번호" />
					<a href="#" title="우편번호검색" class="btnZip btnDouble mb05" id="zip_btn">우편번호 검색</a>
					<br>
					<input name="address1" type="text" id="address1" class="w35" readonly  maxlength="100"/><input name="address2" type="text" id="address2" class="ml05 w35" maxlength="100" title="상세주소입력" />
				</td>
			</tr>
	</tbody>
	</table>


	<!--h1 class="tit01">최종학력</h1-->
	<table class="contentsTable inputForm">

	<caption>
		<strong>최종학력 입력</strong>
		<p>최종학력 입력: 고등학교명, 졸업년도, 대학교, 전공,종업유무를 입력</p>
	</caption>

	<colgroup>
			<col width="15%">
			<col width="*">
	</colgroup>
	<tbody>
		<tr>
			<th width="151" rowspan="2" class="txtLeft"><label for="Hname">고등학교<span class="star">*</span></label></th>
			<td width="352" class="txtLeft">
				<input name="Hname" id="Hname" type="text" class="w35" placeholder="고등학교를 검색해주세요." maxlength="100" readonly />
				<input name="Hcode" type="hidden" />
				<input name="Harea" type="hidden" />
				<a href="HfindSchool.asp" onclick="searchSchool(event);" title="고등학교검색" class="btnZip btnPost mb05" target="_blank">고등학교검색</a>
                <a href="/new/ad_lead/images/한국IT전문학교교사추천서.hwp" title="추천서 다운로드" class="btnZip btnDouble mb05">추천서 다운로드</a>
				</td>
				<th width="95" class="txtLeft">
					졸업(예정)년도
				</th>
			<td width="98" class="txtLeft">
				<select name="Hgdate1" id="Hgdate1" class="w30" title="졸업(예정)년도">
					<option value="">선택</option>
					<%
					For i = Year(Date) + 2 To 1900 Step -1
						Response.Write "<option value=""" & i & """>" & i & "년</option>"
					Next
					%>
				</select>
				<select name="Hgdate2" id="Hgdate2" class="w30 " title="졸업(예정)월">
				<%
				For i = 1 To 12
					If StrComp(i,2) = 0 Then
						Response.Write "<option value=""" & i & """ selected=""selected"">" & i & "월</option>"
					Else
						Response.Write "<option value=""" & i & """>" & i & "월</option>"
					End If
				Next
				%>
				</select>

				<!--
				<input name="Hgdate1" type="text" class="w80" id="Hgdate1" style="ime-mode:disabled" maxlength="4" onKeyPress="onlyNumber(event);">
				년
				<input name="Hgdate2" type="text" class="w50" id="Hgdate2" style="ime-mode:disabled" value="02" maxlength="2" onKeyPress="onlyNumber(event);">
				월
				-->
			</td>
		</tr>
		<tr>
			<td colspan="3" class="txtLeft" id="school_gubun_wrapper">
				<label><input type="radio" name="school_gubun" value="1" class="ml15"> <strong class="point">전문계</strong></label> &nbsp;
				<label><input type="radio" name="school_gubun" value="2" class="ml15"> <strong class="point">인문계</strong></label> &nbsp;
				<label><input type="radio" name="school_gubun" value="3" class="ml15"> <strong class="point">예체능계</strong></label> &nbsp;
				<label><input type="radio" name="school_gubun" value="4" class="ml15"> <strong class="point">외국계</strong></label> &nbsp;
				<label><input type="radio" name="school_gubun" value="5" class="ml15"> <strong class="point">검정고시</strong></label>
			</td>
		</tr>


        <style>
.application .checkBox2 {
    padding: 10px;
    background: #f8f8f8;
    border: 1px solid #e5e5e5;
    height: 250px;
    overflow-y: scroll;
    line-height: 1.5;
    font-size: 14px;
    color: #999999;
    margin-bottom: 20px;
    font-size: 0.9rem;
}
</style>
                             <tr>
        	<td colspan="3">

<div class="checkBox2" style="text-align:left; display:none;">
	서류 미비로 학력 인정이 되지 않아 학습자등록이 되지 않을 경우 수업을 받더라도 학점이수가 불가능합니다. 외국계 학력 인정의 여부는 본교와는 관계없이 평생교육법에 따라 국가평생교육진흥원에서 결정하는 사안으로 구비서류 준비와 학력 인정의 여부는 전적으로 학생 본인에게 있습니다. 본교는 학력 인정 절차만 안내할 뿐 이에 대한 어떠한 책임도 없음을 알려드립니다.

<br><br><br>

<span style="text-decoration:underline; font-style:bold; text-align:left"> 본인은 위의 주의사항을 잘 숙지하였으며 외국계 학력 인정의 문제로 학습자등록이 불가하여 학점이수가 불가능할 경우 전적으로 본인의 책임임을 확인합니다.</span>
<br><br>

<div class="privacyCheck"><label><input style="vertical-align:0px;" type="checkbox" name="privacyCk2" id="privacyCk2" value="1" class="input-check"> 동의합니다. </label></div>



		<tr>
		  <th class="txtLeft" style="font-size:14px;">고교 위탁교육 사항<span class="star">*</span></th>
		  <td class="txtLeft" colspan="3"><label>
		    <input type="radio" name="phigh" value="없음" checked="checked" class="ml15">
		    <strong>없음</strong>
		  </label>
		    <label>
              <input type="radio" name="phigh" value="있음" class="ml15">
              <strong class="point">있음</strong></label> <input name="phigh_name" type="text" id="phigh_name" class="w10 input-disabled" value=""  maxlength="100" disabled="disabled">학교</td>
		  </tr>


		<tr>
			<th rowspan="2" class="txtLeft"><label for="ocs_status">타대학 지원현황</label></th>
			<td colspan="3" class="txtLeft">
				<label><input type="radio" name="ocs_status" value="" class="ml15" checked> <strong class="point">없음</strong></label>
				<label><input type="radio" name="ocs_status" value="1" class="ml15"> <strong class="point">대학교</strong></label>
				<label><input type="radio" name="ocs_status" value="2" class="ml15"> <strong class="point">전문대학</strong></label>
				<label><input type="radio" name="ocs_status" value="3" class="ml15"> <strong class="point">전문학교</strong></label>
				<label><input type="radio" name="ocs_status" value="4" class="ml15"> <strong class="point">평생교육원</strong></label>
			</td>
		</tr>
		<tr>
			<td colspan="3" class="txtLeft">
				<input name="ocs_name" type="text" id="ocs_name" class="w20 input-disabled"  maxlength="100" disabled="disabled" /> 대학교
				<input name="ocs_major" type="text" id="ocs_major" class="ml20 w20 input-disabled" maxlength="15" title="전공" disabled="disabled" /> 전공
			</td>
		</tr>
		<tr>
			<th rowspan="2" class="txtLeft"><label for="Cname">대학교</label></th>
			<td colspan="3" class="txtLeft">
				<input name="Cname" type="text" id="Cname" class="w20"  maxlength="100" /> 대학교
				<input name="Cmajor" type="text" id="Cmajor" class="ml20 w20" maxlength="15" title="전공" /> 전공
			</td>
		</tr>
		<tr>
			<td colspan="3" class="txtLeft">
				<label><input type="radio" name="Cgtype" value="졸업" class="ml15"> <strong class="point">졸업</strong></label>
				<label><input type="radio" name="Cgtype" value="예정" class="ml15"> <strong class="point">졸업예정</strong></label>
				<label><input type="radio" name="Cgtype" value="휴학" class="ml15"> <strong class="point">휴학</strong></label>
				<label><input type="radio" name="Cgtype" value="중퇴" class="ml15"> <strong class="point">중퇴</strong></label>
			</td>
		</tr>
        <tr>
        	<th class="txtLeft">학원</th>
            <td class="txtLeft" colspan="3">
            	<input type="text" name="academy" id="academy" class="w35" maxlength="100" value=""/>
                <span class="ml10">※ 현재 학원을 다니는 경우에만 입력하세요!</span>
            </td>
        </tr>
	</tbody>
	</table>

<h3 class="title02">보호자 인적사항</h3>
				<table class="contentsTable inputForm">
				<caption>
					<strong>보호자 정보 입력</strong>
					<p>보호자 정보 입력: 성명, 관계, 연락처를 입력 </p>
				</caption>
				<colgroup>
					<col width="15%">
					<col width="*">
					<col width="15%">
					<col width="*">
					<col width="15%">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th class="txtLeft"><label for="name1">성명<!--<span class="star">*</span>--></label></th>
						<td class="txtLeft"><input name="name1" type="text" class="w100" id="name1" maxlength="10" ></td>

						<th class="txtLeft"><label for="relation1">관계<!--<span class="star">*</span>--></label></th>
						<td class="txtLeft"><input name="relation1" type="text" class="w100" id="relation1" maxlength="5" ></td>
						<th class="txtLeft"><label for="parent_tel1">연락처<!--<span class="star">*</span>--></label></th>
						<td class="txtLeft"><input name="parent_tel1" type="text" class="w100" id="parent_tel1" maxlength="15" onKeyPress="onlyNumber(event);"></td>
					</tr>
					<!--tr>
						<td class="first">보호자1</td>
						<td><input name="name1" type="text" class="w90p" id="name1" maxlength="10" style="ime-mode:active;"></td>
						<td><input name="relation1" type="text" class="w90p" id="relation1" maxlength="5" style="ime-mode:active;"></td>
						<td><input name="parent_tel1" type="text" class="w90p" id="parent_tel1" maxlength="15" style="ime-mode:disabled;"></td>
					</tr>
					<tr>
						<td class="first">보호자2</td>
						<td><input name="name2" type="text" class="w90p" id="name2" maxlength="10" style="ime-mode:active;"></td>
						<td><input name="relation2" type="text" class="w90p" id="relation2" maxlength="5" style="ime-mode:active;"></td>
						<td><input name="parent_tel2" type="text" class="w90p" id="parent_tel2" maxlength="15" style="ime-mode:disabled;"></td>
					</tr-->
				</tbody>
				</table>






	<!--h1 class="tit01">기타 정보</h1-->
	<h3 class="title02">기타 사항</h3>
	<table class="contentsTable inputForm">
	<caption>
		<strong>기타 정보 입력</strong>
		<p>기타 정보 입력: 졸업후 계획(취업,편입, 대학원진학, 유학, 기타)를 입력</p>
	</caption>
	<colgroup>
		<col width="15%">
			<col width="*">
	</colgroup>

	<tbody>
		<tr>
			<!--<th scope="row" rowspan="2">기타 정보</th>-->
			<th class="txtLeft">졸업 후 계획</th>
			<td class="txtLeft">
				<label><input name="graduation" type="radio" value="1" ><strong class="point">취업</strong></label>
				<label><input name="graduation" type="radio" value="2" class="ml15"><strong class="point">편입(일반 및 학사)</strong></label>
				<label><input name="graduation" type="radio" value="3" class="ml15"><strong class="point">대학원진학</strong></label>
				<label><input name="graduation" type="radio" value="4" class="ml15"><strong class="point">유학</strong></label>
				<label><input name="graduation" type="radio" value="5" class="ml15"><strong class="point">기타</strong></label>
			</td>
		</tr>
<!--
		<tr>
			<th>병역 관계</th>
			<td>
				<label><input name="armytype" type="radio" value="1" class="input-radio"> 군필</label>&nbsp;&nbsp;
				<label><input name="armytype" type="radio" value="2" class="input-radio"> 미필</label>&nbsp;&nbsp;
				<label><input name="armytype" type="radio" value="3" class="input-radio"> 면제</label>&nbsp;&nbsp;
				(고등학교 졸업예정인 남학생은 미필, 여학생은 면제에 체크해 주세요)
			</td>
		</tr>
-->

		<!--<tr>
			<th class="txtLeft" rowspan="2">면접희망일<span class="star">*</span></th>
            <td class="txtLeft">
            	<label><input name="hopestatus" type="radio" value="4" checked ><strong class="point">일반</strong></label>
				<label><input name="hopestatus" type="radio" value="52" class="ml15"><strong class="point">군복무 or 해외체류</strong></label>
            </td>

		</tr>-->
      <!--  <tr>
        <td class="txtLeft">
        		<select name="hopedate" id="hopedate" class="w20" title="면접희망일(년)">
                    <option value="">개별면접</option>
                </select>
				<!--<select name="hopedate1" id="hopedate1" class="w10" title="면접희망일(년)">
				</select>년&nbsp;&nbsp;
				<select name="hopedate2" id="hopedate2" class="w10 " title="면접희망일(월)">
				</select>월&nbsp;&nbsp;
				<select name="hopedate3" id="hopedate3" class="w10" title="면접희망일(일)">
				</select>일&nbsp;&nbsp;
				<span class="ml10">※ 면접시간 확인 후 전화로 면접확정일을 알려드리겠습니다.</span>
			</td>
        </tr>-->


	<tr>
	<th class="txtLeft">지원경로<span class="star">*</span></th>
		<td class="txtLeft" id="ImotivationWrap">
        	<ul class="ImotivationWrap">
				<li>
                    <input type="radio" name="Imotivation" data-imotivation="" value="" class="input-check"><label> 없음 </label>
                </li>
                <li>
                    <input type="radio" name="Imotivation" data-imotivation="" value="학교설명회" class="input-check"><label> 학교설명회 </label>
                </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="교사 추천" class="input-check"><label> 교사 추천 </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="친구.지인 추천" class="input-check"><label> 친구,지인 추천 </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="온라인(카카오톡)상담" class="input-check"><label> 온라인(카카오톡)상담 </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="전화상담" class="input-check"><label> 전화상담 </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="인터넷 검색" class="input-check"><label> 인터넷검색 </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="입시 사이트" class="input-check mr2"><label> 입시 사이트 </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="SNS" class="input-check"><label> SNS </label>
                 </li>
                <li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="포스터" class="input-check"><label> 포스터 </label>
                </li>
				<li>
                	<input type="radio" name="Imotivation" data-imotivation="" value="진로체험" class="input-check"><label> 진로체험 </label>
                </li>
                 <li>
                	<input type="radio" name="Imotivation" data-imotivation="etc" value="기타" class="input-check"><label> 기타 </label>
                </li>
            </ul>
			<div id="ImotivationEtcWrap" class="blind">
				<input type="text" name="ImotivationEtc" class="w50" value="" maxlength="200" placeholder="지원경로 기타 사항을 입력하세요">
			</div>
		</td>
	</tr>


    <tr>
    	<th class="txtLeft">면접 유형<span class="star">*</span></th>
			<td class="txtLeft">
				<label><input name="recommend2" id="recommend2" type="radio" value="정규면접(토)" class="ml15"><strong class="point">정규면접(토)</strong></label>
				<label><input name="recommend2" id="recommend2" type="radio" value="개별면접(평일)" class="ml15"><strong class="point">개별면접(평일)</strong></label>
				<label><input name="recommend2" id="recommend2" type="radio" value="기타" class="ml15"><strong class="point">기타</strong></label>
			</td>
    </tr>

     <tr>
    	<th class="txtLeft">면접구분<span class="star">*</span></th>
			<td class="txtLeft">
				<label><input name="carea" id="carea" type="radio" value="offline" class="ml15"><strong class="point">오프라인(학교방문 대면) 면접</strong></label>
				<label><input name="carea" id="carea" type="radio" value="online" class="ml15"><strong class="point">온라인(학교 미 방문 비대면) 면접</strong></label>

			</td>
    </tr>




    <tr>
    <th class="txtLeft">추천인</th>
    	<td class="txtLeft">
        	<input type="text" name="recommend" value=""><span class="ml10">※ 추천인이 없을 경우 빈칸으로 두세요.</span>
        </td>
    </tr>
    <tr>
	<th class="txtLeft">세부상담 희망분야</th>
    	<td class="txtLeft">
        	<label><input type="radio" name="call_request" value="1" class="ml15"> <strong class="point">입시</strong></label>
			<label><input type="radio" name="call_request" value="2" class="ml15"> <strong class="point">진로</strong></label>
			<label><input type="radio" name="call_request" value="3" class="ml15"> <strong class="point">편입</strong></label>
			<label><input type="radio" name="call_request" value="4" class="ml15"> <strong class="point">취업</strong></label>
			<label><input type="radio" name="call_request" value="5" class="ml15"> <strong class="point">캠퍼스투어</strong></label>
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
		<div class="font-bold">본인은 한국IT직업전문학교에 입학하고자 소정의 서류를 갖추어 지원합니다.<br />
		<%=year(now)%>년 <%=month(now)%>월 <%=day(now)%>일</div><br />
		<a href="#" title="원서제출" class="btnReceipt blue" id="btn-submit">원서제출</a>
		<!--<a href="javascript:reset();" title="새로작성" class="btn01_gray">새로작성</a>-->
	</div>

</form>


<!-- 배너광고 (리타게팅) 집행 2017-05-22 -->
<script type="text/javascript">

var roosevelt_params = {

retargeting_id:'kuW5yBYDH2LZeXe_aasJGg00',

tag_label:'V3ccLGP9RC2aYgiC8TXYAg'

};

</script>

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

$("input:radio[name='school_gubun']").change(function() {
				var val = $(this).val();
				if(val==4){

					$("#privacyCk2_chk").val(val);
					$(".checkBox2").css("display","block");

						}else{

						$("#privacyCk2_chk").val();
						$(".checkBox2").css("display","none");
				};
			});


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
	//console.log("sk");
			var radioValue = $(this).val();
			$(".select-part-course > optgroup").remove();
			$("input[name=regyear]").val(radioValue);
		if(radioValue == "2021"){
			addstr ="<%=getCourse2("2021")%>";
			$("input[name=interviewtype]").val("<%=GetInterviewtype(2021)%>");
			$("input[name=regtype]").val("<%=GetRegtype(2021)%>");
  			// init();
		}else if (radioValue == "2022"){
			addstr = "<%=getCourse("2022")%>";
			$("input[name=interviewtype]").val("수시 1차");
			$("input[name=regtype]").val("<%=GetRegtype(2022)%>");
		}

		$('.select-part-course').append(addstr);

		});




/*	$("input[name=checkyear]").change(function() {
		var radioValue = $(this).val();
		var addstr = "";
		$(".select-part-course > optgroup").remove();
		$("input[name=regyear]").val(radioValue);

		if(radioValue == "2020"){
			addstr ="<%=getCourse("2020")%>";
			$("input[name=interviewtype]").val("<%=GetInterviewtype(2020)%>");
			$("input[name=regtype]").val("<%=GetRegtype(2020)%>");
  		 init();
		}
		else if (radioValue == "2021"){
			$("input[name=interviewtype]").val("<%=GetInterviewtype(2021)%>");
			$("input[name=regtype]").val("<%=GetRegtype(2021)%>");
			addstr = "<%=getCourse("2021")%>";
			$("#hopedate").find("option").remove().end();
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var dayOfWeek = week[new Date().getDay()];
			if(dayOfWeek != "토"){
				$('<option>').val('<%=getMeetingDate(0)%>').text('<%=getMeetingDate(0)%>').appendTo($('#hopedate'));
			}
			$('<option>').val('<%=getMeetingDate(1)%>').text('<%=getMeetingDate(1)%>').appendTo($('#hopedate'));
			$("#hopedate").append("<option value=''>개별면접</option>");
			//$("#hopedate3").find("option").remove().end();
			//$("#hopedate3").append("<option value='02' >02</option>");
		}
		$('.select-part-course').append(addstr);
	});*/

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
