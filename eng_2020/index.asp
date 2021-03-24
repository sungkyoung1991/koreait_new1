<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%	page="main" %>
<!-- #include virtual="/_include/inc_header.asp" -->

<%
table = "news_board_eng"
bbscode = Trim(request("bbscode")) : bbscode = Replace(bbscode,"'","") : bbscode = Replace(bbscode,"""","")
code = Trim(request("code")) : code = Replace(code,"'","") : code = Replace(code,"""","")



search = Trim(request("search")) : search = Replace(search,"'","")
find = Trim(request("find")) : find = Replace(find,"'","")

'2016.09.01 - 검색오류 방지
Select Case CStr(search)
Case "title", "content"
	find = Replace(find,"%","")
	find = Replace(find,"'","")
	find = Replace(find,"""","")
Case Else
	search = ""
	find = ""
End Select

'중간고사, 기말고사 생략 - 2016.06.02
subsql = " list_view=1 and bbscode in ('notice_eng')"
searching = ""

If Len(find) >= 1 then
	if search = "content" then
		subsql = subsql & " and "& search &" LIKE '%"& find &"%'"
	else
		subsql = subsql & " and Lower("& search &") LIKE '%"& LCase(find) &"%'"
	end if

	searching = searching & "&search="& Server.UrlEncode(search) &"&find="& Server.UrlEncode(find)
End If

'Page 검사 - 2016.06.22
If Not isNumeric(request("page")) Or request("page") = "" Or request("page") = "0" Then
	page = 1
else
	page = request("page")
end if

session("page") = page

' 페이징 리스트
' Set_PageSize : 페이지 사이즈
' Set_PageNum : 현재페이지
' Set_Field : 필드명
' Set_Table : 테이블명
' Set_Where : 검색조건
' Set_OrderBy : 정렬조건
' Set_PageCount : 전체페이지 갯수(반환)
' Set_RecordCount : 전체리스트 갯수(반환)

page_count = 10

PageSize = 17
PageNum = page

Field = "take_idx, name, writeday, title, readnum, top_view, step, re_level"
WhereStr = subsql
OrderBy = "Order by top_view desc, writeday desc"
PageCount = 0 : RecordCount = 0

'Response.Write "Select top 10 " & Field & " From " & table & " Where " & WhereStr &  " " & OrderBy
'Response.End

'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
rsArray = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, table, WhereStr, OrderBy, PageCount, RecordCount)

%>

<div id="container" class="main_bg">
	<!-- S: container -->
	<!--<div class="avada-row pt30 pb20">-->
	<div class="">
		<section class="bannerWrap">
			<!--영상이미지-->
			<!--<video src="http://www.koreait.ac.kr/eng_2020/video/intro_2020.mp4" style="width:100%;height:100%;" autoplay="autoplay" muted="muted">
			</video>-->
			<!--<img src="http://www.koreait.ac.kr/eng_2020/img/mainbackgound.jpg" alt="" style="width:100%;height:100%;">-->
			            
            <iframe src="https://player.vimeo.com/video/438841768?autoplay=1&muted=1&loop=1" width="640" height="360" frameborder="0" allow="autoplay;" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
		</section>
		
		
	</div>
	
	<section class="conWrap avada-row">
			<div class="linkWrap welcomWrap">
				<div class="linkBox1">
					<a href="http://eng.koreait.ac.kr/introduce/greeting.asp">
						<span>Welcome<br/>Remark</span>
					</a>
				</div>
				<div class="linkBox2">
					<a href="http://eng.koreait.ac.kr/study/apply.asp">
						<span>Application</span>
					</a>
				</div>
				<div class="linkBox3">
					<a href="http://eng.koreait.ac.kr/study/calender.asp">
						<span>Academic<br/>Calendar</span>
					</a>
					<a href="http://eng.koreait.ac.kr/study/degree.asp">
						<span>Course<br/>Admission<br/>Guide</span>
					</a>
				</div>
			</div>
			
			<div class="linkWrap degreeWrap">
				<div class="degreeTitleGroup">
						<p class="degreeTitle">Undergraduate<br>Degree</p>
						<p>we degree Program <br />runs four courses</p>
				</div>
				<div class="degreeCon">
					<a href="http://eng.koreait.ac.kr/department/major1.asp">
						<div>GAME</div>
					</a>
				</div>
				<div class="degreeCon">
					<a href="http://eng.koreait.ac.kr/department/major2.asp">
						<div>INFORMATION SECURITY</div>
					</a>
				</div>
				<div class="degreeCon">
					<a href="http://eng.koreait.ac.kr/department/major3.asp">
						<div>DESIGN</div>
					</a>
				</div>
				<div class="degreeCon">
					<a href="http://eng.koreait.ac.kr/department/major4.asp">
						<div>FSION SMART</div>
					</a>
				</div>
			</div>
			
			<div class="noticeWrap">
				<div class="noticeGroup">
					<div class="noticeTitle">Notice</div>
					<div class="noticeArticle">
                        <%
							If Not IsArray(rsArray) Then
						%>
						<div height="1" colspan="5" align="center">등록된 게시물이 없습니다.</div>
					<%
					Else
						For i = 0 To Ubound(rsArray,2)
						  	news = ""
					  		width = ""

							take_idx = rsArray(0,i)
							name = rsArray(1,i)
							writeday = rsArray(2,i)
							title = Trim(rsArray(3,i))
							readnum = FormatCheckNumZero(rsArray(4,i))
							top_view = FormatCheckNumZero(rsArray(5,i))
							Step = FormatCheckNumZero(rsArray(6,i))
							re_level = FormatCheckNumZero(rsArray(7,i))

							writeday = FormatDatetimes(writeday)
							wdate = left(writeday,10)
							title = replace(title,"&quot;","'")

							If Len(title) > 34 Then
								title = Mid(title,1,80) & ".."
							End If

							If CDbl(re_level) > 0 Then 
								wid = re_level
								for k=1 to wid
									width=width&"&nbsp;"
								Next
								
								reply = width & "<img src='images/re.gif'>"
							Else
								reply = ""
							End If

							If DateDiff("h",writeday,Now()) < 24  AND StrComp(step,0) = 0 AND StrComp(re_level,0) = 0 Then
								news = "&nbsp;<img src='/Mat_IT/images/mi_itmania_issue_icon_new.gif' width='9' height='9' align='absmiddle' alt='new' />"
							End If

							tNum = RecordCount - CDbl(rsArray(Ubound(rsArray,1),i)) + 1
					%>
                  		<p>
             				 <a href="notice/list_open.asp?id=<%=take_idx%>"><%=title%></a>
						</p>
                    <%
						Next
					End if
					%>
						
					</div>
				</div>
				<div class="photoGroup">
					<div class="noticeTitle">Photo Gallery</div>
					<ul class="noticeArticle slick-item">
						<li><img src="img/main/mainback_photo.png" alt="conclude an agreement"></li>
						<li><img src="img/main/mainback_photo2.png" alt="IT Competition"></li>
						<li><img src="img/main/mainback_photo3.png" alt="Motion Capture Demonstration"></li>
					</ul>
				</div>
			</div>
		</section>
		
		<section class="quickWrap">
			<div class="quickGroup avada-row">
				<a href="http://eng.koreait.ac.kr/help/visa.asp">
					<img class="jello-horizontal" src="img/main/visa.png" alt="visa rule">
					<div>VISA</div>
				</a>
				<a href="http://eng.koreait.ac.kr/help/insurance.asp">
					<img class="jello-horizontal" src="img/main/insurance.png" alt="INSURANCE rule">
					<div>INSURANCE</div>
				</a>
				<a href="http://eng.koreait.ac.kr/help/housing.asp">
					<img class="jello-horizontal" src="img/main/housing.png" alt="HOUSING rule">
					<div>HOUSING</div>
				</a>
				<a href="http://eng.koreait.ac.kr/help/faq.asp">
					<img class="jello-horizontal" src="img/main/faq.png" alt="Frequently Asked Questions">
					<div>FAQS</div>
				</a>
			</div>
		</section>
</div><!-- E: container -->

<!-- #include virtual="/_include/inc_footer.asp" -->