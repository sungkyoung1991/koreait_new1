<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
category="3"
menu="1"
sub_menu="1"
title="s07_001"
%>
    <!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
    <!-- S: header 시작 -->
    <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
    <!-- E: header 종료 -->

     <!--2020-->
    <!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->
    <!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->


	<!-- #include virtual="/inc/2017/subHeader.asp" -->
<%

'ArySelection - inc_html_head_utf8.inc

Study_year = ArySelection(0).item("Study_year")
Dim period : period = ArySelection2(0).item("period_s_date") & " ~ " &  ArySelection2(0).item("m_period_e_date")
Dim period2 : period2 = ArySelection2(0).item("Study_year") & "년 " &  ArySelection2(0).item("m_period_s_date") & " ~ " &  ArySelection2(0).item("m_period_e_date")
%>

	<div class="tab">
		<ul>
        	<li class="on"><a href="">신입생 모집전형</a></li>
			<li><a href="">모집요강</a></li>
			<li><a href="">전형유형 및 지원자격</a></li>
			<li><a href="">전형과정 및 방법</a></li>
			<li><a href="">외국인 및 유학생.</a></li>
            <li><a href="">예비 신입생 리뷰</a></li>
		</ul>
	</div>
	<div class="subContentsTitleBox">
		<div class="txtBox">
			<span class="title01">대한민국 IT기술을 선도하는 교육의 중심! 한국IT직업전문학교!</span>
			<span class="title02"><span><%=Study_year%>학년도 신입생 모집</span> <strong><%=period%></strong><span>까지</span></span>
		</div>
		<span class="mark mark01"><img class="lazy" data-src="/images/2017/contents/mark01.png" alt=""></span>
		<span class="mark mark02"><img class="lazy" data-src="/images/2017/contents/mark02.png" alt=""></span>
	</div>
	<div class="tabContents">
		<ul>

        	<li class="admission01">

            <img src="/images/2017/contents/qk.jpg"/>

            </li>


			<li class="admission01">
				<h3 class="title02"><%=Study_year+1%>학년도 신입생 모집요강</h3>
				<p>서류는 면접 당일에 제출하며, 합격자 발표와 등록금 납부는 개별 통지됩니다.</p>
				<ul>
					<li>
						<span>수능·내신 미반영</span>
						<p>(적성검사 + 면접선발) </p>
					</li>
					<li>
						<span>타대학 중복지원 가능</span>
					</li>
					<li>
						<span>심화학기,자격증 <br> 강의 전액무료 </span>
					</li>
					<li>
						<span>2,3년만에 4년제 <br> 학사학위 취득 가능</span>
					</li>
                    <li>
						<span>일본 취업 지원</span>
                        <!--<p>(일본어 강의 무료)</p>-->
					</li>
				</ul>
				<h3 class="title02">전형일정</h3>
				<table summary="2행,8열 프로그램명 주요내용 설명" class="contentsTable">
					<caption>프로그램별 주요내용</caption>
					<colgroup>
						<col width="20%">
						<col width="25%">
						<col width="20%">
						<col width="10%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr>
							<th>모집구분</th>
							<th>전형기간</th>
							<th>합격자발표</th>
							<th>서류제출</th>
							<th>등록금 납부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span><%=Study_year+1%>학년 신입생 모집</span></td>
							<td><%=period%></td>
							<td><%=ArySelection(0).item("Pass_announce")%></td>
							<td><%=ArySelection(0).item("Document")%></td>
							<td><%=ArySelection(0).item("Payment")%></td>
						</tr>
					</tbody>
				</table>

				<h3 class="title02">모집계열</h3>
				<table summary="2행,8열 프로그램명 주요내용 설명" class="contentsTable">
					<caption>프로그램별 주요내용</caption>
					<colgroup>
						<col width="15%">
						<col width="20%">
						<!--<col width="15%">
						<col width="15%">-->
						<col width="35%">
					</colgroup>
					<thead>
						<tr>
							<th rowspan="2">계열</th>
							<th rowspan="2">과정</th>
                            <!-- 2019-02-21 모집인원 삭제 요청-->
							<!--<th colspan="2">모집인원</th>-->
							<th rowspan="2">학위</th>
						</tr>
						<!--<tr>
							<th class="grayBg">일반전형</th>
							<th class="grayBg rightLine">특별전형</th>
						</tr>-->
					</thead>
                    <tbody>
<%
Function GetClassPnameLisToAry()
	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_모집계열_조회_L @mode='pname'"
'	Dim sql : sql ="exec HAkSA_모집계열_조회_L @mode='pname2'"

	GetClassPnameLisToAry = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
END Function

Function GetClassHnameLisToAry()
	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_모집계열_조회_L @mode='hname'"
	'Dim sql : sql ="exec HAkSA_모집계열_조회_L @mode='hname2'"

	GetClassHnameLisToAry = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
END Function

'모집요강
Dim AryPname : AryPname = GetClassPnameLisToAry()
Dim AryHname : AryHname = GetClassHnameLisToAry()
IF IsArray(AryPname) Then
	For i = 0 To UBound(AryPname)
		IF isArray(AryHname) Then
			For j = 0 To UBound(AryHname)
				IF StrComp(AryPname(i).item("Pname"),AryHname(j).item("Pname")) = 0 Then
					%>
				<tr>
                <%	IF StrComp(1,AryHname(j).item("seq")) = 0 Then%>
            		<td rowspan="<%=AryPname(i).item("Hcnt")%>"><%=AryPname(i).item("Pname")%></td>
       			 <% END IF %>
					<td class="txtLeft"><%=AryHname(j).item("Hname")%></td>
                   <!-- <td><=AryHname(j).item("Jungwon")%></td>
                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                    <td class="txtLeft"><%=AryHname(j).item("degree")%> 수여</td>
              	</tr>
                <%
				END IF
			NEXT
		END IF
	Next
END IF

%>
</tbody>
				</table>
				<div class="btnWrap">
					<a href="/new/ad_lead/support_apply.asp" class="btnReceipt blue">원서접수</a>
					<a href="http://www.koreait.ac.kr/new/ad_lead/vreserve.asp" class="btnCounsel grey">입학상담</a>
				</div>
			</li><!-- 모집요강페이지 end -->

			<li class="admission02">
				<h3 class="title02">전형유형 및 지원자격</h3>
				<p>※ 타대학 수시 / 정시 합격자도 지원(중복지원) 가능</p>
				<table summary="2행,8열 프로그램명 주요내용 설명" class="contentsTable">
					<caption>프로그램별 주요내용</caption>
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<thead>
						<tr>
							<th>전형유형</th>
							<th>지원자격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>일반전형</td>
							<td class="txtLeft">
								고등학교 졸업자 및 <%=Study_year%>년 졸업예정자 (문과/이과, 예체능, 전문/실업계 구분 없이 교차지원 가능)
							</td>
						</tr>
						<tr>
							<td rowspan="6">특별전형</td>
							<td class="txtLeft">검정고시 합격자</td>
						</tr>
						<tr>
							<td class="txtLeft">타대학 중퇴 및 졸업자 (현재 재학 중이여도 지원/면접은 가능)</td>
						</tr>
						<tr>
							<td class="txtLeft">산업체 6개월 이상 근무자</td>
						</tr>
						<tr>
							<td class="txtLeft">각종 대회 입상자</td>
						</tr>
						<tr>
							<td class="txtLeft">국가기술자격증 기능사 이상 소지자</td>
						</tr>
						<tr>
							<td class="txtLeft">사회단체 봉사활동 50시간 이상 봉사한 자</td>
						</tr>
					</tbody>
				</table>

			</li><!-- 전형유형 및 지원자격 end -->

			<li class="admission03">
				<h3 class="title02">전형과정 및 방법</h3>
				<span><img class="lazy" data-src="/images/2017/contents/admission03_01.jpg" alt=""></span>
				<h3 class="title02">잠재 능력 검사</h3>
				<div class="inspection">
					<dl>
						<dt>잠재능력검사란?</dt>
						<dd>
							<p>
								학생 선발기준을 획일화된 성적보다는 학생 개개인의 창의력, 잠재능력 등을 최우선으로 적용하기 위한 검사입니다. <br>
								계열별로 검사안이 준비되어 있으며, 본인이 생각하는 다양한 아이디어를 자유롭게 기술하는 방식입니다.
							</p>
						</dd>
					</dl>
				</div>
				<h3 class="title02">전형방법</h3>
				<p>계열관련 잠재 능력 검사(40%) + 면접시험(60%)</p>
				<div class="feature05 mt30 ">
					<ul>
						<li>
							<span class="num">01</span>
							<p>포트폴리오나 습작집 지참 시 가산점 부여 </p>
						</li>
						<li>
							<span class="num">02</span>
							<p>자격증 취득자의 경우 가산점 부여</p>
						</li>
						<li>
							<span class="num">03</span>
							<p>공모전 당선자 가산점 부여<br>- 관련 서류를 면접 시 제출해야 함</p>
						</li>
					</ul>
				</div>

				<h3 class="title02">자격증 점수 산정기준</h3>
				<p>※ 이 외의 자격증에 대해서는 자격증 난이도에 따라 부여</p>
				<table summary="" class="contentsTable">
					<caption>프로그램별 주요내용</caption>
					<colgroup>
						<col width="65%">
						<col width="35%">
					</colgroup>
					<thead>
						<tr>
							<th>자격증</th>
							<th>가산점</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>정보처리기사, 정보보안기사, CISA, CISSP, CEH, CCNA</td>
							<td>10점</td>
						</tr>
						<tr>
							<td>공모전 당선자</td>
							<td>10점</td>
						</tr>
						<tr>
							<td>정보처리 산업기사, 정보보안 산업기사, 컴퓨터운용사, 네트워크 관리사, 컴퓨터 활용능력 1급</td>
							<td>7점</td>
						</tr>
						<tr>
							<td>컴퓨터 활용능력 2급, 리눅스 마스터 1급</td>
							<td>5점</td>
						</tr>
						<tr>
							<td>워드, MOS</td>
							<td>3점</td>
						</tr>
					</tbody>
				</table>
			</li><!-- 전형과정 및 방법 end -->

			<li class="admission04">
				<div class="foreigner">
					<dl>
						<dt>외국인 및 유학생</dt>
						<dd>
							<p>
								해당 국가의 교육관계법령 등에 의거 소정의 학력이 인정되어야 하며,해당 국가의 국가기관에 의해<br>학력인정확인이 가능한 학교이어야 함
							</p>
						</dd>
					</dl>
				</div>

				<table summary=" " class="contentsTable mt20">
					<caption>프로그램별 주요내용</caption>
					<colgroup>
						<col width="40%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th>제출서류</th>
							<th>고졸</th>
							<th>대졸</th>
							<th>대학 재학/제적</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>출입국사실증명서 / 외국인등록증 (또는 국내거소사실 증명서)</td>
							<td>○</td>
							<td>○</td>
							<td>○</td>
						</tr>
						<tr>
							<td>고등학교 졸업증명서 1부</td>
							<td>○</td>
							<td>X</td>
							<td>○</td>
						</tr>
						<tr>
							<td>초, 중, 고등학교 전과정 성적증명서 각 1부</td>
							<td>○</td>
							<td>X</td>
							<td>○</td>
						</tr>
						<tr>
							<td>학사과정 졸업증명서, 성적증명서 각 1부</td>
							<td>X</td>
							<td>○</td>
							<td>X</td>
						</tr>
						<tr>
							<td>학사과정 재적 또는 제적증명서, 성적증명서 각 1부</td>
							<td>○</td>
							<td>X</td>
							<td>○</td>
						</tr>
						<tr>
							<td>고등학교 학력인정확이서 또는 아포스티유 확인서</td>
							<td>○</td>
							<td>X</td>
							<td>○</td>
						</tr>
						<tr>
							<td>대학 학력인정확인서 또는 아포스티유 확인서</td>
							<td>X</td>
							<td>○</td>
							<td>○</td>
						</tr>
						<tr>
							<td>원어민 경우 한글번역공증 각 1부</td>
							<td>○</td>
							<td>○</td>
							<td>○</td>
						</tr>
					</tbody>
				</table>
			</li>


            <li>
            	<iframe name="ifrm" id="ifrm4" src="st_review2.asp" width="100%" height="1801" frameborder="no" scrolling="no" align="center"></iframe>


            </li>

		</ul>
	</div>

<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
