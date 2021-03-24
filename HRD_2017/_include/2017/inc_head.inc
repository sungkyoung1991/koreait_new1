<%
	IF strComp(cur_file, "resume_insert.asp") <> 0 AND StrComp(Session("ResumeTab"),"") <> 0 Then
		Session("ResumeTab") = ""
	END IF

%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>한국IT아카데미</title>

    <meta name="description" content="방송콘텐츠, 정보보안, 게임콘텐츠, 웹디자인 전문가양성, NCS 과정 국비지원무료교육, 취업연계">
    <meta property="og:type" content="website">
    <meta property="og:title" content="한국IT아카데미">
    <meta property="og:description" content="방송콘텐츠, 정보보안, 게임콘텐츠, 웹디자인 전문가양성, NCS 과정 국비지원무료교육, 취업연계">
    <meta property="og:image" content="http://job.ac.kr/main_imgs/logo.jpg">
    <meta property="og:url" content="http://job.ac.kr/">

    <!--네이버웹마스터서포트등록-->

    <meta name="naver-site-verification" content="cb6b2ecc94e35a84637b389c29be88c55ff12d4b"/>
	<meta name="format-detection" content="telephone=no">


    <!--favicon-->
    <link rel="shortcut icon" type="image/png" href="/images/2017/favicon.png">

	<!--네이버웹마스터선호 URL설정-->
	<link rel="canonical" href="http://job.ac.kr/index.asp">
	<link rel="canonical" href="http://job.ac.kr/inovationsite/inovation.html">
	<link rel="canonical" href="http://job.ac.kr/community/notice-list.asp">

    <!--css-->
	<link rel="stylesheet" href="/css/2017/common.css">
    <link rel="stylesheet" href="/css/2017/reset.css">
	 <!--plugin css-->
    <link rel="stylesheet" href="/css/2017/jquery.bxslider.css">
	<link rel="stylesheet" href="/css/plugin/mCustomScrollbar.css">

    <link rel="stylesheet" href="/css/2017/mainStyle.css?var=1.1">
	<link rel="stylesheet" href="/css/2017/contents.css?var=1.5">
	<link rel="stylesheet" href="/css/2017/layout.css">

	<!--슬릭슬라이더-->
	<link rel="stylesheet" type="text/css" href="/css/2018/slick-theme.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">


	<!--jquery -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<!-- 이미지 로딩 -->
	<script src="/js/2018/lazyload.js"></script>
	<!-- 슬라이드 -->
	<script src="/js/2017/jquery.bxslider.js"></script>
	<!-- map 반응형-->
	<script src="/js/2017/jquery.rwdImageMaps.min.js"></script>
	<script type="text/javascript" src="/js/plugin/mCustomScrollbar.js"></script>
	<!-- 슬릭슬라이더 -->
	<script type="text/javascript" src="/js/2018/slick.min.js"></script>

	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- 메인화면 스크립트 -->
	<script src="/js/2017/MainScript.js?ver=1.5"></script>

	<!-- 메뉴 스크립트 -->
	<script src="/js/2017/MenuScript.js"></script>

	<script src="/js/2018/jquery.bpopup.min.js"></script>

	<script src="/js/2017/common.js"></script>

    <!-- 2018.01.08 마케팅 본부 네이버공통키(식별자) 변경 -->
	<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>

    <!--네이버웹마스터sns주소등록-->
    <span itemscope="" itemtype="http://schema.org/Organization">
         <link itemprop="url" href="http://www.job.ac.kr">
             <a itemprop="sameAs" href="https://www.instagram.com/koritjob"></a>
             <a itemprop="sameAs" href="https://www.facebook.com/www.job.ac.kr"></a>
             <a itemprop="sameAs" href="https://blog.naver.com/yongtecher-bonbu"></a>
             <a itemprop="sameAs" href="http://cafe.naver.com/ayschool"></a>
    </span>

		<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s)
{if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};
if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];
s.parentNode.insertBefore(t,s)}(window, document,'script',
'https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '282965825979359');
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=282965825979359&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
