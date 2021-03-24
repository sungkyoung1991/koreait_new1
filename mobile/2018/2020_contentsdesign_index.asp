<!-- #include virtual="/inc/Service_Inc.inc" -->
<!-- #include Virtual="/inc/2018/inc_html_head2020.inc" -->
<%
tab = request("tab")

if tab = "" then
	tab = 0
end if
%>

<!-- S: page -->
<!-- #include Virtual="/inc/2018/inc_body_header2020.inc" -->
<script>
$(document).ready(function(e) {
    var tab = $(".clearfix li").eq(<%=tab%>).index();

	if (tab=="" || tab==null){
			tab=0;
		}else{
			tab=<%=tab%>
			};

	$(".clearfix li").eq(tab).addClass("on").siblings(".clearfix li").removeClass("on");
	$(".clearfix li").eq(tab).trigger("click");
});
</script>
<div id="subContents">
    <div data-role="page" class="slidePage" id="itstoryPage" data-next="" data-prev=""  data-defaults="ture" >
        <section class="sub_in_wrap">
           <!-- <div class="greetings_ban">
                <a data-ajax="false" href="http://m.koreait.ac.kr/2018/2020_design_morebanner.asp?bbscode=2020_contentsdesign_index" class="ui-link"><img src="/images/2020/design_banner.jpg" alt="디자인 계열배너이미지"></a>
            </div>-->
            <div class="design_wrap_new">
                <div class="greetings_tab">
                    <div class="tab_box">
                        <ul class="clearfix">
                            <li>계열소개</li>
                            <li>계열소식</li>
                            <li>작품갤러리</li>
                            <li>교수소개</li>

                            <li>디지털시각디자인·비주얼웹디자인</li>
                            <li>일러스트레이션·드로잉</li>
                            <li>미디어·유튜브</li>
                            <li>웹툰·애니</li>
                            <!-- <li>만화애니메이션</li> -->
                            <!-- <li>유튜브</li> -->
                        </ul>
                    </div>
                    <div class="tab_content">

                    <!--계열소개-->
                        <div class="tab_cont_in1 tab_cont_box">
                            <div class="tab_in_con">
                                <div class="schoolintro schoolSeries">
                                    <img src="../images/2020/school/contentsdesign/design01.jpg" alt="NO.1 최신시설을 활용한 수업">
                                    <img src="../images/2020/school/contentsdesign/design02.jpg" alt="NO.2 프로젝트 시스템">
                                    <img src="../images/2020/school/contentsdesign/design03.jpg" alt="NO.3 전공심화학기">
                                    <img src="../images/2020/school/contentsdesign/design04.jpg" alt="NO.4 코툰">
                                    <img src="../images/2020/school/contentsdesign/design05.jpg" alt="NO.5 만화도서관">
                                    <img src="../images/2020/school/contentsdesign/design06.jpg" alt="NO.6 정규학기">
                                </div>
                            </div>
                        </div>

                        <!--계열소식-->
                        <!-- #include file="./2020_cd_index_2.asp" -->


                        <!--작품갤러리-->
                        <!-- #include file="./2020_cd_index_3.asp" -->

                        <!--교수소개-->
                         <!-- #include file="./2020_cd_index_4.asp" -->

                        <!--시각디자인-->
                        <div class="tab_cont_in5 tab_cont_box">
                            <div class="tab_in_con">
                               <div class="design_visual schoolSeries">
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img01.png" alt="시각디자인안내"></div>
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img02.png" alt="시각디자인소개"></div>
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img03.png" alt="계열별 심화교육으로 재능을 키우다"></div>
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img04.png" alt="특화된 교육과정 한눈에 보기"></div>
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img05.png" alt="포트폴리오"></div>
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img06.png" alt="교육과정"></div>
                                   <div><img src="../images/2020/school/contentsdesign/visualdesign/img07.png" alt="자격증취득시기"></div>
                               </div>
                            </div>
                        </div>

                        <!--일러스트-->
                        <div class="tab_cont_in6 tab_cont_box">
                            <div class="tab_in_con">
                               <div class="design_illust schoolSeries">
                                   <div><img src="../images/2020/school/contentsdesign/illust/img01.png" alt="일러스트안내"></div>
                                   <div><img src="../images/2020/school/contentsdesign/illust/img02.png" alt="일러스트소개"></div>
                                   <div><img src="../images/2020/school/contentsdesign/illust/img03.png" alt="계열별 심화교육으로 재능을 키우다"></div>
                                   <div><img src="../images/2020/school/contentsdesign/illust/img04.png" alt="특화된 교육과정 한눈에 보기"></div>
                                   <div><img src="../images/2020/school/contentsdesign/illust/img05.png" alt="포트폴리오"></div>
                                   <div><img src="../images/2020/school/contentsdesign/illust/img06.png" alt="교육과정"></div>
                                   <div><img src="../images/2020/school/contentsdesign/illust/img07.png" alt="자격증취득시기"></div>
                               </div>
                            </div>
                        </div>

                        <!--멀티미디어-->
                        <div class="tab_cont_in7 tab_cont_box">
                            <div class="tab_in_con">
                               <div class="design_multi schoolSeries">
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img01.png" alt="멀티미디어안내"></div>
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img02.png" alt="멀티미디어소개"></div>
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img03.png" alt="계열별 심화교육으로 재능을 키우다"></div>
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img04.png" alt="특화된 교육과정 한눈에 보기"></div>
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img05.png" alt="포트폴리오"></div>
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img06.png" alt="교육과정"></div>
                                   <div><img src="../images/2020/school/contentsdesign/multimedia/img07.png" alt="자격증취득시기"></div>
                               </div>
                            </div>
                        </div>

                        <!--웹툰-->
                         <div class="tab_cont_in8 tab_cont_box">
                            <div class="tab_in_con">
                               <div class="design_webtoon schoolSeries">
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img01.png" alt="웹툰안내"></div>
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img02.png" alt="웹툰개"></div>
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img03.png" alt="계열별 심화교육으로 재능을 키우다"></div>
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img04.png" alt="특화된 교육과정 한눈에 보기"></div>
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img05.png" alt="포트폴리오"></div>
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img06.png" alt="교육과정"></div>
                                   <div><img src="../images/2020/school/contentsdesign/webtoon/img07.png" alt="자격증취득시기"></div>
                               </div>
                            </div>
                        </div>

                        <!--만화애니메이션-->
                         <!-- <div class="tab_cont_in9 tab_cont_box">
                            <div class="tab_in_con">
                               <div class="design_animation schoolSeries">
                                   <div><img src="../images/2020/school/contentsdesign/animation/img01.png" alt="만화애니메이션안내"></div>
                                   <div><img src="../images/2020/school/contentsdesign/animation/img02.png" alt="만화애니메이션소개"></div>
                                   <div><img src="../images/2020/school/contentsdesign/animation/img03.png" alt="계열별 심화교육으로 재능을 키우다"></div>
                                   <div><img src="../images/2020/school/contentsdesign/animation/img04.png" alt="특화된 교육과정 한눈에 보기"></div>
                                   <div><img src="../images/2020/school/contentsdesign/animation/img05.png" alt="포트폴리오"></div>
                                   <div><img src="../images/2020/school/contentsdesign/animation/img06.png" alt="교육과정"></div>
                                   <div><img src="../images/2020/school/contentsdesign/animation/img07.png" alt="자격증취득시기"></div>
                               </div>
                            </div>
                        </div> -->

                         <!--유튜브-->
                         <!-- <div class="tab_cont_in10 tab_cont_box">
                            <div class="tab_in_con">
                               <div class="design_youtube schoolSeries">
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img01.png" alt="유튜브안내"></div>
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img02.png" alt="유튜브소개"></div>
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img03.png" alt="계열별 심화교육으로 재능을 키우다"></div>
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img04.png" alt="특화된 교육과정 한눈에 보기"></div>
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img05.png" alt="포트폴리오"></div>
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img06.png" alt="교육과정"></div>
                                   <div><img src="../images/2020/school/contentsdesign/youtube/img07.png" alt="자격증취득시기"></div>
                               </div>
                            </div>
                        </div> -->

                    </div>
                </div>
            </div>
            <!-- 팝업 -->
            <!--#include Virtual= "/inc/2018/inc_campus_pop.inc"-->
            <!-- footer (하단) -->
            <!--#include Virtual= "/inc/2018/inc_body_footer.inc"-->
        </section>


    </div>
</div> <!-- page END-->

<!-- <script>
  fbq('track', 'ViewContent');
</script> -->




<!--푸터부분 인클루드-->
<!-- include virtual="/inc/inc_web_log_script_utf8.inc" -->


<script type='text/javascript' src='/js/2018/main.js'></script>

</body>
</html>
