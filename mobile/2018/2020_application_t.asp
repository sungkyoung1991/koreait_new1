<!-- #include virtual="/inc/Service_Inc.inc" -->
<!-- #include Virtual="/inc/2018/inc_html_head2020.inc" -->
<%
'============ 소스참조 : /koreaitweb/mobile/entrance/application.asp ============
'============ contents 주석처리 영역안에 추가 ===================================
%>
<%
' 0 : From_To, Study_year, selection, From_Date, To_Date, Document, selection_pay, Pass_announce, Payment, RegType [9]
SelectionListToArray = GetSelectionListToArray()
Dim addStr

'원서접수 일자
Function GetSelectionDateAry(ByVal sch, ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "exec HAkSA_원서접수일정_조회_L @mode='" & sch & "', @type='" & Set_type & "' "
	'Response.Write sql
	GetSelectionDateAry = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

'Dim ArySelection : ArySelection = GetSelectionDateAry("test", 102)
Dim ArySelection : ArySelection = GetSelectionDateAry("Selection", 102)

RegYear = "2022"

IF isArray(ArySelection) Then
	IF RegYear = "" Then
		RegYear = ArySelection(0).item("Study_year")
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



%>
<%

%>

<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>

<script type="text/javascript">
var _nasa={};
_nasa["cnv"] = wcs.cnv("4","1"); // wcs.cnv("전환유형", "전환가치") 세팅.구매 유형인 경우 결제금액은 상황에
</script>


<script type="text/javascript">
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

function jumin() {
	alert('우편번호조회 버튼을 눌러 거주지 동을 입력해 주세요!');
}

function unCheckObj(obj) {
	$("#"+obj).addClass("blink");
	$("html, body").delay(100).animate({scrollTop: $("#"+obj).offset().top-120 }, 1000);
	$("#"+obj).focus();
}

function check_theForm() {
	var val = "";

	with(document.theForm) {

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


		if(privacyCk.checked == false) {
			if (!confirm("개인정보보호정책 및 이용에 동의를 하지 않았습니다.\n\n동의하고 진행하시겠습니까?")) {
				privacyCk.focus();
				return;
			} else {
				$("#privacyCk").click();
			}
		}

		if (course1.selectedIndex == 0) {
			alert ("지원학과 1지망을 반드시 선택해 주세요");
			unCheckObj("course1");
			//course1.focus();
			return;
		}

		if (course2.selectedIndex == 0) {
			alert ("지원학과 2지망을 반드시 선택해 주세요");
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

		val = $("#jumin1").val().num();
		$("#jumin1").val(val);
		if (val.length < 6) {
			alert ("생년월일을 반드시 입력해 주세요");
			unCheckObj("jumin1");
			//jumin1.focus();
			return;
		}

		val = $("#mobile2").val().num();
		$("#mobile2").val(val);
		if (val.length < 3) {
			alert ("지원자의 연락처를 반드시 입력해 주세요");
			unCheckObj("mobile2");
			//mobile2.focus();
			return;
		}

		val = $("#mobile3").val().num();
		$("#mobile3").val(val);
		if (val.length < 4) {
			alert ("지원자의 연락처를 반드시 입력해 주세요");
			unCheckObj("mobile3");
			//mobile3.focus();
			return;
		}


		if (Hname.value.length == 0 ) {
			alert ("고등학교명 (검정고시 포함)을 입력해 주세요");
			unCheckObj("Hname");
			$("#btn-find-school").trigger("click");
			//searchSchool();
			return;
		}



		action = "write_ok_t.asp";
		submit();
	}
}

$(document).ready(function() {



	$("#zipcode").on("click", function(e) {
		goJusoPopup();
	});

	$("#zip_btn").on("click", function(e) {
		e.preventDefault();
		goJusoPopup();
	});


	$("#name, #jumin1, #mobile2, #mobile3, #Hname, #Hgdate1, #Hgdate2, #address1").on("propertychange change keyup paste input", function() {

		$(this).removeClass("blink");
	});

	$("#name, #jumin1, #mobile2, #mobile3, #Hname, #Hgdate1, #Hgdate2, #address1").on("focus",function(){
	//	$(this).removeClass("blink");
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
		var $frm = $("#theForm");
		var url = "write_temp_list_ok.asp";
		var param = $frm.serialize();
		$.post(url, param);
	});

	$("#address1").on("focusout", function(e) {
		if (!!$(document).data("addr")) { return; }

		var js_name = $.trim($("#name").val());
		var js_mobile2 = $.trim($("#mobile2").val());
		var js_mobile3 = $.trim($("#mobile3").val());

		if (!(js_name.length >= 1 && js_mobile2.length >= 3 && js_mobile3.length >= 4)) { return; }

		$(document).data("send", true);
		$(document).data("addr", true);
		var $frm = $("#theForm");
		var url = "write_temp_list_ok.asp";
		var param = $frm.serialize();
		$.post(url, param);
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
<style type="text/css">
label {
	margin-bottom: 0 !important;
	display: inline !important;
}
input[type=radio], input[type=checkbox] {
	height: 1.0em !important;
}
select option{
  /*text-indent: 15px;*/
}
#ImotivationWrap label {
	margin-left: 5px !important;
}
h3.title {
	margin-top: 5px;
}
.privacy-area {
	background: #EEE;
	color: #333;
	border: solid 2px #0076a3;
	padding-right: 10px;
	border-radius: 5px;
}
.privacy-area ul.privacy {
}
.privacy-area ul.privacy li {
	list-style: decimal;
}
.privacy-area ul a {
	color: #333;
}
.privacy-area ul a:hover {
	color: #000;
	text-decoration: underline;
}
.privacy-area ul a:focus, .privacy-area a:active {
	text-decoration: none;
	color: #333;
}
.courseWrap, .HgdateWrap, .yearWrap {
	display: block;
}
.courseWrap li, .HgdateWrap li, .yearWrap li {
	float: left;
	min-width: 7.5rem;
	word-break: keep-all;
}
.entrance {
	margin: 15px;
	text-align: left;
}
.entrance .contentsTable tr th {
	word-break: keep-all;
}
.btnPost {
	margin-top: 0.2rem;
}
.hopedateWrap li {
	float: left;
	width: 30%;
}
.hopedateWrap li:nth-child(2), .hopedateWrap li:nth-child(3) {
	margin-left: 0.4rem;
}
.input-disabled {
	background-color: #EBEBE4 !important;
	border: 1px solid #ABADB3 !important;
	padding: 2px 1px !important;
}
.select-part-course {
	text-align: left !important;
}
.checkBox ul li {
	list-style: decimal;
}
label{font-size:0.8em!important;}
input{vertical-align:-2px;margin-left:15px;}

@media screen and (min-width:540px ) {
.HgdateWrap li {
	min-width: 33.3%
}
.HgdateWrap li:nth-child(2) {
	margin-left: 1rem;
	min-width: 25%;
}
.courseWrap li {
	min-width: 40%
}
.courseWrap li:nth-child(2) {
	margin-left: 1rem;
}
.address {
	max-width: 30%;
}

}

@media screen and (max-width:539px ) {
.HgdateWrap li:nth-child(1) {
	margin-bottom: 0.2rem;
}
.blink {
	-webkit-animation: blink 2.0s linear infinite;
	-moz-animation: blink 2.0s linear infinite;
	-ms-animation: blink 2.0s linear infinite;
	-o-animation: blink 2.0s linear infinite;
	animation: blink 2.0s linear infinite;
	border: 1px solid rgba(81, 203, 238, 1);
}
 @keyframes blink {
 0% {
box-shadow: 0 0 15px rgba(81, 203, 238, 1);
}
 50% {
box-shadow: none;
}
 100% {
box-shadow: 0 0 15px rgba(81, 203, 238, 1);
}
}
 @-webkit-keyframes blink {
 0% {
box-shadow: 0 0 15px rgba(81, 203, 238, 1);
}
 50% {
box-shadow: 0 0 0;
}
 100% {
box-shadow: 0 0 15px rgba(81, 203, 238, 1);
}
}
</style>
<!-- S: page -->
<!-- #include Virtual="/inc/2018/inc_body_header2020.inc" -->

<img src="/ms1/images/tm_b.jpg" style="width:100%; margin-top:100px; margin-bottom:-120px; ">

<div id="subContents">
	<div data-role="page" class="slidePage" id="itstoryPage" data-next="" data-prev=""  data-defaults="ture" >
		<section class="sub_in_wrap">

			<!--- contents start --->
			<form name="theForm" id="theForm" method="post">
				<div class="entrance application" data-role="content" data-enhance="false">
					<input type="hidden" name="tempPhoto" />
					<input type="hidden" name="regyear" value="<%=regyear%>" />
					<input type="hidden" name="interviewtype" value="<%=interviewtype%>" />
					<input type="hidden" name="regtype" value="<%=regtype%>" />

                    <input type="hidden" id="privacyCk2_chk" value="" />

					<!--	<input type="hidden" name="admission" value="1" />-->

					<script type="text/javascript">
					function privacyCk_alert(e) {
						var evt = e || window.event;
						if (evt.preventDefault) { evt.preventDefault(); } else { evt.returnValue = false; }

						alert("한국IT직업전문학교 개인정보취급방침\n\n'(재)한국IT직업전문학교'는 (이하 '학교') 이용자의 개인정보를 중요시하며, '정보통신망 이용촉진 및 정보보호'에 관한 법률을 준수하고 있습니다.\n학교 개인정보취급방침을 통하여 이용자가 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.\n만일 개인정보취급방침을 개정하는 경우에는 웹사이트 및 게시판 공지사항(또는 개별공지)을 통하여 안내해 드립니다.\n\n- 본 방침은 : 2008 년 07 월 01 일 부터 시행됩니다.\n\n■ 개인정보 수집 항목\n학교는 학생의 수업 진행, 학습자 등록, 학점인정 신청, 상담, 학사 행정 안내 및 운영 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.\nο 수집항목\n이름, 주민등록번호, 핸드폰 번호, 로그인ID, 비밀번호, 자택 전화번호/주소, 이메일, 학력/출신학교, 신장/체중, 사진, 가족관계, 각종 신청서를 통해 작성되는 개인 인적 사항(기초생활수급자 해당 여부, 국가보훈 대상자 여부 등), 성적 등 학적사항, 환불계좌, 인터넷 학사서비스 이용시 발생하는 접속로그, 쿠키, IP정보 등이 생성되어 수집될 수 있습니다.\nο 개인정보 수집방법\n회원가입, 상담신청, 온라인상담, 학습자등록 서류 제출, 장학금 신청 등 각종 학사운영을 위한 신청서 제출 등\n\n■ 개인정보의 수집 목적\n학교는 수집한 개인정보를 다음의 목적을 위해 활용합니다.\nο 학습자 등록, 학점인정 및 학위 수여를 위한 정보 제공\nο 학습 안내 및 학사 행정 서비스, 학생 복지\nο 학생 학업 능력 향상을 위한 개인 상담\n\n■ 개인정보의 보유 및 이용기간\n학습자가 학교에서 제공하는 교육서비스를 이용하는 동안 학교는 이용자의 개인정보를 계속적으로 보유하며 지속적인 교육서비스 제공 등을 위해 이용합니다. 단, 학습자가 졸업 및 자퇴하거나 제적되어 학적을 소멸하였을 경우에는 평생교육 학점은행제 학사 운영 지침에 따라 의무 보관 기간 동안만 보관을 합니다.\nο 학점은행제 학사 운영 지침에 의한 2년 의무보존 자료\n정기 평가지 및 평가 기준안, 과제물 및 평가 기준안, 실험실습 근거 자료 및 평가표\nο 학점은행제 학사 운영 지침에 의한 영구 보존 자료\n성적전표, 출석부\nο 학습자 관리를 위한 자료의 보존 기간(학적 소멸 후 1년)\n이름, 주민등록번호, 핸드폰 번호, 로그인ID, 비밀번호, 자택 전화번호/주소, 이메일, 학력/출신학교, 상담자료(신장/체중, 사진, 가족관계 등 민감 개인정보 포함)\n\n■ 개인정보의 파기 절차 및 방법\n학교는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.\n파기절차 및 방법은 다음과 같습니다.\nο 파기절차\n회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함)\n내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다.\n별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유되어지는 이외의 다른 목적으로 이용되지 않습니다.\nο 파기방법\n- 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.\n- 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.\n\n■ 개인정보의 제 3자 제공\n학교는 이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.\nο 국가평생교육진흥원 : 학습자 등록 및 학점 인정 신청 등의 학위 과정 운영을 위해 꼭 필요한 정보\nο 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우\n\n■ 동의를 거부할 권리 및 동의를 거부할 경우의 불이익\n개인정보 수집, 제공 및 활용 동의서를 작성함에 있어 동의서 작성을 거부할 수 있는 동의거부권이 각 개인별로 있으며, 다만 동의 거부자에 대해서는 학점은행제 교육기관인 본교에서 발생한 학습자의 성적 관련 모든 자료가 무효화 됨을 인지하여야 합니다.\n\n■ 이용자 및 법정대리인의 권리와 그 행사방법\n이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은 당해 만 14세 미만 아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다.\n이용자 혹은 만 14세 미만 아동의 개인정보 조회,수정을 위해서는 '개인정보변경'(또는 '회원정보수정' 등)을 가입해지(동의철회)를 위해서는 '회원탈퇴'를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다.\n혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.\n귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이 통지하여 정정이 이루어지도록 하겠습니다.oo는 이용자 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “oo가 수집하는 개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.\n\n■ 개인정보 자동수집 장치의 설치, 운영 및 그 거부에 관한 사항\n학교는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 oo의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다. 학교은(는) 다음과 같은 목적을 위해 쿠키를 사용합니다.\nο 쿠키 등 사용 목적\n- 회원과 비회원의 접속 빈도나 방문 시간 등을 분석, 이용자의 취향과 관심분야를 파악 및 자취 추적, 각종 이벤트 참여 정도 및 방문 회수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공\n귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. \nο 쿠키 설정 거부 방법\n예: 쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.\n설정방법 예(인터넷 익스플로어의 경우)\n: 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보\n단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.\n\n■ 개인정보에 관한 민원서비스\n학교는 이용자의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자를 지정하고 있습니다.\n\n개인정보관리책임자 성명 : 김영일\n전화번호 : 02-578-5551\n이메일 : webmaster@koreait.ac.kr\n\n이용자는 학교의 교육서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로 신고하실 수 있습니다. 학교는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.\n기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.\n\n1.개인분쟁조정위원회 (www.1336.or.kr/1336)\n2.정보보호마크인증위원회 (www.eprivacy.or.kr/02-580-0533~4)\n3.대검찰청 인터넷범죄수사센터 (http://icic.sppo.go.kr/02-3480-3600)\n4.경찰청 사이버테러대응센터 (www.ctrc.go.kr/02-392-0330)\n");
					}
					</script>



					<table class="contentsTable inputForm">
						<colgroup>
						<col width="26%">
						<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th class="txtLeft">
									지원계열<span class="star">*</span>
								</th>
								<td class="txtLeft">
									<ul class="courseWrap">
										<li>
											<%

											'지원학과 값 불러오기 - 2016.04.19 /mobile/inc/function/Fn_Service.inc 참조
											PartListArray = GetPartListToArray(regyear) : CourseListArray = GetCourseListToArray(regyear)
											PartListArray2 = GetPartListToArray2(regyear) : CourseListArray2 = GetCourseListToArray2(regyear)
											'PartListArray = GetPartListToArray2019(regyear) : CourseListArray = GetCourseListToArray2019(regyear)
											Dim rs_year, rs_year2, rs_class
											Response.Write "<input type=""hidden"" name=""part1"" id=""part1"" class=""input-part"" value="""" />"
											Response.Write "<select name=""course1"" id=""course1"" class=""select-part-course w85"">"
											Response.Write "<option value="""">1지망선택...</option>"
											Response.Write getCourse(regyear)
											Response.Write "</select>"
											Response.Write "</li><li>"
											%>
											<label for="course2"></label>
											<%
											Response.Write "<input type=""hidden"" name=""part2"" id=""part2"" class=""input-part"" value="""" />"
											Response.Write "<select name=""course2"" id=""course2"" class=""select-part-course w85"">"
											Response.Write "<option value="""">2지망선택...</option>"
											Response.Write getCourse(regyear)
											Response.Write "</select>"
											%>
										</li>
									</ul>
								</td>
							</tr>

                            <tr>
								<th class="txtLeft">
									<label for="name">성명<span class="star">*</span></label>
								</th>
								<td class="txtLeft">
									<input id="name" name="name" value="" type="text" placeholder="한글성명을 입력해주세요." autocomplete="on" maxlength="15" />
								</td>
							</tr>
							<tr>
								<th class="txtLeft">
									<label for="jumin1">생년월일<span class="star">*</span></label>
								</th>
								<td class="txtLeft">
									<input id="jumin1" name="jumin1" value="" type="tel" placeholder="주민번호 앞 6자리를 입력해주세요." maxlength="6" onKeyPress="onlyNumber(event);" />
								</td>
							</tr>

                            <tr>
								<th class="txtLeft">
									<label for="mobile1">휴대폰<span class="star">*</span></label>
								</th>
								<td class="txtLeft">
									<select name="mobile1" id="mobile1" class="w20 ml15 mr15"  placeholder="휴대폰 앞번호를 입력해주세요.">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									-
									<label for="mobile2"></label>
									<input name="mobile2" type="tel" id="mobile2" maxlength="4" class="w20 mr10" onKeyPress="onlyNumber(event);" />
									-
									<label for="mobile3"></label>
									<input name="mobile3" type="tel" id="mobile3" maxlength="4" class="w20"  onKeyPress="onlyNumber(event);" />
								</td>
							</tr>

                            <tr>
								<th rowspan="1	" class="txtLeft">
									<label for="Hname">고등학교<span class="star">*</span></label>
								</th>
								<td class="txtLeft" colspan="2">
									<input id="Hname" name="Hname" value="" type="text" maxlength="100"  />
									<input name="Hcode" type="hidden" />
									<input name="Harea" type="hidden" />
									<br>

									</td>

                             <tr>


						</tbody>
					</table>

					<table class="contentsTable inputForm" summary="신입생 원서접수 지원자 인적사항">

						<colgroup>
						<col width="26%">
						<col width="*">
						</colgroup>
						<tbody>
						</tbody>
					</table>

					<table class="contentsTable inputForm">

						<colgroup>
						<col width="26%">
						<col width="*">
						</colgroup>
						<tbody>

        	<td colspan="3">

<div class="checkBox2" style="text-align:left; display:none;">
	서류 미비로 학력 인정이 되지 않아 학습자등록이 되지 않을 경우 수업을 받더라도 학점이수가 불가능합니다. 외국계 학력 인정의 여부는 본교와는 관계없이 평생교육법에 따라 국가평생교육진흥원에서 결정하는 사안으로 구비서류 준비와 학력 인정의 여부는 전적으로 학생 본인에게 있습니다. 본교는 학력 인정 절차만 안내할 뿐 이에 대한 어떠한 책임도 없음을 알려드립니다.

<br><br><br>

<span style="text-decoration:underline; font-style:bold; text-align:left"> 본인은 위의 주의사항을 잘 숙지하였으며 외국계 학력 인정의 문제로 학습자등록이 불가하여 학점이수가 불가능할 경우 전적으로 본인의 책임임을 확인합니다.</span>
<br><br>

<div class="privacyCheck"><label><input style="vertical-align:0px;" type="checkbox" name="privacyCk2" id="privacyCk2" value="1" class="input-check"> 동의합니다. </label></div>
</div>



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
					    <a href="#" onclick="privacyCk_alert(event);" class="bold">개인정보취급방침</a>을 자세히 보려면 클릭하세요.
					    <!--http://m.koreait.ac.kr/2018/2020_application.asp참고 팝업이 나옴: 연결해주세요..-->
					</div>
					<!--<div class="m05">
						<a href="#" onclick="privacyCk_alert(event);" class="bold">개인정보취급방침</a>을 자세히 보려면 클릭하세요.
					</div>-->

                    <div style="text-align:center;">
                   	 <p class="privacyCheck">
                    	<label for="privacyCk">
                        	<input type="checkbox" name="privacyCk" value="1" id="privacyCk" style="vertical-align:-2px;margin-top:10px;">
                  				예, 개인정보보호정책 및 이용에 동의합니다.
                    	</label>
				    </p>
                    </div>


					<div class="btnWrap"> <a href="#" class="btnReceipt blue2020 wid135"  onClick="check_theForm();">다음</a> </div>
				</div>
			</form>
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


				initYear();



					function initYear(){

						$("input[name=checkyear]").change(function() { /*sksksksksksksk*/

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

						}


				/* initial */
				function init() {
					var r = getTermToSaturday(idate)
					calendar = getPeriod(idate, addDates , r );
					//console.log(calendar);
					//makeYear(dy,dm)
					makeDate();
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

					//console.log(year+","+month);
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
									if(j["day"] < 10 && temyear == 2018 && j["month"] == 3 ){
										$('<option>').val(j["day"]).text(j["day"]).appendTo($('#hopedate3'));
									}else if( temyear != 2018 && j["month"] != 2) {
										$('<option>').val(j["day"]).text(j["day"]).appendTo($('#hopedate3'));
									}else if(j["day"] < 29 && temyear == 2018 && j["month"] == 2){
										$('<option>').val(j["day"]).text(j["day"]).appendTo($('#hopedate3'));
									}
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
								//console.log(j["year"])
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
			<!--- contents end ---->

			<!-- 팝업 -->
			<!--#include Virtual= "/inc/2018/inc_campus_pop.inc"-->
			<!-- footer (하단) -->
            <!--#include Virtual= "/inc/2018/inc_body_footer.inc"-->
		</section>
	</div>
</div>
<!-- page END-->

<!-- <script>
  fbq('track', 'ViewContent');
</script> -->

<!--푸터부분 인클루드-->
<!-- include virtual="/inc/inc_web_log_script_utf8.inc" -->

<script type='text/javascript' src='/js/2018/main.js'></script>
</body></html>
