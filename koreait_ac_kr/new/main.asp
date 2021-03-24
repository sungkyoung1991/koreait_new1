<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->



<%
if request("ap")="true" then
 RESPONSE.REDIRECT "http://www.koreait.ac.kr/new/index.asp?ap=chk"
end if
 %>


<%
'원서접수 일자 - UTF8
Function GetSelectionDateArrayUTF8ToStr(ByVal Set_Type)
	Dim tStr : tStr = GetSelectionDateArrayToStr(Set_Type)

	If StrComp(Set_Type,1) = 0  OR StrComp(Set_Type,8) = 0  Then
		tStr = Replace(tStr,"Y","년")
		tStr = Replace(tStr,"M","월")
		tStr = Replace(tStr,"D","일")
	End If

	GetSelectionDateArrayUTF8ToStr = tStr
End Function

Function GetSelectionDateAry(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "HAkSA_원서접수일정_조회_L @mode='Selection', @type='" & Set_type & "' "
	'Response.Write sql
	GetSelectionDateAry = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function
Dim Selection : Selection = GetSelectionDateAry(102)


'###### 스쿨생활 엿보기
'School Life - 2016.08.19
' 0 : take_idx, title, mainimg, summery [3]
Function GetSchoolLifeToArray()

	Dim sql : sql = "Select top 6 take_idx, title, convert(nvarchar,writeday) as writeday, listimg "
	sql = sql & " From dbo.tbl_board_list "
	sql = sql & " where main_check=1 and mainimg <> '' and status = '1' and bbscode != '1minknowhow' and bbscode != 'eventboard' Order By top_view desc, writeDay Desc, take_idx Desc"

	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
	Application.Lock
	Application.Contents("SchoolLife_Array") = arrRs
	Application.Contents("SchoolLife_Now") = Now()
	Application.Unlock

	GetSchoolLifeToArray = arrRs
End Function

'###### 입학 QnA
Function GetITQnAToArray()

	Dim sql : sql = "Select top 6 take_idx, title, convert(nvarchar, convert(varchar(10),writeday,120)) as writeday, case when len(pwd) > 0 then 'Y' else 'N' end as pal_chk "
	sql = sql & " From dbo.sangdam_board2 "
	sql = sql & " where status = '1' and re_level=0  Order by ref desc, step asc"

	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)

	Application.Lock
	Application.Contents("ITQnA_Array") = arrRs
	Application.Contents("ITQnA_Now") = Now()
	Application.Unlock

	GetITQnAToArray = arrRs
End Function

'###### 한국 IT 학생 스토리
Function GetITStoryToArray()
	Dim sql : sql = "Select take_idx,title, case when mainimg = '' then listimg else mainimg end as mainimg ,summery, part From dbo.tbl_board_list where bbscode = '1minknowhow' "
	'sql = sql & "main_check=1 and mainimg <> '' "
	sql = sql & " and status = '1' Order By writeDay Desc, take_idx Desc "

	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
	Application.Lock
	Application.Contents("ITStory_Array") = arrRs
	Application.Contents("ITStory_Now") = Now()
	Application.Unlock

	GetITStoryToArray = arrRs
End Function

Function GetMainBannerToArray()
	Dim AryHashMap
	Set AryHashMap = New RsToHashMap
	sql = "TBL_SiteBanner_L @adminchk = 'w', @gubun = 'w', @position='EventBanner', @pageNumber='', @RowPerPage=''"
	Dim arrRs : arrRs = AryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)

	Application.Lock
	Application.Contents("MainBanner_Array") = arrRs
	Application.Contents("MainBanner_Now") = Now()
	Application.Unlock

	GetMainBannerToArray = arrRs

END Function

'계열별 취업 현황 리스트
Function GetMainWorkingToArray()
	Dim AryHashMap
	Set AryHashMap = New RsToHashMap
	sql = "HAKSA_취업현황_L @site='WEB_MAIN', @part='ALL', @pageNumber='1', @RowPerPage='10'"

	 'Response.Write sql
	Dim arrRs : arrRs = AryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)

	Application.Lock
	Application.Contents("MainWorking_Array") = arrRs
	Application.Contents("MainWorking_Now") = Now()
	Application.Unlock

	GetMainWorkingToArray = arrRs

END Function

Function getMainBanner(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='메인배너' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_f(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='포커스' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_f = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_news(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='뉴스' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_news = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_sns(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='sns' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_sns = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_A1(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='소식' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_A1 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_A2(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='행사' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_A2 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_A3(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='학생스토리' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_A3 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_A4(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='공지' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_A4 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Function getMainBanner_A5(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap

	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='서브배너' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner_A5 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function


Dim mbanner : mbanner = getMainBanner(102)
Dim mbanner_f : mbanner_f = getMainBanner_f(102)
Dim mbanner_news : mbanner_news = getMainBanner_news(102)
Dim mbanner_sns : mbanner_sns = getMainBanner_sns(102)

Dim mbanner_A1 : mbanner_A1 = getMainBanner_A1(102)
Dim mbanner_A2 : mbanner_A2 = getMainBanner_A2(102)
Dim mbanner_A3 : mbanner_A3 = getMainBanner_A3(102)
Dim mbanner_A4 : mbanner_A4 = getMainBanner_A4(102)
Dim mbanner_A5 : mbanner_A5 = getMainBanner_A5(102)



%>
<!-- #include Virtual="/inc/2017/inc_html_head_utf10.inc" -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body>

  <%
  if request("sk")="true" then
  %>
  <div> Top banner custom </div>
  <%
  end if
   %>


<!-- S: skip navi -->
<!-- #include virtual="/inc/2017/inc_skip_navi_utf8.inc" -->
<!-- E: skip navi -->
<!-- S: header 시작 -->
<!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->
<!-- E: header 종료 -->

<% 'AryMainBanner= GetMainBanner() %>
<div class="mainWrap">

	<div id="mainVisual">
		<ul class="swiper-wrapper">

        <%
        For i = 0 To UBound(mbanner)

		%>

            <li class="swiper-slide">
                <a href="<%=mbanner(i).item("content")%>">
	                <img src="/upload_files/renew/banner/<%=mbanner(i).item("file2")%>">
                </a>
            </li>

        <%

			NEXT
		%>



		</ul>
		<div class="pager"></div>
	</div>

	<!--2020add_mainBtn_st-->
	<div class="mainBtn">
		<a href="http://www.koreait.ac.kr/new/index.asp?ap=chk"><img class="btnImg" src="/images/2020/mainBtn1_off.png" alt="등록금조회"></a>
		<a href="http://www.koreait.ac.kr/new/ad_lead/support_apply.asp"><img class="btnImg" src="/images/2020/mainBtn2_off.png" alt="신입생원서접수"></a>
		<a href="http://www.koreait.ac.kr/new/ad_lead/ms_main.asp"><img class="btnImg" src="/images/2020/mainBtn3_off.png" alt="모의원서접수"></a>
		<a href="http://www.koreait.ac.kr/new/ad_lead/counsel_request_post.asp"><img class="btnImg" src="/images/2020/mainBtn4_off.png" alt="입학자료신청"></a>
	</div>
	<!--2020add_mainBtn_end-->

</div>

<div id="mainContents">


<!--2020add_subbanner_st-->
<div class="subbannerWrap2">
	<div id="SubBannerVisual">
		<ul class="swiper-wrapper">
        <%
        For i = 0 To UBound(mbanner_A5)
		%>
            <li class="swiper-slide">
                <a href="<%=mbanner_A5(i).item("content")%>">
	                <img src="/upload_files/renew/banner/<%=mbanner_A5(i).item("file2")%>">
                </a>
            </li>

        <%
			NEXT
		%>
		</ul>
		<div id="subBannerPager" class="subBannerPager"></div>
	</div>
</div>
<!--2020add_subbanner_end-->

<!--2020add_portfoliolink_st-->
<div class="mainPortfolio">
	<h2 class="newTitle2020"><img src="/images/2020/mainPortfolioTit.png" alt="mainPortfolio"></h2>
	<div class="portfolioTabBox">
		<ul>
			<li class="on">게임계열</li>
			<li class="">정보보안계열</li>
			<li>디지털디자인계열</li>
			<li>인공지능(AI)계열</li>
		</ul>
	</div>
	<div class="portfolioTabContent">
		<div class="tabContIn1" style="display:block;">
			<a style="top:-170px;" href="http://www.koreait.ac.kr/new/school/game/html/gallery.asp" class="mainFocusMore">더보기</a>
			<ul>
				<li><a href="http://www.koreait.ac.kr/new/school/game/html/gallery.asp"><img src="/images/2020/portfolioImg01.png" alt=""></a></li>
			</ul>
		</div>
		<div class="tabContIn2" style=";">
			<a style="top:-170px;" href="http://www.koreait.ac.kr/new/school/security/html/gallery.asp" class="mainFocusMore">더보기</a>
			<ul>
				<li><a href="http://www.koreait.ac.kr/new/school/security/html/gallery.asp"><img src="/images/2020/portfolioImg02.png" alt=""></a></li>
			</ul>
		</div>
		<div class="tabContIn3" style="">
			<a style="top:-170px;" href="http://www.koreait.ac.kr/new/school/contentsdesign/html/gallery.asp" class="mainFocusMore">더보기</a>
			<ul>
				<li><a href="http://www.koreait.ac.kr/new/school/contentsdesign/html/gallery.asp"><img src="/images/2020/portfolioImg03.png" alt=""></a></li>
			</ul>
		</div>
		<div class="tabContIn4" style="">
			<a style="top:-170px;" href="http://www.koreait.ac.kr/new/school/smart/html/gallery.asp" class="mainFocusMore">더보기</a>
			<ul>
				<li><a href="http://www.koreait.ac.kr/new/school/smart/html/gallery.asp"><img src="/images/2020/portfolioImg04.png" alt=""></a></li>
			</ul>
		</div>
	</div>
</div>

<!--2020add_portfoliolink_end-->

<style>
.announcTabBox ul li{cursor:pointer;}
</style>
	<div class="mainAnnouncements">
		<h2 class="newTitle2020"><img src="/images/2020/mainAnnouncementsTit2.png" alt="Announcements"></h2>
		<div class="announcTabBox">
			<ul>
            	<li class="on">행사</li>
				<li>소식</li>
				<li>학생 스토리</li>
				<li>공지</li>
			</ul>
		</div>


        <style>
		.tabContIn_a{/*height:230px;*/height:304px; padding:0px;}
		.tabContIn_img{width:270px; /*height:220px;*/height:304px; margin-left:-10px;}
		</style>

		<div class="announcTabContent">



        <!--행사탭-->
			<div class="tabContIn1" style="display:block;">
            <a style="top:115px;" href="http://www.koreait.ac.kr/new/board/eventboard.asp" class="mainFocusMore">더보기</a>
				<ul>
					<%
                    For i = 0 To 3 '4개 고정

                    %>

                        <li>




                        <a class="tabContIn_a" href="<%=mbanner_A2(i).item("content")%>">

                                <img class="tabContIn_img" src="/upload_files/renew/banner/<%=mbanner_A2(i).item("file2")%>">






                            </a>
                        </li>

                    <%

                    NEXT
                    %>
				</ul>
			</div>



        <!--소식탭-->
			<div class="tabContIn2">
            <a style="top:115px;" href="http://www.koreait.ac.kr/new/board/pressboard.asp" class="mainFocusMore">더보기</a>
				<ul>

					<%
                    For i = 0 To 3 '4개 고정

                    %>

                        <li>
							<a class="tabContIn_a" href="<%=mbanner_A1(i).item("content")%>">

                                <img class="tabContIn_img" src="/upload_files/renew/banner/<%=mbanner_A1(i).item("file2")%>">

                            </a>
                        </li>

                    <%

                    NEXT
                    %>
				</ul>
			</div>



            <!--학생 스토리탭-->
			<div class="tabContIn3">
             <a style="top:115px;" href="http://www.koreait.ac.kr/new/board/1minknowhow.asp" class="mainFocusMore">더보기</a>
				<ul>
					<%


                    For i = 0 To 3 '4개 고정

                    %>

                        <li>


							<a class="tabContIn_a" href="<%=mbanner_A3(i).item("content")%>">

                                <img class="tabContIn_img" src="/upload_files/renew/banner/<%=mbanner_A3(i).item("file2")%>">

                            </a>


                        </li>

                    <%

                    NEXT
                    %>
				</ul>
			</div>

            <!--공지탭-->
			<div class="tabContIn4">
             <a style="top:115px;" href="http://www.koreait.ac.kr/new/board_skin/board_index01.asp" class="mainFocusMore">더보기</a>
				<ul>
					<%
                    For i = 0 To 3 '4개 고정

                    %>

                        <li>
							<a class="tabContIn_a" href="<%=mbanner_A4(i).item("content")%>">

                                <img class="tabContIn_img" src="/upload_files/renew/banner/<%=mbanner_A4(i).item("file2")%>">

                            </a>
                        </li>

                    <%

                    NEXT
                    %>
				</ul>
			</div>
		</div>

	</div>
	<script>
		$(window).scroll(function() {
			var wScroll = $(this).scrollTop();

			if (wScroll > 200) {
				$("header").addClass("on");
				$(".gnbWrap .amazon").css({
					"background": "url(/images/2017/layout/aws.png) no-repeat",
					"background-size": "80%",
					"width": "230px",
					"height": "40px"
				});
			} else if (wScroll == 0) {
				$("header").removeClass("on");
				$(".gnbWrap .amazon").css({
					"background": "url(/images/2017/layout/aws_white.png) no-repeat",
					"background-size": "80%",
					"width": "230px",
					"height": "40px"
				});
			}
		});

		$(document).ready(function() {
			//annoucetab
			$(".announcTabBox li").click(function() {
				$(this).addClass("on").siblings("li").removeClass("on");
				var idxTabBox = $(".announcTabBox li").index(this) + 1;
				$(".announcTabContent .tabContIn" + idxTabBox).show().siblings("div").hide();
			});
			//portfoliotab
			$(".portfolioTabBox li").click(function() {
				$(this).addClass("on").siblings("li").removeClass("on");
				var idxTabBox = $(".portfolioTabBox li").index(this) + 1;
				$(".portfolioTabContent .tabContIn" + idxTabBox).show().siblings("div").hide();
			});

			//mainjob
			$(".mainjobTabBox li").click(function() {
				$(this).addClass("on").siblings("li").removeClass("on");
				var idxTabBox = $(".mainjobTabBox li").index(this) + 1;
				$(".mainjobTabContent .tabContIn" + idxTabBox).show().siblings("div").hide();
			});
		})
	</script>


	<!--2020add_classlink_st-->
	<div class="mainClassLink">
		<h2 class="newTitle2020"><img src="/images/2020/mainClassLinkTit.png" alt=""></h2>
		<div class="classLink">
			<a href="http://www.koreait.ac.kr/new/school/game/html/">
				<img src="/images/2020/classlink_game.png" alt="">
				<div class="classBtn">게임계열</div>
			</a>
			<a href="http://www.koreait.ac.kr/new/school/security/html/">
				<img src="/images/2020/classlink_security.png" alt="">
				<div class="classBtn">정보보안계열</div>
			</a>
			<a href="http://www.koreait.ac.kr/new/school/contentsdesign/html/">
				<img src="/images/2020/classlink_design.png" alt="">
				<div class="classBtn">디지털디자인계열</div>
			</a>
			<a href="http://www.koreait.ac.kr/new/school/smart/html/">
				<img src="/images/2020/classlink_smart.png" alt="">
				<div class="classBtn">인공지능(AI)계열</div>
			</a>
			<a href="http://www.koreait.ac.kr/new/school/electric/html/">
				<img src="/images/2020/classlink_elec.png" alt="">
				<div class="classBtn">전기공학</div>
			</a>
		</div>
	</div>
	<!--2020add_classlink_end-->


	<!--2020add_apply_st-->
	<div class="mainApplyGroup">
		<div class="mainApply">
			<div class="applyBtnWrap">
				<div class="applyTitle">
					<div>입학 안내</div>
					<div>4차 산업혁명 시대를 주도할 인재는 바로 너!</div>
				</div>
				<ul class="applyBtnGroup">
					<li>
						<a href="http://www.koreait.ac.kr/new/ad_lead/admission.asp">
							<img src="/images/2020/applyQuick01.png" alt="모집요강">
							<div>모집요강</div>
						</a>
					</li>
					<li>
						<a href="http://www.koreait.ac.kr/new/board_skin/sangdam_board/board_index.asp">
							<img src="/images/2020/applyQuick02.png" alt="입학Q&A">
							<div>입학Q&#38;A</div>
						</a>
					</li>
					<li>
						<a href="http://www.koreait.ac.kr/new/board/eventboard.asp?code=con&id=740&page=1&tab=0">
							<img src="/images/2020/applyQuick03.png" alt="진로체험">
							<div>진로체험</div>
						</a>
					</li>
					<li>
						<a href="http://www.koreait.ac.kr/new/ad_lead/interviewGud.asp">
							<img src="/images/2020/applyQuick04.png" alt="면접가이드">
							<div>면접가이드</div>
						</a>
					</li>
					<li>
						<a href="http://www.koreait.ac.kr/new/ad_lead/support_passnotice.asp">
							<img src="/images/2020/applyQuick05.png" alt="합격자 조회">
							<div>합격자 조회</div>
						</a>
					</li>
					<li>
						<a href="http://www.koreait.ac.kr/new/ad_lead/vreserve.asp">
							<img src="/images/2020/applyQuick06.png" alt="방문상담예약">
							<div>방문상담예약</div>
						</a>
					</li>
				</ul>
			</div>

			<div class="applyTxtGroup">
				<h2><img src="/images/2020/applyTit.png" alt="2021학년도 신ㆍ편입생 모집"></h2>
				<div class="applytxt">
					<p>ㆍ수능/내신 미반영<br /><span>(계열별 면접선발)</span></p>
					<p>ㆍ면접&#38;적성검사 100% 선발</p>
					<p>ㆍ합격생 선행학습 제공</p>
				</div>
				<div class="applytxt2">
					<%
					IF isArray(Selection) Then
						For i = 0 To UBound(Selection)
							IF StrComp(Selection(i).item("Study_year"),"2021") = 0 Then
					%>
					<a href="/new/ad_lead/support_apply.asp?year=<%=Selection(i).item("Study_year")%>">
						<span>~ <%=right(Selection(i).item("To_Date"),8)%></span>
					</a>
					<%
							END IF
						NEXT
					END IF
					%>
				</div>
				<div class="applyLinkBtn"><a href="http://www.koreait.ac.kr/new/ad_lead/support_apply.asp">원서접수</a></div>
			</div>

		</div>
	</div>
<!--2020add_apply_end-->

<!--2020add_mainjob_st-->
<div class="mainjob">
	<h2 class="newTitle2020"><img src="/images/2020/mainjobTit.png" alt="mainPortfolio"></h2>
	<div class="mainjobTabBox">
		<ul>
			<li class="on">취업</li>
			<li class="">대학원 진학</li>
			<li>국방</li>
		</ul>
	</div>
	<div class="mainjobTabContent">
		<div class="tabContIn1" style="display:block;">
			<ul>
				<li><img src="/images/2020/mainjob02.png" alt=""></li>
			</ul>
		</div>
		<div class="tabContIn2" style=";">
			<ul>
				<li><img src="/images/2020/mainjob01.png" alt=""></li>
			</ul>
		</div>
		<div class="tabContIn3" style="">
			<ul>
				<li><img src="/images/2020/mainjob03.png" alt=""></li>
			</ul>
		</div>
	</div>
</div>


	<div class="mainCourse">
		<h2 class="newTitle2020"><img src="/images/2020/mainCourseTit.png" alt="Course"></h2>
		<ul>

        	<li><a href="http://www.koreait.ac.kr/new/ad_lead/support_apply_sub.asp">
				<img src="/images/2020/mainCourse03.png" alt="" />
				<p><span>원서접수</span></p>
			</a></li>

			<li><a href="http://www.koreait.ac.kr/new/tep3-1.asp">
				<img src="/images/2020/mainCourse02.png" alt="" />
				<p><span>전형소개</span></p>
			</a></li>

            <li><a href="http://www.koreait.ac.kr/new/tep3-1.asp">
				<img src="/images/2020/mainCourse01.png" alt="" />
				<p><span>과정소개</span></p>
			</a></li>

		</ul>
	</div>

    <div class="mainSns">
		<div class="msIN">
			<h2 class=""><img src="/images/2020/mainSnsTit.png" alt="Korea IT Sns"></h2>

			<div class="sns-swiperWrap">
				<div class="sns_siperWrap_in">
					<div class="sns-swiper-container-wrap">
						<div class="sns-swiper-container">
							<ul class="swiper-wrapper">

                            <%
								Dim sns_icon(3)
								sns_icon(0) = "facebook"
								sns_icon(1) = "youtube"
								sns_icon(2) = "naver"
								sns_icon(3) = "insta"
							%>
								<%
                                	For i = 0 To 3
                                %>

                                <li class="swiper-slide">


										<img src="/images/2020/color_<%=sns_icon(i)%>.png" class="swiper_in_icon" />


									<a target="_blank" href="<%=mbanner_sns(i).item("content")%>" class="" data-animation="" >
										<div class="snsinwrap">
											<img src="/upload_files/renew/banner/<%=mbanner_sns(i).item("file2")%>" alt="" />
										</div>
									</a>
								</li>

                                <%
                                	NEXT
                                %>
							</ul>
						</div>
						<div class="snsSwiperNext"></div>
						<div class="snsSwiperPrev"></div>
						<div class="sns-swiper-pagination"></div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<style type="text/css">
	.LC-swiper-container-wrap{
		width:603px;
		height:532px;

		overflow:hidden;

	}

	#mainBanner .pager {
		width: auto !important;
		left: auto !important;
		padding-left:53px;
		color:#808080;
	}

	#mainBanner .swiper-pagination-bullet{


		position:relative;

		float:left;

	    padding:3px;

		top: -15px;
		left:232px;


	display: inline-block;
    width: 14px;
    height: 14px;
    border: 2px solid #c7c7c7;
    margin: 0 5px;
    -webkit-border-radius: 100%;
    -moz-border-radius: 100%;
    border-radius: 100%;
    transition: all 0.5s ease-out;
    background: none;
    opacity: 1;


	}
	#mainBanner .swiper-pagination-bullet-active{

		background-color:#c7c7c7;
	}


	#mainBanner .subBackground .LC-sub {position:relative; left:0; right:0; bottom:0; top:0;width: 232px;height: 555px;}
	#mainBanner .subBackground .LC-sub#LC-subBg1{background:url(images/subBanner/subBannerBackground_01_new.jpg)no-repeat center bottom;}
	#mainBanner .subBackground .LC-sub#LC-subBg2{background:url(images/subBanner/subBannerBackground_02_new.jpg)no-repeat center bottom;}
	#mainBanner .subBackground .LC-sub#LC-subBg3{background:url(images/subBanner/subBannerBackground_03_new.jpg)no-repeat center bottom;}
	#mainBanner .subBackground .LC-sub#LC-subBg4{background:url(images/subBanner/subBannerBackground_04_new.jpg)no-repeat center bottom;}
	.LC-s1 {top: 0px;left: 0px;	}
	.LC-s2 {top: 0;right: 0;}
	.LC-s3 {bottom: 0px;left: 0;}
	.LC-s4 {bottom: 0px;right: 0px;}

	.swap-on-hover {
		position: relative;
		max-width: 370px;
		height:37px;
	}


	.swap-on-hover img {
		position: absolute;
		top:0;
		left:0;
		overflow: hidden;
		width: 370px;
		height: 127px;
	}

	.swap-on-hover .ui {
		position: absolute;
		top:23px;
		left:62px;
		overflow: hidden;
		width: 250px;
		height: 50px;

	}

	.swap-on-hover .swap-on-hover-front-image {
		z-index: 2;
		transition: opacity .5s linear;
		cursor: pointer;
	}

	.swap-on-hover:hover > .swap-on-hover-front-image{
		opacity: 0;
	}
	/* 변경해야 할 부분 */
	#working.workingContents {margin-bottom:0;}	/* main.css Line 352 */
	.workingContents .workingWrap {margin-bottom: 0;}				/* contents.css Line 619 */
	.subRightGroup .RboxGroup2 {margin-bottom:13px;margin-top:0;}
	.subRightGroup .subRboxBtn {    width: 300px;    position: absolute;    top: 445px;    left: 60px;}
	/*********************/

	#partCon{
		width:300px;
		height:75px;
		font-size:14px;
		line-height:27px;
		margin-bottom:20px;
		margin-left:65px;
		margin-top:25px;

		}

	.swap-on-hover2 {
		position: relative;
		max-width: 370px;
		height:127px;
	}


	.swap-on-hover2 img {
		position: absolute;
		top:15px;
		left:23px;
		overflow: hidden;
		width: 65px;
		height: 85px;
	}

	.swap-on-hover2 .ui {
		position: absolute;
		top:23px;
		left:62px;
		overflow: hidden;
		width: 250px;
		height: 50px;

	}

	.swap-on-hover2 .swap-on-hover-front-image {
		z-index: 2;
		transition: opacity .5s linear;
		cursor: pointer;
	}

	.swap-on-hover2:hover > .swap-on-hover-front-image{
		opacity: 0;
	}

	.school-re .school-reContentWrap>ul{position: relative;}

	.school-re .schoolRightBtn{width: 110px; height: 110px;  float: left;  text-indent: -9999px;
		border-radius: 110px 110px 110px 110px; z-index: 1; background: rgba(30, 30, 30, 0.5);
		-moz-border-radius: 110px 110px 110px 110px;-webkit-border-radius: 110px 110px 110px 110px;
		 background-repeat: no-repeat; background-size:35%;
		background-position: center;
		position: absolute;top: 150px; left: 20%;
		}

	.school-re .schoolLeftBtn{width: 110px; height: 110px; float: right; text-indent: -9999px;
		border-radius: 110px 110px 110px 110px; z-index: 1; background: rgba(30, 30, 30, 0.5);
		-moz-border-radius: 110px 110px 110px 110px;-webkit-border-radius: 110px 110px 110px 110px;
		 background-repeat: no-repeat; background-size:35%;
		background-position: center;
		position: absolute;top: 150px; left: 20%;
	    margin-left: 1300px;
		}



	</style>
	<!--새로운 작업부분-->
	<script language="javascript">
	var direction = "l";

	var swiperSns = new Swiper('.sns-swiper-container', {

			loop			:	true,
			autoplay : 4000,
			speed: 1500,
			paginationClickable: true,
			pagination: '.sns-swiper-pagination',
		});
	$(document).ready(function(e) {

		$(document).on("click",".snsSwiperNext",function(e){
			e.preventDefault();
			$(".copy").stop();
			direction = "r";
			swiperSns.slideNext();
		});
		$(document).on("click",".snsSwiperPrev",function(e){
			e.preventDefault();
			$(".copy").stop();
			direction = "l";
			swiperSns.slidePrev();
		});

		var swiper = new Swiper('.LC-swiper-container', {

			loop			:	true,

			autoHeight:true,

			autoplay : 4000,

			speed: 1500,

			pagination: ".pagerq",
			paginationClickable: true
		});

		$(document).on("click",".sub-btnPrev-l",function(e){
			e.preventDefault();
			$(".copy").stop();
			direction = "l";
			swiper.slideNext();
		});
		$(document).on("click",".sub-btnPrev-r",function(e){
			e.preventDefault();
			$(".copy").stop();
			direction = "r";
			swiper.slidePrev();
		});

		$(document).on("click",".lContentbtnl",function(e){
			e.preventDefault();
			$(".copy").stop();
			direction = "r";
			swiper.slideNext();
		});
		$(document).on("click",".lContentbtnr",function(e){
			e.preventDefault();
			$(".copy").stop();
			direction = "l";
			swiper.slidePrev();
		});

	});

	function doAnimations(elements) {
		//console.log(elements);
		var animationEndEvents = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
		elements.each(function() {
			var $this = $(this);
			var $animationDelay = $this.data('delay');
			var $animationType = 'animated ' + $this.data('animation');
			$this.css({
				'animation-delay': $animationDelay,
				'-webkit-animation-delay': $animationDelay,
				'opacity':1
			});
			$this.addClass($animationType).one(animationEndEvents, function() {
				$this.removeClass($animationType);
			});
		});
	};


	</script>

	</div>

</div>


<!-- footer (하단) -->
<!--#include Virtual= "/inc/2017/inc_body_footer_utf8_sk.asp"-->

<%  IF request("ap") = "chk" THEN %>

	<!--#include Virtual="/inc/2017/inc_popup_main_utf8_new.inc"-->

<% ELSE %>

	<!--#include Virtual="/inc/2017/inc_popup_main_utf85.asp"-->

<% END IF %>


<!-- 배너광고 (리타게팅) 집행 2017-05-22  -->
<script type="text/javascript">
	var roosevelt_params = {
		retargeting_id: 'kuW5yBYDH2LZeXe_aasJGg00',
		tag_label: 'jPvnXgwyRkucooZs1Bbyqg'
	};

</script>

<script type="text/javascript" src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type": "Person",
		"name": "한국IT직업전문학교",
		"url": "http://www.koreait.ac.kr",
		"sameAs": [
			"https://www.facebook.com/koreaitbest",
			"http://plus.kakao.com/home/jp5sl4b9",
			"http://tv.naver.com/koreait1998"
		]
	}

</script>
<script>
	$(document).ready(function(e) {
		$('.school .schoolList li').hover(function() {
				$(this).find("ul").css('visibility', 'visible');
			},
			function() {
				$(this).find("ul").css('visibility', 'hidden');
			}
		);
	});
</script>

<!-- 배너광고 (리타게팅) 집행 2017-05-22 end -->



<!--계열소개 제이쿼리-->

<script>
	timer();
	mainBtn();
	subBanner();
	var current = 0;
	var $interval;

	function timer() {

		slide()

	}

	function slide() {

		$(".schoolRightBtn").click(function(e){
			$(".bannerbox").animate({
			left: "-=300px"
			}, function() {
				$(".bannerbox").css({"left": 0});
			$(".bannerbox>li").first().appendTo('.bannerbox');

			});
		    if (current == 17) current = 0;
		})


		$(".schoolLeftBtn").click(function(e){
			$(".bannerbox").animate({
			left: "+=300px"
			}, function() {
				$(".bannerbox").css({"left": 0});
			$(".bannerbox>li").last().prependTo('.bannerbox');

			});
		    if (current == 17) current = 0;
		})

		$('.CourseIntroduceWrap>li.CourseIntroduce').mouseover(function(){
				$(this).css('background-color','#000;')
				$(this).find('p').css('color','#fff')
			});
		$('.CourseIntroduceWrap>li.CourseIntroduce').mouseleave(function(){
				$(this).css('background-color','#fff')
				$(this).find('p').css('color','#676767')
			});
	}

	/*2020_add_mainBtn*/
	function mainBtn(){
		$(".btnImg").mouseover(function(){
			$(this).attr("src", $(this).attr("src").replace('_off.png','_on.png'));
		});
		$(".btnImg").mouseout(function(){
			$(this).attr("src", $(this).attr("src").replace('_on.png','_off.png'));
		});
	}
	/*2020_add_subbanner*/
	function subBanner(){
		var SubBannerVisual = new Swiper('#SubBannerVisual',{
			loop : true,
			autoplay: 2000,
			pagination: '.subBannerPager',
		})
	}
</script>

<script type="text/javascript">
//팝업
//$(document).ready(function(){

    //console.log("sk: " );
 //  window.open('http://www.koreait.ac.kr/new/te.html', '학위수여식', 'width=310px,height=410px;,scrollbars=no;,location= no;,toolbars=no;,status=no;');
//});


    </script>


</body>
</html>
