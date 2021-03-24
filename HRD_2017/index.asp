<!--#include virtual="/_include/Service_Inc.inc"-->
<%
Dim file_root, img_thum

Dim isMobile : isMobile = CheckMobileToBool()
%>
        <!--#include virtual="/_include/2017/inc_head.inc"-->
        <!--#include virtual="/_include/2017/inc_body_head.inc"-->
        <div id="container">
            <div class="">
                <div id="slickmainid" class="slickmain" style="margin-bottom: 0;">
                    <a href="#">
                        <img src="<%IF isMobile Then %>/images/2020/tablet-banner_97.jpg<%Else%>/images/2020/pc-banner_97.jpg<%END IF%>" usemap="#map04" style="width:100%;max-width:100%;height:auto;" alt="정보보안과정"/>
                    </a>
                    <a href="#">
                        <img src="<%IF isMobile Then %>/images/2020/tablet-banner_96.jpg<%Else%>/images/2020/pc-banner_96.jpg<%END IF%>" usemap="#map05" style="width:100%;max-width:100%;height:auto;" alt="방송영상과정"/>
                    </a>
                    <a href="http://job.ac.kr/community/notice-view.asp?page=1&scode=3&sncd=243">
                    	<img class="lazy" src="<%IF isMobile Then %>/images/2020/tablet-banner_95.jpg<%Else%>/images/2020/pc-banner_95.jpg<%END IF%>" style="width:100%;max-width:100%;height:auto;" alt="우수훈련기관 5년인증"/>
                    </a>
                    <a href="http://job.ac.kr/event/event_view.asp?idx=25&page=1">
                    	<img class="lazy" src="<%IF isMobile Then %>/images/2020/tablet-banner_89.jpg<%Else%>/images/2020/pc-banner_89.jpg<%END IF%>" style="width:100%;max-width:100%;height:auto;" alt="2020달라지는 국민내일배움카드"/>
                    </a>
                    <a href="http://job.ac.kr/community/notice-view.asp?page=1&scode=3&sncd=136">
                    	<img class="lazy" src="<%IF isMobile Then %>/images/2018/tablet-banner_74.png<%Else%>/images/2018/pc-banner_74.png<%END IF%>" style="width:100%;max-width:100%;height:auto;" alt="훈련이수자평가연속A등급획득"/>
                    </a>
                    <!--
                    <a href="http://job.ac.kr/intro/hankookitacademy-history.asp">
                    	<img class="lazy" src="<%IF isMobile Then %>/images/2019/tablet-banner_79.jpg<%Else%>/images/2019/pc-banner_79.jpg<%END IF%>" style="width:100%;max-width:100%;height:auto;" alt="고용노동부인증IT교육전문기관" />
                    </a>-->
                    <!-- <a href="http://job.ac.kr/curriculum/course-picture.asp?crcd=0">
                    	<img class="lazy" src="<%IF isMobile Then %>/images/2019/tablet-banner_76.jpg<%Else%>/images/2019/pc-banner_76.jpg<%END IF%>" usemap="#map02" style="width:100%;max-width:100%;height:auto;" alt="영상콘텐츠,방송콘텐츠"/>
                    </a> -->
                 </div>
            </div>
           
            <%IF isMobile Then %>
            	<!-- 모바일 Imag Map -->
                     <map name="map04" id="map04"><area shape="rect" coords="60,334,269,442" href="http://job.ac.kr/curriculum/course-view.asp?crcd=304" style="max-width:100%;height:auto;" alt=""><area shape="rect" coords="278,338,486,441" href="http://job.ac.kr/curriculum/course-view.asp?crcd=302" alt=""></map>
                     <map name="map05" id="map05"><area shape="rect" coords="52,277,282,401" href="http://job.ac.kr/curriculum/course-view.asp?crcd=329" style="max-width:100%;height:auto;" alt=""><area shape="rect" coords="290,281,534,405" href="http://job.ac.kr/curriculum/course-view.asp?crcd=323" alt=""></map>
                     <map name="map03" id="map03"><area shape="rect" coords="131,315,505,479" href="http://job.ac.kr/curriculum/course-view.asp?crcd=304" style="max-width:100%;height:auto;" alt=""><area shape="rect" coords="528,341,897,463" href="http://job.ac.kr/curriculum/course-view.asp?crcd=302" alt=""></map>
             	<!-- 모바일 Imag Map END  -->
            <%Else%>
            	<!-- 웹 Imag Map -->
                    <map name="map04" id="map04"><area shape="rect" coords="357,337,694,428" href="http://job.ac.kr/curriculum/course-view.asp?crcd=304" style="max-width:100%;height:auto;" alt=""><area shape="rect" coords="701,334,1046,426" href="http://job.ac.kr/curriculum/course-view.asp?crcd=302" alt=""></map>
                    <map name="map05" id="map05"><area shape="rect" coords="390,294,664,436" href="http://job.ac.kr/curriculum/course-view.asp?crcd=329" style="max-width:100%;height:auto;" alt=""><area shape="rect" coords="675,296,947,429" href="http://job.ac.kr/curriculum/course-view.asp?crcd=323" alt=""></map>
                    <map name="map03" id="map03"><area shape="rect" coords="572,306,953,446" href="http://job.ac.kr/curriculum/course-view.asp?crcd=304" style="max-width:100%;height:auto;" alt=""><area shape="rect" coords="987,315,1378,445" href="http://job.ac.kr/curriculum/course-view.asp?crcd=304" alt=""></map>
             	<!-- 웹 Imag Map END  -->
            <%END IF%>

            <div class="quick-menu">
                <div class="container con-center clearfix">
					<a href='/entrance/online-counselling.asp'>
                    	<span class="icon"></span>
                        <span>온라인상담</span>
                    </a>
					<a href='/entrance/online.asp'>
                        <span class="icon"></span>
                        <span>온라인신청</span>
                    </a>
					<a href='/intro/hankookitacademy-teacher.asp'>
                        <span class="icon"></span>
                        <span>교수소개</span>
                    </a>
					<a href='/community/complete-interview.asp'>
                        <span class="icon"></span>
                        <span>수강후기</span>
                    </a>
					<a href='/project/project-game.asp'>
                        <span class="icon"></span>
                        <span>프로젝트</span>
                    </a>
					<a href='/intro/hankookitacademy-dasan.asp'>
                        <span class="icon"></span>
                        <span>취업지원</span>
                    </a>
					<a href='/community/pressView.asp'>
                        <span class="icon"></span>
                        <span>언론보도</span>
                    </a>
                </div>
            </div>

            <!--190605과정슬라이드 업데이트-->
            <script>
				$(document).ready(function(){ 
					//공지사항 탭 효과
					noticetab();	
					function noticetab(){
						$(".noticetabbtnGroup li").click(function(e){
							var i=$(this).index();
							$(".noticeTabGroup ul").eq(i).addClass("active").siblings().removeClass("active")
							$(".noticetabbtnGroup li").eq(i).addClass("activeBtn").siblings().removeClass("activeBtn")
						})
					}
					//방문상담예약하기부분의 미니배너 플립효과 타이머
					setInterval(onCount,5000);
					var i=1;
					function onCount(){
						$(".minibannerGroup a").eq(i).addClass("flip").siblings().removeClass("flip");
						i++;if(i==3) i=0;//if(i==3){i=0;}이렇게 해도 되고 
					}
					//slick();	
						$('.slickmain').slick({
						autoplay : true,
						speed : 400 /*이미지가 슬라이딩시 걸리는 시간*/,
						dots: true,
						infinite: true,
						autoplaySpeed: 3000 /*이미지가 다른 이미지로 넘어 갈때의 텀*/,
						arrows: false,
						slidesToShow: 1,
						slidesToScroll: 1,
						fade: false,
						responsive:[
										{breakpoint:960,settings:{arrows:false}}
						]
							
						});
						$('.tagContentGroup').slick({
							autoplay: true,
							dots: true,/*인디버튼*/
							speed: 200 /*이미지가 슬라이딩시 걸리는 시간*/ ,
							infinite: true,
							autoplaySpeed: 3000 /*이미지가 다른 이미지로 넘어 갈때의 텀*/ ,
							/*arrows: true,*/
							slidesToShow: 4, /*슬라이드 보이는 개수*/
							slidesToScroll: 4,/*슬라이드 넘어가는 개수*/
							fade: false,
							pauseOnHover:true, /*마우스 호버시 슬라이드 이동 멈춤*/
							arrows: false,/*좌우화살버튼 노출*/
							touchMove: false,
							responsive: [
											{ /* 반응형웹*/
											breakpoint: 960, /*기준화면사이즈 */
											settings: {slidesToShow:3,slidesToScroll: 3} /*사이즈에 적용될 설정 */
											},
											{ /* 반응형웹*/
											breakpoint: 800, /*기준화면사이즈 */
                 							settings: {slidesToShow:2,slidesToScroll: 2 } /*사이즈에 적용될 설정 */
											},	
											{ /* 반응형웹*/
											breakpoint: 380, /*기준화면사이즈 */
                 							settings: {slidesToShow:2,slidesToScroll: 2 } /*사이즈에 적용될 설정 */
											}
        								]
						});

					$(".tagGroup li").click(function(e) {
						var filter = $(this).attr("class");				
						$('.tagContentGroup').slick('slickUnfilter');
						$(".tagContentGroup").slick("slickFilter","."+filter).slick("refresh");
					});
				});
			</script>
           
          	<div class="coursebannerWrap">
          		<div class="container con-center clearfix">
           			<h3>- special Course - </h3>
           			<div class="coursebannertagGroup">
           				<ul class="tagGroup">                         
                            <li class="tagall">#모두보기</li>
           					<li class="tagfree">#국비지원</li>
                            <li class="java">#자바JAVA프로그래머</li> 
                            <li class="rpa"> #RPA 취업약정과정</li>
<!--           					<li class="tagcerti">#과정평가형</li>-->
           					<!--<li class="tagcard">#실업자내일배움카드과정</li>-->
           					<li class="tagbroad">#방송영상</li>
           				<!--	<li class="tagdesign">#디자인</li>-->
           					<li class="tagschool">#일반고위탁</li>
           					<!--<li class="tagweb">#디자인</li>-->
           					<!--<li class="tagvr">#혁신성장청년인재양성</li>-->
           					<!--<li class="tagweb">#웹디자인</li>-->
           					<!--<li class="taggame">#게임제작</li>   -->   
           					<li class="tagsecurity">#정보보안</li>      
           				</ul>
           			</div>
           			<div class="tagContentGroup slick-items"> 						 
                         
<%
Dim gubun, bannerTag, tabName
'if strComp(gubun,"모두보기")=0 then

Function getCourseLis5
	Dim aryHashMap 
 	Set aryHashMap = New RsToHashMap
' 	sql ="[dbo].[HRD_훈련과정_L] @mode='mBanner', @scode = '', @pageNumber='1', @RowPerPage='5' "
 	sql ="[dbo].[HRD_메뉴관리_L] @site='HRD', @position = 'banner', @gubun='SubCourse' "
	getCourseLis5 = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
END Function

Dim aryCoursep : aryCoursep = getCourseLis5()
                        If Not IsArray(aryCoursep) Then
                                response.write "<li><span class=""class-name"">현재 모집중인 과정이 없습니다.</span></li>" & vbcrlf
                        Else
                            For i = 0 To UBound(aryCoursep)
							
							
			Dim chkClscd,chkDivcd,arr,chkCrcd
			arr = Array("시각디자인","포토샵","일러스트")					
			chkClscd = cstr(aryCoursep(i).item("clscd"))
			chkDivcd = cstr(aryCoursep(i).item("divcd"))
			chkCrcd = cstr(aryCoursep(i).item("crcd"))				

			if chkClscd="12" and (chkDivcd="1" or chkDivcd="3" or chkDivcd="4" or chkDivcd="7" or chkDivcd="13" or chkDivcd="2") then '국비지원
              	bannerTag = bannerTag & " tagfree "
				
			end if
			
			if (chkClscd="20" and chkDivcd="12") then '과정평가형  
               	bannerTag = bannerTag & " tagcerti "
			
			end if
            
			if (chkClscd="22" and chkDivcd="13") then '혁신성장청년인재양성  
              	bannerTag = bannerTag & " tagvr "
			
			end if
            
			if (chkClscd="4" and chkDivcd="9") then '일반고위탁과정  
              	bannerTag = bannerTag & " tagschool "
			
			end if
	         
			if ((chkClscd="12" or chkClscd="2") and chkDivcd="3") then '방송영상  
              	bannerTag = bannerTag & " tagbroad "
			
			end if
            
			if ((chkClscd="12" or chkClscd="20") and chkDivcd="4") then '웹디자인  
            	bannerTag = bannerTag & " tagweb "
					
		  	end if
			
            if (chkClscd="12" and chkDivcd="1") then '게임제작  
              	bannerTag = bannerTag & " taggame "
			
			end if
			 
			if (chkClscd="12" and chkDivcd="2") then '정보보안  
              	bannerTag = bannerTag & " tagsecurity "
			
			end if
             
			if ((chkClscd="2" or chkClscd="3")) then '내일배움카드과정 
             	bannerTag = bannerTag & " tagcard "
			
			end if
			
			if (chkCrcd="302") then '자바 
             	bannerTag = bannerTag & " java "
			
			end if
			
			if (chkCrcd="314") then 'rpa 
             	bannerTag = bannerTag & " rpa "
			
			end if
			
			
			
			
			    
				
			For j = 0 To UBound(arr)
				if instr(cstr(trim(aryCoursep(i).item("crtitle"))),arr(j))<>0 then '웹디자인
					bannerTag = bannerTag & " tagdesign "			
				end if
			NEXT
                		
			select case chkClscd
			case "20"
				tabName="과정평가형"
			case "12"
				tabName="국가기간"
			case "19"
				tabName="상태"
			case "2"
				tabName="내일배움카드"
			case "5"
				tabName="일반"
			case "4"
				tabName="일반고특화"
			case "3"
				tabName="재직자"
			case "22"
				tabName="청년인재과정"
			end select
					
			%>
             <div class="slickimg tagall <%=bannerTag%> ">
                             <a href="/curriculum/course-view.asp?crcd=<%=aryCoursep(i).item("crcd")%>"> 						 		
                                <div class="slicktxt"> 
									<div><%=tabName%></div>           
  	                                <div>
										<% if strComp(trim(cstr(aryCoursep(i).item("scode"))),"1")=0 then %>
                                            한국IT직업전문학교 양재
                                        <%else%>
                                          한국IT아카데미 구로
                                        <%end if%>                                    
                                    </div>
                                    <div><%=aryCoursep(i).item("crtitle")%></div>
                                    <div><%=aryCoursep(i).item("edusdate")%>개강</div>
                                </div>                                
        
                                <img src="upload/course/<%=aryCoursep(i).item("img")%>" alt="">
							</a>
              </div>  
                  <%
								bannerTag=""
								tabName=""
				
                            NEXT
							
                        END IF 
               '       END IF 
            
					%>        
                    </div>
           		</div>
           </div>
           
           	
           
           <div class="mainNoticeWrap">
            	<div class="noticeGroup container con-center clearfix">
            		<article class="noticeArticle1">
            			<h3 style="display: none;">방문상담 및 공지사항</h3>
            			<div class="minibannerGroup">
            				<a href="http://job.ac.kr/curriculum/course-professionalEdu-newpage.asp" class="flip"><img src="/images/2019/mainnew/mainnotice-changeimg02.png" alt="과정소개"/></a>
            				<a href="http://job.ac.kr/training/vocationaltraining-NCS.asp"><img src="/images/2019/mainnew/mainnotice-changeimg01.png" alt="직업훈련"/></a>
            				<a href="http://job.ac.kr/intro/hankookitacademy-jobprocess.asp"><img src="/images/2019/mainnew/mainnotice-changeimg03.png" alt="취업지원센터"/></a>
            			</div>
            			<div class="noticeReservation button-4">
    						<div class="eff-4"></div>
    						<a href="http://job.ac.kr/request-counseling/newpage.asp">방문상담 예약하기<img src="/images/2019/mainnew/mainnotice-arrow.png" alt="" style="width:26px; height:26px;"/></a>
  						</div>
            		</article>
            		<article class="noticeArticle2">
            			<h3>공지사항<span>_Notice</span></h3>
            			<ul class="noticetabbtnGroup">
            				<li class="activeBtn">양재공지</li>
            				<li class="">구로공지</li>
            			</ul>
            		            			<div class="noticeTabGroup">
            				<ul id="noticetab1" class="noticeTabYanggae active">
								         <%
Function getNoticeLis()
	Dim aryHashMap 
	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_공지사항_L] @mode='list' , @scode='1', @pageNumber='1', @RowPerPage = '4' "
	getNoticeLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)	
END Function 
' 공지사항 
Dim aryNoticeList
aryNoticeList = getNoticeLis()
					 	If NOT isArray(aryNoticeList) Then 
							response.write "<li>등록된 공지사항이 없습니다.</li>" & vbcrlf
						Else 
							For i = 0 To UBound(aryNoticeList)
					%>
                                <li>
                                    <a href="/community/notice-view.asp?cpage=1&scode=<%=aryNoticeList(i).item("scode")%>&sncd=<%=aryNoticeList(i).item("sncd")%>">
                                      
                                      <%if strComp(aryNoticeList(i).item("snishot"),"Y")=0 then%>
	                                      <span style="color:#ec559a;">[필독]</span>
                                      <%end if%>
                                      
									 <span title="<%=aryNoticeList(i).item("sntitle")%>"><%=aryNoticeList(i).item("sntitle")%></span>
                                      
                                      
                                    </a>
                                </li>
                                <%
							Next
						End IF
                    %>
            				</ul>
            				<ul id="noticetab2" class="noticeTabGuro">
<%
Function getNoticeLis2()
	Dim aryHashMap 
	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_공지사항_L] @mode='list' , @scode='3', @pageNumber='1', @RowPerPage = '4' "
	getNoticeLis2 = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)	
END Function 
' 공지사항 
Dim aryNoticeList2
aryNoticeList2 = getNoticeLis2()
					 	If NOT isArray(aryNoticeList2) Then 
							response.write "<li>등록된 공지사항이 없습니다.</li>" & vbcrlf
						Else 
							For i = 0 To UBound(aryNoticeList2)
					%>
                                <li>
                                    <a href="/community/notice-view.asp?cpage=1&scode=<%=aryNoticeList2(i).item("scode")%>&sncd=<%=aryNoticeList2(i).item("sncd")%>">
                                    
                                    <%if strComp(aryNoticeList(i).item("snishot"),"Y")=0 then%>
	                                      <span style="color:#ec559a;">[필독]</span>
                                      <%end if%>
                                      
                                        <%=aryNoticeList2(i).item("sntitle")%>
                                    </a>
                                </li>
                                <%
							Next
						End IF
                    %>
            				</ul>
            			</div>
            		</article>
            		<article class="noticeArticle3">
            			<h3 style="display: none;">위치소개</h3>
            			<div class="articleYangjae">
            				<h4 style="color:#ef559a;">양재캠퍼스 위치</h4>
            				<div class="noticeArticleQ noticeArticleQ1" style="font-family: serif;">02.597.5731</div>
            				<div class="noticeArticleImg noticeArticleImg1"><a href="http://job.ac.kr/campusinfo/campusinfo-yangjae.asp"></a></div>
            			</div>
            			<div class="articleGuro">
            				<h4 style="color:#197bed;">구로캠퍼스 위치</h4>
            				<div class="noticeArticleQ noticeArticleQ2" style="font-family: serif;">02.597.5156</div>
            				<div class="noticeArticleImg noticeArticleImg2"><a href="http://job.ac.kr/campusinfo/campusinfo-guro.asp"></a></div>
            			</div>
            		</article>
           		 </div>
            </div>
            
            <!--메인페이지 새로운 부분 끝-->
            <div class="secondWrap">
                <div class="class-start container con-center clearfix">
                    <div class="jobSystem lazy" data-src="/images/2018/secondwrap/secondwrap-img1.jpg">
                        <a href="http://job.ac.kr/intro/hankookitacademy-jobprocess.asp">
                            <h3>한국IT만의 취업지원시스템</h3>
                            <p style="font-size:14px;">100%취업을 위한 한국IT의 노력</p>
                            <p style="font-size:14px; margin-top:85px;">더알아보기></p>
                        </a>
                    </div>
                    <div class="jobPass">
                        <ul>
                            <%
Function getJobSuccessLis
	Dim aryHashMap 
	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[TBL_SiteJobSuccess_L] @gubun = 'W', @admincd='0', @scode='', "
	sql = sql & " @idx='0',@isView='Y', @pageNumber='1', @RowPerPage='7' "
	getJobSuccessLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
END Function 
Dim aryJobSuccess : aryJobSuccess = getJobSuccessLis()
					   		If isArray(aryJobSuccess) Then
								For i = 0 To UBound(aryJobSuccess)
					   %>
                                <li>
                                    <%IF strComp(aryJobSuccess(i).item("isView"),"Y") = 0 Then %>
                                         <a href="/job-success/job_success.asp?page=1&idx=<%=aryJobSuccess(i).item("idx")%>" style="width:85%; display: inline-block;">
                                                <%=aryJobSuccess(i).item("tecompany")%>취업을 축하드립니다</a>
                                        <%END IF%>
                                         <img class="lazy" data-src="/images/2018/secondwrap/secondwrap-icon-new.gif" alt="newicon"  src="/images/2018/secondwrap/secondwrap-icon-new.gif">       
                                </li>

                                <%
                          	Next
                          END IF
                     %>
                        </ul>

                    </div>
                    <div class="jobInterview lazy" data-src="/images/2018/secondwrap/secondwrap-img2.jpg">
                        <h3>취업수료생 인터뷰</h3>
                        <ul class="secondslide">
                            <%
Function getJobInterviewLis
	Dim aryHashMap 
 	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_수료생_인터뷰_L] @mode='list' , @gubun='J', @pageNumber='1', @RowPerPage = '3'"
	getJobInterviewLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
END Function 
Dim aryJobInterview : aryJobInterview = getJobInterviewLis()
Dim JobContents
		
						
                                IF isArray(aryJobInterview) Then 
                                    for i = 0 To UBound(aryJobInterview)
										JobContents = replace(aryJobInterview(i).item("summary"),"A.","<br>A. ")
                                        IF JobContents <> "" Then 
                            %>
                                <li>
                                    <a href="/community/student-interview.asp?cpage=1&take_idx=<%=aryJobInterview(i).item("take_idx")%>">
                                        <p class="interTitle">
                                            <%=aryJobInterview(i).item("crtitle")%>
                                        </p>
                                        <div class="interCon">
                                            <%=JobContents%>
                                        </div>
                                    </a>
                                </li>
                                <%
                                        END IF
                                    NEXT
                                END IF
                             %>
                        </ul>
                        <div class="main_slider_controller">
                            <div class="main_slider_controls">
                                <div class="bx-controls-auto">
                                    <div class="bx-controls-auto-item"><a class="bx-start" href="">Start</a></div>
                                </div>
                            </div>
                            <div class="main_slider_pagers">
                                <div class="bx-pager bx-default-pager">
                                    <div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div>
                                    <div class="bx-pager-item"><a href="" data-slide-index="1" class="bx-pager-link">2</a></div>
                                    <div class="bx-pager-item"><a href="" data-slide-index="2" class="bx-pager-link">3</a></div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div class="middle-wrap">
                <div class="middlecontent container con-center clearfix">
                    <div class="cardnews-box slide_box">
                        <h3 class="box-title">
                            카드뉴스
                            <span>card news</span>
                        </h3>
                        <ul class="cardnews-slide slide_bx">
                            <%
Function getCardNewsLis()
	Dim aryHashMap 
	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_카드뉴스_L] @mode='list', @idx = '', @pageNumber='1',  @RowPerPage = '3'"
	getCardNewsLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
END Function 

'카드 뉴스
Dim aryCardNews : aryCardNews = getCardNewsLis()
                            If IsArray(aryCardNews) Then
                                For i = 0 To UBound(aryCardNews)
							%>
                                <li style='background:#fff url(<%=aryCardNews(i).item("src")%>) no-repeat;'>
                                    <a href="<%=aryCardNews(i).item("link")%>">
                                       <img class="lazy" data-src="<%=aryCardNews(i).item("src")%>" alt="카드뉴스이미지" src="/images/srcimg.png">
                                    </a>
                                </li>
                                <%
                                Next
                            End If
                            %>
                        </ul>
                    </div>

                    <div class="event-box slide_box">
                        <h3 class="box-title">
                            이벤트
                            <span>event</span>
                        </h3>
                        <ul class="event-slide slide_bx">
<%							
Function getEventLis()
	Dim aryHashMap 
 	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_이벤트_L] @mode='main', @idx = '', @pageNumber='1',  @RowPerPage = '5'"
	getEventLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
END Function 

'이벤트 
Dim aryEvent
aryEvent = getEventLis()
						IF isArray(aryEvent) Then 
							For i = 0 To UBound(aryEvent)
					%>
                                <li>
                                    <a href="event/event_view.asp?idx=<%=aryEvent(i).item("take_idx")%>&page=1">
                        		<img class="lazy" data-src="/upload/event_thum/<%=aryEvent(i).item("sethum")%>" src="/upload/event_thum/<%=aryEvent(i).item("sethum")%>" alt="이벤트이미지">
                           </a>
                                </li>
                                <%
                    		Next
						End IF
                     %>
                        </ul>
                    </div>
                    <div class="licence-box lazy" data-src="/images/2017/pc_middle_license.jpg">
                        <a href="http://job.ac.kr/license/license.asp">
                            <h3 class="box-title">
                                자격증정보
                                <span>licence</span>
                            </h3>
                        </a>
                    </div>
                    <div class="picture-box slide_box">
                        <h3 class="box-title">
                            학교소식
                            <span>news</span>
                        </h3>
                        <ul class="picture-slide slide_bx">
                            <%
                              img_thum = "picture_0"
                              file_root = "/images/2017/picture/"
                              For i = 1 To 7
                                  Response.Write "<li>"
                                  Response.Write "<img style='max-height: 230px; width: 100%;' class=""lazy"" data-src=""" & file_root  & img_thum & i & ".jpg"" alt=""학교이미지"" src=""/images/srcimg.png"">"
                                  Response.Write "</li>"
                              Next
                          %>
                        </ul>
                    </div>
                    <div class="reservation-box lazy" data-src="/images/2017/pc_middle_reservation.jpg">
                        <a>
                            <h3 class="box-title">
                                방문상담예약현황

                                <span>reservation</span>
                            </h3>
                        </a>
                        <ul class="reservation-list">
                            <%
							
 ' 방문 상담 예약
 Function getReservationLis()
 	Dim aryHashMap 
	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_방문상담예약_L] @mode='list',@pageNumber='1',  @RowPerPage = '8'"
 	getReservationLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)	
 END Function 
 
Dim  aryReservation : aryReservation = getReservationLis()
                             If Not IsArray(aryReservation) Then
                                response.write "<li>등록된 방문 상담예약이 없습니다.</li>" & vbcrlf
                            Else
                                For i = 0 To UBound(aryReservation)
						%>
                                <li>
                                    <p>
                                        <%=aryReservation(i).item("trinterviewdate")%>
                                    </p>
                                    <p>
                                        <%=aryReservation(i).item("name")%>
                                    </p>
                                    <p>
                                        <%=aryReservation(i).item("trinterviewtime")%>
                                    </p>
                                    <p>
                                        <%=aryReservation(i).item("sname")%>
                                    </p>
                                </li>
                                <%
                                NEXT
                            END IF 
                        %>
                        </ul>
                    </div>
                    <div class="recruit-box lazy" data-src="/images/2017/pc_middle_recruit3.jpg">
                       <!-- <a href="javascript:" >--><a href="http://job.ac.kr/employment/recruit.asp" > <!--http://job.ac.kr/employment/recruit.asp-->
                            <h3 class="box-title">
                                구인게시판
                                <span>recruit</span>
                            </h3>
                        </a>
                    </div>
                </div>
            </div>

            <!--수료생인터뷰-->
            <!--<div class="interContent">
                <div class="interviewWrap container con-center clearfix">
                    <div class="interviewGroup">
                        <ul class="interviewBox">
                            <%
Function getInterviewLis
	Dim aryHashMap 
 	Set aryHashMap = New RsToHashMap
	sql = "[dbo].[HRD_수료생_인터뷰_L] @mode='list' , @gubun='I', @pageNumber='1', @RowPerPage = '5'"
	getInterviewLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
END Function 
Dim aryInterview : aryInterview = getInterviewLis()

						IF isArray(aryInterview) Then 
							for i = 0 To UBound(aryInterview)
								If not isNull(aryInterview(i).item("file_name_01")) Then 
					%>
                                <li class="intArt">
                                    <div class="intArtimg lazy" data-src="/upload/jobinterview/<%=aryInterview(i).item("file_name_01")%>"></div>
                                    <div class="intArtText">
                                        <a href="http://job.ac.kr/community/jobinterview.asp?cpage=1&take_idx=<%=aryInterview(i).item("take_idx")%>">
                                            <p>한국IT수료생 인터뷰.</p>
                                            <h3 class="title">
                                                <%=aryInterview(i).item("title")%>
                                            </h3>
                                            <p class="intnone">
                                                <%=aryInterview(i).item("crtitle")%>
                                            </p>
                                           <div class="intbtn con-center">상세보기 <i class="fas fa-angle-right"></i></div>
                                        </a>
                                    </div>
                                </li>
                                <%	
								END IF	
							Next
						END IF
					%>
                        </ul>

                        <ul class="intebtnBox bx-controls">
                        </ul>
                    </div>
                </div>
            </div>-->
            <div class="box-wrap">
                <div class="container con-center content clearfix">
                    <div class="project-box lazy" data-src="/images/2017/box-bg01.jpg">
                        <a href="/project/project-game.asp">
                            <h3 class="box-title">프로젝트<span>PROJECT</span></h3>
                            <h3 class="main-text">Make Your Project.</h3>
                        </a>
                    </div>
                    <div class="review lazy" data-src="/images/2017/review.jpg">
                        <a href='/community/course-review.asp'>
                            <h3 class="box-title">수강후기<span>REVIEW</span></h3>
                            <h3 class="main-text">훈련생 직접작성 <br>HRD수강후기</h3>
                        </a>
                    </div>
                    <div class="photogallery lazy" data-src="/images/2017/photogallery1.jpg">
                        <a href="/community/photogallery.asp">
                            <h3 class="box-title">포토갤러리<span>PHOTOGALLERY</span></h3>
                        </a>
                    </div>
                     <div class="notice lazy" data-src="/images/2017/training.jpg" style="background-color:#66d6fe; background-position: center; background-repeat: no-repeat; background-size: contain;">
                        <a href="http://job.ac.kr/training/vocationaltraining-NCS.asp"></a>
                        
                    </div>
                </div>
            </div>
            <div class="relationSite">
       			<ul class="container con-center clearfix">
       				<li><a href="https://www.work.go.kr/" target="_blank"><img src="/images/2019/relationlogo01.png" alt="워크넷"></a></li>
       				<li><a href="http://www.moel.go.kr" target="_blank"><img src="/images/2019/relationlogo02.png" alt="고용노동부"></a></li>
       				<li><a href="https://www.ncs.go.kr" target="_blank"><img src="/images/2019/relationlogo03.png" alt="국가직무능력표준"></a></li>
       				<li><a href="http://hrd.go.kr" target="_blank"><img src="/images/2019/relationlogo04.png" alt="HRD-NET"></a></li>
       				<li><a href="https://www.ksqa.or.kr" target="_blank"><img src="/images/2019/relationlogo05.png" alt="한국기술교육대학교-직업능력심사평가원"></a></li>
       				<li><a href="http://www.q-net.or.kr" target="_blank"><img src="/images/2019/relationlogo06.png" alt="Q-Net"></a></li>
       			</ul>
        	</div>

        </div>
        <!--고교위탁 임시 팝업-->
        <!--<div id="hsmainPopup" class="hsmainPopup-Pstyle" style="top:-100px;!important">
            <span class="b-close">X</span>
            <div class="hsMainPopup-content" style="height: auto; width: auto;">
                <div class="highschool-MainPopup">
                    <div class="hs-MainPopupimg hsMainPopuppc"><a href="http://www.job.ac.kr/curriculum/course-woker.asp?crcd=0"><img src="/images/2018/highschool-mainpopup/cloud-mainpopup_200812.png" alt=""></a></div>
                    <div class="hs-MainPopupimg hsMainPopupmobile"><a href="http://www.job.ac.kr/curriculum/course-woker.asp?crcd=0"><img src="/images/2018/highschool-mainpopup/cloud-mainpopup_mobile_200812.png" alt=""></a></div>
                </div>
            </div>
        </div>--><!--
        <map name="map21">
            <area shape="rect" title="이미지" coords="0,0,316,250" href="http://job.ac.kr/curriculum/course-woker.asp?crcd=0">
            <area shape="rect" title="시나리오기반 모의해킹 실무" coords="323,2,636,258" href="http://job.ac.kr/curriculum/course-view.asp?crcd=193">
            <area shape="rect" title="시나리오기반 모의해킹 심화" coords="324,263,634,504" href="http://job.ac.kr/curriculum/course-view.asp?crcd=194">
            <area shape="rect" title="악성코드 분석과 리버싱기초" coords="1,265,314,504" href="http://job.ac.kr/curriculum/course-view.asp?crcd=39">
        </map>
        <map name="map22">
            <area shape="rect" title="이미지" coords="1,21,277,186" href="http://job.ac.kr/curriculum/course-woker.asp?crcd=0">
            <area shape="rect" title="시나리오기반 모의해킹 실무" coords="0,193,278,258" href="http://job.ac.kr/curriculum/course-view.asp?crcd=193">
            <area shape="rect" title="시나리오기반 모의해킹 심화" coords="0,267,279,331" href="http://job.ac.kr/curriculum/course-view.asp?crcd=194">
            <area shape="rect" title="악성코드 분석과 리버싱기초" coords="0,338,278,403" href="http://job.ac.kr/curriculum/course-view.asp?crcd=39">
        </map>-->
        <!--고교위탁 임시 팝업 끝-->

        <!-- site-map -->
        <!--#include virtual="/_include/2017/inc_quick_menu.inc"-->
        <!-- footer -->
        <!--#include virtual="/_include/2017/inc_footer.inc"-->
        <!-- side-bar -->
        <!--#include virtual="/_include/2017/inc_side_menu.inc"-->
        <!--간편 상담 -->
        <!--#include virtual="onlinePopup.asp"-->
        

        <!-- Web Log Writer -->
        <!-- #include virtual="/_include/inc_LogWriter.inc" -->

        </body>

        </html>
