<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
category="3"
menu="6"
sub_menu="1"
title="s07_006"
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
' 0 : Pname, Course
'희망학과(part)
Function GetPartListToArray(ByVal regyear)
	Dim SQL : SQL = "select distinct replace(Pname,'스쿨', '계열') as Pname, Course from dbo.ClassName where study_year='2022' and scode='5' and Status='1' and Pname != 'e-스포츠계열' order by Course"
	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
	GetPartListToArray = arrRs
End Function

' 0 : PName, Hname
'희망학과(Course)
Function GetCourseListToArray(ByVal regyear)
	Dim SQL : SQL = "select replace(Pname,'스쿨', '계열') as Pname, Hname from ClassName where Study_year='2022' and scode='5' and Status='1' and Pname != 'e-스포츠계열' order by orderby"
	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
	GetCourseListToArray = arrRs
End Function
%>

<script type="text/javascript">
$(document).ready(function() {
	$("#zipcode").on("click", function(e) {
		goJusoPopup();
	});

	$("#zip_btn").on("click", function(e) {
		e.preventDefault();
		goJusoPopup();
	});
});

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

function SendFn(e) {

    $(".btnReceipt").css("display","none");
	try { var evt = e || window.event; evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;	} catch(e) {}

	var str;

	str = document.theForm.course1.value;
	if (str == "") {
		alert("관심계열을 선택해주세요");
		document.theForm.course1.focus();
		return;
	}

	str = document.theForm.name1.value;
	if (str == "") {
		alert("이름을 입력해주세요");
		document.theForm.name1.focus();
		return;
	}

	str = document.theForm.hp1.value;
	if (str == "") {
		alert("핸드폰 번호를 입력해주세요");
		document.theForm.hp1.focus();
		return;
	}

	str = document.theForm.hp2.value;
	if (str == "") {
		alert("핸드폰 번호를 입력해주세요");
		document.theForm.hp2.focus();
		return;
	}

	str = document.theForm.hp3.value;
	if (str == "") {
		alert("핸드폰 번호를 입력해주세요");
		document.theForm.hp3.focus();
		return;
	}

	if (theForm.email1.value == "") {alert("E-mail을 입력하여 주십시오.");theForm.email1.focus();return;}
	if (theForm.email2.value == "self" & theForm.email3.value == "") {alert("E-mail을 입력하여 주십시오.");theForm.email3.focus();return;}


	str = document.theForm.school_year.value;
	if (str == "") {
		alert("학년을 선택해주세요");
		document.theForm.school_year.focus();
		return;
	}

	str = document.theForm.address1.value;
	if (str == "") {
		alert("주소를 입력해주세요");
		goJusoPopup();
		return;
	}

	str = document.theForm.address2.value;
	if (str == "") {
		alert("나머지 주소를 입력해주세요");
		document.theForm.address2.focus();
		return;
	}


	//document.theForm.action = "counsel_request_post_proc.asp";
	//document.theForm.submit();

	var url = $("#theForm").attr("action");
	var post = $("#theForm").attr("method");
	var params = $("#theForm").serialize();
	var targetID = "";
	var resultFn = "";

	ajaxSendParam(url, params, post, targetID, resultFn);
}

function searchSchool(e) {
	try { var evt = e || window.event; evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;	} catch(e) {}
	var Hschool = window.open("HfindSchool2.asp","Hschool","top=0,left=0,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=0,copyhistory=0,width=420,height=120");
	Hschool.focus();
}

function check_mail() {
	var form=document.theForm;

	if (form.email2.value=='self') {
		form.email3.style.display='';
		form.email3.focus();
		form.email2.selectedindex=12;
	} else {
		form.email2.value=form.email2.value;
		form.email3.style.display='none';
		form.email3.value='';
	}
}

function FrmReset(e) {
	try { var evt = e || window.event; evt.preventDefault ? evt.preventDefault() : evt.returnValue = false;	} catch(e) {}
	document.theForm.reset();
}

$(document).ready(function(){
	//textbox 포커싱 색 변화
	$('input').focus(function(){
		$(this).addClass("input-focus");
	}).blur(function(){
		$(this).removeClass("input-focus");
	});

	//계열선택
	$("select.select-part-course").change(function() {
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
<style type="text/css">
	.input-focus { border:1px #0076a3 solid; }
	select.select-part-course { width:200px; }
	select.select-part-course option { padding:2px 10px; }
</style>

<div class="entrance">
<Form name="theForm" id="theForm" action="counsel_request_post_proc.asp" method="post">
	<div class="sec">
		<h3 class="title02 frist">본교의 입학자료를 보내드립니다.</h3>
		<table class="contentsTable inputForm" summary="신입생 원서접수 지원자 인적사항">
			<caption>신입생 원서접수 지원자 인적사항</caption>
		<colgroup>
			<col width="15%">
			<col width="*">
		</colgroup>
			</colgroup>
			<tbody>
				<tr>
					<th  class="txtLeft"><label for="course1">관심계열</label></th>
					<td  class="txtLeft">
<%
'지원학과 값 불러오기 - 2016.04.19
regyear = GetSelectionDateArrayToStr(0)
Response.Write "<input type=""hidden"" name=""regyear"" id=""regyear"" value=""" & regyear & """ />"

PartListArray = GetPartListToArray(regyear) : CourseListArray = GetCourseListToArray(regyear)
Response.Write "<input type=""hidden"" name=""part1"" id=""part1"" class=""input-part"" value="""" />"
Response.Write "<select name=""course1"" id=""course1"" class=""select-part-course"">"
Response.Write "<option value="""">관심계열선택</option>"

If IsArray(PartListArray) Then
	For i = 0 To Ubound(PartListArray,2)
		' 0 : Pname, Course
		rs_pname = PartListArray(0,i)

		Response.Write "<optgroup label=""" & rs_pname & """>"

		If IsArray(CourseListArray) Then
			For j = 0 To Ubound(CourseListArray,2)
				' 0 : PName, Hname
				rs_pname2 = CourseListArray(0,j)
				rs_hname2 = CourseListArray(1,j)

				If StrComp(rs_pname, rs_pname2) = 0 Then
					'Response.Write "<option value=""" & rs_hname2 & """> - " & Replace(rs_hname2,"전공","") & "</option>"
					Response.Write "<option value=""" & rs_hname2 & """> - " & Replace(Replace(rs_hname2,"시각디자인전공(3년제)","시각디자인"),"전공","") & "</option>"
				End If
			Next
		End If

		Response.Write "</optgroup>"
	Next
End If

Response.Write "</select>"
%>
					</td>
				</tr>
				<tr>
					<th  class="txtLeft"><label for="name1">이름</label></th>
					<td  class="txtLeft"><input name="name1" id="name1" type="text" maxlength="20"  class="w20"/></td>
				</tr>
				<tr>
					<th  class="txtLeft"><label for="hp1">휴대전화</label></th>
					<td  class="txtLeft">
						<select name="hp1" id="hp1" class="w10">
							<option value="010" selected>010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						-
						<input name="hp2" type="text" maxlength="4" onKeyPress="onlyNumber(event);" title="휴대전화(중간자리)"   class="w10"/>
						-
						<input name="hp3" type="text" maxlength="4" onKeyPress="onlyNumber(event);" title="휴대전화(끝자리)"  class="w10"/>
					</td>
				</tr>
				<tr>
					<th class="txtLeft"><label for="school1">고등학교</label></th>
					<td class="txtLeft">
						<input name="school1" id="school1" type="text" placeholder="고등학교를 검색해주세요." class="w20" maxlength="50" readonly />
						<input name="Hcode" type="hidden" />
						<input name="Harea" type="hidden" />
						<a href="HfindSchool2.asp" onclick="searchSchool(event);" title="고등학교검색" class="btnZip btnPost mr10" target="_blank">고등학교검색</a>

						<select name="school_year" class="w10" title="학년 선택" onChange="setInput(this.value);" >
							<option value="">== 학년 ==</option>
							<option value="중1학년">중1학년</option>
							<option value="중2학년">중2학년</option>
							<option value="중3학년">중3학년</option>
							<option value="고1학년">고1학년</option>
							<option value="고2학년">고2학년</option>
							<option value="고3학년">고3학년</option>
							<option value="검정고시">검정고시</option>
							<option value="외국계">외국계</option>
                            <option value="기타">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="txtLeft"><label for="email1">이메일</label></th>
					<td class="txtLeft">
						<input name="email1" id="email1" type="text" maxlength="100" class="w20"/>
						<input type="text" name="email3" style="display:none;" class="w20"  maxlength="100" title="이메일 나머지 주소 입력" /> @
						<select name="email2" class="w15" onChange="check_mail();" title="이메일 나머지 주소 선택">
							<option value="chol.com">chol.com </option>
							<option value="dreamwiz.com">dreamwiz.com </option>
							<option value="empal.com">empal.com </option>
							<option value="hanmir.com">hanmir.com </option>
							<option value="hanafos.com">hanafos.com </option>
							<option value="hotmail.com">hotmail.com </option>
							<option value="lycos.co.kr">lycos.co.kr </option>
							<option value="nate.com">nate.com </option>
							<option value="naver.com" selected>naver.com </option>
							<option value="netian.com">netian.com </option>
							<option value="paran.com">paran.com </option>
							<option value="yahoo.co.kr">yahoo.co.kr </option>
							<option value="self">직접입력 </option>
					 </select>
					</td>
				</tr>
				<tr>
					<th class="txtLeft"><label for="address1">주소</label></th>
					<td class="txtLeft">
						<input name="zipcode" type="text" id="zipcode" class="w10 mb05" maxlength="5" readonly title="우편번호" />
						<a href="#" title="우편번호검색" class="btnZip btnDouble" id="zip_btn" target="_blank">우편번호검색</a><br/>
						<input name="address1" type="text" id="address1" class="w35" maxlength="100" readonly />
						<input name="address2" type="text" id="address2" class="w35" maxlength="100" title="상세주소입력" />
					</td>
				</tr>
				<tr style="display:none;">
					<th class="txtLeft">지원상태</th>
					<td class="txtLeft">
						<label><input type="radio" name="r_status" value="1" checked="checked" class="input-radio" />본교 지원</label>
						<label><input type="radio" name="r_status" value="0"  class="input-radio" />타대학 지원</label>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btnWrap">
		<a href="#" onclick="SendFn(event);" title="자료신청" class="btnReceipt blue">자료신청</a>
		<a href="#" onclick="FrmReset(event);" title="새로작성" class="btnReceipt grey">취소</a>
	</div>
</form>
</div>
<%
table = "DataRequest2008"

'Page 검사 - 2016.06.22
If Not isNumeric(request("page")) Or request("page") = "" Or request("page") = "0" Then
	page = 1
else
	page = request("page")
end if

session("page") = page

subsql = " scode=5 And (deleter is null or deleter='' or deleter='[student]') And (regdatetemp Between 20160301000000 And CONVERT([bigint],CONVERT([varchar](8),getdate(),(112))+replace(CONVERT([varchar](8),getdate(),(114)),':',''),(0))) and name1<>'' "

' 페이징 리스트
' Set_PageSize : 페이지 사이즈
' Set_PageNum : 현재페이지
' Set_Field : 필드명
' Set_Table : 테이블명
' Set_Where : 검색조건
' Set_OrderBy : 정렬조건
' Set_PageCount : 전체페이지 갯수(반환)
' Set_RecordCount : 전체리스트 갯수(반환)

page_count = 10

PageSize = 15
PageNum = page

Field = "name1, now1, send_check"
WhereStr = subsql
OrderBy = "Order by regdatetemp desc, seq desc"
PageCount = 0 : RecordCount = 0

'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
rsArray = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, table, WhereStr, OrderBy, PageCount, RecordCount)

If IsArray(rsArray) Then
%>
<link href="/new/css/list.css" rel="stylesheet" type="text/css" />

<div class="questWrap">
	<div class="quest mt50">
		<table class="board_list" style="display:none;">
		<caption>
			<strong>입학자료신청 목록</strong>
			<p>입학자료신청 목록: 이름, 신청일, 상태를 제공</p>
		</caption>
		<colgroup>
			<col width="20%">
			<col width="*%">
			<col width="30%">
		</colgroup>
		<thead>
			<tr >
				<th scope="col" class="firstnum bg-c-fa font-c-w acenter">이름</th>
				<th scope="col" class="bg-c-fa font-c-w acenter">신청일</th>
				<th scope="col" class="bg-c-fa font-c-w acenter">상태</th>
			</tr>
		</thead>
		<tbody>
		<%
			For i = 0 To UBound(rsArray,2)
				news = ""
				width = ""
				name = rsArray(0,i)
				'wdate = left(rsArray(1,i),13)
				wdate = rsArray(1,i)
				send_check = rsArray(2,i)

				If StrComp(send_check,1) = 0 Then
					send_check_str = "<span style=""font-weight:bold;letter-spacing:1px;"">발송</span>"
				Else
					send_check_str = "<span style=""color:#666;"">대기중</span>"
				End If
		%>
			<tr class="notice_list">
				<td><%=name%><%=news%></td>
				<td><%=wdate%></td>
				<td><%=send_check_str%></td>

			</tr>
		<%
			Next
		%>
		</table>
	</div>
</div>

 <% 'Call PageCounterWebPrevNext(Page, PageCount, page_count,"", "") %>
<% End If %>

<script>
	function setInput(val){
		var school_year = val;
		if(school_year == "기타"){
			//$("#school1").removeAttr("readonly");
			$("input[name=school1]").attr("readonly",false);
			$("input[name=school1]").attr("disabled",false);
			$("input[name=school1]").attr("disabled",false);
			$("input[name=school1]").attr("placeholder","기타정보를 입력해주세요.");
		}else{
			$("input[name=school1]").val("");
			$("input[name=school1]").attr("readonly",true);
			$("input[name=school1]").attr("disabled",false);
			$("input[name=school1]").attr("placeholder","고등학교를 검색해주세요.");
		}
	}

</script>
	<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
