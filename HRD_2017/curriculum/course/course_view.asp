	    <div class="contentTitle">
                <h2>STUDY INFORMATION</h2>
            </div>
            <div class="infoBox">
                <div class="firstWrap clearfix">
                    <div class="courseInfo">

                        <h4 class="titleText">과정소개</h4>
                        <div class="Box">
                            <p>
                            	<span class="head">개강일</span>
                                <span class="date">
								<%=arrCourse(0).item("edusdate")%> (<%=WeekDayName(weekday(arrCourse(0).item("edusdate")),true)%>)
                                </span>
                            </p>
                            <p>
                            	<span class="head">교육기간</span>




                                <span class="period">
								<%= Formatnumber(DateDiff("W",arrCourse(0).item("edusdate"),arrCourse(0).item("eduedate")) / 4,0)%> 개월 (<%=arrCourse(0).item("weeks")%> 1일 <%= arrCourse(0).item("diffHour") %>시간 / <%=arrCourse(0).item("eduhours")%>시간)
                                </span>
                                <br>
                                <span style="color: #acacac; font-size:7pt; margin-left:180px;"> *점심시간 포함</span>




                            </p>




                            <p><span class="head">수강료</span><span class="tuition">
                            <%=Mid(FormatCurrency(arrCourse(0).item("edupay"),0), 2)%>원(자비부담금 : <%=Mid(FormatCurrency(arrCourse(0).item("selfpay"),0), 2)%>원)</span>
                            <% IF arrCourse(0).item("clscata") = "2" Or  arrCourse(0).item("clscata") = "1" Or  arrCourse(0).item("clscata") = "4" Or  arrCourse(0).item("clscata") = "6" Then %>

							<br/>

                             <%
									if request("crcd")<>"257" then
							%>

                            <!--<span class="small">&gt; 훈련비(1인당 최대 300만원)지원 + 훈련 장려금 최대-->

                            <% else %>

                            		<!--<span class="small">&gt; 훈련비(1인당 최대 약 400만원)지원 + 훈련 장려금 최대  -->

                            <% end if %>

                             <% if request("crcd")="248" then %>

                             <!--**-->

                             <% else %>

                             <!--11만 6천원 지원-->

                             <% end if %>

                             </span></p>
                            <%ElseIF arrCourse(0).item("clscata") = "3" Then %>
                            <br/><span class="small">&gt; 정규직(우선지원대상기업기준) & 비정규직 모두 100% 지원 / 0원 부담</span></p>
                            <%Else%>


                            <% if request("crcd")<>"251" then %>
                            <br/><span class="small">&gt; 훈련비 100% 국비지원

    	                         <% if request("crcd")="248" then %>

                                 교통비 + 중식 제공

                                 <% else %>

                                 <!-- 최대 31만 6천원 지원 -->
                                 
	                             <% end if %>
                             <% end if %>

                             </span></p>
                            <%End If%>
                            <p><span class="head">정원</span><span class="limit"><%=arrCourse(0).item("appcnt")%> 명</span></p>
                            <p><span class="head">훈련시간</span><span class="time"><%=Left(arrCourse(0).item("edustime"), 2) & ":" & Right(arrCourse(0).item("edustime"), 2)%> ~ <%=Left(arrCourse(0).item("eduetime"), 2) & ":" & Right(arrCourse(0).item("eduetime"), 2)%></span></p>
                        </div>
                    </div>


                    <div class="target">
                        <%=arrCourse(0).item("targetText")%>
                    </div>
                </div>
                <div class="btns1 clearfix">
                    <p>

                    <%

					if request("crcd") = "248" then

                    %>

					과정문의 02-597-3450

                     <% elseif request("crcd") = "251" then %>
                    과정문의 02-578-9975
                    <% else %>

					<%=arrCourse(0).item("sname")%>캠퍼스 전화상담 <%=arrCourse(0).item("tel")%>

                    <% end if %>

                    </p>
                    <div class="online">
                    <p><a href="/entrance/online.asp?crcd=<%=crcd%>&scode=<%=arrCourse(0).item("scode")%>&clscata=<%=arrCourse(0).item("clscata")%>">온라인 접수</a></p>
                    <p><a href="/entrance/online-counseling-write.asp">온라인 상담</a></p>
                    </div>
                </div>
                <div class="contentWrap">
                    <h3><%=arrCourse(0).item("infotitle")%></h3>
                    <div class="clearfix contentTitle">
                        <div class="imgwrap">
                            <img class="lazy" data-src="/upload/course_img/<%=arrCourse(0).item("scifile")%>" alt="">
                        </div>
                        <div class="textwrap">
                           <%=arrCourse(0).item("infotext")%>
                        </div>
                    </div>
					<%=arrCourse(0).item("etctext")%>
                    <%=arrCourse(0).item("curritext")%>
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
                    <%
						sql = "exec HRD_프로젝트_L @crcd =" & crcd & ", @pageNumber ='1',  @RowPerPage='6', @site='HRD'"
						arrProject = arrHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
						IF isArray(arrProject) Then
					%>
                    <h2 class="conTitle" >수료생 프로젝트</h2>
                    	<div class="gallery-wrap clearfix" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
                    <%
							for i = 0 To UBound(arrProject)
					%>

						<a href="<%=arrProject(i).item("link")%>?page=<%=cpage%>&spcd=<%=arrProject(i).item("spcd")%>&cpcd=<%=arrProject(i).item("cpcd")%>">
                            <div class="gallery">
                                <div class="imgBox">
                                    <div class="bg">
                                        <!--<img src="images/project/show-bg.png" alt="">-->
                                    </div>
                                    <div class="gallery-img lazy" data-src="/upload/portfolio/thumb/<%=arrProject(i).item("spthumb")%>"
                                    style="background-repeat:no-repeat; background-position:center;background-size:cover;">
                                        <!--<img src="images/project/uniqlo-thum.jpg" alt="">-->
                                    </div>
                                </div>
                                <p class="title-text"><%=arrProject(i).item("crtitle")%></p>
                                <p class="date"><%=arrProject(i).item("tbname")%></p>
                            </div>
                        </a>
                    <%
						NEXT
					%>
                    </div>
                 <% END IF %>

                    <%IF strComp(arrCourse(0).item("scode"), 1) = 0 Then%>
                    <img class="lazy" data-src="/images/2017/hankookit-yangae-181012-3.png" alt="인증훈련기관" class="certification" style="width:335px;">
                    <%ELSEIF strComp(arrCourse(0).item("scode"), 3) = 0 Then%>

                     <img class="lazy" data-src="/images/2017/hankookit-guro-181012-3.png" alt="인증훈련기관" class="certification" style="width:335px;">
                     <%Else%>
                     <img class="lazy" data-src="/images/2017/hankookit-multi-181012-3.png" alt="인증훈련기관" class="certification" style="width:335px;">
                    <%End IF%>
                </div>
                <div class="btns2 clearfix">
                    <p>

                       <%

					if request("crcd") = "248" then

                    %>

					과정문의 02-597-3450

	                <% elseif request("crcd") = "251" then %>
                    과정문의 02-578-9975
                    <% else %>

					한국IT아카데미(<%=arrCourse(0).item("sname")%>) TEL.<%=arrCourse(0).item("tel")%>

                    <% end if %>



                    </p>
                    <div class="online">
                    <p><a href="/entrance/online.asp?crcd=<%=crcd%>&scode=<%=arrCourse(0).item("scode")%>&clscata=<%=arrCourse(0).item("clscata")%>">온라인 접수</a></p>
                    <p><a href="/entrance/online-counseling-write.asp">온라인 상담</a></p>
                    </div>
                </div>
            </div>
        </div>

    </section>
