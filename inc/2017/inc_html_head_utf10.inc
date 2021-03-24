<%
Function XssFilter(strTempX)
'	// 캐릭터 타입 검증 'H'-한글, 'E'-영문, 'N'-숫자, 'Z'-기타
	'strTempX = Replace(strTempX, "<", "〈")
	'strTempX = Replace(strTempX, ">", "〉")
	'strTempX = Replace(strTempX, "(", "（")
	'strTempX = Replace(strTempX, ")", "）")
	'strTempX = Replace(strTempX, "[", "［")
	'strTempX = Replace(strTempX, "]", "］")
	'strTempX = Replace(strTempX, "{", "｛")
	'strTempX = Replace(strTempX, "}", "｝")
	'strTempX = Replace(strTempX, "/", "／")
	'strTempX = Replace(strTempX, "%", "％")
	'strTempX = Replace(strTempX, ";", ":")
	'strTempX = Replace(strTempX, "&", "＆")
	strTempX = Replace(strTempX, "'", "´")
	'strTempX = Replace(strTempX, "-", "ㅡ")
	'strTempX = Replace(strTempX, ",", "．")
	'strTempX = Replace(strTempX, ".", "．")
	'strTempX = Replace(strTempX, CHR(34),"˝")
	'strTempX = Server.HTMLEncode(strTempX)

	strTempX = Trim(strTempX)
	XssFilter = strTempX
End Function

'문서 타이틀 - 2016.09.12
Function GetDocumentTitle()
	Dim title : title = " - 한국IT"
	Dim title2 : title2 = "학사학위 취득과정"
	Dim title3 : title3 = "한국IT"

	' 0 : ID, SEQ_NO, TITLE, URL, TARGET, CATEGORY0, CATEGORY1, CATEGORY2 [7]
	Dim GlobalCategoryArray : GlobalCategoryArray = GetGlobalCategoryToArray()

	If user_id <> "" And category="9" And menu="1" Then
		title2 = "회원정보수정"
	ElseIf user_id <> "" And category="9" And menu="2" Then
		title2 = "회원탈퇴"
	ElseIf Len(title_nm) >= 1 Then
		title2 = title_nm
	Else
		If IsArray(GlobalCategoryArray) Then
			For i = 0 To UBound(GlobalCategoryArray,2)
				If StrComp(category,GlobalCategoryArray(5,i)) = 0 And StrComp(menu,GlobalCategoryArray(1,i)) = 0 Then
					title2 = GlobalCategoryArray(2,i)
					Exit For
				End If
			Next
		End If
	End If

	GetDocumentTitle = title2 & title
	'GetDocumentTitle = category
End Function

DocumentTitle = GetDocumentTitle()
Dim auth_url:auth_url = request.serverVariables("url")
Dim auth_file : auth_file = Mid(auth_url, InstrRev(auth_url,"/")+1)
	

'모집요강 - 진행중인 모집요강 정보 가져오기
Function GetSelectionListToArr()

	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period', @type=''"
	GetSelectionListToArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
	
End Function

'모집요강 - 진행중인 모집요강 정보 가져오기
Function GetSelectionListToArr2()

	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period2', @type=''"
	GetSelectionListToArr2 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
	
End Function


'모집요강
Dim ArySelection : ArySelection = GetSelectionListToArr()	
Dim ArySelection2 : ArySelection2 = GetSelectionListToArr2()	
	
	
%>
<!DOCTYPE HTML>
<html lang="ko">
<head>

<meta http-equiv="Content-Language" content="ko" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="HandheldFriendly" content="true" />
<meta name="viewport" content="width=1400,user-scalable=yes">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />

<meta property="og:type" content="website">
<meta property="og:url" content="http://www.koreait.ac.kr/">

<%IF (auth_file = "eventboard.asp" or auth_file = "pressboard.asp") AND (strComp(request("id"),762) = 0 or strComp(request("id"),763) = 0 ) AND  StrComp(request("code"), "con") = 0 Then%>
<meta property="og:image" content="http://www.koreait.ac.kr/images/2018/project.jpg">
<%Else%>
<meta property="og:image" content="http://www.koreait.ac.kr/images/2018/thumbnail.jpg">
<%END IF%>

<meta name="description" content="IT특성화전문학교, 전문학사 및 4년제 학위과정, 게임학과, 정보보안학과, 디자인학과, 드론학과 등 안내.">
<meta name="og:description" content="IT특성화전문학교, 전문학사 및 4년제 학위과정, 게임학과, 정보보안학과, 디자인학과, 드론학과 등 안내.">
<meta name="Title" content="<%=DocumentTitle%>">
<meta name="og:title" content="<%=DocumentTitle%>">
<meta name="keywords" content="게임학과, 게임기획학과, 게임그래픽학과, 게임프로그래밍학과, 게임공학과, 게임관련학과, 정보보안학과, 정보보호학과, 사이버보안학과, 컴퓨터보안학과,시각디자인학과, 웹디자인학과, 일러스트학과, 웹툰학과, 애니메이션학과, 만화학과,드론학과, 컴퓨터공학과, 로봇공학과, 소프트웨어학과, 사물인터넷학과,e스포츠학과, 프로게이머학과">
<meta name="Author" content="">
<meta name="naver-site-verification" content="5335147bda905c6b4b9c00b8cc1476a293e3db5a"/>
<meta name="google-site-verification" content="E54Tt89INChH-E9EnhdwcJbGu6XPQFrXBNWRe-rYBwI" />

<title><%=DocumentTitle%></title>


<!-- favicon -->
<link rel="shortcut icon" href="/favicon64.ico" type="image/x-icon" />

<!-- Noto Sans KR (korean) -->
<link rel="stylesheet" media="all" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" />

<!-- font-awesome file -->
<link rel="stylesheet" media="all" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<!-- Google Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


	<link rel="stylesheet" type="text/css" href="/css/2017/reset.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/swiper.css">
	<link rel="stylesheet" type="text/css" href="/css/2017/common.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/layout.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/main2020_re.css?ver=1.1" />
	<link rel="stylesheet" type="text/css" href="/css/2017/contents.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/entrance.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/member.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/mypage.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/board.css" />
	<link rel="stylesheet" type="text/css" href="/css/2017/depart.css" />
	

<!-- jquery file -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/1.4.1/jquery-migrate.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<script type="text/javascript" src="/js/2017/TweenMax.min.js"></script>
<script type="text/javascript" src="/js/2017/top.js"></script>
<!--[if lt IE 9]>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
	  <![endif]-->
	 
<script type="text/javascript" src="/js/2018/AptitudeMove.js"></script>
	  
<script type="text/javascript" src="/js/2017/common2020.js"></script>
<!--jquery ajax Lazy-->
<script src="/js/2018/lazyload.min.js"></script>

<!-- jquery ajax swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/css/swiper.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.4.2/js/swiper.jquery.min.js"></script>
<!--
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/2.7.6/idangerous.swiper.min.css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/2.7.6/idangerous.swiper.min.js"></script>
-->

<!-- jquery ajax loader -->
<link rel="stylesheet" href="/css/jquery.ajax.css" />
<script src="/js/jquery.ajax.utf8.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js"></script>

<!-- web script file -->
<link rel="stylesheet" type="text/css" href="/css/2017/koreait.css" />
<script src="/js/common.utf8.js" charset="utf-8"></script>
<script src="/js/cookie.utf8.js" charset="utf-8"></script>

<!-- jquery snow 
<script type="text/javascript" src="/js/2018/snowfall.jquery.js"></script>
-->

<script type="text/javascript">
$(document).ready(function() {
	$("#gnb > .gnbList > li a").on("focus",function(e){
		$("#gnb > .gnbList > li").trigger("mouseenter");
	})	
	$("#gnb > .gnbList > li a").on("blur",function(e){
		$("#header").trigger("mouseleave");
	})
});
</script>


<!-- 2018-03-20 입시 홍보 요청 --> 
<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
<script type="text/javascript">
      kakaoPixel('2205978717928535043').pageView();
	  
	  <!-- 2018.03.20 입시홍보 요청(원서 접수) -->

	  <%
		IF auth_file = "support_apply_pay_finish.asp" Then 
	 %>
 		kakaoPixel('2205978717928535043').completeRegistration();
	<%END IF%>
</script>








<style type="text/css">
body { min-width:1480px; }
</style>
