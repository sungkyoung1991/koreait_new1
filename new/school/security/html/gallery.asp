<!-- #include file="../include/subHeader.asp" -->
<link href="/new/school/css/bootstrap.min.css" rel="stylesheet">
<link href="/new/school/css/ekko-lightbox.css" rel="stylesheet">
	<div class="auto">
		<%
        ' 페이징 리스트
        ' Set_PageSize : 페이지 사이즈
        ' Set_PageNum : 현재페이지
        ' Set_Field : 필드명
        ' Set_Table : 테이블명
        ' Set_Where : 검색조건
        ' Set_OrderBy : 정렬조건
        ' Set_PageCount : 전체페이지 갯수(반환)
        ' Set_RecordCount : 전체리스트 갯수(반환)
        
		page = FormatCheckNumZero(request("page")) : If StrComp(page,0) = 0 Or Not isNumeric(request("page")) Then page = 1
		Dim images, tabcode
        PageSize = 12
        PageNum = page
        tabcode = request("tcode")
        tableName = "koreaitweb.[work_board_2017]"
        Field = "take_idx, title, caption , uri, imagefile, images  "
        WhereStr = "[bbscode] like '%" & bbscode & "%' and [use]='Y' "
		IF UCase(tabcode) = "M"  Then 
			WhereStr = WhereStr & " and (ltrim(rtrim(uri)) != ''  AND uri is not null) "
		ElseIF UCase(tabcode) = "I" then
			WhereStr = WhereStr & " and (ltrim(rtrim(images)) != ''  AND images is not null) "
		Else
			tabcode = "A"
		END IF
        OrderBy = "Order by sequence desc"
        PageCount = 0 : RecordCount = 0
        searching = "&tcode=" & tabcode
        'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
        rsList = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, tableName, WhereStr, OrderBy, PageCount, RecordCount)
        %>
        
        <div class="controls">
            <ul>
                <a href="/new/school/security/html/gallery.asp?page=1&tcode=A">
                	<li class="control <%IF UCase(tabcode) = "A" Then %>mixitup-control-active<%END IF%>">ALL</li>
                </a>
                <a href="/new/school/security/html/gallery.asp?page=1&tcode=I">
               	 	<li class="control <%IF UCase(tabcode) = "I" Then %>mixitup-control-active<%END IF%>">IMAGE</li>
                </a>
                <a href="/new/school/security/html/gallery.asp?page=1&tcode=M">
                	<li class="control <%IF UCase(tabcode) = "M" Then %>mixitup-control-active<%END IF%>">MOVIE </li>
                </a>
            </ul>
   		</div> 
        
		<div class="galleryWrap">
			<ul>
			<%
			If Not IsArray(rsList) Then 
				Response.Write "<div style=""text-align:center; font-size:20px; padding:40px;"">등록된 게시물이 없습니다.</div>"
			Else
            	
            	For i = 0 To Ubound(rsList,2)
					take_idx = rsList(0,i)
					title = rsList(1,i)
					caption = rsList(2,i)
					uri = rsList(3,i)
					imagefile = rsList(4,i)
					images = rsList(5,i)
				%>
				<li>
					<span><img class="lazy" data-src="/upload_files/work/<%=imagefile%>" alt="<%=title%>"></span>
					<div class="txtBox">
						<dl>
							<dt><%=title%></dt>
							<dd><%=caption%></dd>
						</dl>
						<a href="<%IF uri <> "" THEN %><%=uri%><%ELSE%>/upload_files/work/imagefile/<%=images%><%END IF%>" 
                         data-toggle="lightbox" data-gallery="mixedgallery" data-max-width="1360" data-width="680" data-title="<%=title%>" >View more+</a>
					</div>
				</li>
				<%	
				Next
			End if
			%>
			</ul>
		</div>
		<% Call PageCounterWeb2017(Page, PageCount, 10, "", searching) %>
	</div>
    
    
 <script>
  $(document).ready(function ($) {
	  // delegate calls to data-toggle="lightbox"
	  $(document).on('click', '[data-toggle="lightbox"]', function(event) {
		  event.preventDefault();
		  return $(this).ekkoLightbox({	
		  		alwaysShowClose: true,		
					 	
		  });
	  });
  });
</script>

<script src="/new/school/js/jquery-3.2.1.slim.min.js" ></script>
<script>jquery_3_2_1 = $.noConflict(true);</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
 <script src="/new/school/js/ekko-lightbox.js"></script>

<!-- for documentation only -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/anchor-js/3.2.1/anchor.min.js"></script>
<!-- #include file="..//include/subFooter.asp" -->