<%
Dim arySideBar, arySubSideBar
'사이드바 메뉴
 FUNCTION getSideBarLis()
 	Dim aryHashMap 
 	Set aryHashMap = New RsToHashMap
	sql ="exec HRD_메뉴관리_L @site='HRD', @position = 'SiteMap', @gubun='SideBar'"
	getSideBarLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
 END FUNCTION 
'사이드바 메뉴
 FUNCTION getSubSideBarLis()
 	Dim aryHashMap 
 	Set aryHashMap = New RsToHashMap
	sql ="exec HRD_메뉴관리_L @site='HRD', @position = 'SiteMap', @gubun='SubSideBar'"
	getSubSideBarLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
 END FUNCTION 
	arySideBar = getSideBarLis()
	arySubSideBar = getSubSideBarLis()
%>

<div class="side-bar clearfix" id = "gnb">
	<div class="btn-wrap">
		<a href="#" class="side-btn"></a>
	</div>
	<div class="scrollbar">
		<div class="side_call">
			<a <%IF CheckMobileToBool() Then %>href="tel:1588-1577" alt="대표번호1588-1577" <%Else%> href="javascript:online();" title="한국it아카데미빠른상담가기"<%END IF%>>
				<img class="lazy" src="/images/2017/f_call_re.png" alt="상담문의 1588-5517" width="130">
			</a>
		</div>
		<div class="scrollbar-inner">
			<ul class="gnbList">
				<%  
					IF isArray(arySideBar) Then 
						For each key in arySideBar
				 %>
					<li class="<%=key("class_d")%>" >
                    
					<a class='<%=key("TITLE_ICON")%>'><%=ChgHTMLReplace(key("TITLE"))%></a>
					<ul class="sub">
						<%
							IF isArray(arySubSideBar) Then 
								for each subKey in arySubSideBar
									IF strComp(key("SIDE_BAR_NO"),subKey("SIDE_BAR_NO")) = 0 Then 
									  IF MEM_ID <> "" AND  StrComp(subKey("CSS_CLASS"),"mypage") = 0 Then
									  %>
										  <li class="<%=subKey("CSS_CLASS")%>"><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
									  <%
									  ElseIF StrComp(subKey("CSS_CLASS"),"mypage") <> 0 Then
										  IF strComp(key("SIDE_BAR_NO"), 10) = 0 AND CINT(subKey("CATEGORY1")) < 4 Then
									  %>
										  <li class="<%=subKey("CSS_CLASS")%>"><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
									  <% 
										  Else 
									  %>
									  <li class="<%=subKey("CSS_CLASS")%>"><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
									  <%
										  END IF
									  END IF
									END IF
								NEXT
							END IF
						%>
                        	</ul>
             				 </li>
								<%
							NEXT
						END IF
				%>

			</ul>
		</div> <!-- scrollbar-inner END -->
	</div>  <!-- scrollbar END -->
</div>  <!-- side-bar END-->

<script language="javascript">
$(function () {  
	$("#gnb .gnbList > li").eq(2).find("ul").append($(".navbar > .container > .depth01").find("li").clone());

});
</script>
<%
    IF CheckMobileToBool()  <> true Then 
%>

<!-- Popup -->
<!--#include virtual="/_include/2017/inc_popup.inc"-->
<%
    End IF
%>

<%
connClose()
%>


