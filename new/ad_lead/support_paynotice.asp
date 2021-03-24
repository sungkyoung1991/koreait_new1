<%
category="7"
menu="9"
sub_menu="1"
title="s07_009"

category0 = category
title_nm = "등록금납부 확인"
%>
<!-- #include virtual="/new/_include/inc_header.asp" -->
<!-- #include virtual="/new/top.asp" -->

<script language="JavaScript" type="text/JavaScript">
<!--
function onlyNumber() {
	if ( event.keyCode<48 || event.keyCode>57 )
		event.returnValue=false;
}

function SendFn() {
	var str;
	
	str = document.theForm.name.value;
	if (str == "") {
		alert("이름을 입력해주세요");
		document.theForm.name.focus();
		return;
	}
	
//	str = document.theForm.jumin1.value;
//	if (str == "") {
//		alert("주민번호를 입력해주세요");
//		document.theForm.jumin1.focus();
//		return;
//	}
	
//	str = document.theForm.jumin2.value;
//	if (str == "") {
//		alert("주민번호를 입력해주세요");
//		document.theForm.jumin2.focus();
//		return;
//	}

		str = document.theForm.studentnum.value;
	if (str == "") {
		alert("수험번호를 입력해주세요");
		document.theForm.studentnum.focus();
		return;
	}

	document.theForm.action = "support_paynotice_finish.asp";
	document.theForm.submit();
}

function reset() {
	document.theForm.name.value = "";
	document.theForm.jumin1.value = "";
	document.theForm.jumin2.value = "";
}
//-->
</script>

<div class="content_body">
<form name="theForm" method="post">	
	<h1 class="tit01">등록금납부 확인</h1>
	<div class="info">
		<dl>
			<dd class="acenter">
				지원자 성명과 수험번호를 넣으십시오.<br />문의사항은 입시홍보실(02-578-5551)에 문의하시기 바랍니다.
			</dd>
		</dl>
		<div class="acenter pb10">
			<label for="name">지원자 성명:</label> <input name="name" id="name" type="text" style="ime-mode:active;" value="" />
			<label for="studentnum">수험번호:</label> <input size=7 name="studentnum" id="studentnum" maxlength="8" type="text" style="ime-mode:disabled;"  class="w100" value="<%=request("studentnum")%>">
		</div>
	</div>
	<div class="acenter pt10">
		<a href="#" onclick="SendFn();" class="btn01_blue">조회하기</a>
		<a href="#" onclick="reset();"  class="btn01_gray">다시입력</a>
	</div>
</form>							
</div>
<!-- #include virtual="/new/bottom.asp" -->