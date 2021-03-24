<!-- #include virtual="/inc/Service_Inc.inc" -->
<!-- #include Virtual="/inc/2018/inc_html_head2020.inc" -->


 
 
<script type="text/javascript">
$(document).ready(function(){
	
	
	
	  $("#sch").click(function(e) {
		  
		var name = $("#name").val();
		var studentnum = $("#studentNum").val();
 
		if ($("#name").val().length < 1) {
			alert("지원자 성명을 입력하세요.");
			return;
		}
	
		
		if ($("#studentNum").val().length < 1) {
			alert("수험번호 입력하세요.");
			return;
		}
		
		
	//	console.log("sk : " , name);
	//	console.log("sk2 : " , studentnum);
		getData(name, studentnum);
		
    });

	
});


function getData(name, studentnum){
	
	//$("form[name=theForm]").get(0).submit();
	
	// ajaxForm
	var url = "./accepted_dao.asp";
	var targetID = "";
	var resultFn = "";
	var params = {"name" : name, "studentnum":studentnum};
	var post = "post";
	ajaxSendParam(url, params, post, targetID, resultFn);
	
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

</script>


<!-- S: page -->
<!-- #include Virtual="/inc/2018/inc_body_header2020.inc" -->

<script type="text/javascript">



</script>

<div id="subContents">
    <div data-role="page" class="slidePage" id="itstoryPage" data-next="" data-prev=""  data-defaults="ture" > 
        <section class="sub_in_wrap">
            <!--#include Virtual= "/inc/2018/inc_body_greetings_bannner.inc"-->
            <div class="candidate_wrap pwrap application" data-enhance="false">
                <p class="wp10 tal">지원자 이름과 수험번호를 입력하세요<br>문의사항은 입학홍보실(02-578-5551)로 문의하시기 바랍니다.</p>
                 <form data-ajax="false" name="theForm" id="theForm"  method="post" action="">
                <table summary="지원자조회">
                   <caption>지원자조회</caption> 
                   <tbody>
                       <tr>
                           <td class="candiTitle" ><h3 class="title">지원자 성명</h3></td>
                           <td class="candiTxt"><input type="text" name="name" id="name"></td>
                       </tr>
                       <tr>
                           <td class="candiTitle"><h3 class="title">수 험 번 호</h3></td>
                           <td class="candiTxt"><input  type="text" name="studentNum" id="studentNum"></td>
                       </tr>
                   </tbody>
                </table>
                </form>
                <div class="btnWrap">
                    <a data-ajax="false" id= "sch" class="blue2020 ui-link">조회하기</a>

                </div>
            </div>
            <!-- footer (하단) -->
            <!--#include Virtual= "/inc/2018/inc_body_footer.inc"-->
        </section>
    </div>	
</div> <!-- page END-->
     

<!-- <script>
  fbq('track', 'ViewContent');
</script> -->

<!--푸터부분 인클루드-->
<!-- include virtual="/inc/inc_web_log_script_utf8.inc" -->

<script type='text/javascript' src='/js/2018/main.js'></script> 
  	
</body>
</html>
