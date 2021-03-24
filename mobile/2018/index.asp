<!-- #include virtual="/inc/Service_Inc.inc" -->
<%
Function GetEventBannerToAttay()
	Dim AryHashMap
	Set AryHashMap = New RsToHashMap
	Dim sql : sql  = "TBL_SiteBanner_L @adminchk ='m', @gubun = 'a', @position='', @pageNumber='1', @RowPerPage ='99' "
	'Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
	SET db = Server.CreateObject("ADODB.Connection")
	db.Open CONNSTRING_WEB
	Set rs = db.execute(sql)
	If Not Rs.Eof Then
		arrRs = AryHashMap.getHashMap(Rs) 
	Else
		arrRs = Null
	End If
	Application.Lock
	Application.Contents("MainBanner_Array") = arrRs
	Application.Contents("MainBanner_Now") = Now()
	Application.Unlock

		
	GetEventBannerToAttay = arrRs 
	
END Function
'배너 목록 조회
Dim AryBanner : AryBanner = GetMobileBanner()

'2020***************************************************************************************************************************************************

Function getMainBanner()

	Dim AryHash
	Set AryHash = new RsToHashMap
	
	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='메인배너_m' order by order_no asc , take_idx desc"
	'Response.Write sql
	getMainBanner = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
	
END Function 


Dim mbanner : mbanner = getMainBanner()





%>

<!-- #include Virtual="/inc/2018/inc_html_head2020.inc" -->
<!-- S: page -->
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css"/>

<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.js"></script>



<div data-role="page" class="slidePage" id="indexPage" data-next="" data-prev="" data-defaults="ture"> 
<section id="main_wrapper_new">
    <div class="inner_wrap">
        <div class="main_visual">
            <div class="your-class">
            
				<%
              	  For i = 0 To UBound(mbanner)
                      
                %>
                	<div>
                        <a data-ajax="false" href="<%=mbanner(i).item("content")%>">
                            <img src="/upload_files/renew/banner/<%=mbanner(i).item("file2")%>" style="width: 100%;" />
                        </a>
                    </div>                 
                <%
                    
               	 NEXT
                %>
                      
            </div>
        </div> 
        <div class="main_sub_menu">
            <ul>
                <li>
                    <a href="/2018/guidelines.asp" data-ajax="false">모집요강</a>
                </li>
                <li>
                    <a href="/2018/2020_application.asp" data-ajax="false">원서접수</a>
                </li>
                
                <li>
                    <a href="/2018/2020_reference.asp" data-ajax="false">입시<br>자료신청</a>
                </li>
               
             
                <li>
                    <a href="/2018/2020_application_t.asp" data-ajax="false">모의<br>원서접수</a>
                </li>
                <li>
                    <a href="/2018/2020_interviewguide.asp" data-ajax="false">면접가이드</a>
                </li>
               
            </ul>
        </div>

        <div class="main_banner_list">
            <a data-ajax="false" href="/2018/game_index.asp"><img src="/images/2020/main_banner2021_list03.jpg" style="width: 100%;" /></a>
            <a data-ajax="false" href="/2018/2020_security_index.asp"><img src="/images/2020/main_banner2021_list04.jpg" style="width: 100%;" /></a>
            <a data-ajax="false" href="/2018/2020_contentsdesign_index.asp"><img src="/images/2020/main_banner2021_list02.jpg" style="width: 100%;" /></a>
            <a data-ajax="false" href="/2018/2020_smart_index.asp"><img src="/images/2020/main_banner2021_list01.jpg" style="width: 100%;" /></a>
            <a data-ajax="false" href="/2018/2020_elect_index.asp"><img src="/images/2020/main_banner2021_list05.jpg" style="width: 100%;" /></a>
        </div>

        <div class="main_school_evt">
            <strong>학교행사</strong>
            <div class="your-class">
            
            <%	Dim AryEventList : AryEventList = GetEventBannerToAttay()
					IF IsArray(AryEventList) Then 
						For i = 0 To 5
						if StrComp(AryEventList(i).item("IsView"),"Y") = 0 Then 
					%>
                	<div>
                    	<a href="/event_renew/2018/event_board.asp?code=con&id=<%=AryEventList(i).item("take_idx")%>" data-ajax="false">
                        	<img style="width:100%;" src="/upload_files/board/list/<%=AryEventList(i).item("mlistImg")%>" onerror="this.src='/upload_files/board/list/<%=AryEventList(i).item("imagefile")%>'"/>
                        </a>
                    </div>

                 <%
				 		END IF
					NEXT
				 END IF%>

            </div>
        </div>

        <div class="main_customer_menu">
            <a data-ajax="false" href="http://m.koreait.ac.kr/2018/2020_qnaList.asp">입학 Q&A</a>
            <a data-ajax="false" href="http://m.koreait.ac.kr/2018/2020_candidate.asp">합격자 조회</a>
            <a data-ajax="false" href="http://m.koreait.ac.kr/2018/2020_feature.asp">한국IT 경쟁력</a>
            <a data-ajax="false" href="http://m.koreait.ac.kr/board/inc2/board_Content2020.asp?code=con&id=1010&page=1">졸업인증제란?</a>
            <a data-ajax="false" href="http://m.koreait.ac.kr/2018/2020_smart_index.asp">4차산업혁명<br>STORY</a>
            <a data-ajax="false" href="http://m.koreait.ac.kr/2018/2020_vocathinalHighschool.asp" style="padding: 4.8rem 0 .8rem;background-position: center .7rem;">직장인<br>주 1회 과정</a>
        </div>

        <div class="main_job_report">
            <strong>계열별 취업현황</strong>
            
            <div class="job_tab_content">
                <div id="working">
                    <!--#include Virtual="/2018/main/working.asp"-->    
                </div>
               
            </div>
        </div>


        <div class="main_banner_list">
            <a data-ajax="false" href="http://gallery.koreait.kr/" target="_blank"><img src="/images/2020/main_gallery.jpg" style="width: 100%;" /></a>
        </div>
        <!-- footer (하단) -->
        <!--#include Virtual= "/inc/2018/inc_body_quickwrapsns.inc"-->
        <!--#include Virtual= "/inc/2018/inc_body_kakao.inc"-->
        <!--#include Virtual= "/inc/2018/inc_body_footer.inc"-->
    </div>
</section>
</div>

<script>
$(document).ready(function(){

    $('.your-class').slick({dots: true,autoplay: true,});
    $('.report_slick').slick({
        autoplay: true,
        centerMode: true,
        centerPadding: '20px',
        slidesToShow: 3,
    });

    //tab
	$(".jop_tab_box li").click(function(){
        $('.report_slick').slick('refresh');
        
		$(this).addClass("on").siblings("li").removeClass("on");
		var idxTabBox = $(".jop_tab_box li").index(this)+1;
		$(".job_tab_content .job_tab_cont_in"+idxTabBox).show().siblings("div").hide();
	});
});
</script>


<!-- page END-->		

<!--푸터부분 인클루드-->

<!-- include virtual="/inc/inc_web_log_script_utf8.inc" -->
<!--푸터부분 인클루드-->
<script type="application/ld+json">
 {
  "@context": "http://schema.org",
  "@type": "Person",
  "name": "한국IT직업전문학교",
  "url": "http://www.koreait.ac.kr",
  "sameAs": [
    "https://www.facebook.com/koreaitbest",
    "http://plus.kakao.com/home/jp5sl4b9",
    "http://tv.naver.com/koreait1998"
  ]
 }
 </script>
 
 <!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-98895167-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-98895167-1');
</script>

 

<script type='text/javascript' src='/js/2018/main.js'></script>
  	
</body>
</html>