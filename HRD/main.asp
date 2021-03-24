<!--#include virtual="/_include/Service_Inc.inc"-->
<%
Dim cls, chk1, chk2, chk3
Dim rsArrayMenu, rsArrayMainRoll, rsArrayNotice, rsArrayCourseIcon, rsArrayCounsel, rsArrayEpilogue, rsArrayPortfolio
Dim rsArraySiteJobInfo, rsArrayState

'메뉴구성
sql = "select c.clscata, r.crcd, r.crtitle from TBL_CourseReal r, TBL_CourseClass c where r.clscd = c.clscd and r.isview = N'Y' order by c.clscata, r.crcd"
rsArrayMenu = GetRowsQuery(CONNSTRING_WEB,sql)

'메인 롤
sql = "select smrfile, smrurl from TBL_SiteMainRoll where smrisview = N'Y'"
rsArrayMainRoll = GetRowsQuery(CONNSTRING_WEB,sql)

'공지사항
sql = "select top 5 sncd, sntitle, regdate, snishot from TBL_SiteNotice where snishot = N'Y' and scode = '1' and (snstatus is null or snstatus = 'Y') order by regdate desc"
sql = sql & " union all "
sql = sql & " select top 5 sncd, sntitle, regdate, snishot from TBL_SiteNotice where snishot <> N'Y' and scode = '1' and (snstatus is null or snstatus = 'Y') order by regdate desc"
sql = "select top 5 * From (" & sql & ") As x"
rsArrayNotice = GetRowsQuery(CONNSTRING_WEB,sql)

'지원과정
'sql = "select c.clscata, r.crcd, r.crtitle from TBL_CourseReal r, TBL_CourseClass c where r.clscd = c.clscd and r.crstatus = N'A' order by c.clscata, r.edusdate"
sql = "select c.clscata, r.crcd, r.crtitle, IsNull(i.scifile,'') as scifile "
sql = sql & " from TBL_CourseReal r "
sql = sql & " Inner Join TBL_CourseClass c On r.clscd = c.clscd "
sql = sql & " Inner Join TBL_SiteCourse s On s.crcd=r.crcd "
sql = sql & " left Join TBL_SiteCourseImg i On s.mainimg = i.scicd "
'sql = sql & " where r.crstatus = N'A' and r.isview= N'Y' order by c.clscata, r.edusdate"
sql = sql & " where r.crstatus = N'A' and r.scode = '1' order by c.clscata, r.edusdate"
rsArrayCourseIcon = GetRowsQuery(CONNSTRING_WEB,sql)

'입학상담
sql = "select top 5 sccd, sctitle, scwdate from TBL_SiteCounsel where sccd = parentcd and scode = 1 and  (del_yn = 'N' or del_yn is null) order by scwdate desc"
rsArrayCounsel = GetRowsQuery(CONNSTRING_WEB,sql)

'합격자리스트(취업현황)
'sql = "select top 5 sjicd, incrute_kind, regdate from TBL_SiteJobInfo order by regdate desc"
sql = "select top 5 take_idx as sjicd, incrute_kind, writeday as regdate from jobinfo2_board where Status=1 order by ref desc, step"
rsArraySiteJobInfo = GetRowsQuery(CONNSTRING_WEB,sql)

sql = "select top 5 e.tecd, left(b.tbname,1) + '**: ' + r.crtitle + ' ' + ltrim(str(r.crinning)) + '회차' as crtitle, e.tejoindate from TBL_TraineeBasic b, TBL_TraineeCourse c, TBL_TraineeEmploy e, TBL_CourseReal r where b.tbcd = c.tbcd and c.tccd = e.tccd and c.crcd = r.crcd and c.tcstatus = 12 order by e.tejoindate desc"
rsArrayState = GetRowsQuery(CONNSTRING_WEB,sql)

'수강후기
sql = "select top 5 s.secd, s.secontents, s.regdate from TBL_SiteEpilogue s inner join TBL_CourseReal r on s.crcd = r.crcd where r.scode = '1' order by s.regdate desc"
rsArrayEpilogue = GetRowsQuery(CONNSTRING_WEB,sql)

'포트폴리오
sql = "select top 10 p.spcd, p.spisimg, p.spthumb, p.spfile, p.crtitle from TBL_SitePortfolio p "
sql = sql & " inner join TBL_courseReal r on p.crcd = r.crcd and r.scode != 2 order by p.regdate desc"
rsArrayPortfolio = GetRowsQuery(CONNSTRING_WEB,sql)

Dim arrCrCds(5)
For i = 1 To UBound(arrCrCds,1)
	arrCrCds(i) = 0
Next

Dim tmp_link_str : tmp_link_str = "#"
rsArray = rsArrayMenu
If IsArray(rsArray) Then
	For i = 0 To UBound(rsArray,2)
		If StrComp(arrCrCds(rsArray(0,i)),0) = 0 Then 
			arrCrCds(rsArray(0,i)) = rsArray(1,i)

			If Len(tmp_link_str) = 1 Then
				tmp_link_str = "/curriculum/curriculum.asp?cata=" & rsArray(0,i) & "&crcd=" & arrCrCds(rsArray(0,i))
			End If
		End If
	Next
End If
tmp = "javascript:alert('개설된 과정이 없습니다.');"

timesSecArr(1) = timer()
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>한국 IT 직업전문학교</title>
<meta name="Robots" content="ALL">
<meta name="description" content="정보보안, 게임콘텐츠, 디자인 전문가양성, NCS 과정 국비무료교육, 취업연계">

<meta property="og:type" content="website">
<meta property="og:title" content="한국 IT 직업전문학교">
<meta property="og:description" content="정보보안, 게임콘텐츠, 디자인 전문가양성, NCS 과정 국비무료교육, 취업연계">
<meta property="og:image" content="http://hrd.koreait.ac.kr/main_imgs/logo.jpg">
<meta property="og:url" content="http://hrd.koreait.ac.kr">

<link rel="shortcut icon" href="/favicon1.ico" type="image/x-icon">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="stylesheet" type="text/css" href="/css/main_frame.css?20170110" />
<link rel="stylesheet" type="text/css" href="/css/quick_menu.css?20170111" />

<!--[if lt IE 9]>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" charset="utf-8"></script>
<![endif]-->

<link rel="stylesheet" media="all" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js" charset="utf-8"></script>

<!-- jquery.bxslider -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.5/jquery.bxslider.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.5/jquery.bxslider.min.js" charset="utf-8"></script>

<!-- jquery.fancybox -->
<link rel="stylesheet" media="all" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.pack.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js" charset="utf-8"></script>

<script src="/js/common.js"></script>
<script src="/js/custom.js?20170113"></script>

<style type="text/css">
.contact_wrap {
    margin: 5px 0 0 0;
    border: 1px solid #dadbd4;
    border-top: 5px solid #dadbd4;
    width: 149px;
    height: 175px;
	background-color: #AAA;
    background: url("../main_imgs/mini_map2.jpg") no-repeat center;
	text-indent: -10000px;
}

.bottom_wrap { 
    width: auto;
    height: 180px;
    margin: 0;
    border: 1px solid #dadbd4;
}

.bottom_wrap .heading {
    position: relative;
    display: inline-block;
    padding: 3px 0 5px 15px;
    width: 285px;
    vertical-align: bottom;
    font-size: 13px;
    font-family: notokr-medium;
    border: 0px solid;
}

.portfolio_wrap .heading {
    position: relative;
    display: inline-block;
    padding: 5px 0 5px 15px;
    width: 162px;
    vertical-align: bottom;
    font-size: 13px;
    font-family: notokr-medium;
    border: 0px solid;
}

.bxSlider .slide { display: none; }
.bx-wrapper .slide { margin:0 auto; padding:0; margin-right:20px !important; display: inline-block !important;}
.bx-wrapper .slide img { border:0; padding:0; margin:0 auto; }

/* 이미지 슬라이드 */
#roll_image .bx-wrapper { margin:0 auto; box-shadow: none; max-width: 650px !important; width: 650px; height: 330px; border:0; padding:0; }
#roll_image .bx-wrapper .bx-pager { display: none;}
#roll_image .bx-wrapper .bx-controls .bx-prev { left: 0; background:url('/main_imgs/thin_left_arrow_333.png') no-repeat center;}
#roll_image .bx-wrapper .bx-controls .bx-next { right: 0; background:url('/main_imgs/thin_right_arrow_333.png') no-repeat center;}

/* 롤링배너 */
#roll_banner .bx-wrapper { margin:0 auto; box-shadow: none;	border:0; padding:15px 0; }
#roll_banner .bx-wrapper .slide { width: 140px !important; }
#roll_banner .bx-wrapper .bx-pager { display: none;}
#roll_banner .bx-wrapper .bx-controls .bx-prev { left: -80px; background:url('/main_imgs/btnBannerPrev.png') no-repeat center;}
#roll_banner .bx-wrapper .bx-controls .bx-next { right: -80px; background:url('/main_imgs/btnBannerNext.png') no-repeat center;}

/* 실업자지원과정, 재직자지원과정, 일반과정 배너 */
.roll_course { position: relative; width: 100%; overflow: hidden; border:0; padding:0; margin:0; } 
.roll_course .bx-wrapper { margin:0 auto; box-shadow: none; border:0; padding:10px 25px 0; width:240px;}
.roll_course .bx-wrapper .slide { width: 110px !important; }

.roll_course .bx-wrapper .bx-pager { display: none;}
.roll_course .bx-wrapper .bx-controls .bx-prev { left: -10px; background:url('/main_imgs/btnBannerPrev.png') no-repeat center;}
.roll_course .bx-wrapper .bx-controls .bx-next { right: -10px; background:url('/main_imgs/btnBannerNext.png') no-repeat center;}

/* 포트폴리오 */
#roll_portfolio .bx-wrapper { margin:0 auto; box-shadow: none; border:0; padding:10px 30px 0; width:880px;}
#roll_portfolio .bx-wrapper .slide { width: 200px !important; margin-right:25px !important; }
#roll_portfolio .bx-wrapper .bx-pager { display: none;}
#roll_portfolio .bx-wrapper .slide img { width:260px; }
#roll_portfolio .bx-wrapper .bx-controls .bx-prev { left: -10px; background:url('/main_imgs/btnBannerPrev.png') no-repeat center;}
#roll_portfolio .bx-wrapper .bx-controls .bx-next { right: -10px; background:url('/main_imgs/btnBannerNext.png') no-repeat center;}
</style>

<style type="text/css">
.header_wrap {
    min-width: 100%;
    height: 60px;
    background-color: #06a9ef;
    border: 0px solid orange;
}

.gnb_wrap {
    width: 1000px;
    border: 0px solid;
    background: url("/main_imgs/main_logo.jpg") no-repeat 2px 15px;
}

ul#gnb { width: 1000px !important; padding:0 !important; margin:0 !important; }
ul#gnb > li { width: 123px !important; height: 60px !important; float:left; }
ul#gnb > li:first-child { margin-left:139px; }

ul#gnb > li > a { display: block; height: 40px; font-size: 14px; color: #666; padding: 25px 5px 5px 5px; border: 0px solid; }
ul#gnb > li > a:hover { background-color: #FFF; color:#000; }

#sub-menu-area {
	display:none;
	position: absolute;
	top: 60px;
	left: 0;
	width: 1000px;
	height: 230px;
	z-index: 10000;
	line-height: normal;
	opacity: 0.93;
	overflow: hidden;
	padding-left:0; padding-top:10px;
    background: #FFF url("/main_imgs/round_logo2.png") no-repeat 17px 50px;
	background-color: #FFF;
}

#sub-menu-area ul.sub-menu { 
	float: left;
	vertical-align: top;
	border-top: 5px solid #06a9ef;
	border-left: 1px solid #DDD;
	margin:0; padding:0;
	margin-left: 2px;
	width: 120px;
}

#sub-menu-area ul.sub-menu:first-child { 
	margin-left:139px;
}

#sub-menu-area ul.sub-menu li { 
	height: 27px;
	padding-left:5px;
	color: #FFF;
}

#sub-menu-area ul.sub-menu li > a { font-size: 12px; color: #666; line-height: 27px; letter-spacing:-1px; font-family: notokr-demilight;}
#sub-menu-area ul.sub-menu li > a:hover { font-size:12px; color:#000; letter-spacing:-1px; font-family: notokr-medium; }

.fancybox-overlay { z-index: 999999; }
</style>

<script type="text/javascript">
$(document).ready(function(){
	$('#roll_image .bxSlider').bxSlider({
		auto : true,
		pause : 4000,
		slideWidth: 650,
		minSlides: 1,
		maxSlides: 1,
		moveSlides: 1,
		slideMargin: 0
	});

	$('#roll_banner .bxSlider').bxSlider({
		auto : false,
		pause : 4000,
		slideWidth: 160,
		minSlides: 1,
		maxSlides: 5,
		moveSlides: 2,
		slideMargin: 20
	});

	$('.roll_course .bxSlider').bxSlider({
		auto : true,
		pause : 4000,
		slideWidth: 240,
		minSlides: 1,
		maxSlides: 2,
		moveSlides: 2,
		slideMargin: 10
	});

	$('#roll_portfolio .bxSlider').bxSlider({
		auto : true,
		pause : 4000,
		slideWidth: 640,
		minSlides: 1,
		maxSlides: 4,
		moveSlides: 1,
		slideMargin: 0
	});

	$("#gnb > li, #sub-menu-area").hover(
		function () {
			//$('ul', this).stop().slideDown(300);
			$("#sub-menu-area").stop().slideDown(300);
		},
		function () {
			//$('ul', this).stop().slideUp(100);
			$("#sub-menu-area").stop().slideUp(100);
		}
	);
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(".fancybox").fancybox({
		padding		: 1,
		margin		: 0,
		//maxWidth	: 960,
		//maxHeight	: 610,
		maxWidth	: 1280,
		maxHeight	: 720,
		fitToView	: false,
		//width		: '960',
		//height	: '540',
		width		: '1280',
		height		: '720',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'elastic',
		closeEffect	: 'elastic',
		openSpeed	: 'fast',
		closeSpeed  : 'fast',
		openMethod	: 'zoomIn',
		closeMethod : 'zoomOut',
		'titleFormat' : function(title, currentArray, currentIndex, currentOpts) {
		return '<span id="fancybox-title-over">' + (title.length ? ' &nbsp; #' + title : '') + '</span>';
		}
	});
});
</script>
</head>
<body oncontextmenu='return false'>
<div class="wrap">
	<nav class="snb_wrap">
		<ul class="snb centered">
			<li><a href="<%=ROOT_URL%>">Home</a></li>
<% If MEM_ID = "" Then %>
			<li><a href="membership/login.asp">Login</a></li>
			<li><a href="membership/join.asp">Join</a></li>
<% Else %>
			<li><a href="membership/logout.asp">Logout</a></li>
			<li><a href="membership/mypage.asp">MyPage</a></li>
<% End If %>
			<li><a href="intro/sitemap.asp">Sitemap</a></li>
		</ul>
	</nav>

	<div class="header_wrap" style="position:relative;">
		<div class="tbl centered" style="background-color:#ffffff; width:1000px;">
			<div class="tbl_cell">
				<nav class="gnb_wrap">
					<ul id="gnb">
						<li><a href="/intro/greeting.asp" class="jeju">학교소개</a></li>
						<li><a href="/course/current.asp" class="jeju">모집과정</a></li>
						<li><a href="<%=tmp_link_str%>" class="jeju">교육과정안내</a></li>
						<li><a href="/training/training_info.asp?tab=1" class="jeju">훈련안내</a></li>
						<li><a href="/entrance/online.asp" class="jeju">상담신청</a></li>
						<li><a href="/employment/recruitment.asp" class="jeju">취업지원</a></li>
						<li><a href="/community/notice.asp" class="jeju">커뮤니티</a></li>
					</ul>
				</nav>
			</div>

			<!-- S: sub-menu-area -->
			<div id="sub-menu-area">
				<ul class="sub-menu">
					<!--<li><a href="/intro/greeting1.asp">이사장 인사말</a></li>
					<li><a href="intro/greeting2.asp">학교장 인사말</a></li>-->
					<li><a href="intro/greeting.asp">인사말</a></li>
					<li><a href="intro/history.asp">학교연혁</a></li>
					<li><a href="intro/foundation.asp">재단법인소개</a></li>
					<li><a href="intro/dasan.asp">다산센터</a></li>
					<!--<li><a href="intro/ci.asp">학교상징</a></li>-->
					<li><a href="intro/facility.asp">시설안내</a></li>
					<li><a href="intro/map.asp">오시는길</a></li>
				</ul>

				<ul class="sub-menu">
					<li><a href="course/current.asp">현재 모집중인 과정</a></li>
					<!--<li><a href="course/ongoing.asp">진행중인 과정</a></li>-->
					<li><a href="course/schedule.asp">연간 모집과정</a></li>
				</ul>

				<ul class="sub-menu">
					<li><a href="<% If StrComp(arrCrCds(1),0) <> 0 Then %>/curriculum/curriculum.asp?cata=1&crcd=<%=arrCrCds(1)%><% Else %><%=tmp%><% End If %>">국가기간전략산업</a></li>
					<li><a href="<% If StrComp(arrCrCds(2),0) <> 0 Then %>/curriculum/curriculum.asp?cata=2&crcd=<%=arrCrCds(2)%><% Else %><%=tmp%><% End If %>">내일배움카드(실업자)</a></li>
					<li><a href="<% If StrComp(arrCrCds(3),0) <> 0 Then %>/curriculum/curriculum.asp?cata=3&crcd=<%=arrCrCds(3)%><% Else %><%=tmp%><% End If %>">내일배움카드(재직자)</a></li>
					<li><a href="<% If StrComp(arrCrCds(4),0) <> 0 Then %>/curriculum/curriculum.asp?cata=4&crcd=<%=arrCrCds(4)%><% Else %><%=tmp%><% End If %>">일반고 특화(고교위탁)</a></li>
					<li><a href="<% If StrComp(arrCrCds(5),0) <> 0 Then %>/curriculum/curriculum.asp?cata=5&crcd=<%=arrCrCds(5)%><% Else %><%=tmp%><% End If %>">일반실무과정</a></li>
				</ul>


				<ul class="sub-menu">
					<li><a href="/training/training_info.asp?tab=1">국가기간전략산업</a></li>
					<li><a href="/training/training_info.asp?tab=2">내일배움카드(실업자)</a></li>
					<li><a href="/training/training_info.asp?tab=3">내일배움카드(재직자)</a></li>
					<li><a href="/training/training_info.asp?tab=4">일반고 특화(고교위탁)</a></li>
					<li><a href="/training/training_info.asp?tab=5">일반실무과정</a></li>
				</ul>

				<ul class="sub-menu">
					<li><a href="/entrance/online.asp">온라인접수</a></li>
					<li><a href="/entrance/counseling.asp">입학상담</a></li>
					<li><a href="/entrance/progress.asp">접수진행확인</a></li>
				</ul>

				<ul class="sub-menu">
					<!--<li><a href="/employment/seeker.asp">인재정보</a></li>-->
					<li><a href="/employment/recruitment.asp">구인의뢰</a></li>
					<li><a href="/employment/state.asp">취업현황</a></li>
					<li><a href="/employment/archive.asp">취업자료실</a></li>
					<li><a href="/employment/collaboration.asp">산학협력업체</a></li>
					<li><a href="/employment/reference.asp">취업관련사이트</a></li>
				</ul>


				<ul class="sub-menu">
					<li><a href="/community/notice.asp">공지사항</a></li>
					<li><a href="/community/faq.asp">자주하는질문</a></li>
					<li><a href="/community/proposal.asp">건의함</a></li>
					<li><a href="/community/portfolio.asp">포트폴리오</a></li>
					<li><a href="/community/comment.asp">수강후기</a></li>
					<li><a href="/community/classroom.asp">수업방</a></li>
				</ul>
			</div>
			<!-- E: sub-menu-area -->

		</div>
	</div>

	<div class="title_wrap">
		<div class="tbl centered">
			<div class="tbl_cell" style="width:650px; background:#FFF;">

				<!-- 메인 롤 -->
				<div id="roll_image">
<%
rsArray = rsArrayMainRoll
If IsArray(rsArray) Then
	Response.Write "<ul class=""bxSlider"">"
	For i = 0 To UBound(rsArray,2)
		Response.Write "<li class=""slide""><a href=""" & rsArray(1,i) & """><img src=""/upload/main_roll/" & rsArray(0,i) & """ style=""width:650px; height:330px;""></a></li>"
	Next
	Response.Write "</ul>"
End If
%>
				</div>
			</div>

			<div class="tbl_cell" style="width:350px">
				<div class="notice_wrap" style="height: 165px;">
					<div style="height:30px">
						<span class="heading">공지사항</span><a href="community/notice.asp"><span class="more"></span></a>
					</div>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<%
i = 0
rsArray = rsArrayNotice
If Not IsArray(rsArray) Then
	response.write "<tr class='row'><td class='cell'><div style=""text-align:center;line-height:140px;"">등록된 공지사항이 없습니다.</div></td></tr>" & vbcrlf
Else
	For i = 0 To UBound(rsArray,2)
		If StrComp(rsArray(3,i),"Y") = 0 Then
			cls = "font-weight:bold;"
		Else
			cls = ""
		End IF
%>
						<tr class="row">
							<td class="cell" width="85%">
								<span class="cell_title"><a href="/community/notice_view.asp?cpage=1&sncd=<%=rsArray(0,i)%>" style="<%=cls%>"><%=nLeft(rsArray(1,i), 23)%></a></span>
							</td>
							<td class="cell"><%=Right(getDate(rsArray(2,i), "-"), 5)%></td>
						</tr>
<%
	Next
End If
%>
					</table>
				</div>

				<div class="course_info_wrap" style="height: 165px;">
					<div style="height:30px">
						<span class="heading">입학상담</span><a href="entrance/counseling.asp"><span class="more"></span></a>
					</div>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<%
' icon_guk icon_sil icon_jae icon_il
rsArray = rsArrayCounsel
If Not IsArray(rsArray) Then
	response.write "<tr class='row'><td class='cell'><div style=""text-align:center;line-height:140px;"">등록된 상담이 없습니다.</div></td></tr>" & vbcrlf
Else
	For i = 0 To UBound(rsArray,2)
%>
						<tr class="row">
							<td class="cell" width="85%">
								<span class="cell_title"><a href="/entrance/counseling.asp?sccd=<%=rsArray(0,i)%>"><%=nLeft(rsArray(1,i), 23) & getIsNew(rsArray(2,i))%></a></span>
							</td>
							<td class="cell"><%=Right(getDate(rsArray(2,i), "-"), 5)%></td>
						</tr>
<%
	Next
End If
%>
					</table>
				</div>

			</div>
		</div>
	</div>

<style>
.list-area { width:1000px; }
.list-area > .tbl_cell { width:1000px;}
.list-area > .tbl_cell > .heading { display:block; width:auto; background:#ebece6; border:2px solid #dadbd4;text-align:center; margin-top:5px; }

.list-area .curriculum_cell:first-child { padding-left: 0; }
.list-area .curriculum_cell {
	display: table-cell;
	vertical-align: top;
	position: relative;
	margin: 0;
	padding: 0;
	border: 0px solid green;
	width: 326px;
	padding: 5px 0 0 12px;
}

.list-area .curriculum_cell .course_wrap {
    width: auto;
    height: 175px;
    margin: 0;
    border: 1px solid #dadbd4;
    border-top: 5px solid #dadbd4;
}

.list-area .curriculum_cell .course_wrap > .heading { width:auto; }
</style>

	<div class="main_wrap">

		<div class="tbl centered list-area">
			<div class="tbl_cell">
				<div class="heading">모집과정</div>

		<!-- S: 모집과정 -->
		<div class="tbl centered">
			<div class="tbl_cell curriculum_cell">
<%
rsArray = rsArrayCourseIcon
If IsArray(rsArray) Then
	chk1 = -1
	chk2 = -1
	chk3 = -1

	For i = 0 To UBound(rsArray,2)
		If (rsArray(0,i) = 1 Or rsArray(0,i) = 2) And chk1 = -1 Then		' 실업자
			chk1 = i
		'ElseIf (rsArray(0,i) = 3 Or rsArray(0,i) = 4) And chk2 = -1 Then	' 재직자
		ElseIf (rsArray(0,i) = 3) And chk2 = -1 Then	' 재직자
			chk2 = i
		'ElseIf rsArray(0,i) = 5 And chk3 = -1 Then		' 일반
		ElseIf rsArray(0,i) = 4 And chk3 = -1 Then		' 위탁교육
			chk3 = i
		End If
	Next
End If
%>
				<div class="course_wrap">
					<div class="heading">실업자지원과정</div>
					<div class="als-container roll_course" id="roll_course1">
<%
If chk1 >= 0 Then
	j = 0

	Response.Write "<ul class=""bxSlider"">"
	For i = chk1 To UBound(rsArray,2)
		If StrComp(rsArray(0,i),1) = 0 Or StrComp(rsArray(0,i),2) = 0 Then
%>
							<li class="slide"><a href="/curriculum/curriculum.asp?cata=<%=rsArray(0,i)%>&crcd=<%=rsArray(1,i)%>"><img src="/course_img/<%=rsArray(3,i)%>" width="110" height="120" border="0" alt="<%=rsArray(2,i)%>"></a></li>
<%
		j = j + 1
		End If
	Next
	If j = 1 then Response.Write "<li class=""slide"">&nbsp;</li>"
	Response.Write "</ul>"
Else
	response.write "<div style=""text-align:center;line-height:120px;"" class=""cell"">현재 모집중인 과정이 없습니다.</div>"
End If
%>
					</div>
				</div>
			</div>

			<div class="tbl_cell curriculum_cell">
				<div class="course_wrap">
					<div class="heading">재직자지원과정</div>
					<div class="als-container roll_course" id="roll_course2">
<%
If chk2 >= 0 Then
	j = 0
	Response.Write "<ul class=""bxSlider"">"
	For i = chk2 To UBound(rsArray,2)
		'If StrComp(rsArray(0,i),3) = 0 Or StrComp(rsArray(0,i),4) = 0 Then
		If StrComp(rsArray(0,i),3) = 0 Then
%>
							<li class="slide"><a href="/curriculum/curriculum.asp?cata=<%=rsArray(0,i)%>&crcd=<%=rsArray(1,i)%>"><img src="/course_img/<%=rsArray(3,i)%>" width="110" height="120" border="0" alt="<%=rsArray(2,i)%>"></a></li>
<%
		j = j + 1
		End If
	Next
	If j = 1 then Response.Write "<li class=""slide"">&nbsp;</li>"
	Response.Write "</ul>"
Else
	response.write "<div style=""text-align:center;line-height:120px;"" class=""cell"">현재 모집중인 과정이 없습니다.</div>"
End If
%>
					</div>
				</div>
			</div>

			<div class="tbl_cell curriculum_cell">
				<div class="course_wrap">
					<div class="heading">일반고 특화(고교위탁) 과정</div>
					<!--div class="heading">일반과정</div-->
					<div class="als-container roll_course" id="roll_course3">
<%
If chk3 >= 0 Then
	j = 0
	Response.Write "<ul class=""bxSlider"">"
	For i = chk3 To UBound(rsArray,2)
		If StrComp(rsArray(0,i),4) = 0 Then
%>
							<li class="slide"><a href="/curriculum/curriculum.asp?cata=<%=rsArray(0,i)%>&crcd=<%=rsArray(1,i)%>"><img src="/course_img/<%=rsArray(3,i)%>" width="110" height="120" border="0" alt="<%=rsArray(2,i)%>"></a></li>
<%
		j = j + 1
		End If
	Next
	If j = 1 then Response.Write "<li class=""slide"">&nbsp;</li>"
	Response.Write "</ul>"
Else
	response.write "<div style=""text-align:center;line-height:120px;"" class=""cell"">현재 모집중인 과정이 없습니다.</div>"
End If
%>
					</div>
				</div>
			</div>
		</div>
		<!-- E: 모집과정 -->


			</div>

		</div>

		<div class="tbl centered list-area">
			<div class="tbl_cell curriculum_cell">
				<div class="bottom_wrap">
					<div style="height:30px">
						<span class="heading">취업정보</span><a href="employment/recruitment.asp"><span class="more"></span></a>
					</div>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<%
rsArray = rsArraySiteJobInfo
If Not IsArray(rsArray) Then
	response.write "<tr class='row'><td class='cell'><div style=""text-align:center;line-height:140px;"">등록된 취업정보가 없습니다.</div></td></tr>" & vbcrlf
Else
	For i = 0 To UBound(rsArray,2)
%>
						<tr class="row">
							<td class="cell" width="85%">
								<span class="cell_title"><a href="/employment/recruitment.asp"><%=Replace(nLeft(rsArray(1,i), 22),"<","&#60;") & getIsNew(rsArray(2,i))%></a></span>
							</td>
							<td class="cell"><%=Right(getDate(rsArray(2,i), "-"), 5)%></td>
						</tr>
<%
	Next
End If
%>
					</table>
				</div>
			</div>

			<div class="tbl_cell curriculum_cell">
				<div class="bottom_wrap">
					<div style="height:30px">
						<span class="heading">합격자 리스트</span><a href="employment/state.asp"><span class="more"></span></a>
					</div>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<%
rsArray = rsArrayState
If Not IsArray(rsArray) Then
	response.write "<tr class='row'><td class='cell'><div style=""text-align:center;line-height:140px;"">등록된 합격자 리스트가 없습니다.</div></td></tr>" & vbcrlf
Else
	For i = 0 To UBound(rsArray,2)
%>
						<tr class="row">
							<td class="cell" width="85%">
								<span class="cell_title"><a href="/employment/state.asp"><%=nLeft(rsArray(1,i), 22) & getIsNew(rsArray(2,i))%></a></span>
							</td>
							<td class="cell"><%=Right(getDate(rsArray(2,i), "-"), 5)%></td>
						</tr>
<%
	Next
End If
%>
					</table>
				</div>
			</div>

			<div class="tbl_cell curriculum_cell">
				<div class="bottom_wrap">
					<div style="height:30px">
						<span class="heading">수강후기</span><a href="community/comment.asp"><span class="more"></span></a>
					</div>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" align="center">
<%
rsArray = rsArrayEpilogue
If Not IsArray(rsArray) Then
	response.write "<tr class='row'><td class='cell'><div style=""text-align:center;line-height:140px;"">등록된 수강후기가 없습니다.</div></td></tr>" & vbcrlf
Else
	For i = 0 To UBound(rsArray,2)
%>
						<tr class="row">
							<td class="cell" width="85%">
								<span class="cell_title"><a href="/community/comment.asp"><%=nLeft(rsArray(1,i), 22)%></a></span>
							</td>
							<td class="cell"><%=Right(getDate(rsArray(2,i), "-"), 5)%></td>
						</tr>
<%
	Next
End If
%>
					</table>
				</div>
			</div>
		</div>


		<div class="tbl centered" style="width:1000px;">
			<div class="tbl_cell">
				<div class="portfolio_wrap" style="width:auto;">
					<div class="als-container" id="roll_portfolio">
						<span class="heading" style="width:958px">포트폴리오</span><a href="/community/portfolio.asp"><span class="more"></span></a>
<%
rsArray = rsArrayPortfolio
If Not IsArray(rsArray) Then
	response.write "<div style=""text-align:center;line-height:140px;"" class=""cell"">등록된 포트폴리오가 없습니다.</div>"
Else
	Response.Write "<ul class=""bxSlider"">"
	For i = 0 To UBound(rsArray,2)
		tmp2 = Trim(rsArray(2,i))
		If tmp2 = "" Then tmp2 = Trim(rsArray(3,i))
		tmp3 = "<a class=""fancybox"" rel=""group"" href=""/upload/portfolio/" & rsArray(3,i) & """ title=""" & Trim(rsArray(4,i)) & """>"
		If rsArray(1,i) = "N" Then		tmp3 = "<a class=""fancybox"" rel=""group"" href=""https://player.vimeo.com/video/" & rsArray(3,i) & "?autoplay=1&loop=1&byline=0&portrait=0"" data-fancybox-type=""iframe"" title=""" & Trim(rsArray(4,i)) & """>"
%>
							<li class="slide"><%=tmp3%><img src="/upload/portfolio/<%=tmp2%>" width="150" height="130" border="0" class="hand" /></a></li>
<%
	Next
	Response.Write "</ul>"
End If
%>
					</div>
				</div>
			</div>
		</div>

		<div class="tbl centered" style="min-height:100%">
			<div class="tbl_cell" style="width:900px">
				<div id="roll_banner">
					<ul class="bxSlider">
						<li class="slide"><a href="http://www.hrd.go.kr/jsp/HRDH/main/index.jsp" target="_blank" title="HRD-Net(새창)"><img src="main_imgs/hrd_banner.gif" border="0" alt="HRD-Net" /></a></li>
						<li class="slide"><a href="http://www.work.go.kr" target="_blank" title="워크넷(새창)"><img src="main_imgs/worknet_banner.gif" border="0" alt="워크넷" /></a></li>
						<li class="slide"><a href="http://www.moel.go.kr" target="_blank" title="고용노동부(새창)"><img src="main_imgs/moel_banner.gif" border="0" alt="고용노동부" /></a></li>
						<li class="slide"><a href="http://www.kcomwel.or.kr/main.jsp" target="_blank" title="근로복지공단(새창)"><img src="main_imgs/kcomwel_banner.gif" border="0" alt="근로복지공단" /></a></li>
						<li class="slide"><a href="http://www.keis.or.kr" target="_blank" title="한국고용정보원(새창)"><img src="main_imgs/keis_banner.gif" border="0" alt="한국고용정보원" /></a></li>
						<li class="slide"><a href="http://www.hrdkorea.or.kr" target="_blank" title="한국산업인력공단(새창)"><img src="main_imgs/hrdkorea_banner.gif" border="0" alt="한국산업인력공단" /></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="footer_wrap">
		<div class="tbl centered">
			<div class="tbl_cell">
				<span class="foot_logo"></span>
			</div>
			<address id="address_wrap">
				(06734) 서울특별시 서초구 남부순환로 347길 23(서초동 1364-42) <span style="padding-left:10px;">(재)다산인재개발원 229-82-01663</span><span style="padding-left:15px;">통신판매업신고번호: 제 2005-07099호</span><br>
				대표자: 김명용 <span style="padding-left:10px;">개인정보관리책임자: 박소연</span><span style="padding-left:30px;"><i class="fa fa-fw fa-phone" aria-hidden="true"></i>전화번호: 02-597-5731</span><span style="padding-left:30px;"><i class="fa fa-fw fa-fax" aria-hidden="true"></i>팩스: 02-578-9797</span><span style="padding-left:30px;"><a href="http://intra.koreait.ac.kr" target="_blank"><i class="fa fa-fw fa-windows" aria-hidden="true"></i>인트라넷 접속</a></span><br>
				COPYRIGHT ⓒ 2013 DASAN HRD Foundation. ALL RIGHTS RESERVED
			</address>
		</div>
	</div>

<!-- Quick Menu (Right) -->
<!--#include virtual="/_include/inc_quick_menu.inc"-->

<!-- Popup -->
<!--#include virtual="/_include/inc_popup.inc"-->

<!-- Web Log Writer -->
<!-- #include virtual="/_include/inc_LogWriter.inc" -->

<% 
timesSecArr(2) = timer()
Call LogWrite("time1:" & FormatNumber(timesSecArr(1) - timesSecArr(0),4) & Chr(9) & "time2:" & FormatNumber(timesSecArr(2) - timesSecArr(0),4) , "MainTime")
Response.Write "<div style=""background:#143249;color:#143249;text-align:right;"">(" & FormatNumber(timesSecArr(2) - timesSecArr(0),4) & " Sec)</div>"
%>
</div>

<% '모바일웹 화면이동 버튼 %>
<!-- #include virtual="/_include/inc_footer_mobile_btn.asp" -->

</body>
</html>
