<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
category="2"
menu="4"
sub_menu="1"

title="s02_004"
pageNum = "1"
subNum = "1"

%>
    <!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
    <!-- S: header 시작 -->
    <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
    <!-- E: header 종료 -->

     <!--2020-->
    <!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->
    <!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->

	<!-- #include virtual="/inc/2017/subHeader.asp" -->

<script type="text/javascript">
	/*
$(document).ready(function(){

	var link = document.location.href;
	var tab = link.split('/').pop();
	$('a[href="'+tab+'"]').toggle("click");

});

$(document).load(function(e) {
   // window.onload=sizeFrame;
});

function sizeFrame() {
	var frmCnt = document.getElementsByName("ifrm").length;

	for(var i = 1; i <f= rmCnt; i++ ){
		var iframecode = document.getElementById("ifrm"+i);
		if(iframecode.contentDocument) {
			iframecode.height = iframecode.contentDocument.documentElement.scrollHeight+100; //FF 3.0.11, Opera 9.63, and Chrome

		} else {
			iframecode.height = iframecode.contentWindow.document.body.scrollHeight+100; //IE6, IE7 and Chrome
		}
	}
}*/
</script>



<div class="tab">
		<ul>
			<li class="<%IF strcomp(request("cate"),1) = 0 or request("cate") = "" Then %>on<%ENd IF%>"><a href="#ifrm1">게임계열</a></li>
			<li class="<%IF strcomp(request("cate"),3) = 0 Then %>on<%ENd IF%>"><a href="#ifrm2">디지털콘텐츠계열</a></li>
			<li class="<%IF strcomp(request("cate"),2) = 0 Then %>on<%ENd IF%>"><a href="#ifrm3">정보보안계열</a></li>
			<li class="<%IF strcomp(request("cate"),4) = 0 Then %>on<%ENd IF%>"><a href="#ifrm4">인공지능(AI)계열</a></li>
		<!--	<li><a href="#ifrm5">카툰계열</a></li>-->
		</ul>
	</div>
	<div class="tabContents">
		<ul>
			<li class="entryInfo01" style="display:<%IF strcomp(request("cate"),1) = 0 or request("cate") = "" Then %>block<%Else%>none<%ENd IF%>;">

					<h1 class="hidden">게임계열</h1>
					<%
						pname = "게임"
					%>
					<h3 class="title02">게임계열 취업현황</h3>
					<iframe name="ifrm" id="ifrm1" src="working_situation_ifrm.asp?pname=<%=pname%>" width="100%" height="1801" frameborder="no" scrolling="no" align="center"  title="<%=pname%> 취업현황"></iframe>


			</li><!-- 게임계열 end -->

			<li class="entryInfo02" style="display:<%IF strcomp(request("cate"),3) = 0 Then %>block<%Else%>none<%ENd IF%>;">
				<div class="reviewBox">
				<h1 class="hidden">디자인계열</h1>
					<%
						pname = "디자인"
					%>
					<h3 class="title02">콘텐츠디자인계열 취업현황</h3>
					<iframe name="ifrm" id="ifrm2" src="working_situation_ifrm.asp?pname=<%=pname%>" width="100%" height="1801"  frameborder="no" scrolling="no" align="center"  title="<%=pname%> 취업현황"></iframe>
				</div>
			</li><!-- 디자인계열 end -->

			<li class="entryInfo03" style="display:<%IF strcomp(request("cate"),2) = 0 Then %>block<%Else%>none<%ENd IF%>;">
				<div class="reviewBox">
					<h1 class="hidden">정보보안계열</h1>
					<%
						pname = "정보보안"
					%>
					<h3 class="title02 frist">정보보안계열 취업현황</h3>
					<iframe name="ifrm" id="ifrm3" src="working_situation_ifrm.asp?pname=<%=pname%>" width="100%"  height="1801"  frameborder="no" scrolling="no" align="center"  title="<%=pname%> 취업현황"></iframe>
				</div>

			</li><!-- 정보보안계열 end -->

			<li class="entryInfo04" style="display:<%IF strcomp(request("cate"),4) = 0 Then %>block<%Else%>none<%ENd IF%>;">
				<div class="reviewBox">
					<h1 class="hidden">융합스마트계열</h1>
					<%
						pname = "융합스마트"
					%>
					<h3 class="title02">융합스마트계열 취업현황</h3>
					<iframe name="ifrm" id="ifrm4" src="working_situation_ifrm.asp?pname=<%=pname%>" width="100%" height="1801" frameborder="no" scrolling="no" align="center"  title="<%=pname%> 취업현황"></iframe>
				</div>

			</li><!-- 융합스마트계열 end -->

			<li class="entryInfo05">

					<h1 class="hidden">카툰계열</h1>
					<%
						pname = "카툰"
					%>
					<h3 class="title02">카툰계열 취업현황</h3>
					<iframe name="ifrm" id="ifrm5" src="working_situation_ifrm.asp?pname=<%=pname%>" width="100%" height="1801"  frameborder="no" scrolling="no" align="center"  title="<%=pname%> 취업현황"></iframe>

			</li><!-- 카툰계열 end -->
		</ul>
	</div>
	<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
