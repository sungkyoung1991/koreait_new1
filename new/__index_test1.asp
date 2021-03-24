<!-- #include virtual = "/new/school/inc/Service_Inc.inc" -->
<%
'2016-03-24 김병석 (모바일에서 웹페이지 보기)
Dim MobileWebView : MobileWebView = Request.QueryString("m")
If StrComp(MobileWebView,"mobile") = 0 Then
	Session("MobileWebView") = ""
ElseIf StrComp(MobileWebView,"web") = 0 Or StrComp(Session("MobileWebView"),"web") = 0 Then
	Session("MobileWebView") = "web"
Else
	Session("MobileWebView") = ""
End If

'2016-03-24 김병석 (모바일에서 웹페이지 보기)
If StrComp(Session("MobileWebView"),"web") <> 0 Then

	'If Request.ServerVariables("REMOTE_ADDR") = "182.172.23.65" Then
	'	Response.clear
	'	Response.Write "web:" & Session("MobileWebView")
	'	Response.end
	'End If

	'2016-03-03 이상준 요청사항
	'(주)로그 모바일 리다이렉션
	Dim httpRegEx, httpMatches
	Set httpRegEx = New RegExp
	With httpRegEx
		.Pattern = "(iphone|ipod|iemobile|mobile|lgtelecom|ppc|blackberry|sch-|sph-|lg-|canu|im-|ev-|nokia)"
		.IgnoreCase = True
		.Global = False
	End With
	Set httpMatches = httpRegEx.Execute(Request.ServerVariables("HTTP_USER_AGENT"))
	If httpMatches.count > 0 Then
		Dim Us,Ds,Qs
		Us = "http://m.koreait.ac.kr/index.asp" '#모바일 이동url
		Ds = "?"
		Qs=Request.ServerVariables("QUERY_STRING")
		If InStr(1,Us,"?") > 0 Then
			Ds = "&"
		End If
		if len(Qs)>0 then
			Qs = Ds & Qs
		End If
		Us = Us & Qs
		Response.Redirect Us
		Response.End
	Else
		Set httpRegEx = Nothing
		Set httpMatches = Nothing
	End If
End If
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>한국IT - 학사학위 취득과정</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--meta name="viewport" content="width=device-width, user-scalable=no,initial-scale=1.0,user-scalable=no,maximum-scale=1.0,minimum-scale=1.0,target-densitydpi=device-dpi" / -->
<meta name="format-detection" content="telephone=no"/>

<link rel="stylesheet" media="all" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- jquery file -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-migrate-1.4.1.min.js" integrity="sha256-SOuLUArmo4YXtXONKz+uxIGSKneCJG4x0nVcA0pFzV0=" crossorigin="anonymous" charset="utf-8"></script>

<!-- jquery ui file -->
<link rel="stylesheet" type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js" charset="utf-8"></script>

<script type="text/javascript" src="/js/jquery.vticker.min.js"></script>

<% If StrComp(Session("MobileWebView"),"web") <> 0 Then %>
<script type="text/javascript">
<!--
if(document.referrer.substring(0,22)!="http://m.koreait.ac.kr") {  // 오른쪽 도메인 글자수를 세보고 그 숫자를 적는다.
	var uAgent = navigator.userAgent.toLowerCase();
	var mobilePhones = new Array('iphone','ipod','android','blackberry','windows ce','nokia','webos','opera mini','sonyericsson','opera mobi','iemobile');
	for(var i=0;i<mobilePhones.length;i++)
		if(uAgent.indexOf(mobilePhones[i]) != -1)
			document.location="http://m.koreait.ac.kr/index.asp";
}
//-->
</script>
<% End If %>

<!--[if lt IE 9]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<![endif]-->

<link rel="shortcut icon" href="/favicon1.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/index2016_common.css?20160912">
<link rel="stylesheet" href="css/index2016.css?20161130">
<link rel="stylesheet" href="css/index_slides.css">
<script src="js/common.2016.js?20160906"></script>

<script type="text/javascript">
$(document).ready(function() {
	//공지사항 상하스크롤
	$('#notice').vTicker({ showItems: 4 });
	$("#notice").focusin(function(e) {
		$('#notice').vTicker('pause', true);
	}).focusout(function(e) {
		$('#notice').vTicker('pause', false);
	});
});
</script>
</head>

<body style="min-width:1250px;">

<!--S: skip navi -->
<div id="skip_nav">
	<ul>
		<li><a href="#mainZone">본문 바로가기</a></li>
		<li><a href="#gnb">주 메뉴 바로가기</a></li>
	</ul>
</div>
<!--E: skip navi -->

<!--학교특전소개 팝업 시작-->
<!--
<div id="sPopZone" class="dis-n">
	<p id="spopArea">
		<ul>
			<li class="popclosebtn"><a href="#spopArea"><img style="float:right;" src="images/btn_closepop.gif" alt="닫기버튼"/></a></li>
			<li class="explain"><img src="images/info.jpg" alt="한국IT 학교특전 소개"/></li>
		</ul>
	</p>
</div>
-->
<!--학교특전소개 팝업 끝-->

<!-- S: 상단 팝업존 -->
<form name="popup">
	<div id="popupZone">
		<h2 class="hidden">배너</h2>
		<ul class="popZdiv">
			<li><a href="/new/board_skin/press_board/board_index.asp?code=con&table=press_board&bbscode=&id=252" class="popB">국가평생교육진흥원 우수기관 선정. 한국 IT는 IT교육을 통해 인재를 양성해 국가와 사회발전에 기여한 공을 인정받아 국가평생교육진흥원 학점은행제 우수기간 표창를 받았다.</a></li>
			<li><a href="/new/board/schoollife.asp?code=con&id=26"  class="popC">서울시교육청 교육기부 대상. 한국 IT는 IT교육을 통해 인재를 양성해 국가와 사회발전에 기여한 공을 인정받아 서울시교육청 교육기부 대상을 받았다.</a></li>
		</ul>
		<div class="close">
			<div class="closeZdiv"><a class="right" href="#popupZone" id="btn_popupzoneClose">닫힘</a>
				<div class="left">
					<input type="checkbox" id="closedBan" value="Y" title="" class="checkbox" style="border:0;"/>
					<label for="closedBan">1일간 열지 않음</label>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- E: 상단 팝업존 -->

<!-- S: 상단 팝업존#2 -->
<!-- #include virtual="/new/_include/inc_popup_utf8.inc" -->
<!-- E: 상단 팝업존#2 -->

<div id="wrap">

<!-- S: 상단메뉴 시작 -->
<!-- #include virtual="/new/inc_top_menu_utf8.inc" -->
<!-- E: 상단메뉴 종료 -->


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.0/flexslider.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/flexslider/2.6.0/jquery.flexslider-min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.flexslider-main').flexslider({
		animation: "slide",
		controlNav: false,
		customDirectionNav: $(".mainImage-controller a")
	});

	//꿈이 이루어지는 학교 - 한국 IT 웹툰
	$("#it_brochure").click(function(e) {
		e.preventDefault();
		var url = $(this).attr("href");
		window.open(url, '', 'fullscreen=yes,channelmode');
	});
});
</script>
<style type="text/css">
.flexslider { background:inherit !important; border:0; }
.flex-prev, .flex-next { text-indent: -9999px; }

#mainArea { margin:0 auto; position:relative; max-width:1600px; }
#mainArea .mainImage ul li { height:635px !important; }
#mainArea .mainImage ul li img { width:auto; min-width:600px; max-width:1000px; height:635px !important; }
#mainArea .mainImage .mainImage-controller li { top : 50%; }
#mainArea .mainDispla { width:auto; height:635px; margin-right:600px; overflow:hidden; min-width:600px; max-width:1000px; }
#mainArea .mainRightMenu { width:600px; max-width:600px; position:absolute; top:0; right:0; }

</style>

<!-- S: 메인 이미지 영역 시작-->
<div id="mainZone">
	<div id="mainArea">

		<ul class="mainDispla">
			<li id="mainDisplayIn">
				<!-- S: 이미지 클릭 되었을 때 보여져야 하는 부분-->
				<!--
				<ul>
					<div class="mainDisplayFullimg">
						<ul class="closebtn">
							<li><img src="images/btn_close.gif" alt="닫기"></li>
						</ul>
						<ul class="mainDisplaySubimg">
							<li id="vimeo"></li>
						</ul>
					</div>
				</ul>
				-->
			   <!-- E: 이미지 클릭 되었을 때 보여져야 하는 부분-->
				<ul>
					<li id="mainDisplayImage">
						<div class="mainImage" style="position:relative; margin:0; padding:0;">
							<div class="mainImage flexslider-main">
								<ul class="slides">
								<li>
									<a href="/new/board/ithotnews.asp?code=con&id=233&page=1"><img src="/new/images/main_img_04.jpg" alt="숭실대학교 대학원 합격! 2년만에 학사끝! 대학원가자!" /></a>
								</li>

								<li>
									<a href="/new/board/ithotnews.asp?code=con&id=239&page=1"><img src="/new/images/main_img_09.jpg" alt="2016 디자인스쿨 공모전 총 결산" /></a>
								</li>

								<li>
									<a href="/new/working_intro/entry_edu_report.asp"><img src="/new/images/main_img_01_1.jpg" alt="학교 경쟁력 - 대한민국 최고의 IT전문교육기관. 대학 그이상의 명품학교. World Class College. 85% 실습, 실습을 가장 많이 하는 학교, 프로젝트교육, 압도적 실력차이. 대학 이상의 명품학교. IT분야 최다 취업생 배출. 글로벌기업이 장학금 주는 학교. 90% 이상의 취업과 진학실적" /></a>
								</li>

								<li>
									<a href="/new/school/gstar_movie.asp"><img src="/new/images/main_img_06.jpg?20161207" alt="지스타2016 부산 벡스코 한국it전문학교 게임스쿨 참가작품" /></a>
								</li>

								<li>
									<a href="/new/board/ithotnews.asp?code=con&id=236&page=1"><img src="/new/images/main_img_05.jpg" alt="2016 제14회 프로젝트 경진대회 링크 정보보안  " /></a>
								</li>

								<!--	<li>
										<a href="http://koreait-job.saramin.co.kr/" target="_blank"><img src="/new/images/main_img_04.jpg" alt="취업센터 운영" /></a>
									</li>-->
								</ul>
							</div>

							<!--메인 이미지 컨트롤러(화살표) -->
							<ul class="mainImage-controller">
								<li class="btn-left"><a href="#" id="btn-slide-prev" class="flex-prev">이전</a></li>
								<li class="btn-right"><a href="#" id="btn-slide-next" class="flex-next">다음</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</li>
		</ul>

		<ul class="mainRightMenu">
<%
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
%>
			<li class="bannerline01">
				<div class="admission_div">
					<div style="position:relative;"><h3 class="admission_yyyy"><%=GetSelectionDateArrayToStr(0)%></h3></div>
					<div style="position:relative;padding-top:55px;"><h3 class="admission_mmdd">&nbsp;&nbsp;<%=GetSelectionDateArrayUTF8ToStr(1)%></h3></div>
				</div>
				<a href="/new/ad_lead/support_apply.asp"><img src="images/bg_recruit.jpg" alt="<%=GetSelectionDateArrayToStr(0)%>학년 신입생 우선선발. <%=GetSelectionDateArrayUTF8ToStr(1)%>. 수능,내신 미반영(100%면접선발). 중복지원 가능. 토, 일 전화상담 가능, 문의전화 02-578-5551" /></a>
			</li>
			<li class="bannerline10"><a href="/community/event_20170203.asp" target="_blank"><img src="images/2018banner5_1.png" alt="예비 수험생을 위한 2018학년 신입학 설명회 2018학년 입시 설명회 신청 2018학년 원서 예비 접수" ></a></li>

			<li class="bannerline03"><a href="/new/board/ithotnews.asp"><img src="images/mainbanner02_new.jpg" alt="한국IT 핫소식 : KOREA IT HOT NEWS" /></a></li>
			<li class="bannerline07"><a href="/new/contest/school0<%=GetRndNum(1,5)%>.asp" target="_blank"><img src="images/mainbanner03_new.jpg" alt="한국IT  재학생실력: KOREA IT PROJECT" /></a></li>
			<!--<li class="bannerline04"><a href="javascript://;"><img src="images/mainbanner02.jpg" alt="학교특전소개" id="opensPopZone"/></a></li>-->
			<li class="bannerline05"><a href="/new/board/1minknowhow.asp"><img src="images/mainbanner07.png?20161227" alt="취업,진학,창업 졸업 그후 우리들의 이야기" /></a></li>
			<li class="bannerline08"><a href="/new/pride_it/it_brochure.asp" id="it_brochure" target="_blank"><img src="images/mainbanner06.jpg" alt="한국IT 웹툰: 꿈이 이루어지는 학교" /></a></li>
			
			<li class="bannerline04"><a href="/community/support_2017.asp" target="_blank"><img src="images/mainbanner02.jpg" alt="체험 프로그램: 정말 하고 싶은 게 뭐야?!" /></a></li>
			<li class="bannerline06"><a href="/new/edu_intro/entrance_result.asp"><img src="images/2018banner4.png" alt="한국IT 지난 입시결과: KOREA IT ENTRANCE REPORT" /></a></li>

		
			<!--<li class="bannerline08"><a href="http://kotoon.kr/xe/" target="_blank"><img src="images/mainbanner04_new.jpg" alt="코툰"/></a></a></li>-->
		</ul>
	</div>
</div>
<!-- E: 메인 이미지 영역 시작-->

<script type="text/javascript">
$(document).ready(function() {
	$(".school01_1, .school02_1, .school03_1, .school04_1, .school05_1").hover(
		function(e) {
			$(this).find('li').find("div.area").show();
		}, function(e) {
			$(this).find('li').find("div.area").hide();
		}
	);

	$("#schoolArea").focusin(function(e) { $("#schoolArea .schoolZone div.area").show(); });
	$("#schoolArea div.bg").css("opacity", 0.8);
});
</script>

<style type="text/css">
#schoolArea .schoolZone ul li div.area { position:relative; display:none; }
#schoolArea .schoolZone ul li div.bg { width:224px; height:192px; display:block; background-color:#000; position:absolute; top:0; left:0; }
#schoolArea .schoolZone ul li div.txt { width:224px; display:block; position:absolute; padding-top:16px; top:0; left:0; }
#schoolArea .schoolZone ul li div.area a { display:block; width:200px; height:27px; line-height:27px; border-bottom:1px dotted #FFF; color:#FFF; text-align:center; margin:4px auto;}
#schoolArea .schoolZone ul li div.area a:hover { color: #fff400; text-shadow: 0 4px 4px rgba(0, 0, 0, 0.4); }

.school01_1{width:224px; height:250px;}
.school01_1 h1{height:57px; text-align:center;}
.school01_1 ul li { background:url(/new/images/btn_design01.jpg?20161213) no-repeat; width:224px; height:192px; display:block; }
.school01_1 ul li a:first-child { margin-top:20px; }

.school02_1{width:224px; height:250px;}
.school02_1 h1{height:57px; text-align:center;}
.school02_1 ul li{ background:url(/new/images/btn_game01.jpg?20161213) no-repeat; width:224px; height:192px; display:block;}

.school03_1{width:224px; height:250px;}
.school03_1 h1{height:57px; text-align:center;}
.school03_1 ul li{background:url(/new/images/btn_security01.jpg?20161213) no-repeat; width:224px; height:192px; display:block;}

.school04_1{width:224px; height:250px;}
.school04_1 h1{height:57px; text-align:center;}
.school04_1 ul li{background:url(/new/images/btn_smart01.jpg?20161213) no-repeat; width:224px; height:192px; display:block;}

.school05_1{width:224px; height:250px;}
.school05_1 h1{height:57px; text-align:center;}
.school05_1 ul li{background:url(/new/images/btn_mobile01.jpg?20161213) no-repeat; width:224px; height:192px; display:block;}
</style>

	<!-- S: 스쿨별 바로가기 영역 -->
	<div id="schoolArea">
		<div class="schoolZone">
			<ul class="group">
				<li>
					<div class="school01_1">
						<h1><a href="/new/school/design/"><img src="images/title_design.png?20161213" alt="디자인스쿨" /></a></h1>
						<ul>
							<li>
								<div class="area">
									<div class="bg"></div>
									<div class="txt">
										<a href="/new/school/design/?s=1" target="_blank">시각디자인(3년제)</a>
										<a href="/new/school/design/?s=3" target="_blank">웹툰(Webtoon)</a>
										<a href="/new/school/design/?s=2" target="_blank">만화애니메이션</a>
										<a href="/new/school/design/?s=5" target="_blank">일러스트레이션</a>
										<a href="/new/school/design/?s=4" target="_blank">비주얼웹디자인</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="school02_1">
						<h1><a href="/new/school/game/"><img src="images/title_game.png?20161213" alt="게임스쿨" /></a></h1>
						<ul>
							<li>
								<div class="area">
									<div class="bg"></div>
									<div class="txt">
										<a href="/new/school/game/?s=1" target="_blank">게임프로그래밍(3년제)</a>
										<a href="/new/school/game/?s=2" target="_blank">게임기획(3년제)</a>
										<a href="/new/school/game/?s=3" target="_blank">게임그래픽</a>
										<a href="/new/school/game/?s=4" target="_blank">게임스토리텔링</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="school03_1">
						<h1><a href="/new/school/security/"><img src="images/title_security.png?20161213" alt="정보보안스쿨" /></a></h1>
						<ul>
							<li>
								<div class="area">
									<div class="bg"></div>
									<div class="txt">
										<a href="/new/school/security/?s=1" target="_blank">융합컴퓨터보안(3년제)</a>
										<a href="/new/school/security/?s=2" target="_blank">컴퓨터보안</a>
										<a href="/new/school/security/?s=4" target="_blank">사이버포렌식</a>
										<a href="/new/school/security/?s=3" target="_blank">해킹바이러스대응</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<div class="school04_1">
						<h1><a href="/new/school/smart/"><img src="images/title_smart.png?20161213" alt="스마트스쿨" /></a></h1>
						<ul>
							<li>
								<div class="area">
									<div class="bg"></div>
									<div class="txt">
										<a href="/new/school/smart/?s=3" target="_blank">드론&#183;로봇</a>
										<a href="/new/school/smart/?s=1" target="_blank">컴퓨터공학</a>
										<a href="/new/school/smart/?s=2" target="_blank">사물인터넷</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</li>
				<li class="end">
					<div class="school05_1">
						<h1><a href="/new/school/mobile/"><img src="images/title_mobile.png?20161213" alt="모바일스쿨" /></a></h1>
						<ul>
							<li>
								<div class="area">
									<div class="bg"></div>
									<div class="txt">
										<a href="/new/school/mobile/?s=1" target="_blank">앱개발</a>
										<a href="/new/school/mobile/?s=2" target="_blank">인터넷창업</a>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- E: 스쿨별 바로가기 영역 -->

	<!-- S: 공지사항 컨텐츠 영역 -->
	<div id="noticeArea">
		<div class="noticeZone">
			<ul>
				<li>
					<!-- S: 공지사항 DIV -->
					<div id="notice">
						<ul>
<%
'###### 공지사항
'Notice List - 2016.08.19
' 0 : take_idx, title, writeday [2]
Function GetNoticeListToArray()

	'If IsArray(Application.Contents("NoticeList_Array")) And IsDate(Application.Contents("NoticeList_Now")) Then
	'	If DatePart("d",Application.Contents("NoticeList_Now")) = DatePart("d",Now()) Then
	'		GetNoticeListToArray = Application.Contents("NoticeList_Array")
	'		Exit Function
	'	End If
	'End If

	If IsArray(Application.Contents("NoticeList_Array")) Then
		GetNoticeListToArray = Application.Contents("NoticeList_Array")
		Exit Function
	End If

	Dim sql : sql = "Select top 10 take_idx, title, writeday FROM news_board where (bbscode='한국IT전문학교' or bbscode='통합') And list_view=1 order by top_view desc, writeday desc "
	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)

	Application.Lock
	Application.Contents("NoticeList_Array") = arrRs
	Application.Contents("NoticeList_Now") = Now()
	Application.Unlock

	GetNoticeListToArray = arrRs
End Function

'###### 공지사항
tArray = GetNoticeListToArray()
If IsArray(tArray) Then
	For i = 0 To UBound(tArray,2)
		take_idx = tArray(0,i)
		title = fnCutString(tArray(1,i), "…", 60)
		writeday = Left(tArray(2,i),10)
		writeday = replace(writeday,"-",".")

		Response.Write "<li>"
		Response.Write "<dl>"
		Response.Write "<dt class=""date""><a href=""/new/board_skin/news_board/board_index.asp?code=con&table=news_board&bbscode=&id=" & take_idx & """>" & writeday & "</a></dt>"
		Response.Write "<dd class=""list""><a href=""/new/board_skin/news_board/board_index.asp?code=con&table=news_board&bbscode=&id=" & take_idx & """>" & title & "</a></dd>"
		Response.Write "</dl>"
		Response.Write "</li>"
	Next
End If
%>
						</ul>
					</div>
					<!-- E: 공지사항 DIV -->
				</li>
				<li>
					<!-- S: 자주찾는 메뉴 -->
					<div id="oftenmenu">
						<ul>
							<li class="first"><a href="/new/ad_lead/support_apply.asp"><img src="images/btn_oftenmenu01.jpg" alt="원서접수" /></a></li>
							<li><a href="/new/ad_lead/admission.asp"><img src="images/btn_oftenmenu02.jpg" alt="모집요강" ></a></li>
							<li><a href="/new/board_skin/sangdam_board2/board_index.asp"><img src="images/btn_oftenmenu03.jpg" alt="입학상담" /></a></li>
							<li><a href="/new/ad_lead/counsel_request_post.asp"><img src="images/btn_oftenmenu05.jpg" alt="입학안내자료신청" /></a></li>
							<li><a href="/new/ad_lead/support_passnotice.asp"><img src="images/btn_oftenmenu06.jpg" alt="합격자조회" /></a></li>
							<li><a href="/new/ad_lead/support_paynotice.asp"><img src="images/btn_oftenmenu04.jpg" alt="납부확인" /></a></li>
						</ul>
					</div>
					<!-- E: 자주찾는 메뉴 -->
				</li>
			</ul>
		</div>
	</div>
	<!-- E: 공지사항 컨텐츠 영역 -->

<script>
$(document).ready(function() {
	$('#flexloader-job-slideshow').flexslider({
		animation: "slide",
		controlNav: false,
		customDirectionNav: $("#jobArea .btnArea a")
	});
});
</script>

	<!-- S: 취업 진로 성공현황 영역 -->
	<div id="jobArea" style="background:#FFF; border-top:1px solid #aaa;">
		<div class="jobZone">
			<h1><img src="images/title_job.png" alt="한국IT직업전문학교와 함께 한 취업/진학 성공현황" /></h1>
			<ul>
				<li>
					<div class="btnArea">
						<ul>
							<li class="Lbtn"><a href="#" class="flex-prev"><img src="images/btn_jobarrowleft.gif" alt="이전 - 취업진학 성공현황 보기"/></a></li>
							<li class="Rbtn"><a href="#" class="flex-next"><img src="images/btn_jobarrowright.gif" alt="이후 - 취업진학 성공현황 보기"/></a></li>
						</ul>
					</div>
				</li>
			</ul>
			<div id="flexloader-job-slideshow" class="flexslider flexloader-job-slideshow">
				<ul class="slides">
<%
Dim joblistAltArr(6)
joblistAltArr(1) = "윤*훈 (사)한국저작권단체연합회 취업. 고*승 (주)나스미디어 취업. 취*영 (주)넥슨코리아 취업. 강*훈 (주)네오티스 취업. 김*형 SK인포섹 C&C 취업. 정*훈 (주)다산네트웍스 취업. 전*진 (주)싸이버원 취업. 경*하 한국사이버결제 취업. 한*형 단국대 대학원 진학. 석*인 건국대 대학원 진학"
joblistAltArr(2) = "성*모 (주)와이제이 에듀케이션 취업. 소*호 네오플 취업. 김*원 (주)잉카인터넷 취업. 하*혜 (주)타라그래픽스 취업. 오*은 (주)포커스켐퍼니 취업. 김*민 (주)한경닷컴 취업, 원*솔 (주)한경닷컴 취업, 창*형 중앙대 대학원 진학. 박*현 건국대 대학원 진학. 손*철 숭실대 대학원 진학"
joblistAltArr(3) = "안*영 11번가취업. 김*윤 CJ E&M Games 취업. 양*훈 CJ E&M 취업. 김*지 EA 취업. 김*성 EA 모바일 취업. 박*하 T3엔터테이먼트 취업. 강*구 공군학사. 백*범 SK플래닛. 김*환 세종대 대학원 진학. 백*선 동국대 대학원 진학"
joblistAltArr(4) = "이*주 공군학사. 구*모 네오티스 취업. 김*호 데존비즈온 취업. 장*경 드림시큐리티 취업. 양*석 라이브플렉스 취업. 이*영 사이버원 취업. 고*호 소프트포럼(주). 백*범 숭실대 대학원 진학. 박*진 숭실대 대학원 진학. 정*진 광운대 대학원 진학"
joblistAltArr(5) = "김*승 싸이버원 취업. 하*호 엑토즈소프트 취업. 김*성 와이디온라인 취업. 민*록 웹젠 취업. 오*우 위메이드 취업. 홍*비 이스트소프트 취업. 김*석 (주)다날취업. 이*욱 그리비티 인터렉티브 취업. 나*열 광운대 대학원 취업. 최*준 성균관대 대학원 진학"
joblistAltArr(6) = "정*훈 (주)현대자동차 취업. 박*아 (주)한화갤러리아 취업. 배*희 (주)잉카인터넷 취업. 구*제 (주)잉카인터넷 취업. 김*준 (주)싸이버원 취업. 문*수 (주)네오티스 취업. 박*진 (주)다날 취업. 김*선 공군학사. 김*근 광운대 대학원 진학. 김*현 성균관대 대학원 진학"

For i = 1 To 6
	Response.Write "<li><a href=""/new/working_intro/working_situation.asp""><img src=""images/joblist" & Right("00"&i,2) & ".png"" alt=""" & joblistAltArr(i) & """ /></a>"
Next
%>
				</ul>
			</div>
		</div>
	</div>
	<!-- E: 취업 진로 성공현황 영역 -->


	<!-- S: 스쿨생활 엿보기 영역 -->
	<div id="schoolLifeArea">
		<h1><img src="images/title_schoollife.gif" alt="스쿨생활엿보기" /></h1>
		<div class="schoolLifeZone">
			<ul>
<%
'###### 스쿨생활 엿보기
'School Life - 2016.08.19
' 0 : take_idx, title, mainimg [2]
Function GetSchoolLifeToArray()

	If IsArray(Application.Contents("SchoolLife_Array")) Then
		GetSchoolLifeToArray = Application.Contents("SchoolLife_Array")
		Exit function
	End If

	Dim sql : sql = "Select top 4 take_idx,title,mainimg From dbo.tbl_board_list where main_check=1 and mainimg<>'' Order By writeDay Desc, take_idx desc"
	Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)

	Application.Lock
	Application.Contents("SchoolLife_Array") = arrRs
	Application.Contents("SchoolLife_Now") = Now()
	Application.Unlock

	GetSchoolLifeToArray = arrRs
End Function

'###### 스쿨생활 엿보기
tArray = GetSchoolLifeToArray()
If IsArray(tArray) Then
	For i = 0 To UBound(tArray,2)
		take_idx = tArray(0,i)
		title = fnCutString(tArray(1,i), "…", 60)
		main_img = "/upload_files/ckeditor/board/list/" & tArray(2,i)

		Response.Write "<li>"
		Response.Write "<a href=""/new/board/schoollife.asp?code=con&id=" & take_idx & """><img src=""" & main_img & """ alt=""" & title & """ style=""width:269px; height:320px;"" /></a>"
		Response.Write "</li>"
	Next
End If
%>
			</ul>
		</div>
	</div>
	<!-- E: 스쿨생활 엿보기 영역 -->

	<!-- S: 학생 작품 영역 -->
	<div id="sPArea">
		<div class="sPZone">
			<ul>
				<li class="sP01">
					<!-- 프로젝트 경진대회 학생작품-->
					<div id="project">
						<h1><img src="images/title_project.gif" alt="프로젝트 경진대회" /></h1>
						<ul>
							<li><a href="/new/contest/school0<%=GetRndNum(1,5)%>.asp" target="_blank"><img id="projectImage" src="" alt="프로젝트경진대회작품 더보기" /></a></li>
						</ul>
					</div>
				</li>
			</ul>
			<ul>
				<li class="sP02">
					<!-- G-STAR 참가작 학생작품-->
					<div id="gstar">
						<h1><img src="images/title_gstar.gif" alt="G-STAR참가작" /></h1>
						<ul>
							<li><a href="/new/pride_it/game_gstar.asp"><img id="gstarImage" src="" alt="지스타작품 더보기" /></a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<!-- E: 학생 작품 영역 -->


<% '푸터 영역 %>
<!-- #include virtual = "/new/_include/inc_footer_utf8.inc" -->

<% '모바일웹 화면이동 버튼 %>
<!-- #include virtual="/_include/inc_footer_mobile_btn_utf_8.asp" -->

</div>

<% '페이지 로그기록 스크립트 %>
<!-- #include virtual="/_include/inc_PageLog_Writer.asp" -->

</body>
</html>
