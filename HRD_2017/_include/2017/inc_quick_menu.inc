 <div class="site-map">
        <div class="site-map-inner container con-center">
            <ul>
            <%  
				if isArray(arrMainCate) Then 
					for each Key in arrMainCate
						IF strComp(key("SEQ_NO"), 10) <> 0 Then 
			 %>
				<li  class="<%=key("classNM")%>">
					<a><%=key("TITLE")%></a>
                    <ul>
                    	<%
							IF isArray(arySubCate) Then 
								for each subKey in arySubCate
									IF strComp(key("SEQ_NO"),subKey("SEQ_NO")) = 0 AND strComp(key("SEQ_NO"),2) <> 0 Then
										IF MEM_ID <> "" AND  StrComp(subKey("CSS_CLASS"),"mypage") = 0 Then
										%>
											<li class="<%=subKey("CSS_CLASS")%>"><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
										<%
										ElseIF StrComp(subKey("CSS_CLASS"),"mypage") <> 0  Then
										%>
										<li class="<%=subKey("classNM")%>"><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
									    <%
										END IF
						
					   				ELSEIF strComp(key("SEQ_NO"),subKey("SEQ_NO")) = 0  AND strComp(key("SEQ_NO"),2) = 0 Then
										IF IsArray(aryCourseCate) Then
											for each CourseKey in aryCourseCate
												IF strComp(CourseKey("SEQ_NO"),subKey("SEQ_NO")) = 0 Then
						%>
                        	<li class="<%=CourseKey("classNM")%>"><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
                        <%
												END IF
											NEXT
										END IF
									ELSEIF strComp(key("SEQ_NO"),subKey("SEQ_NO")) = 0  AND strComp(key("SEQ_NO"),2) = 0 Then
						%>
                        <%
									END IF
								NEXT
							END IF
						%>
                    </ul>
                </li>
			<%
						END IF
					NEXT
				END IF		
			%>
            </ul>
        </div>
    </div>


<script language="javascript">
$(function () {  
	/*상단 과정 메뉴 링크 복사*/
	$(".site-map .site-map-inner > ul > li").eq(1).find("ul").append($(".navbar > .container > .depth01").find("li").clone());
	/*일반고특화 과정 숨기기*/
	$(".site-map .site-map-inner > ul > li").eq(1).find("ul > li ").eq(5).css("display", "none");
	/*커뮤니티 과정숨기가*/
    $(".site-map .site-map-inner > ul > li").eq(4).css("display", "none");
	
	//$(".site-map .site-map-inner > ul > li").eq(2).find("ul > li ").eq(0).find("a").attr("href", $(".navbar > .container > .depth01 > li").eq(0).find("a").attr("href"))
	//$(".site-map .site-map-inner > ul > li").eq(2).find("ul > li ").eq(1).find("a").attr("href", $(".navbar > .container > .depth01 > li").eq(1).find("a").attr("href"))
	//$(".site-map .site-map-inner > ul > li").eq(2).find("ul > li ").eq(2).find("a").attr("href", $(".navbar > .container > .depth01 > li").eq(3).find("a").attr("href"))


});
</script>