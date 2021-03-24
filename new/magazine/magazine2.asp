
<div></div>
<div class="magazineList">
	<div class="listWrap">

		<div class="listBox">
				 <a href="javascript:" data-idx="202003">
					 <img src="<%=BOARD_LIST_IMG_PATH%>list/202003_list.jpg"/>
							 <div>KOREA IT MAGAZINE | <span>2020년 3월호</span></div>
					 </a>
			 </div>

     <div class="listBox">
        	<a href="javascript:" data-idx="201912">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/201912_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2019년 12월호</span></div>
            </a>
        </div>
        


    <div class="listBox">
        	<a href="javascript:" data-idx="201909">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/201909_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2019년 9월호</span></div>
            </a>
        </div>


      <div class="listBox">
        	<a href="javascript:" data-idx="201906">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/201906_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2019년 6월호</span></div>
            </a>
        </div>






        <!-- <div class="listBox">
        	<a href=""  style="pointer-events: none; cursor: default;">
        		<img style="opacity:-0.5;" src="<%=BOARD_LIST_IMG_PATH%>list/201809_list.jpg"/>
                <div> <span></span></div>
            </a>
        </div>-->

         <!--<div class="listBox">
        	<a href="" style="pointer-events: none; cursor: default;">
        		<img style="opacity:-0.5;" src="<%=BOARD_LIST_IMG_PATH%>list/201809_list.jpg"/>
                <div><span></span></div>
            </a>
        </div>-->

       <!--  <div class="listBox">
        	<a href="" style="pointer-events: none; cursor: default;">
        		<img style="opacity:-0.5;"src="<%=BOARD_LIST_IMG_PATH%>list/201809_list.jpg"/>
                <div><span></span></div>
            </a>
        </div>-->
	</div>
</div>

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
