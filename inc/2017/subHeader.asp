<%
dim pp
pp =  split(request.servervariables("HTTP_url"),"/")(2)
'학교소개 about_us
'pride_it pride_it
'입학안내 ad_lead
'학교생활 board
'학사안내 edu_intro
'학생서비스 stu_service
'취업지원센터 working_intro
'else 영재교육원
%>

<div id="subVisual" >
	<!--<div class="subVisualWrap">-->
	<div class="<% if pp = "about_us" then %> ab_mb <%elseif pp = "pride_it" then %>pr_mb <%elseif pp="ad_lead" then %>ad_mb <% elseif pp="board" then %>board_mb <% elseif pp="edu_intro" then %>edu_mb <% elseif pp="stu_service" then %>stu_mb <% elseif pp="working_intro" then %> work_mb <% elseif pp="mypage" then %> stu_mb <% else %> yg_mb <%end if%>">
		<div class="auto">

		</div>
	</div>
</div>
<div id="subContents" class="auto">
	<div class="lnbWrap">
		<h2 class="subTitle">
			<span class="inner">
				<span class="kor"></span>
				<span class="eng"></span>
			</span>
		</h2>
		<div id="lnb">

		</div>
		<div class="lnbBanner">
			<span class="year"><%=ArySelection(0).item("Study_year")%>학년도</span>
			<dl>
				<dd>한국IT직업전문학교</dd>
				<dt>신입생 모집</dt>
			</dl>
			<span class="date"><%=ArySelection(0).item("m_From_date") & " ~ " & ArySelection(0).item("m_To_Date") %></span>
			<a href="/new/ad_lead/support_apply.asp"><img class="lazy" data-src="/images/2017/contents/btnApplication.png" alt="원서 접수하기"></a>
			<ul>
				<li>
					수능 / 내신 미반영 <br>
					<span>(계열 면접 선발)</span>
				</li>
                <li>면접&적성검사 100%선발</li>


                <li> 선행학습 무료지원</li>
                <!--<li> 일본 취업 지원</li>-->

			</ul>
		</div>
	</div>
	<div id="contents">
		<h2 class="contentsTitle"><span></span></h2>
		<ul class="breadCrumb">
			<li><a href="">HOME</i></a></li>
		</ul>
		<div class="contentsWrap">
