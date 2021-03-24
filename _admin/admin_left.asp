<%@Language="VBScript" CODEPAGE="65001" %>
<!-- #include virtual="/_include/admin_secret.asp" -->
<% Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8" %>

<%
response.expires = 0

' 10:총괄, 9:관리 8:임원, 7:홍보부, 6:총무부, 5:교학부, 2:게시판관리, 1:학부
If (StrComp(id,"webmaster") = 0 And Request.ServerVariables("REMOTE_ADDR") = "49.1.218.9") And True Then
	'테스트용 값
	'power = 7 : id = "2016390"
End If

Dim left_menu_display_arr(10), left_menu_etc_array(3)
Select Case CStr(power)
Case "10" '총괄
	left_menu_display_arr(1) 	= 1 '운영자관리
	left_menu_display_arr(2) 	= 1 '회원관리
	left_menu_display_arr(3) 	= 1 '사이트운영
	left_menu_display_arr(4) 	= 1 '학부관리
	left_menu_display_arr(5) 	= 1 '입학관리
	left_menu_display_arr(6) 	= 1 'IT 커뮤니티
	left_menu_display_arr(7) 	= 1 'Event 관리
	left_menu_display_arr(8) 	= 1 'Content us 관리
	left_menu_display_arr(9) 	= 1 '선행학습 관리
	left_menu_display_arr(10) 	= 1 '기숙사 관리

	left_menu_etc_array(1) = 1 '고용노동부 과정
	left_menu_etc_array(2) = 1 '주1회과정관리
	left_menu_etc_array(3) = 1 '글로벌 인재 양성과정
Case "9" '관리
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 1 '회원관리
	left_menu_display_arr(3) = 1 '사이트운영
	left_menu_display_arr(4) = 1 '학부관리
	left_menu_display_arr(5) = 1 '입학관리
	left_menu_display_arr(6) = 1 'IT 커뮤니티
	left_menu_display_arr(7) = 1 'Event 관리
	left_menu_display_arr(8) = 1 'Content us 관리
	left_menu_display_arr(9) = 1 '선행학습 관리
	left_menu_display_arr(10) 	= 1 '기숙사 관리

	left_menu_etc_array(1) = 0 '고용노동부 과정
	left_menu_etc_array(2) = 0 '주1회과정관리
	left_menu_etc_array(3) = 0 '글로벌 인재 양성과정
Case "8" '임원
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 1 '사이트운영
	left_menu_display_arr(4) = 1 '학부관리
	left_menu_display_arr(5) = 0 '입학관리
	left_menu_display_arr(6) = 1 'IT 커뮤니티
	left_menu_display_arr(7) = 1 'Event 관리
	left_menu_display_arr(8) = 0 'Content us 관리
	left_menu_display_arr(9) = 1 '선행학습 관리
	left_menu_display_arr(10) 	= 1 '기숙사 관리

	left_menu_etc_array(1) = 1 '고용노동부 과정
	left_menu_etc_array(2) = 1 '주1회과정관리
	left_menu_etc_array(3) = 1 '글로벌 인재 양성과정
Case "7" '홍보부
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 0 '사이트운영
	left_menu_display_arr(4) = 1 '학부관리
	left_menu_display_arr(5) = 1 '입학관리
	left_menu_display_arr(6) = 0 'IT 커뮤니티
	left_menu_display_arr(7) = 1 'Event 관리
	left_menu_display_arr(8) = 1 'Content us 관리
	left_menu_display_arr(9) = 0 '선행학습 관리
	left_menu_display_arr(10) 	= 1 '기숙사 관리

	left_menu_etc_array(1) = 0 '고용노동부 과정
	left_menu_etc_array(2) = 0 '주1회과정관리
	left_menu_etc_array(3) = 1 '글로벌 인재 양성과정
Case "6" '총무부
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 0 '사이트운영
	left_menu_display_arr(4) = 1 '학부관리
	left_menu_display_arr(5) = 0 '입학관리
	left_menu_display_arr(6) = 0 'IT 커뮤니티
	left_menu_display_arr(7) = 0 'Event 관리
	left_menu_display_arr(8) = 0 'Content us 관리
	left_menu_display_arr(9) = 0 '선행학습 관리
	left_menu_display_arr(10) 	= 0 '기숙사 관리

	left_menu_etc_array(1) = 0 '고용노동부 과정
	left_menu_etc_array(2) = 1 '주1회과정관리
	left_menu_etc_array(3) = 0 '글로벌 인재 양성과정
Case "5" '교학부
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 1 '사이트운영
	left_menu_display_arr(4) = 1 '학부관리
	left_menu_display_arr(5) = 0 '입학관리
	left_menu_display_arr(6) = 0 'IT 커뮤니티
	left_menu_display_arr(7) = 1 'Event 관리
	left_menu_display_arr(8) = 0 'Content us 관리
	left_menu_display_arr(9) = 1 '선행학습 관리
	left_menu_display_arr(10) 	= 1 '기숙사 관리

	left_menu_etc_array(1) = 1 '고용노동부 과정
	left_menu_etc_array(2) = 0 '주1회과정관리
	left_menu_etc_array(3) = 0 '글로벌 인재 양성과정
Case "2" '게시판관리
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 0 '사이트운영
	left_menu_display_arr(4) = 0 '학부관리
	left_menu_display_arr(5) = 0 '입학관리
	left_menu_display_arr(6) = 0 'IT 커뮤니티
	left_menu_display_arr(7) = 0 'Event 관리
	left_menu_display_arr(8) = 0 'Content us 관리
	left_menu_display_arr(9) = 0 '선행학습 관리
	left_menu_display_arr(10) 	= 0 '기숙사 관리

	left_menu_etc_array(1) = 0 '고용노동부 과정
	left_menu_etc_array(2) = 0 '주1회과정관리
	left_menu_etc_array(3) = 0 '글로벌 인재 양성과정
Case "1" '학부
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 1 '사이트운영
	left_menu_display_arr(4) = 1 '학부관리
	left_menu_display_arr(5) = 0 '입학관리
	left_menu_display_arr(6) = 1 'IT 커뮤니티
	left_menu_display_arr(7) = 1 'Event 관리
	left_menu_display_arr(8) = 0 'Content us 관리
	left_menu_display_arr(9) = 1 '선행학습 관리
	left_menu_display_arr(10) 	= 1 '기숙사 관리

	left_menu_etc_array(1) = 0 '고용노동부 과정
	left_menu_etc_array(2) = 0 '주1회과정관리
	left_menu_etc_array(3) = 0 '글로벌 인재 양성과정
Case Else
	left_menu_display_arr(1) = 1 '운영자관리
	left_menu_display_arr(2) = 0 '회원관리
	left_menu_display_arr(3) = 0 '사이트운영
	left_menu_display_arr(4) = 0 '학부관리
	left_menu_display_arr(5) = 0 '입학관리
	left_menu_display_arr(6) = 0 'IT 커뮤니티
	left_menu_display_arr(7) = 0 'Event 관리
	left_menu_display_arr(8) = 0 'Content us 관리
	left_menu_display_arr(9) = 0 '선행학습 관리
	left_menu_display_arr(10) 	= 0 '기숙사 관리

	left_menu_etc_array(1) = 0 '고용노동부 과정
	left_menu_etc_array(2) = 0 '주1회과정관리
	left_menu_etc_array(3) = 0 '글로벌 인재 양성과정
End Select

'ID별 추가 권한 설정 - 2016.03.28 (김병석)
If StrComp(Request.Cookies("koreait")("name"),"홍보부") = 0 Then
	left_menu_display_arr(2) = 1 '회원관리
	left_menu_display_arr(3) = 1 '사이트운영
End If

If StrComp(id,"jungbo2") = 0 Or StrComp(id,"디자인") = 0 Then
	left_menu_display_arr(7) = 1 'Event 관리
End If

'If StrComp(id,"2014315") = 0 Then
'	left_menu_display_arr(4) = 1 'Event 관리
'	left_menu_display_arr(6) = 1 'Event 관리
'End If
%>


<style type="text/css">
div.lb { height:4px; background:#FFF; }
h2 {  height:23px; line-height: 23px; margin:0; vertical-align: middle; border-bottom:1px solid #FFF; }
i.fa{font-size:20px; float: right;}
strong { float:right;font-size:8pt;padding:2px;cursor:pointer; padding-right:5px; }

strong > span:hover { color: #FFFF00; }

ul {  margin:0; padding:0; border:0; padding-left: 8px; background-color: #E7F1FA; list-style:none; }
ul > li { color: #444444; background-color: #E7F1FA; font-size: 12px; margin:0; padding:0; border:0; min-height:18px; line-height:18px; vertical-align:middle; margin-left:0; /* list-style:square; */ }

ul > li:before { content:"-"; vertical-align:middle; border:0px solid; padding-right:6px; }
ul > li.sub-menu:before {content:"";padding:0;}
ul > li.sub-menu > h2.a_menu{background:#0083cb;}
.old-site-event-area {display:none;}

</style>

<script>

var popupX = (window.screen.width / 2) - (200 / 2);
var popupY= (window.screen.height / 2) - (300 / 2);

function channel_win() {
window.open("http://www.koreait.ac.kr/new/test22.asp", "", "width=900, height=230");

}
</script>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<hr>




<% '1: 운영자관리 %>
<% If StrComp(1,left_menu_display_arr(1)) = 0 Then %>




	<h2 class="a_menu">
		<strong onclick="$('.agent-user-area').toggle();">
			<span class="agent-user-area" style="display:inline;"><i class="fa fa-caret-down"></i></span><span class="agent-user-area" style="display:none;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>운영자관리</span>
	</h2>
	<ul class="agent-user-area" style="display:none;">
		<li><a href="/_admin/agent_user/" target="body">운영자 관리</a></li>
<!--		<li><a href="/_admin/mailS/smtp.asp" target="body">smtp</a></li>-->
	</ul>
	<div class="lb"></div>


<% End If %>

<% '2: 회원관리 %>
<% If StrComp(1,left_menu_display_arr(2)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.member-board-area').toggle();">
			<span class="member-board-area" style="display:none;"><i class="fa fa-caret-down"></i></span>
            <span class="member-board-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>회원관리</span>
	</h2>
	<ul class="member-board-area">
		<li><a href="/_admin/member_board/list.asp" target="body">회원 관리</a></li>
        <li><a href="/_admin/query_board/list.asp" target="body">건의사항 관리</a></li>
	</ul>
	<div class="lb"></div>
<% End If %>

	<h2 class="a_menu">
		<strong onclick="$('.renew_area').toggle();">
            <span class="renew_area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
			<span class="renew_area" style="display:none;"><i class="fa fa-caret-down"></i></span>

		</strong>
		<span>리뉴얼</span>
	</h2>
	<ul class="renew_area">
		<li><a href="/_admin/renew/subsc/list.asp" target="body">구독 신청자</a></li>
        <li><a href="/_admin/renew/main_banner_admin/list.asp" target="body">메인배너 관리</a></li>
        <li><a href="/_admin/renew/main_banner_admin_m/list.asp" target="body">모바일 메인배너 관리</a></li>

	</ul>
	<div class="lb"></div>


<% '3: 사이트운영 %>
<% If StrComp(1,left_menu_display_arr(3)) = 0 Then %>




	<h2 class="a_menu">
		<strong onclick="$('.site-operation-area').toggle();">
			<span class="site-operation-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-operation-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>사이트운영</span>
	</h2>
	<ul class="site-operation-area">

	<% If InStr("[10][9]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/Class_Date/Class_index.asp" target="body">학부 및 학과 관리</a></li>
		<li><a href="/_admin/Campus/list.asp" target="body">캠퍼스 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/web_popup/list.asp" target="body">팝업 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/Class_Date/Date_index.asp" target="body">모집일정 관리</a></li>
        <li><a href="/_admin/cost/cost_config.asp" target="body">등록금 납부 관리</a></li>
	<% End If %>

<!--
	<% If InStr("[10][9][8][7][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/press_board/list.asp" target="body">홍보미디어</a></li>
	<% End If %>
-->

	<% If InStr("[10][9][5][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/working_situation/list.asp" target="body">취업현황 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/jobinterview_board/list.asp" target="body">취업인터뷰</a></li>
		<li><a href="/_admin/entryinterview_board/list.asp" target="body">진학인터뷰</a></li>
	<% End If %>

	</ul>
	<div class="lb"></div>
<% End If %>

<% '4: 학부관리 %>
<% If StrComp(1,left_menu_display_arr(4)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.site-department-area').toggle();">
			<span class="site-department-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-department-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>학부관리</span>
	</h2>
	<ul class="site-department-area">

	<% If InStr("[10][9][8][7][6][5][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/news_board/list.asp" target="body">공지사항</a></li>
	<% End If %>

	<% If InStr("[10][9][6][5][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/prof_info/list.asp" target="body">교수진 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][6][5][1]","[" & power & "]") >= 1 Then %>
		<!-- li><a href="/_admin/jobinfo_board/list.asp" target="body">취업정보(이전)</a></li -->
		<li><a href="/_admin/jobinfo2_board/list.asp" target="body">취업정보 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][8][6][5][2][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/department_board/list.asp" target="body">스쿨소식</a></li>
	<% End If %>

	<% If InStr("[10][9][8][5][2][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/ClassLife_board/list.asp" target="body">스쿨생활 엿보기 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/Work_board/list.asp" target="body">학부작품 관리</a></li>
		<li><a href="/_admin/Work_board/2018/work_list.asp" target="body">작품갤러리 관리</a></li>
		<!-- <li><a href="/_admin/schedule/schedule_list.asp" target="body">e스포츠 대회일정 관리</a></li> DB 삭제해도 됨-->

	<% End If %>


		<!-- li><a href="/_admin/qna_board/list.asp" target="body">학과@&A 관리</a></li -->

	</ul>
	<div class="lb"></div>
<% End If %>

<% '5: 입학관리 %>
<% If StrComp(1,left_menu_display_arr(5)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.site-sangdam-area').toggle();">
			<span class="site-sangdam-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-sangdam-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>입학관리</span>
	</h2>
	<ul class="site-sangdam-area">
	<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/FAQ_board/list.asp" target="body">입학관련 FAQ</a></li>
		<li><a href="/_admin/Sangdam_board/list.asp" target="body">입학상담 관리</a></li>
        <li><a href="/_admin/news_board_eng/list.asp" target="body">공지사항(영문)</a></li>
				<li><a href="/_admin/news_board_eng2/list.asp" target="body">인터뷰(영문)</a></li>
		<li><a href="/_admin/Sangdam_board_eng/list.asp" target="body">입학상담 관리(영문)</a></li>

        <li><a href="/_admin/ms_board/list.asp" target="body">모의지원</a></li>

		<!-- li><a href="/_admin/global_board/list.asp" target="body">국제교류센터 입학상담 관리</a></li -->
		<!-- li><a href="/_admin/data_request/request_list.asp"  target="body">입학자료 신청관리</a></li -->
		<!-- li><a href="/_admin/haksa/total/list.asp?action=first" target="body">입시관리(총괄)</a></li -->
	<% End If %>
	</ul>
	<div class="lb"></div>
<% End If %>

<% '6: IT 커뮤니티 %>
<% If StrComp(1,left_menu_display_arr(6)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.site-it-community-area').toggle();">
			<span class="site-it-community-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-it-community-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>IT 커뮤니티</span>
	</h2>
	<ul class="site-it-community-area">

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/board_list/list.asp" target="body">통합 게시판 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/project_gboard/list.asp" target="body">프로젝트 경진대회 </a></li>
        <li><a href="/_admin/g_star/g_star_list.asp" target="body">G-Star 참가작품</a></li>
	<% End If %>

	<% If InStr("[10][9]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/total_gallery/list.asp" target="body">Total Gallery 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/issue_board/list.asp" target="body">전문가 인터뷰</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/job_board/list.asp" target="body">나도 IT 스타</a></li>
	<% End If %>

	<% If InStr("[10][9][8][2][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/itgallery_board/list.asp" target="body">교내행사 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/school_board/list.asp" target="body">세계의 전문학교</a></li>
	<% End If %>

	<% If InStr("[10][9][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/talk_board/list.asp" target="body">직찍 콘테스트</a></li>
		<li><a href="/_admin/talk_board/1day.asp" target="body">1일 체험학습</a></li>
        <li><a href="/_admin/pvs_qna/qa_list.asp" target="body">전공교수 1:1 질문</a></li>

        <li><a href="/_admin/sk_list.asp" target="body">영재교육원 신청서 관리</a></li>
        <li><a href="/_admin/yg_edu/qa_list.asp" target="body">영재교육원 문의사항 관리</a></li>
        <li><a href="/_admin/newsletter/list.asp" target="body">뉴스레터 관리</a></li>


		<!-- li><a href="/_admin/startup_board/list.asp" target="body">스타트업 관리</a></li -->
	<% End If %>

	</ul>
	<div class="lb"></div>
<% End If %>

<% '7: Event %>
<% If StrComp(1,left_menu_display_arr(7)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.site-event-area').toggle();">
			<span class="site-event-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-event-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>Event 관리</span>
	</h2>
	<ul class="site-event-area" >
		<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
			<li class="sub-menu">
            	<h2 class="a_menu">
                    <strong onclick="$('.old-site-event-area').toggle();">
                        <span class="old-site-event-area" style="display:none;"><i class="fa fa-caret-up"></i></span><span class="old-site-event-area" style="display:inline;"><i class="fa fa-caret-down"></i></span>
                    </strong>
                    <span>(구) Event 관리</span>
                </h2>
                <ul class="old-site-event-area">
				<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
                    <li><a href="/_admin/Event_board/list.asp" target="body">(구)Event 관리</a></li>
                <% End If %>
                <% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
                    <li><a href="/_admin/Event_dg_board/list.asp" target="body">(구)Event 당첨 관리</a></li>
                <% End If %>
                <% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
                	<li><a href="/_admin/Event_board/viewlist.asp" target="body">7월 Event 신청자</a></li>
            	<% End If %>

                </ul>
            </li>
		<% End If %>



    <% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/Event_board/event_list.asp" target="body">Event 게시판 관리</a></li>
	<% End If %>
    <% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/Event_board/applicant/applicant_list.asp" target="body">Event 신청자 관리</a></li>
	<% End If %>
	<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/Event_board/banner/banner_list.asp" target="body">Event 배너 관리</a></li>
	<% End If %>
    <% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
      	<li><a href="/_admin/Event_board/course/course_list.asp" target="body">진로체험 수료증 관리</a></li>
        <li><a href="/_admin/Event_board/kakao_link.asp" target="body">카카오톡 링크</a></li>
    <% End If %>
	<% If InStr("[10][9][8][7]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/list.asp" target="body">입시설명회 신청자</a></li-->
	<% End If %>

	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!-- li><a href="/_admin/community/list_2016.asp" target="body">2016 체험학교 신청자</a></li
		<li><a href="/_admin/community/list_2017.asp" target="body">체험학교 신청자</a></li>-->
	<% End If %>
	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
    	<!--li><a href="/_admin/community/2018/AptitudeTest_list.asp" target="body">진로탐색</a></li>
		<li><a href="/_admin/community/2018/coding_education.asp" target="body">코딩온라인수업</a></li-->
	<% End If %>
	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/list_lecture_2017.asp" target="body">2017 특강 신청자</a></li-->
	<% End If %>
	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/2018/smart_contest_list.asp" target="body">2018 자율주행 무인자동차</a></li>
        <li><a href="/_admin/community/2018/SpecialLecture.asp" target="body">2018 릴레이특강</a></li-->
	<% End If %>
    <% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/2018/game_contest_list.asp" target="body">2018 LOL 게임대회</a></li>
        <li><a href="/_admin/community/2018/gstar_list.asp" target="body">2018 G-STAR 티켓 신청자</a></li-->
	<% End If %>
	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/list_contest_2018.asp" target="body">2018 웹툰공모전 신청자</a></li-->
	<% End If %>
	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/list_vr_2018.asp" target="body">2018 VR체험 신청자</a></li-->
	<% End If %>
	<% If InStr("[10][9][8][7][5][1]","[" & power & "]") >= 1 Then %>
		<!--li><a href="/_admin/community/list_score_2017.asp" target="body">2017 입시정보 신청자</a></li-->
	<% End If %>

<!--
	<% If InStr("[10][9]","[" & power & "]") >= 1 Or StrComp(id,"jungbo2") = 0 Then %>
		<li><a href="/_admin/community/list_jungbo.asp" target="body">진단 서비스 점검 신청자</a></li>
	<% End If %>

	<% If InStr("[10][9]","[" & power & "]") >= 1 Or StrComp(id,"jungbo2") = 0 Then %>
		<li><a href="/_admin/jungbo_Sangdam_board/list.asp" target="body">진단 서비스 문의</a></li>
	<% End If %>

	<% If InStr("[10][9]","[" & power & "]") >= 1 Or StrComp(id,"디자인") = 0 Then %>
		<li><a href="/_admin/design_jobinfo_board/list.asp" target="body">산학협력프로젝트 신청자</a></li>
	<% End If %>
-->

	<li><a href="/_admin/Event_board/viewlist2.asp" target="body">등록금 조회 신청자</a></li>


    <li><a href="/_admin/Event_board/st_review_admin.asp" target="body">학생리뷰 관리</a></li>

    <li><a href="/_admin/Event_board/lol_event_admin.asp" target="body">롤 이벤트 관리</a></li>

    <li><a href="/_admin/Event_board/ev1_admin.asp" target="body">콘텐츠디자인 이벤트 관리</a></li>

    <li><a href="/_admin/Event_board/ev2_admin.asp" target="body">융합스마트 이벤트 관리</a></li>

    <li><a href="/_admin/search_s/sk_list.asp" target="body">수시이벤트</a></li>

	</ul>
	<div class="lb"></div>
<% End If %>


<% '8: Contect us 관리 %>
<% If StrComp(1,left_menu_display_arr(8)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.contactus-board-area').toggle();">
			<span class="contactus-board-area" style="display:inline;"><i class="fa fa-caret-down"></i></span><span class="contactus-board-area" style="display:none;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>Contect us 관리</span>
	</h2>
	<ul class="contactus-board-area" style="display:none;">
	<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/contactus_board/list.asp" target="body">Contact Us 관리</a></li>
	<% End If %>
	</ul>
	<div class="lb"></div>
<% End If %>


<% '9: 선행학습 관리 %>
<% If StrComp(1,left_menu_display_arr(9)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.site-prestudy-area').toggle();">
			<span class="site-prestudy-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-prestudy-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>선행학습 관리</span>
	</h2>
	<ul class="site-prestudy-area">
<!--
	<% If InStr("[10][9]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/prestudy/step_list.asp" target="body">학습내용 및 문제출제</a></li>
	<% End If %>

	<% If InStr("[10][9]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/prestudy/step_app.asp" target="body">학습 진도 체크 및 평가</a></li>
	<% End If %>
-->
	<% If InStr("[10][9][5][1]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/pre_proboard/list.asp" target="body">선행학습 게시판 관리</a></li>
	<% End If %>

	<% If InStr("[10][9][8]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/potential/list.asp" target="body">잠재능력 평가관리</a></li>
	<% End If %>

	</ul>
	<div class="lb"></div>
<% End If %>

<% '10: 기숙사 관리 %>
<% If StrComp(1,left_menu_display_arr(10)) = 0 Then %>
	<h2 class="a_menu">
		<strong onclick="$('.dormitory-board-area').toggle();">
			<span class="dormitory-board-area" style="display:inline;"><i class="fa fa-caret-down"></i></span>
            <span class="dormitory-board-area" style="display:none;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>기숙사/생활관 관리</span>
	</h2>
	<ul class="dormitory-board-area">
	<% If InStr("[10][9][7]","[" & power & "]") >= 1 Then %>
		<li><a href="/_admin/dormitory_board/dormitory_config.asp" target="body">일정 관리</a></li>
        <li><a href="/_admin/dormitory_board/dormitory_list2.asp" target="body">기숙사 신청자</a></li>
        <li><a href="/_admin/dormitory_board/dormitory_list3.asp" target="body">생활관 신청자</a></li>
        <li><a href="/_admin/dormitory_board/dormitory_list.asp" target="body">방문상담 신청자</a></li>

	<% End If %>
	</ul>
	<div class="lb"></div>
<% End If %>

<%If power = "10" Then  '총괄%>

	<hr>
	<h2 class="a_menu4">
		<strong onclick="$('.work-program-area').toggle();">
			<span class="work-program-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="work-program-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>고용노동부 과정</span>
	</h2>
	<div class="work-program-area" style="display:none;">
		<h2 class="a_menu4">입학안내</h2>
		<ul>
			<li><a href="/_admin/HRD_FAQ_board/list.asp" target="body">자주하는질문</a></li>
			<li><a href="/_admin/HRD_Sangdam_board/list.asp" target="body">입학상담</a></li>
			<li><a href="/_admin/HRD_news_board/list.asp" target="body">공지사항</a></li>
			<li><a href="/_admin/HRD_data_board/list.asp" target="body">취업자료실</a></li>
			<li><a href="/_admin/HRD_gallery_board/list.asp" target="body">학생갤러리</a></li>
		</ul>
		<div class="lb"></div>

		<h2 class="a_menu4">교육과정 관리</h2>
		<ul>
			<li><a href="/_admin/HRD/list.asp" target="body">교육과정 관리</a></li>
			<li><a href="/_admin/HRD/list3.asp" target="body">입학지원서목록</a></li>
			<li><a href="/_admin/HRD/HRD_list.asp" target="body">교육과정 모집현황</a></li>
		</ul>
		<div class="lb"></div>
	</div>


	<hr>
	<h2 class="a_menu2">
		<strong onclick="$('.week-1day-area').toggle();">
			<span class="week-1day-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="week-1day-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>주1회과정 관리</span>
	</h2>
	<div class="week-1day-area" style="display:none;">
		<h2 class="a_menu2">입학안내</h2>
		<ul>
			<li><a href="../haksa/admin/FAQ_board/list.asp" target="body">FAQ</a></li>
			<li><a href="../haksa/admin/Sangdam_board/list.asp" target="body">Q&A</a></li>
			<li><a href="../haksa/admin/event_board/viewlist.asp" target="body">입학상담</a></li>
		</ul>
		<div class="lb"></div>

		<h2 class="a_menu2">커뮤니티 </h2>
		<ul>
			<li><a href="../haksa/admin/news_board/list.asp" target="body">공지사항</a></li>
			<li><a href="../haksa/admin/interview_board/list.asp" target="body">캠퍼스인터뷰</a></li>
		</ul>
		<div class="lb"></div>

		<h2 class="a_menu2">입시관리 </h2>
		<ul>
			<li><a href="../haksa/admin/student/index2.asp" target="body">입학지원서목록</a></li>
			<li><a href="../haksa/admin/DataRequest/index.asp" target="body">입학자료신청목록</a></li>
		</ul>
		<div class="lb"></div>
	</div>


	<hr>
	<h2 class="a_menu3">
		<strong onclick="$('.global-program-area').toggle();">
			<span class="global-program-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="global-program-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>글로벌 인재 양성과정</span>
	</h2>
	<ul class="global-program-area" style="display:none;">
		<li><a href="../haksa/admin/student/index3.asp" target="body">입학지원서목록</a></li>
		<li><a href="/_admin/tafe_Sangdam_board/list.asp" target="body">입학상담 관리</a></li>
	</ul>
	<div class="lb"></div>

<%ElseIf power = "1" Then '학부%>

<%ElseIf power = "5" Then '교학부%>

	<hr>
	<h2 class="a_menu4">
		<strong onclick="$('.work-program-area').toggle();">
			<span class="work-program-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="work-program-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>고용노동부 과정</span>
	</h2>
	<div class="work-program-area" style="display:none;">
		<h2 class="a_menu4">입학안내</h2>
		<ul>
			<li><a href="/_admin/HRD_FAQ_board/list.asp" target="body">자주하는질문</a></li>
			<li><a href="/_admin/HRD_Sangdam_board/list.asp" target="body">입학상담</a></li>
			<li><a href="/_admin/HRD_news_board/list.asp" target="body">공지사항</a></li>
			<li><a href="/_admin/HRD_data_board/list.asp" target="body">취업자료실</a></li>
			<li><a href="/_admin/HRD_gallery_board/list.asp" target="body">학생갤러리</a></li>
		</ul>
		<div class="lb"></div>

		<h2 class="a_menu4">교육과정 관리</h2>
		<ul>
			<li><a href="/_admin/HRD/list.asp" target="body">교육과정 관리</a></li>
			<li><a href="/_admin/HRD/list3.asp" target="body">입학지원서목록</a></li>
			<li><a href="/_admin/HRD/HRD_list.asp" target="body">교육과정 모집현황</a></li>
		</ul>
	</div>
	<div class="lb"></div>

<%ElseIf power = "6" Then '총무부%>

	<hr>
	<h2 class="a_menu2">
		<strong onclick="$('.week-1day-area').toggle();">
			<span class="week-1day-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="week-1day-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>주1회과정 관리</span>
	</h2>
	<div class="week-1day-area" style="display:none;">
		<h2 class="a_menu2">입학안내</h2>
		<ul>
			<li><a href="../haksa/admin/Sangdam_board/list.asp" target="body">Q&A</a></li>
			<li><a href="../haksa/admin/event_board/viewlist.asp" target="body">입학상담</a></li>
		</ul>
		<div class="lb"></div>

		<h2 class="a_menu2">커뮤니티</h2>
		<ul>
			<li><a href="../haksa/admin/news_board/list.asp" target="body">공지사항</a></li>
		</ul>
		<div class="lb"></div>

		<h2 class="a_menu2">입시관리</h2>
		<ul>
			<li><a href="../haksa/admin/student/index2.asp" target="body">입학지원서목록</a></li>
		</ul>
		<div class="lb"></div>
	</div>

<%ElseIf power = "7"  Then '홍보부%>

	<hr>
	<h2 class="a_menu3">
		<strong onclick="$('.global-program-area').toggle();">
			<span class="global-program-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="global-program-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>글로벌 인재 양성과정</span>
	</h2>
	<ul class="global-program-area" style="display:none;">
		<li><a href="../haksa/admin/student/index3.asp" target="body">입학지원서목록</a></li>
		<li><a href="/_admin/tafe_Sangdam_board/list.asp" target="body">입학상담 관리</a></li>
	</ul>
	<div class="lb"></div>

<%ElseIf power = "8" Then  '임원%>

	<hr>
	<h2 class="a_menu4">
		<strong onclick="$('.work-program-area').toggle();">
			<span class="work-program-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="work-program-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>고용노동부 과정</span>
	</h2>
	<div class="work-program-area" style="display:none;">
		<h2 class="a_menu4">교육과정 관리</h2>
		<ul>
			<li><a href="/_admin/HRD/list3.asp" target="body">입학지원서목록</a></li>
			<li><a href="/_admin/HRD/HRD_list.asp" target="body">교육과정 모집현황</a></li>
		</ul>
	</div>
	<div class="lb"></div>


	<hr>
	<h2 class="a_menu2">
		<strong onclick="$('.week-1day-area').toggle();">
			<span class="week-1day-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="week-1day-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>주1회과정 관리</span>
	</h2>
	<div class="week-1day-area" style="display:none;">
		<h2 class="a_menu2">입시관리 </h2>
		<ul>
			<li><a href="../haksa/admin/student/index2.asp" target="body">입학지원서목록</a></li>
		</ul>
	</div>
	<div class="lb"></div>


	<hr>
	<h2 class="a_menu3">
		<strong onclick="$('.global-program-area').toggle();">
			<span class="global-program-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="global-program-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>글로벌 인재 양성과정</span>
	</h2>
	<ul class="global-program-area" style="display:none;">
		<li><a href="../haksa/admin/student/index3.asp" target="body">입학지원서목록</a></li>
	</ul>
	<div class="lb"></div>


<%ElseIf power = "2" Then '게시판관리%>

	<h2 class="a_menu">
		<strong onclick="$('.site-operation-area').toggle();">
			<span class="site-operation-area" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-operation-area" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>사이트운영</span>
	</h2>
	<ul class="site-operation-area">
		<li><a href="/_admin/board_list/list.asp" target="body">통합 게시판 관리</a></li>
		<li><a href="/_admin/press_board/list.asp" target="body">홍보미디어</a></li>

	</ul>
	<div class="lb"></div>

<%End if%>


<% If StrComp(id,"2016390") = 0 Then  %>
	<div style="height:10px; border-top:1px solid #000; line-height:10px;"></div>

	<h2 class="a_menu">
		<strong onclick="$('.site-operation-area2').toggle();">
			<span class="site-operation-area2" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-operation-area2" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>사이트운영</span>
	</h2>
	<ul class="site-operation-area2">
		<li><a href="/_admin/web_popup/list.asp" target="body">팝업 관리</a></li>
		<li><a href="/_admin/Class_Date/Date_index.asp" target="body">모집일정 관리</a></li>
		<li><a href="/_admin/press_board/list.asp" target="body">홍보미디어</a></li>
		<li><a href="/_admin/working_situation/list.asp" target="body">취업현황 관리</a></li>
		<li><a href="/_admin/jobinterview_board/list.asp" target="body">취업인터뷰</a></li>
		<li><a href="/_admin/entryinterview_board/list.asp" target="body">진학인터뷰</a></li>
	</ul>
	<div class="lb"></div>


	<h2 class="a_menu">
		<strong onclick="$('.site-department-area2').toggle();">
			<span class="site-department-area2" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-department-area2" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>학부관리</span>
	</h2>
	<ul class="site-department-area2">
		<li><a href="/_admin/news_board/list.asp" target="body">공지사항</a></li>
		<li><a href="/_admin/department_board/list.asp" target="body">스쿨소식</a></li>
		<li><a href="/_admin/prof_info/list.asp" target="body">교수진 관리</a></li>
		<li><a href="/_admin/Work_board/list.asp" target="body">학부작품 관리</a></li>
		<li><a href="/_admin/ClassLife_board/list.asp" target="body">스쿨생활 엿보기 관리</a></li>
	</ul>
	<div class="lb"></div>


	<h2 class="a_menu">
		<strong onclick="$('.site-it-community-area2').toggle();">
			<span class="site-it-community-area2" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-it-community-area2" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>IT 커뮤니티</span>
	</h2>
	<ul class="site-it-community-area2">
		<li><a href="/_admin/board_list/list.asp" target="body">통합 게시판 관리</a></li>
		<li><a href="/_admin/issue_board/list.asp" target="body">전문가 인터뷰</a></li>
		<li><a href="/_admin/job_board/list.asp" target="body">나도 IT 스타</a></li>
		<li><a href="/_admin/itgallery_board/list.asp" target="body">교내행사 관리</a></li>
		<li><a href="/_admin/school_board/list.asp" target="body">세계의 전문학교</a></li>
		<li><a href="/_admin/project_gboard/list.asp" target="body">프로젝트 경진대회 </a></li>
		<li><a href="/_admin/total_gallery/list.asp" target="body">Total Gallery 관리</a></li>
		<li><a href="/_admin/talk_board/list.asp" target="body">직찍 콘테스트</a></li>
		<li><a href="/_admin/talk_board/1day.asp" target="body">1일 체험학습</a></li>
		<!-- li><a href="/_admin/startup_board/list.asp" target="body">스타트업 관리</a></li -->
	</ul>

<% End If %>

<% If StrComp(id,"2014315") = 0 Then %>
	<div style="height:10px; border-top:1px solid #000; line-height:10px;"></div>

	<h2 class="a_menu">
		<strong onclick="$('.site-department-area2').toggle();">
			<span class="site-department-area2" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-department-area2" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>학부관리</span>
	</h2>
	<ul class="site-department-area2">
		<li><a href="/_admin/Work_board/list.asp" target="body">학부작품 관리</a></li>
	</ul>
	<div class="lb"></div>


	<h2 class="a_menu">
		<strong onclick="$('.site-it-community-area2').toggle();">
			<span class="site-it-community-area2" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-it-community-area2" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>IT 커뮤니티</span>
	</h2>
	<ul class="site-it-community-area2">
		<li><a href="/_admin/total_gallery/list.asp" target="body">Total Gallery 관리</a></li>
	</ul>
	<div class="lb"></div>

<% End If %>

<% 'If (StrComp(id,"webmaster") = 0 And Request.ServerVariables("REMOTE_ADDR") = "49.1.218.9") Or StrComp(id,"2016390") = 0 Then %>
<% If (StrComp(id,"webmaster") = 0 And Request.ServerVariables("REMOTE_ADDR") = "49.1.218.9") And False Then %>
	<div style="height:10px; border-top:1px solid #000; line-height:10px;"></div>
	<h2 class="a_menu">
		<strong onclick="$('.site-it-community-area2').toggle();">
			<span class="site-it-community-area2" style="display:none;"><i class="fa fa-caret-down"></i></span><span class="site-it-community-area2" style="display:inline;"><i class="fa fa-caret-up"></i></span>
		</strong>
		<span>IT 커뮤니티</span>
	</h2>
	<ul class="site-it-community-area2">
		<li><a href="/_admin/web_popup/list.asp" target="body">팝업 관리</a></li>
	</ul>
	<div class="lb"></div>

<% End If %>





<div style="height:30px;"></div>
</body>
</html>
