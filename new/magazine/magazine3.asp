
<div></div>
<div class="magazineList">
	<div class="listWrap">

		<div class="listBox">
				 <a href="javascript:" data-idx="201903">
					 <img src="<%=BOARD_LIST_IMG_PATH%>list/201903_list.jpg"/>
							 <div>KOREA IT MAGAZINE | <span>2019년 3월호</span></div>
					 </a>
			 </div>




         <div class="listBox">
        	<a href="javascript:" data-idx="201812">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/201812_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2018년 12월</span></div>
            </a>
        </div>


        <div class="listBox">
        	<a href="javascript:" data-idx="201809">
        		<img src="<%=BOARD_LIST_IMG_PATH%>list/201809_list.jpg"/>
                <div>KOREA IT MAGAZINE | <span>2018년 9월</span></div>
            </a>
        </div>

         <div class="listBox">
        	<a href="" style="pointer-events: none; cursor: default;">
        		<img style="opacity:-0.5;" src="<%=BOARD_LIST_IMG_PATH%>list/201809_list.jpg"/>
                <div><span></span></div>
            </a>
        </div>


        



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
