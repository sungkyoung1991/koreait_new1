<!-- #include file="./_include/inc_head_2020.inc" -->

<%
subsql = " list_view in (0,1) "
if request("page")="" then
	page=1
else
	page = request("page")
end if

session("page")=page

If page <> "" Then
	cPage = page
	If cPage < 1 Then 
		cPage = 1
	End If
Else
	cPage = 1
End If

pagesize=7
sql = "select count(*) from news_board_kart where " & subsql & " and bbscode='평생교육원'"
  
set rs = conn.execute(sql)
totalrecord = cint(rs(0))
totalpage   = int(rs(0)/ pagesize * -1) * -1 
rs.close

Set rs = Server.Createobject("ADODB.Recordset")
rs.CursorLocation = 3
rs.CacheSize  = pagesize

rssql = "SELECT * FROM news_board_kart where " & subsql & " and bbscode='평생교육원' order by top_view desc, take_idx desc "

rs.PageSize=7

rs.Open rssql, conn, 1

	
page_count=10
totalpage=rs.PageCount		

Set rs.ActiveConnection = Nothing

'--------------------------------------------

subsql2 = " list_view in (0,1) "

if request("page")="" then
	page=1
else
	page = request("page")
end if

session("page")=page

pagesize=7
sql2 = "select count(*) from news_board_kart where " & subsql2 & " and bbscode='학사일정'"
'Response.Write sql2
  
set rs2 = conn.execute(sql2)
totalrecord2 = cint(rs2(0))
totalpage2   = int(rs2(0)/ pagesize * -1) * -1 
rs2.close

Set rs2 = Server.Createobject("ADODB.Recordset")
rs2.CursorLocation = 3
rs2.CacheSize  = pagesize

rssql2 = "SELECT * FROM news_board_kart where " & subsql2 & " and bbscode='학사일정' order by top_view desc, take_idx desc "

'Response.Write rssql2

rs2.PageSize=7

rs2.Open rssql2, conn, 1

	
page_count=10
totalpage=rs2.PageCount		

Set rs2.ActiveConnection = Nothing

%>




<!--banner-->
<section class="bannergroup">
    <h2 style="display:none;">배너이미지</h2>
    <div class="slick-items">
    	<a class="banner01" href="http://joint.koreait.kr/curriculum.asp"><img src="images/banner01.jpg" alt="과정이미지1" style="max-width:100%;height:auto;"></a>
    	<a class="banner02" href="#"><img src="images/banner02.jpg" alt="과정이미지1" style="max-width:100%;height:auto;"></a>
    	<a class="banner03" href="#"><img src="images/banner03.jpg" alt="과정이미지1" style="max-width:100%;height:auto;"></a>
    </div>
</section>

<!--contents-->
<section class="artGroup container clearFix">
    <div class="art art1 clearFix">
        <div class="artTitle">
            <h3>공지사항<span>notice</span></h3>
            <div><a href="http://joint.koreait.kr/notice.asp"><img src="images/plusbtn.png" alt="더보기십자모양"></a></div>
        </div>
        <div class="artTxt">
        
        
         <%
		rs.AbsolutePage=cPage
        do until rs.EOF or i>rs.PageSize
		
		width=""
        news=""
        name = rs("name")
        wdate = left(rs("writeday"),10)
        title = replace(trim(rs("title")),"&quot;","'")
        readnum = rs("readnum")
        power=rs("bbscode")
		top_view=rs("top_view")
		list_view=rs("list_view")
		writer_id=rs("writer_id")
        If Len(title) > 45 Then
          title = Mid(title,1,43) & ".."
        End If
        if rs("re_level") > 0 then
          wid = rs("re_level")
          for k=1 to wid
            width=width&"&nbsp;"
          next
          reply = width&"<img src='/information/images/ico_re.gif'>&nbsp;"
        else
          reply = ""
        end if

        if DateDiff("h",rs("writeday"),Now()) < 24 then
          news = "<img src=""images/newbtn.png"">"
        end if
				  
		%>
       	
           <a href="notice_open.asp?take_idx=<%=rs("take_idx")%>">
               <p><%=title%><%=news%></p>
          </a>
				
        <%
			  rs.Movenext
				 i = i + 1
				 Loop	
		%>
       
        </div>
    </div>
    <div class="art art2">
        <div class="artTitle clearFix">
            <h3>연간교육일정<span>academic calendar</span></h3>
            <div><a href="http://joint.koreait.kr/haksa.asp"><img src="images/plusbtn-white.png" alt="더보기십자모양"></a></div>
        </div>
        <div class="artTxt">
  
        <%
		rs2.AbsolutePage=cPage
		
        do until rs2.EOF or j>rs2.PageSize
		
		width=""
        news=""
        name = rs2("name")
        wdate = left(rs2("writeday"),10)
        title = replace(trim(rs2("title")),"&quot;","'")
        readnum = rs2("readnum")
        power=rs2("bbscode")
		top_view=rs2("top_view")
		list_view=rs2("list_view")
		writer_id=rs2("writer_id")
        If Len(title) > 45 Then
          title = Mid(title,1,43) & ".."
        End If
        if rs2("re_level") > 0 then
          wid = rs2("re_level")
          for k=1 to wid
            width=width&"&nbsp;"
          next
          reply = width&"<img src='/information/images/ico_re.gif'>&nbsp;"
        else
          reply = ""
        end if

        if DateDiff("h",rs2("writeday"),Now()) < 24 then
          news = "&nbsp;&nbsp;<img src=""images/newbtn.png"">"
        end if
				  
		%>
  			<a href="haksa_open.asp?take_idx=<%=rs2("take_idx")%>">
               <p><%=title%><%=news%></p>
          </a>

        <%
			  rs2.Movenext
				 j = j + 1
				 Loop	
		%>
 
        </div>
    </div>
</section>

<section class="courseGroup">
	<h2>모집중강의</h2>
	<div class="courseSubtitle">한국IT공동훈련센터의 인기강의를 만나보세요</div>

	<div class="coursegroup container">
		<!--시작-->
		<div class="tagContentGroup">
			<div class="CourseContent CourseContent1">
				<div>
					<div class="conTitle">게임 기획자 양성 프로젝트 과정</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_game01.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
			<div class="CourseContent CourseContent2">
				<div>
					<div class="conTitle">자바/스프링 기반 디지털 융합 웹 개발자 양성과정</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_java01.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
			<div class="CourseContent CourseContent3">
				<div>
					<div class="conTitle">머신러닝을 활용한 AI(인공지능) 프로젝트 개발 과정</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_ai01.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
			<div class="CourseContent CourseContent4">
				<div>
					<div class="conTitle">소셜미디어를 활용한 라이브커머스 셀러 과정(YouTube)</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_social01.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
			<div class="CourseContent CourseContent5">
				<div>
					<div class="conTitle">UI/UX 실무활용 과정</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_uiux02.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
			<div class="CourseContent CourseContent6">
				<div>
					<div class="conTitle">역공학(Reverse Engineering)기초와 악성코드 분석</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_reverse01.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
			<div class="CourseContent CourseContent7">
				<div>
					<div class="conTitle">실감형 영상 편집과정(360도카메라/VR기기 활용)</div>
					<div class="classBtnGroup clearfix">
						<div><a href="http://joint.koreait.kr/curriculum_editing01.asp">과정보러가기</a></div>
						<div><a href="http://joint.koreait.kr/consultation.asp">상담게시판</a></div>
					</div>
				</div>
			</div>
		</div>
		<!--끝-->
	</div>
</section>

<section class="courseGroup_video">
    <h2 style="display:none;">축하인사</h2>
	<div class="coursegroup container VideoGroup clearFix">
		<!--시작-->
		<div>
			<div class="videoTitle">
				<div>congratulatory</div>
				<div>greeting</div>
			</div>
			<div class="videSubTitle">
				<div>게임물관리위원회 위원장<br/>이재홍</div>
			</div>
		</div>
		<div class="videoBox">
			<video src="images/210106_congratulate.mp4" style="border-radius:20px;" width='100%' height="auto" controls autoplay muted></video>
		</div>
		<!--끝-->
	</div>
</section>

<script>
	$(document).ready(function() {
		//slick();
		$('.tagContentGroup').slick({
		autoplay: true,
		dots: true,
		speed: 200,
		infinite: true,
		autoplaySpeed: 3000,
		slidesToShow: 3,
		slidesToScroll: 3,
		fade: false,
		pauseOnHover: true,
		/*arrows: false,*/
		touchMove: false,
		responsive: [
			{ /* 반응형웹*/
			breakpoint: 960, /*기준화면사이즈 */
			settings: {slidesToShow:1,slidesToScroll: 1} /*사이즈에 적용될 설정 */
			}
		
			]
		});
	});
</script>

<!-- #include file="./_include/inc_footer_2020.inc" -->

</body>

</html>