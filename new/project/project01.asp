<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
category="2"
menu="8"
sub_menu="1"

title="s04_005"
pageNum = "1"
subNum = "1"
%>
	<!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
    <!-- S: header 시작 -->
    <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
    <!-- E: header 종료 -->

     <!--2020-->
    <!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->
    <!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->

	<!-- #include virtual="/inc/2017/subHeader.asp" -->
	<div class="tab pt">
		<ul>
			<li class="on"><a href="">프로젝트 발표회 소개</a></li>
			<li><a href="./project02.asp">수상작품 소개</a></li>
			<li><a href="project03.asp">대회갤러리</a></li>
		</ul>
	</div>
	<div class="tabContents">
		<ul>
			<li class="project01">
				<div class="project01_01">
					<h3 class="title02">프로젝트 발표회 소개</h3>
					<div>
						<span><iframe width="524" height="264" src="https://www.youtube.com/embed/UE92x1A4cnQ?rel=0" frameborder="0" allowfullscreen></iframe></span>
						<div class="txtBox">
							<span class="title">KOREA IT PROJECT CONTEST</span>
							<p>
								한국IT직업전문학교 학생들의 프로젝트 발표회 참가 실력은 해가 갈수록 높아지고 있습니다. 졸업 후 대부분의 학생들이 취업을 선택하는 이유도 입학시점과 비교할 수 없을 정도로 향상되기 때문입니다.
							</p>
							<p><span>본 시스템은</span><span class="blue">일반2,4년제 대학에서 찾아볼 수 없는 차별화된 교육방식</span><span>입니다.</span></p>
							<ul>
								<li>
									<p>
										차별화된 <br>
										교육방식
									</p>
								</li>
								<li>
									<p>
										학생들의 <br>
										실력향상
									</p>
								</li>
								<li>
									<p>
										높은 퀄리티 <br>
										포트폴리오
									</p>
								</li>
							</ul>
						</div>
					</div>
					<ul>
						<li>
							<span><img class="lazy" data-src="/images/2017/contents/project01_01img01.jpg" alt=""></span>
							<div class="txtBox">
								<dl>
									<dt>프로젝트 팀 활동이란?</dt>
									<dd>
										2학년 학생들을 중심으로 각 계열, 전공별 팀원을 구성하여 <br>
										1년간 팀원으로 활동합니다.
									</dd>
									<dd>
										학생들은 1학년 기말고사 이후 교수님의 평가에 의해 <br>
										프로젝트 팀을 구성하여 2학년 때 제작될 프로젝트 내용을 <br>
										확정합니다.
									</dd>
								</dl>
							</div>
						</li>
						<li>
							<span><img class="lazy" data-src="/images/2017/contents/project01_01img02.jpg" alt=""></span>
							<div class="txtBox">
								<dl>
									<dt>프로젝트팀 목표 및 혜택</dt>
									<dd>학생들의 실력향상과 실무능력을 갖춘 인재양성</dd>
									<dd>취업추천 및 기업체 인턴 직원 최우선 파견</dd>
									<dd>작업공간 PC지원</dd>
									<dd>대외전시회 참가 최우선 지원</dd>
								</dl>
							</div>
						</li>
					</ul>
				</div>
				<div class="project01_02">
					<h3 class="title02">수업진행과정</h3>
					<span><img class="lazy" data-src="/images/2017/contents/project01_02img01.jpg" alt=""></span>
					<ul>
						<li><img class="lazy" data-src="/images/2017/contents/project01_02img02.jpg" alt=""></li>
						<li><img class="lazy" data-src="/images/2017/contents/project01_02img03.jpg" alt=""></li>
						<li><img class="lazy" data-src="/images/2017/contents/project01_02img04.jpg" alt=""></li>
						<li><img class="lazy" data-src="/images/2017/contents/project01_02img05.jpg" alt=""></li>
					</ul>
				</div>
			</li>
			<li class="project02"></li>
			<li class="project03"></li>
		</ul>
	</div>
	<script language="javascript">
		$(document).ready(function(e) {
			$('.pt').find('a:eq(0)').trigger('click');

			$(".pt a").click(function(event){
				var ahref = $(this).attr("href");
				var target = $(this).attr("target");
				if (ahref!="") {
					document.location.href=ahref
				}
				event.preventDefault()
			});
		});
	</script>
	<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
