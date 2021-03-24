<!-- #include file="../include/subheader.asp" -->
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

        PageSize = 6
        PageNum = page

        tableName = "koreaitweb.prof_info"
        Field = "take_idx, chapter, name ,filename3 "
        WhereStr = "[use]='Y' And bbscode like '%전기공학%'"
        OrderBy = "Order by top_view asc"
        PageCount = 0 : RecordCount = 0

        'response.write WhereStr

        'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
        rsList = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, tableName, WhereStr, OrderBy, PageCount, RecordCount)
        %>
		<div class="professorList">
			<ul class="clearFix">
			<%
			If Not IsArray(rsList) Then
				Response.Write "<div style=""text-align:center; font-size:20px; padding:40px;"">등록된 게시물이 없습니다.</div>"
			Else

            	For i = 0 To Ubound(rsList,2)
					take_idx = rsList(0,i)
					chapter = rsList(1,i)
					name = rsList(2,i)
					arrName = split(name," ")
					strName = "<strong>" & arrName(0) & "</strong>"
					if ubound(arrName)=0 then
						strTitle = "<span  style='vertical-align: bottom;'>교수님</span>"
					else
						strTitle = "<span style='vertical-align: bottom;'>" & arrName(1) & "님</span>"
					end if
					filename3 = rsList(3,i)
					if filename3="" then
						filename3="noimage.jpg"
					end if

				%>
				<li>
					<span><img class="lazy" data-src="/upload_files/prof/<%=filename3%>" alt="<%=strName%> <%=strTitle%> 사진"></span>
					<div class="txtBox">
						<div class="txtBoxTop">
							<span class="title">꿈이 이루어지는 학교! 한국IT</span>
							<%=strName%> <%=strTitle%>
						</div>
						<div class="txtBoxBottom">
							<dl>
								<dt>주요 담당 과목</dt>
								<dd>
									<%=chapter%>
								</dd>
							</dl>
						</div>
						<a href="" class="btnMore" data-value="<%=take_idx%>">View more +</a>
					</div>
				</li>
				<%
				Next
			End if
			%>
			</ul>
			<% Call PageCounterWeb2017(Page, PageCount, 10, "", searching) %>
		</div>
	</div>
	<div class="professorView">
		<div class="inner clearFix"></div>
		<a href="" class="btnClose"><img class="lazy" data-src="../images/layout/btnCloseIcon.png" alt="닫기"></a>
	</div>
<!-- #include file="../include/subfooter.asp" -->
