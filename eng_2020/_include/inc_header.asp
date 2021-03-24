<%
template_directory=""
%>
<!-- #include virtual="/_include/function.asp" -->


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="shortcut icon" href="/favicon1.ico" type="image/x-icon" />
	<title>Korea Vocational College of Information and Technology</title>

<!--------------------themes Function------------------------->
	<link rel="stylesheet" href="<%=template_directory%>/themes/Avada/style.css" />
	<!--[if IE]>
	<script type="text/javascript" src="/new/themes/Avada/js/respond.min.js"></script>
	<link rel="stylesheet" href="/new/themes/Avada/css/ie.css" />
	<![endif]-->
	<link rel="stylesheet" href="<%=template_directory%>/themes/Avada/css/media.css" />
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!--------------------themes Function끝----------------------->

	<link rel='stylesheet' id='media-settings-base-css'  href='<%=template_directory%>/css/base.css?v=170605' type='text/css' media='all' />
	<link rel='stylesheet' id='media-settings-intro-css'  href='<%=template_directory%>/css/intro.css' type='text/css' media='all' />
	<link rel='stylesheet' id='media-settings-common-css'  href='<%=template_directory%>/css/common.css' type='text/css' media='all' />
	<link rel='stylesheet' id='media-settings-common-css'  href='<%=template_directory%>/css/slick-theme.css' type='text/css' media='all' />

	<!-- jquery file -->
	<script src="https://code.jquery.com/jquery-1.12.3.min.js" charset="utf-8"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" charset="utf-8"></script>

	<script type='text/javascript' src='<%=template_directory%>/themes/Avada/js/jquery.ddslick.min.js?ver=3.8'></script>
	<!--<script type='text/javascript' src='<%=template_directory%>/themes/Avada/js/main.js?ver=3.8'></script>-->

	<!--2020 add_script-->
	<script src="<%=template_directory%>/js/2020script.js"></script>
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<!--printthis.js-->
	<script src="<%=template_directory%>/js/printThis.js"></script>
	<!--font-->
	<script src="<%=template_directory%>/js/jquery.font-accessibility.dev.js"></script>

	<style type="text/css">
		#skip_nav { margin:0; padding:0; }
		#skip_nav ul, #skip_nav ul li { list-style: none; margin:0; padding:0; display:inline; }
		#skip_nav a { position: absolute; left: -3000%; }
		table.dataList { margin-top:4px; }
	</style>


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-HT1ST26MJ2"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'G-HT1ST26MJ2');
	</script>

</head>

<body class="home page page-id-58 page-template page-template-full-width-php logged-in admin-bar no-customize-support">

<% If page="main" Then %>
<!--S: skip navi -->
<div id="skip_nav">
	<ul>
		<li><a href="#container">본문 바로가기</a></li>
		<li><a href="#header">주 메뉴 바로가기</a></li>
		<li><a href="#footer">하단 바로가기</a></li>
	</ul>
</div>
<!--E: skip navi -->
<% Else %>
<!--S: skip navi -->
<div id="skip_nav">
	<ul>
		<li><a href="#content">본문 바로가기</a></li>
		<li><a href="#header">주 메뉴 바로가기</a></li>
		<li><a href="#sidebar">서브메뉴 바로가기</a></li>
	</ul>
</div>
<!--E: skip navi -->
<% End If %>

	<div id="wrapper">
		<div class="header-v2">
		<div class="headerWrap">
			<div class="header-social">
				<div class="avada-row">
					<div class="alignleft">
						<strong>Contact us : </strong><span class="icon_phone" style="padding: 0 12px 0 18px;">+82-2-578-5551</span><span class="icon_fax" style="padding: 0 0 0 18px;">+82-2-578-9866</span>
						<!--<img src="<%=template_directory%>/img/common/logo_c4.png" alt="Tel: +82-2-578-5551, Fax: +82-2-578-9866">-->
					</div>
					<div class="alignright" >
						<div class='top-menu'>
							<ul id="snav" class="menu">
								<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children"><a href="<%=template_directory%>/">HOME</a></li>
								<li class="menu-item menu-item-type-post_type menu-item-object-page"><a href="<%=template_directory%>/introduce/map.asp">LOCATION</a></li>
								<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children"><a href="http://www.koreait.ac.kr" target="_blank" class="font-bold">KOREAN</a></li>
								<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children"><a href="" target="_blank" class="font-bold"><img src="../img/main/youtube.png" alt="유튜브" style="vertical-align: text-bottom;"></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- S: 상단 메뉴 시작 -->
			<!-- #include virtual="/_include/topmenu.asp" -->
			<!-- E: 상단 메뉴 끝 -->
		</div>

<% If page="main" Then %>
	<script type="text/javascript" language="javascript" src="<%=template_directory%>/js/promotion.js"></script>


		<div class="clearfix width-100" style="padding-left:0px;padding-right:0px;">
				<div class="avada-row" style="max-width:100%;">
<%else%>

<!-- S: 상단 타이틀 영역 -->
<!-- #include virtual="/_include/toptitle.asp" -->
<!-- E: 상단 타이틀 영역 -->

<!--S: 2020 printer-->
<div class="printer avada-row">
	<ul id="easyView-setting">
		<li><a href="" class="decrease-me"><img src="../img/sub/minus.png" alt="축소"></a></li>
		<li><a href="" class="reset-me"><img src="../img/sub/view.png" alt="본화면"></a></li>
		<li ><a href="" class="increase-me"><img src="../img/sub/plus.png" alt="확대"></a></li>
		<li><a href="" id="printbtn" onclick="print();"><img src="../img/sub/printer.png" alt="프린터"></a></li>
	</ul>
</div>
<!--E: 2020 printer end-->



			<div id="main" class="qa" style="overflow:hidden !important;">
				<div class="avada-row" style="">

<!-- S: 왼쪽 메뉴 -->
<!-- #include virtual="/_include/left.asp" -->
<!-- E: 왼쪽 메뉴 -->

<%End if%>
