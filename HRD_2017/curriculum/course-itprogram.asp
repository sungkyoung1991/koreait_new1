<!--#include virtual="/_include/Service_Inc.inc"-->
<!--#include virtual="/_include/2017/inc_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_sub_head.inc"-->
<%
Dim cate, subsel
cate = getQuery("cate")
subsel = getQuery("subsel")
IF cate = "" Then
	cate = 0
END IF

%>

             <div class="contentTitle">
                <h2>CLASS INFORMATION</h2>
            </div>
            <div class="infoBox">
                <div class="classMainImg">
                    <img class="lazy" data-src="./../images/2017/course/course-program-main.jpg" alt="정보보안전문가">
                </div>
                <div class="contentWrap">
                    <div class="courseTitleText">
                        <h2>Information Security</h2>
                        <h3>정보시스템보안엔지니어링 과정</h3>
                    </div>
                    <div class="courseInfoText">
                        <p>한국IT아카데미의 본 과정은 4차산업시대 유망직종중의 하나로서 <br/>
                        시스템, 네트워크, DB보안 등 정보보안 분야에 대한 교육이 진행되며 <br/>실무 중심의 수업으로 다양한 문제에 대응 가능한 전문적인 포트폴리오를 완성합니다.</p>
                    </div>
                    <div class="curriculumList">
                        <div class="curriculumLeftRow clearfix">
                            <div class="leftTextBox">
                                <h4>01<br/>보안이론</h4>
                                <p>"보안, 보안해킹,암호 및 보안관리에 대한<br>전반적인 이론을 학습하여 수업의 기초개념을 습득 "</p>
                            </div>
                            <div class="rightImgBox">
                                <img class="lazy" data-src="./../images/2017/course/course-itprogram-picture-img01.jpg" alt="프로그램 기획">
                            </div>
                        </div>

                        <div class="curriculumRightRow clearfix">
                            <div class="rightTextBox">
                                <h4>02<br/>보안위협 및 관리통제</h4>
                                <p>"다양한 해킹사례를 분석하고 보안시스템을 활용하여 <br>위협에 대한 대응방법을 습득   "</p>
                            </div>
                               <div class="leftImgBox">
                                <img class="lazy" data-src="./../images/2017/course/course-itprogram-picture-img02.jpg" alt="캐스팅">
                            </div>

                        </div>
                        <div class="curriculumLeftRow clearfix">
                            <div class="leftTextBox">
                                <h4>03<br/>물리적 보안</h4>
                                <p>"직원, 데이터, 시설, 설비, 시스템 등 조직의 자산에 대한<br> 물리적 보안의 개념을 이해하고 사무실의 보안을 구축"</p>
                            </div>
                            <div class="rightImgBox">
                                <img class="lazy" data-src="./../images/2017/course/course-itprogram-picture-img03.jpg" alt="제작계획">
                            </div>
                        </div>
                        <div class="curriculumRightRow clearfix">
                            <div class="rightTextBox">
                                <h4>04<br/>기술적 보안</h4>
                                <p>"서버 보안 및 응용프로그램, 데이터베이스 보안, 통신 보안 등 <br>기술적인 보안프로그램을 구축하고 활용하는 법을 습득"</p>
                            </div>
                               <div class="leftImgBox">
                                <img class="lazy" data-src="./../images/2017/course/course-itprogram-picture-img04.jpg" alt="방송 리허설">
                            </div>

                        </div>
                        <div class="curriculumLeftRow clearfix">
                            <div class="leftTextBox">
                                <h4>05<br/>인터넷 프로토콜</h4>
                                <p>"TCP/IP나 이외의 프로토콜 이론을 통해 개념을 이해하고 <br>와이어샤크를 활용한 네트워크 프로토콜 분석법을 습득"</p>
                            </div>
                            <div class="rightImgBox">
                                <img class="lazy" data-src="./../images/2017/course/course-itprogram-picture-img05.jpg" alt="프로그램 구성">
                            </div>
                        </div>

                        <div class="curriculumRightRow clearfix">
                           <div class="rightTextBox">
                                <h4>06<br/>네트워크 구축</h4>
                                <p>"네트워크 통신 및 프로세스 관련 기본 용어를 익히고 <br>신기술을 통해 네트워크를 구축하는 방법을 습득"</p>
                            </div>
                            <div class="leftImgBox">
                                <img class="lazy" data-src="./../images/2017/course/course-itprogram-picture-img06.jpg" alt="자료조사">
                            </div>
                        </div>

                    </div>

                    <h2 class="conTitle">수료 후 취업분야</h2>
                        <ul class="jobList clearfix">
                            <li>보안관제</li>
                            <li>서버관리자</li>
                            <li>네트워크엔지니어링</li>
                            <li>기업전산실</li>
                            <li>보안컨설팅업체</li>
                            <li>사이버수사관</li>
                            <li>화이트해커</li>
                            <li>모의해킹전문가</li>
                        </ul>
                        <h2 class="conTitle">훈련 성취도 관리(평가관리)</h2>
                        <ul class="appraisal">
                            <li>평가계획<span>- 평가방법결정 / 평가기준설정 / 평가일정수립</span></li>
                            <li>평가진행<span>- 교과목별(능력단위) 필기·실기평가</span></li>
                            <li>평가결과<span>- 평가결과분석(성취도평가)/훈련목표미달성자 보충(보강)</span></li>
                        </ul>
                        <h2 class="conTitle">체계적인 취업프로그램 진행</h2>
                        <div class="clearfix progress">
                            <div>
                                <p class="head">오리엔테이션</p>
                                <div class="textWrap">
                                    <p>- 취업지원 시스템 안내 및 직업상담사 소개</p>
                                    <p>- 훈련분야 직무 근무조건, 산업체 현황 및 취업 통합안내</p>
                                </div>
                            </div>
                            <div>
                                <p class="head">취업 세미나</p>
                                <div class="textWrap">
                                    <p>- 정기(수시)로 이력서, 자기소개서, 경력기술서, 포트폴리오 작성 요령</p>
                                    <p>- 취업성공 사례를 기반으로 세미나 실시 </p>
                                </div>
                            </div>
                            <div>
                                <p class="head">취업 진로 설정</p>
                                <div class="textWrap">
                                    <p>- 본인의 역량을 진단하고, 구체적인 취업 목표 탐색</p>
                                </div>
                            </div>
                            <div>
                                <p class="head">취업지원 상담</p>
                                <div class="textWrap">
                                    <p>- 1:1 및 그룹 상담을 통한 취업 코칭 실시</p>
                                    <p>- 취업계획 분석을 통한 최적화된 솔루션 제공</p>
                                </div>
                            </div>
                            <div>
                                <p class="head">취업 클리닉</p>
                                <div class="textWrap">
                                    <p>- 이력서, 자기소개서, 경력기술서, 포트폴리오 클리닉</p>
                                    <p>- 실전 면접을 통한 면접 스킬 및 자신감 증대 코칭</p>
                                </div>
                            </div>
                            <div>
                                <p class="head">취업지원</p>
                                <div class="textWrap">
                                    <p>- 구인자의 직업정보 분석 및 구직자의 종합 역량 판단</p>
                                    <p>- 개인별 능력과 역량을 고려한 1:1 매칭 </p>
                                </div>
                            </div>
                        </div>
                        <img class="lazy" data-src="./../images/2017/hankookit-yangae-181012-2.png" alt="우수훈련기관 3년인증 한국IT양재캠퍼스" class="certification">
                </div>
                <div class="btns2 clearfix">
                    <p>한국IT아카데미&#40;양재&#41; TEL.02.597.5731</p>
                    <p><a href="/entrance/online-counseling-write.asp">온라인 상담</a></p>
                </div>
            </div>
        </div>

    </section>





<!-- footer -->
<!--#include virtual="/_include/2017/inc_footer.inc"-->
<!-- side-bar -->
<!--#include virtual="/_include/2017/inc_side_menu.inc"-->

<!-- Web Log Writer -->
<!-- #include virtual="/_include/inc_LogWriter.inc" -->
</body>

</html>
