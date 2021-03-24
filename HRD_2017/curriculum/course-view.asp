<!--#include virtual="/_include/Service_Inc.inc"-->
<!--#include virtual="/_include/2017/inc_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_sub_head.inc"-->
<%
Dim lnbsel : lnbsel = 0
Dim subsel : subsel = "A"
DIm cate, Campus, hours, clscata
Dim infoimg, curriimg, etcimg, crstatus, clsname, crtitle, clsname2, crtitle2, infotitle, divcd
Dim title_wrap, infotext, curritext, etctext, con_info, con_curri, con_etc, targettext, project_yn
Dim arrCourse, arrProject


crcd = getQuery("crcd")

If IsNumeric(crcd) Then
	sql = "exec HRD_과정소개_V @crcd =" & crcd & ", @sccd ='', @site='HRD'"
	arrCourse =	arrHashMap.GetRowsQuery(CONNSTRING_WEB, sql)

'	Response.Write sql

END IF
IF isArray(arrCourse) Then
	lnbsel= arrCourse(0).item("lnbSel")
	subsel = arrCourse(0).item("subsel")

	if strcomp(arrCourse(0).item("clscd"),5) = 0 Then
%>
	<!--#include file="course/nomal_view.asp"-->
<%
	Else
%>
	<!--#include file="course/course_view.asp"-->
<%
	END IF
Else %>
    	 <div class="contentTitle">
                <h2>STUDY INFORMATION</h2>
         </div>
          <div class="contentWrap">
               <div class="clearfix contentTitle">
                    <div class="textwrap" style="width:100%; color:#898989;">
                          <p>등록된 게시물이 없습니다.</p>
                    </div>
               </div>
            </div>
         </section>

<%End IF%>

<!-- footer -->
<!--#include virtual="/_include/2017/inc_footer.inc"-->
<!-- side-bar -->
<!--#include virtual="/_include/2017/inc_side_menu.inc"-->

<script language="javascript">
	$(document).ready(function(e) {
     	$("div.contentWrap").find("ul").eq(0).addClass("jobList  clearfix");
		$("div.contentWrap").find("ul").eq(1).addClass("jobList  clearfix");
		$(".appraisal").removeClass("jobList");
		if ("<%=subsel%>" != "A"){
			thirdLoad(2,<%=lnbsel%>,<%=subsel%>);
		}
		$("div.MayaImgPopup li").append('<i class="material-icons">close</i>');
       MaayImgPopup();
	   MaayImgPopupClose();
	});

	function MaayImgPopup(){
		$("div.mayapopup li").click(function(e) {
            var idx = $(this).index();
			$("div.MayaImgPopup").css("display", "block");
			$("div.MayaImgPopup li").eq(idx).css("display", "block");

        });
	}
	function MaayImgPopupClose(){
		$("div.MayaImgPopup").click(function(e) {
			$("div.MayaImgPopup").css("display", "none");
			$("div.MayaImgPopup li").css("display", "none");

        });

	}

</script>

<!-- Web Log Writer -->
<!-- #include virtual="/_include/inc_LogWriter.inc" -->
</body>

</html>
