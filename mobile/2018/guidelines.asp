<!-- #include virtual="/inc/Service_Inc.inc" -->
<!-- #include Virtual="/inc/2018/inc_html_head2020.inc" -->
<%

Function GetSelectionListToArr()

	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period', @type=''"
	GetSelectionListToArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

End Function


Function GetSelectionListToArr2()

	Dim AryHash
	Set AryHash = new RsToHashMap
	Dim sql : sql ="exec HAkSA_원서접수일정_조회_L @mode='period2', @type=''"
	GetSelectionListToArr2 = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

End Function

'모집요강
Dim ArySelection : ArySelection = GetSelectionListToArr()
Dim ArySelection2 : ArySelection2 = GetSelectionListToArr2()

Dim period : period = ArySelection(0).item("period_s_date") & " ~ " &  ArySelection(0).item("m_period_e_date")

Dim period2 : period2 = ArySelection2(0).item("Study_year") & "년 " & ArySelection2(0).item("m_period_s_date") & " ~ " &  ArySelection(0).item("m_period_e_date")
%>

<!-- S: page -->
<!-- #include Virtual="/inc/2018/inc_body_header2020.inc" -->

<div id="subContents">
    <div data-role="page" class="slidePage" id="itstoryPage" data-next="" data-prev="" data-defaults="ture">
        <section class="sub_in_wrap">
            <!--#include Virtual= "/inc/2018/inc_body_greetings_bannner.inc"-->
            <div class="greetings_tab guidelines">
                <div class="tab_box">
                    <ul class="clearfix">
                        <li class="on">신입생 모집전형</li>
                        <li>모집요강</li>
                        <li>전형유형 및 지원자격</li>
                        <li>전형과정 및 방법</li>
                        <li>외국인 및 유학생</li>
                    </ul>
                </div>
                <div class="tab_content">
                    <div class="tab_cont_in1 tab_cont_box" style="display:block;">
                        <div class="tab_in_con">
                            <img src="/images/2017/contents/first_selection.jpg" style="max-width:100%;">
                        </div>
                    </div>
                    <div class="tab_cont_in2 tab_cont_box">
                        <div class="tab_in_con">
                            <div class="admission01">
                                <h3 class="title">2022학년도 신입생 모집요강</h3>
                                <p class="wp10">서류는 면접 당일에 제출하며, 합격자 발표와 등록금 납부는 개별 통지됩니다.</p>
                                <ul>
                                    <li>
                                        <div class="inner">
                                            <span><img class="lazy" data-src="/images/2017/contents/admission01_01.png" alt="" src="/images/2017/contents/admission01_01.png"></span>
                                            <dl>
                                                <dt>수능·내신 미반영</dt>
                                                <dd>
                                                    <p>(100% 면접선발)</p>
                                                </dd>
                                            </dl>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="inner">
                                            <span><img class="lazy" data-src="/images/2017/contents/admission01_02.png" alt="" src="/images/2017/contents/admission01_02.png"></span>
                                            <dl>
                                                <dt>중복지원 가능</dt>
                                            </dl>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="inner">
                                            <span><img class="lazy" data-src="/images/2017/contents/admission01_03.png" alt="" src="/images/2017/contents/admission01_03.png"></span>
                                            <dl>
                                                <dt>심화학기 강의 <br> 전액 무료</dt>
                                            </dl>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="inner">
                                            <span><img class="lazy" data-src="/images/2017/contents/admission01_04.png" alt="" src="/images/2017/contents/admission01_04.png"></span>
                                            <dl>
                                                <dt>3년만에 4년제 <br> 학사학위 취득가능</dt>
                                            </dl>
                                        </div>
                                    </li>
                                </ul>
                                <h3 class="title mt20">전형일정</h3>
                                <table summary="2행,8열 프로그램명 주요내용 설명" class="contentsTable">

                                    <caption>프로그램별 주요내용</caption>
                                    <colgroup>
                                        <col width="35%">
                                        <col width="65%">
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>모집구분</th>
                                        <td><span>2022학년 신·편입생 모집</span></td>
                                    </tr>
                                    <tr>
                                        <th>전형기간</th>
                                        <td><%=period2%></td>
                                    </tr>
                                    <tr>
                                        <th>합격자발표</th>
                                        <td><%=ArySelection(0).item("Pass_announce")%></td>
                                    </tr>
                                    <tr>
                                        <th>서류제출</th>
                                        <td><%=ArySelection(0).item("Document")%></td>
                                    </tr>
                                    <tr>
                                        <th>등록금 납부</th>
                                        <td><%=ArySelection(0).item("Payment")%></td>
                                    </tr>
                                </tbody>
                                </table>
                                <h3 class="title mt20">모집계열</h3>
                                <table summary="2행,8열 프로그램명 주요내용 설명" class="contentsTable Course">
                                    <caption>프로그램별 주요내용</caption>
                                    <colgroup>
                                        <col width="20%">
                                        <col width="30%">
                                        <!-- 2019-02-21 모집인원 삭제 요청 -->
                                        <!--<col width="10%">
                                        <col width="10%">-->
                                        <col width="30%">
                                    </colgroup>

                                    <thead class="pName2">
                                        <tr>
                                            <th rowspan="2" class="pName2">계열</th>
                                            <th rowspan="2">과정</th>
                                            <!-- <th colspan="2">모집인원</th> -->
                                            <th rowspan="2">학위</th>
                                        </tr>
                                        <!--<tr>
                                            <th class="grayBg">일반 전형</th>
                                            <th class="grayBg rightLine">특별 전형</th>-->

                                    </thead>
                                    <tbody>

																			<tr>

																		<td rowspan="3">게임</td>

																					<td class="txtLeft">게임아트디자인</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">미술학사 시각디자인학 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">게임기획</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">공학사 게임프로그래밍학 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">게임인공지능프로그래밍</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">공학사 게임프로그래밍학 전공 수여</td>
																			</tr>


																			<tr>

																					<td rowspan="4">정보보안</td>

																					<td class="txtLeft">정보보안</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">공학사 정보보호학 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">사이버해킹보안</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">공학사 정보보호학 전공 수여</td>
																			</tr>



																			<tr>

																					<td class="txtLeft">디지털포렌식(사이버경찰)</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">공학사 정보보호학 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">융합보안(인공지능)</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">공학사 정보보호학 전공 수여</td>
																			</tr>

																			<tr>
																					<td rowspan="4">디지털디자인</td>

																					<td class="txtLeft">웹툰·애니</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">산업예술전문학사 시각디자인 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">일러스트레이션·드로잉</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">산업예술전문학사 시각디자인 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">디지털시각디자인·비주얼웹디자인</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">산업예술전문학사 시각디자인 전공 수여</td>
																			</tr>

																			<tr>

																					<td class="txtLeft">미디어·유튜브</td>
																					<!-- <td><=AryHname(j).item("Jungwon")%></td>
																	<td><=AryHname(j).item("Jungwon1")%></td>-->
																					<td class="txtLeft">산업예술전문학사 시각디자인 전공 수여</td>
																			</tr>



                                        <tr>
                                            <td rowspan="5">인공지능(AI)</td>

                                            <td class="txtLeft">AI영상처리</td>
                                            <!-- <td><=AryHname(j).item("Jungwon")%></td>
                                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                                            <td class="txtLeft">공학사 컴퓨터공학 전공 수여</td>
                                        </tr>

																				<tr>

                                            <td class="txtLeft">AI언어처리</td>
                                            <!-- <td><=AryHname(j).item("Jungwon")%></td>
                                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                                            <td class="txtLeft">공학사 컴퓨터공학 전공 수여</td>
                                        </tr>

                                        <tr>

                                            <td class="txtLeft">드론·로봇</td>
                                            <!-- <td><=AryHname(j).item("Jungwon")%></td>
                                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                                            <td class="txtLeft">공학사 컴퓨터공학 전공 수여</td>
                                        </tr>

                                        <tr>

                                            <td class="txtLeft">컴퓨터공학</td>
                                            <!-- <td><=AryHname(j).item("Jungwon")%></td>
                                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                                            <td class="txtLeft">공학사 컴퓨터공학 전공 수여</td>
                                        </tr>

                                        <tr>

                                            <td class="txtLeft">소프트웨어공학</td>
                                            <!-- <td><=AryHname(j).item("Jungwon")%></td>
                                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                                            <td class="txtLeft">공학사 컴퓨터공학 전공 수여</td>
                                        </tr>








                                        <tr>

                                            <td rowspan="1">전기공학</td>

                                            <td class="txtLeft">전기공학</td>
                                            <!-- <td><=AryHname(j).item("Jungwon")%></td>
                                    <td><=AryHname(j).item("Jungwon1")%></td>-->
                                            <td class="txtLeft">공업전문학사 전기 전공 수여</td>
                                        </tr>



                                    </tbody>
                                </table>
                                <!--<div class="btnWrap">
                                    <a href="http://m.koreait.ac.kr/2018/2020_application.asp" class="blue2020 ui-link" data-rel="external" data-ajax="false">원서접수</a>
                                    <a href="http://www.koreait.ac.kr/new/ad_lead/vreserve.asp" class="gray2020 ui-link" data-rel="external" data-ajax="false">입학상담</a>
                                </div>-->
                            </div>
                        </div>
                    </div>
                    <div class="tab_cont_in3 tab_cont_box">
                        <div class="tab_in_con">
                            <div class="admission02">
                                <h3 class="title mt20">전형유형 및 지원자격</h3>
                                <p>※ 타대학 수시 / 정시 합격자도 지원(중복지원) 가능</p>
                                <table summary="2행,8열 프로그램명 주요내용 설명" class="contentsTable">
                                    <caption>프로그램별 주요내용</caption>
                                    <colgroup>
                                        <col width="25%">
                                        <col width="75%">
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

                                                고등학교 졸업자 및 2022년 졸업예정자 (문과/이과, 예체능, 전문/실업계 구분 없이 교차지원 가능)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td rowspan="6">특별전형</td>
                                            <td class="txtLeft">검정고시 합격자</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">타대학 중퇴 및 졸업자 <br>(현재 재학 중이여도 지원/면접은 가능)</td>
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
                            </div>
                        </div>
                    </div>
                    <div class="tab_cont_in4 tab_cont_box">
                        <div class="tab_in_con">
                            <div class="admission03">
                                <h3 class="title">전형과정 및 방법</h3>
                                <span><img class="lazy" data-src="/images/2017/contents/admission03.jpg" alt="" src="/images/2017/contents/admission03.jpg"></span>
                                <h3 class="title mt20">잠재 능력 검사</h3>
                                <div class="txtbox" style="">
                                    <span class="title">잠재능력검사란?</span>
                                    <p>
                                        학생 선발기준을 획일화된 성적보다는 학생 개개인의 창의력, 잠재능력 등을 최우선으로 적용하기 위한 검사입니다. 계열별로 검사안이 준비되어 있으며,
                                        본인이 생각하는 다양한 아이디어를 자유롭게 기술하는 방식입니다.
                                    </p>
                                </div>

                                <h3 class="title mt20">전형방법</h3>
                                <p>계열관련 잠재 능력 검사(40%) + 면접시험(60%)</p>
                                <ul>
                                    <li>
                                        <div class="inner">
                                            <span class="num">01</span>
                                            <p>
                                                포트폴리오나 습작집 <br>지참 시 가산점 부여
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="inner">
                                            <span class="num">02</span>
                                            <p>
                                                자격증 취득자의 경우 <br>가산점 부여
                                            </p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="inner">
                                            <span class="num">03</span>
                                            <p>
                                                공모전 당선자 가산점 부여<br>
                                                - 관련 서류를 면접 시 <br>제출해야 함
                                            </p>
                                        </div>
                                    </li>
                                </ul>

                                <h3 class="title mt20">자격증 점수 산정기준</h3>
                                <p>※ 이 외의 자격증에 대해서는 자격증 난이도에 따라 부여</p>
                                <table summary="" class="contentsTable">
                                    <caption>프로그램별 주요내용</caption>
                                    <colgroup>
                                        <col width="75%">
                                        <col width="25%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>자격증</th>
                                            <th>가산점</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="txtLeft">정보처리기사, 정보보안기사, CISA, CISSP, CEH, CCNA</td>
                                            <td>10점</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">공모전 당선자</td>
                                            <td>10점</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">정보처리 산업기사, 정보보안 산업기사, 컴퓨터운용사, 네트워크 관리사, 컴퓨터 활용능력 1급</td>
                                            <td>7점</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">컴퓨터 활용능력 2급, 리눅스 마스터 1급</td>
                                            <td>5점</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">워드, MOS</td>
                                            <td>3점</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab_cont_in5 tab_cont_box">
                        <div class="tab_in_con">
                            <div class="admission04">
                                <div class="txtbox">
                                    <span class="title">외국인 및 유학생</span>
                                    <p>
                                        해당 국가의 교육관계법령 등에 의거 소정의 학력이 인정되어야 하며, 해당 국가의 국가기관에 의해 학력인정확인이 가능한 학교이어야 함
                                    </p>
                                </div>
                                <table summary=" " class="contentsTable mt20">
                                    <caption>프로그램별 주요내용</caption>
                                    <colgroup>
                                        <col width="52%">
                                        <col width="16%">
                                        <col width="16%">
                                        <col width="16%">
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
                                            <td class="txtLeft">출입국사실증명서 / 외국인등록증 (또는 국내거소사실 증명서)</td>
                                            <td>○</td>
                                            <td>○</td>
                                            <td>○</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">고등학교 졸업증명서 1부</td>
                                            <td>○</td>
                                            <td>X</td>
                                            <td>○</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">초, 중, 고등학교 전과정<br>성적증명서 각 1부</td>
                                            <td>○</td>
                                            <td>X</td>
                                            <td>○</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">학사과정 졸업증명서, 성적증명서 각 1부</td>
                                            <td>X</td>
                                            <td>○</td>
                                            <td>X</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">학사과정 재적 또는 제적증명서, 성적증명서 각 1부</td>
                                            <td>○</td>
                                            <td>X</td>
                                            <td>○</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">고등학교 학력인정확이서 또는 아포스티유 확인서</td>
                                            <td>○</td>
                                            <td>X</td>
                                            <td>○</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">대학 학력인정확인서 또는 아포스티유 확인서</td>
                                            <td>X</td>
                                            <td>○</td>
                                            <td>○</td>
                                        </tr>
                                        <tr>
                                            <td class="txtLeft">원어민 경우 한글번역공증 각 1부</td>
                                            <td>○</td>
                                            <td>○</td>
                                            <td>○</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer (하단) -->
            <!--#include Virtual= "/inc/2018/inc_body_footer.inc"-->
        </section>
    </div>
</div> <!-- page END-->

<script>
    fbq('track', 'ViewContent');
</script>



<!--푸터부분 인클루드-->
<!-- include virtual="/inc/inc_web_log_script_utf8.inc" -->


<script type='text/javascript' src='/js/2018/main.js'></script>

</body>

</html>
