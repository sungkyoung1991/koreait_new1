<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->

<%
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
Function GetStudentListToArray(ByVal Set_Num)
	If Len(Set_Num) = 0 Or Set_Num = "0" Then
		Exit Function
	End If

	Dim SQL : SQL = "Select Top 1 regyear, name, jumin, part1, part2, course1, course2,mobile From dbo.Student Where Num='" & Set_Num & "' And (Deleter='' Or Deleter is null)"

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

	GetStudentListToArray = arrRs
End Function

RsArray = GetStudentListToArray(Session("student_num"))
%>







<div class="entrance">
	<div class="sec">
		<h3 class="title02">입학원서 접수완료</h3>
		<p><font style="color:#FF00BF;">원서접수</font>가 정상적으로 되었습니다.</p>
<%
If IsArray(RsArray) Then
	regyear = RsArray(0,0)
	name = RsArray(1,0)
	jumin = RsArray(2,0)
	part1 = RsArray(3,0)
	part2 = RsArray(4,0)
	course1 = RsArray(5,0)
	course2 = RsArray(6,0)
	mobile =  RsArray(7,0)
%>

		<div class="acenter mb20">:::::::::: <%=regyear%>학년도 신입생모집 지원상황 ::::::::::</div>

		<table class="board_list">
		<caption>
			<strong>입학원서 접수확인</strong>
			<p>입학원서 접수확인: 성명, 생년월일, 지원전공, 비고 를 제공합니다.</p>
		</caption>
		<colgroup>
			<col class="w20p" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th class="first" scope="row">성명</th>
				<td style="text-align:left;padding-left:10px;"><%=name%></td>
			</tr>
			<tr>
				<th class="first" scope="row">생년월일</th>
				<td style="text-align:left;padding-left:10px;"><%=Left(jumin,6)%></td>
			</tr>
			<tr>
				<th class="first" scope="row">지원전공</th>
				<td style="text-align:left;padding-left:10px;">
					<div>-제1지망 : <%=course1%></div>
					<div>-제2지망 : <%=course2%><div>
				</td>
			</tr>
			<tr>
				<th class="first" scope="row">비고</th>
				<td style="text-align:left;padding-left:10px;"><%=regyear%>학년도 신입생모집에 지원하셨습니다.</td>
			</tr>
		</tbody>
		</table>



         <input type="hidden" name="receiver_1" value="<%=mobile%>"/>
         <input type="hidden" name="token" value=""/>




<% End If %>


 <script type="text/javascript">
var receiver_1 = $("input[name='receiver_1']").val();

$(document).ready(function(){

		aligok();

});//ready

function aligok(){


		 $.ajax({
			 type: "POST",
			 async : false,
			 enctype : "multipart/form-data",
			 url: "/new/kakao/aligo_token_r1.asp",
			 success :  function( data ) {
				$("input[name='token']").val(data.urlencode);
				var token = $("input[name='token']").val();

		//		console.log("token : " , token);

				$.ajax({
					type:"post",
					async : false,
					url:"/new/kakao/aligo_Ksend_r2.asp",
					datatype:"json",
					data: {"receiver_1":receiver_1, "token":token},
					success: function(data2){

//						console.log("ajax2 : " , data2);

					}//inner success
				});//inner ajax
			},// outter success
			 error : function( data ) {
				console.log('에러 : ');
			}//outter error
		  });//outter ajax

}


$("#btnSubmit").click(function (event) {

		 //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
		 event.preventDefault();

		 $.ajax({
			 type: "POST",
			 async : false,
			 enctype : "multipart/form-data",
			 url: "/new/kakao/aligo_token.asp",
			 success :  function( data ) {
				$("input[name='token']").val(data.urlencode);
				var token = $("input[name='token']").val();

				console.log("ajax1 : " , data);

				$.ajax({
					type:"post",
					url:"/new/kakao/aligo_Ksend.asp",
					datatype:"json",
					data: {"receiver_1":receiver_1, "token":token},
					success: function(data2){

						console.log("ajax2 : " , data2);

					}//inner success
				});//inner ajax
			},// outter success
			 error : function( data ) {
				console.log('에러 : ');
			}//outter error
		  });//outter ajax
	});//click fucntion


</script>


		<!--<div class="acenter mt20">카톡 : <a href="http://plus.kakao.com/home/jp5sl4b9" style="text-decoration:underline;" target="_blank">http://plus.kakao.com/home/jp5sl4b9</a></div>
		<div class="acenter mb20">면접날짜 확인은 카톡 친추로 확인가능 합니다.</div>-->

		<p class="acenter border-b mt20">
			저희 한국IT전문학교는 앞선 교육시스템을 갖추고, 실무위주의 교수진을 구성하여 <br />
			학생 여러분이 좀 더 나은 미래를 설계 하실수 있도록 노력하고 있습니다.<br />
			추후 작성하신 원서를 확인 후 면접일(1~2일내)을 전화로 안내하여 드리도록 하겠습니다.<br /><br />
			감사합니다.
		</p>
		<div class="btnWrap">
			<a href="<%=template_directory%>/" title="메인으로 가기" class="btnReceipt blue">메인으로 가기</a>
		</div>
	</div>
</div>

<!-- 다음CTS 컨버젼 스크립트 START -->
<script type="text/javascript">
//<![CDATA[
var DaumConversionDctSv="type=W,orderID=,amount=";
var DaumConversionAccountID="kuW5yBYDH2LZeXe_aasJGg00";
if(typeof DaumConversionScriptLoaded=="undefined"&&location.protocol!="file:"){
	var DaumConversionScriptLoaded=true;
	document.write(unescape("%3Cscript%20type%3D%22text/javas"+"cript%22%20src%3D%22"+(location.protocol=="https:"?"https":"http")+"%3A//s1.daumcdn.net/svc/original/U03/commonjs/cts/vr200/dcts.js%22%3E%3C/script%3E"));
}
//]]>



</script>


<script type="text/javascript" src="//wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
if(!wcs_add) var wcs_add = {};
wcs_add["wa"] = "s_49cb760f80a7";
if(window.wcs) {
wcs_do();
}
</script>


<!-- 다음CTS 컨버젼 스크립트 END -->

	<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
