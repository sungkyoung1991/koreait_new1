<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
'게시판 이미지
Const BOARD_LIST_IMG_PATH = "/upload_files/magazine/"
%>


 <!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
 <!-- S: header 시작 -->
 <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
 <!-- E: header 종료 -->

 <!--2020-->
    <!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->
    <!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->

<!-- #include virtual="/inc/2017/subHeader.asp" -->
<style>
	.magazineList > .listWrap {display:table; width:100%; text-align:center; border-radius: 15px; overflow: hidden;}
	.magazineList > .listWrap > .listBox {display:table-cell;padding:10px;background:url(/upload_files/magazine/bg.jpg); background-size:cover;
	background-size: auto 100%;}
	.magazineList > .listWrap >  .listBox > a {display:table;width:100%;margin:auto;position:relative;}
	/*.magazineList > .listWrap >  .listBox > a > img {width:100%; height:auto;max-width:800px;}*/
	.magazineList > .listWrap >  .listBox > a > img {width:35%; margin-top:16%;margin-bottom:14%; height:auto;max-width:800px;  -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1);
    -o-transform:scale(1);
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s; box-shadow:5px 5px 18px #493232;}
	.magazineList > .listWrap >  .listBox > a:hover > img {-webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);
    -o-transform:scale(1.1);
    transform:scale(1.1);}
	.magazineList > .listWrap >  .listBox > a > div {position:absolute; bottom:0; text-align:center; width:100%; font-size:16px; font-weight:700; height:10%; padding-top:2%; left:0; color: #ffffff;}
	.magazineList > .listWrap >  .listBox > a > div > span {color:#ffdeb1;}
</style>
<div class="magazineList">
	<div class="listWrap">

    <div class="listBox">
         <a href="javascript:" data-idx="202103">
           <img src="<%=BOARD_LIST_IMG_PATH%>list/202103_list.jpg"/>
               <div>KOREA IT MAGAZINE | <span>2021년 3월호</span></div>
           </a>
       </div>


     <div class="listBox">
        	<a href="javascript:" data-idx="202012">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/202012_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2020년 12월호</span></div>
            </a>
        </div>


     <div class="listBox">
        	<a href="javascript:" data-idx="202009">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/202009_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2020년 9월호</span></div>
            </a>
        </div>
    <div class="listBox">
        	<a href="javascript:" data-idx="202006">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/202006_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2020년 6월호</span></div>
            </a>
        </div>




    </div>
</div>



			<!-- #include Virtual="/new/magazine/magazine2.asp" -->
            <!-- #include Virtual="/new/magazine/magazine3.asp" -->


<script language="javascript">
	$(document).ready(function(e) {
        $(".magazineList > .listWrap > .listBox > a ").click(function(e) {
            var idx = $(this).data("idx");
			var w = window.document.body.offsetWidth;
			var h = window.document.body.offsetHeight;
			var popup = window.open("magazine_view.asp?idx="+idx,"magazine","width=1150 ,height=800,scrollbars=1, ");
			popup.focus();
        });

    });

</script>

<!--#include Virtual= "/inc/2017/subFooter.asp"-->
<!-- footer (하단) -->
<!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
