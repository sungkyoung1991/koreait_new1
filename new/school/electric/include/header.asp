<!-- #include virtual = "/new/school/inc/Service_Inc.inc" -->
<!-- #include file = "School_Service_Inc.asp" -->
<!-- #include file = "SetTitle.asp" -->
<%
function GetFileName()
    dim files, url, segments, tmpTitle
	tmpTitle = "한국IT"
    'get then current url from the server variables
    url = Request.ServerVariables("path_info")

    segments = split(url,"/")

    'read the last segment
    url = segments(ubound(segments))
	For i = 0 To Ubound(metaTitle)
		IF metaTitle(i,0) = url Then
			tmpTitle = metaTitle(i,1)
			Exit for
		END IF
	Next
    GetFileName = tmpTitle
end function

'원서접수 일자 - UTF8
Function GetSelectionDateArrayUTF8ToStr(ByVal Set_Type)
	Dim tStr : tStr = GetSelectionDateArrayToStr(Set_Type)

	If StrComp(Set_Type,1) = 0 Then
		tStr = Replace(tStr,"Y","년")
		tStr = Replace(tStr,"M","월")
		tStr = Replace(tStr,"D","일")
	End If

	GetSelectionDateArrayUTF8ToStr = tStr
End Function
'원서접수 - 진행중인 원서접수 정보 가져오기
Function GetSelectionListToArr()

	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period', @type=''"
	GetSelectionListToArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

End Function

'원서접수 - 진행중인 원서접수 정보 가져오기
Function GetSelectionListToArr2()

	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period2', @type=''"
	GetSelectionListToArr2 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

End Function

'원서접수
Dim ArySelection : ArySelection = GetSelectionListToArr()
Dim period : period = ArySelection(0).item("m_period_s_date") & " ~ " & ArySelection(0).item("m_period_e_date")


Dim ArySelection2 : ArySelection2 = GetSelectionListToArr2()
Dim period2 : period2 = ArySelection2(0).item("m_period_s_date") & " ~ " & ArySelection2(0).item("m_period_e_date")


%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="HandheldFriendly" content="true" />
	<meta name="viewport" content="width=1600,user-scalable=yes">
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />

	<meta property="og:type" content="website">
	<meta property="og:url" content="">
	<meta name="description" content="드론학과, 소프트웨어학과 등, 성공취업을 위한 산학실습, 실무위주교육, 18년 연속 취업 100%">
	<meta name="og:description" content="드론학과, 소프트웨어학과 등, 성공취업을 위한 산학실습, 실무위주교육, 18년 연속 취업 100%">
	<meta name="Title" content="<%=GetFileName%>">
	<meta name="og:title" content="<%=GetFileName%>">
	<meta name="keywords" content="드론학과, 컴퓨터공학과, 로봇공학과, 소프트웨어학과, 사물인터넷학과">
	<meta name="Author" content="">
	<meta name="naver-site-verification" content="5335147bda905c6b4b9c00b8cc1476a293e3db5a"/>
	<meta name="google-site-verification" content="E54Tt89INChH-E9EnhdwcJbGu6XPQFrXBNWRe-rYBwI" />
	<title><%=GetFileName%></title>
<!--	<title>학사학위 취득과정 - 한국IT</title>-->
	<link rel="shortcut icon" href="/favicon1.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" />
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="../css/2017/reset.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/swiper.css">
	<link rel="stylesheet" type="text/css" href="../css/2017/common.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/layout.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/main.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/contents.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/entrance.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/member.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/mypage.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/board.css" />
	<link rel="stylesheet" type="text/css" href="../css/2017/custom.css" />

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/1.4.1/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.1/js/swiper.jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.1/TweenMax.min.js"></script>

	  <!--[if lt IE 9]>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <![endif]-->
	<script type="text/javascript" src="../js/2017/common.js"></script>
   	<script type="text/javascript" src="../js/2018/lazyload.min.js"></script>
		<!-- google analytics START 2017.5.10 -->

	<script>

	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){

	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),

	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)

	  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');



	  ga('create', 'UA-98895167-1', 'auto');

	  ga('send', 'pageview');



	</script>

	<!-- // google analytics END 2017.5.10 -->

	<!-- Facebook Pixel Code -->

	<script>

	!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?

	n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;

	n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;

	t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,

	document,'script','https://connect.facebook.net/en_US/fbevents.js');

	fbq('init', '813010142189046'); // Insert your pixel ID here.

	fbq('track', 'PageView');

	</script>

	<noscript><img height="1" width="1" style="display:none"

	src="https://www.facebook.com/tr?id=813010142189046&ev=PageView&noscript=1"

	/></noscript>

	<!-- DO NOT MODIFY -->


	<!-- End Facebook Pixel Code -->
</head>
<body>
	<ul id="skipNav">
		<li><a href="#mainContent" class="">메인 본문 바로가기</a></li>
		<li><a href="#content" class="">본문 바로가기</a></li>
		<li><a href="#gnb">메뉴 바로가기</a></li>
		<li><a href="#footer">페이지 하단 바로가기</a></li>
	</ul>
	<header id="header" class="header">
		<div class="gnbWrap">
			<div class="auto">
				<h1 class="logo"><a href="../html/index.asp">
                <img class="lazy" data-src="../images/layout/logo.jpg" alt="한국IT직업전문학교 전기공학계열">
                <span class="hidden">한국IT직업전문학교 전기공학계열</span></a></h1>
				<nav id="gnb">
					<ul class="gnbList">
						<li style="display:none;">
							<h2><a href="introduce.asp" style="display:none;">전기공학계열 소개</a></h2>
							<ul class="sub">
								<li>
									<h3><a href="introduce.asp">전기공학계열 소개</a></h3>
								</li>
							</ul>
						</li>
						<li>
							<h2><a href="lecture02.asp">과정안내</a></h2>
							<ul class="sub">
								<li><h3><a href="lecture02.asp">전기공학</a></h3></li>

							</ul>
						</li>
						<li>
							<h2><a href="gallery.asp">작품갤러리</a></h2>
							<ul class="sub">
								<li>
									<h3><a href="gallery.asp">작품갤러리</a></h3>
								</li>
							</ul>
						</li>
						<li>
							<h2><a href="story.asp">취업스토리</a></h2>
							<ul class="sub">
								<li>
									<h3><a href="story.asp">취업스토리</a></h3>
								</li>
							</ul>
						</li>
						<li>
							<h2><a href="board_index.asp">계열소식</a></h2>
							<ul class="sub">
								<li>
									<h3><a href="board_index.asp">계열소식</a></h3>
								</li>
							</ul>
						</li>
						<li>
							<h2><a href="professor.asp">교수진소개</a></h2>
							<ul class="sub">
								<li>
									<h3><a href="professor.asp">교수진소개</a></h3>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
				<!--<a href="javascript:allMenuOpen()" class="btnAllMenu"><img class="lazy" data-src="../images/layout/btnAllMenu.jpg" alt="메뉴열기"></a>-->
			</div>
		</div>
	</header>

    <div class="Aptitude">
			<img src="/images/2019/3ba.png" usemap="#Mapq">
			<map name="Mapq">
			  <area shape="rect" coords="5,4,175,63" href="http://www.koreait.ac.kr/new/index.asp?ap=chk">
			  <area shape="rect" coords="5,63,173,125" href="http://www.koreait.ac.kr/new/ad_lead/counsel_request_post.asp">
			  <area shape="rect" coords="4,130,174,197" href="http://www.koreait.ac.kr/new/board/eventboard.asp?code=con&id=740&page=1&tab=0">
			</map>

	</div>

<!--<div class="Aptitude">
	<div class="auto">
	<a href="http://www.koreait.ac.kr/community/2018/AptitudeTest.asp" target="_blank">
	<div class="AptitudeWrap" id="AptitudeIcon" data-idx="1"></div>
	</a>
	</div>
</div>-->
