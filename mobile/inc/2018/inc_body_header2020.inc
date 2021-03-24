<!-- E: skip navi -->
<div id="subTopMenu">
	
	<div id="mainQuick" >
	
		<h2 class="hidden">신입생 모집 및 바로가기 메뉴</h2>
		 <div class="period">
			  <dl>
				  <dt><span class="year"><%=GetSelectionDateArrayToStr(0)%>학년도 </span>신입생 모집</dt>
				  <dd>
					  <strong><%=GetSelectionDateArrayUTF8ToStr(3)%></strong> 까지
				  </dd> 
			  </dl>
			  <div><a data-ajax="false" href="/entrance/application.asp" data-rel="external" data-ajax="false">원서접수</a></div>
		  </div>
	</div>
	
	<div id="mainMenuNew" class="mainMenuNew">
		<div class="depth1_menu">
			<ul class="depth1_menu_ul">
				<li class="menu_active">
					<h2>학교소개</h2>
					<div class="depth2_menu">
						<ul>
							<li><a data-ajax="false" class="greetings" href="/2018/greetings.asp" data-ajax="false">인사말</a></li>
							<li><a data-ajax="false" class="campus_guide" href="/2018/campus_guide.asp" data-ajax="false">캠퍼스 안내</a></li>
							<li><a data-ajax="false" class="2020_itmap" href="/2018/2020_itmap.asp" data-ajax="false">오시는 길</a></li>
						</ul>
					</div>
				</li>
				<li class="menu_active">
					<h2>입학안내</h2>
					<div class="depth2_menu">
						<ul>
							<li><a data-ajax="false" class="guidelines" href="/2018/guidelines.asp" data-ajax="false">모집요강</a></li>
							
							
							<li><a data-ajax="false" class="2020_application_t ms1 ms2 ms3 ms4 ms5 ms_result" href="/2018/2020_application_t.asp" data-ajax="false">모의 원서접수</a></li>
							
							
							<li><a data-ajax="false" class="2020_application" href="/2018/2020_application.asp" data-ajax="false">원서접수</a></li>
							<li><a data-ajax="false" class="2020_candidate" href="/2018/2020_candidate.asp" data-ajax="false">합격자 조회</a></li>
							<li><a data-ajax="false" class="2020_qna 2020_qnaList" href="/2018/2020_qnaList.asp" data-ajax="false">입학 Q&A</a></li>
							<li><a data-ajax="false" class="2020_interviewguide" href="/2018/2020_interviewguide.asp" data-ajax="false">면접 가이드</a></li>
							<li><a data-ajax="false" class="2020_reference 2020_check" href="/2018/2020_reference.asp" data-ajax="false">입시자료 신청</a></li>
						</ul>
					</div>
				</li>
				<li class="menu_active">
					<h2>PRIDE IT</h2>
					<div class="depth2_menu">
						<ul>
							<li><a data-ajax="false" class="2020_feature" href="/2018/2020_feature.asp" data-ajax="false">한국IT 경쟁력</a></li>
							<li><a data-ajax="false" class="koreait_news board_Content2020" href="/board/koreait_news.asp" data-ajax="false">한.아.전 소식</a></li>
							<li><a data-ajax="false" class="2020_job" href="/2018/2020_job.asp" data-ajax="false">취업현황</a></li>
							<li><a data-ajax="false" class="2020_itstory 1minknowhow" href="/2018/2020_itstory.asp" data-ajax="false">학생 스토리</a></li>
						</ul>
					</div>
				</li>
				<li class="menu_active">
					<h2>계열소개</h2>
					<div class="depth2_menu">
						<ul>
							<li><a data-ajax="false" class="game_index" href="/2018/game_index.asp" data-ajax="false">게임계열</a></li>
							<li><a data-ajax="false" class="2020_security_index" href="/2018/2020_security_index.asp" data-ajax="false">정보보안계열</a></li>
							<li><a data-ajax="false" class="2020_contentsdesign_index" href="/2018/2020_contentsdesign_index.asp" data-ajax="false">디지털디자인계열</a></li>
							<li><a data-ajax="false" class="2020_smart_index" href="/2018/2020_smart_index.asp" data-ajax="false">인공지능(AI)계열</a></li>	
                             <li><a data-ajax="false" class="2020_elect_index" href="/2018/2020_elect_index.asp" data-ajax="false">전기공학계열</a></li>																				
							<!-- <li><a data-ajax="false" class="2020_enter_index" href="/2018/2020_enter_index.asp" data-ajax="false">게임엔.터테인먼트계열</a></li> -->
						</ul>
					</div>
				</li>
				<li class="menu_active">
					<h2>학교생활</h2>
					<div class="depth2_menu">
						<ul>
							<li><a data-ajax="false" class="2020_event event_board eventboard" href="/event_renew/2018/event_board.asp" data-ajax="false">학교행사</a></li>
							<li><a data-ajax="false" class="2020_announce" href="/2018/2020_announce.asp" data-ajax="false">공지사항</a></li>
							<li><a data-ajax="false" class="schedule_m" href="/2018/schedule_m.asp" data-ajax="false">학사일정</a></li>
						</ul>
					</div>
				</li>
				<li class="menu_active">
					<h2>특별전형</h2>
					<div class="depth2_menu">
						<ul>
							<li><a data-ajax="false" class="2020_vocathinalHighschool" href="/2018/2020_vocathinalHighschool.asp" data-ajax="false">직장인 주1회 과정</a></li>
							<!--<li><a data-ajax="false" class="tepsk_index" href="/2018/tepsk_index.asp" data-ajax="false">영재교육원</a></li>-->
							<li><a data-ajax="false" class="2020_foreignerTraining" href="/2018/2020_foreignerTraining.asp" data-ajax="false">외국인 기술연수생</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
</div>
	

<script>
$(document).ready(function(e) {
/*	var headerMenuOn = $('#mainMenuNew .depth1_menu_ul li.on').offset().left;
	var subHeaderOn = $('#mainMenuNew .depth2_menu li a.on').offset().left;
	$('#mainMenuNew .depth1_menu_ul').scrollLeft(headerMenuOn);
	$('#mainMenuNew .depth2_menu').scrollLeft(subHeaderOn);*/
});
</script>