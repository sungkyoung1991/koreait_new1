<!-- #include file="../include/header2020.asp" -->
<%
'###### 공지사항
'Notice List - 2020
' 0 : take_idx, title, writeday [2]
Function getNoticeArr(ByVal Set_type)
	Dim AryHash
	Set AryHash = new RsToHashMap	
	sql = "Select top 5 take_idx, title, writeday FROM news_board where (bbscode='한국IT전문학교' or bbscode='통합') And list_view=1 order by top_view desc, writeday desc"	
	getNoticeArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)	
END Function

'###### 취업
'getJobArr - 2020
Function getJobArr(ByVal Set_type)
	Dim AryHash
	Set AryHash = new RsToHashMap	
	sql = "Select top 5 take_idx, bbscode, title, co_name, co_persons, name, co_position, role, tel, mob, Fax, Email, HomePage, zipcode, address1, address2, co_intro, incrute_kind, job_kind, job_pay, work_time, etc, gradu_rate, career_kind, career_year, career_limite, sex_kind, age_year, age_limite, with_paper, howtoaply, day_limite, howtosend_kind, howtosend_email, howtosend_Fax, writeday, pwd, ref, step, re_level, readnum, numm From jobinfo2_board Where Status=1 Order by ref desc, step asc"	
	getJobArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)	
END Function

Function getMainBanner_smart(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap
	
	sql = "select take_idx, pj_code, order_no, content, file2, c_dt from renew_banner where pj_code='정보보안' order by order_no asc , take_idx desc"
	getMainBanner_smart = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
	
END Function 

Function getSmart_eventArr(ByVal Set_type)

	Dim AryHash
	Set AryHash = new RsToHashMap
	
	sql = "TBL_SiteBoard_L @gubun='L', @bs_gubun='classlife,itgallery,prointerview,itstar,pressboard', @bbscode='정보보안', @topCnt=4, @pageNumber=1, @RowPerPage = 4"
	getSmart_eventArr = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)
	
END Function 







Dim getNotice : getNotice = getNoticeArr(102)
Dim getJob : getJob = getJobArr(102)
Dim mbanner_smart : mbanner_smart = getMainBanner_smart(102)
Dim smart_event : smart_event = getSmart_eventArr(102)

%>
	<div id="mainVisual">
		<ul class="swiper-wrapper">
        
        <script>
			function gop(page){
					
					location.href = page;
				}
		</script>
        
        
        <%
        For i = 0 To UBound(mbanner_smart)
				  
		%>
       
            <li class="swiper-slide new">
                   
	                <img onClick="gop('<%=mbanner_smart(i).item("content")%>');" style="cursor:pointer; width:100%; height:552px; max-height:552px;" src="/upload_files/renew/banner/<%=mbanner_smart(i).item("file2")%>">
                    <a style="display:none;"></a>
                       
            </li>
       
       
        <%
				
			NEXT
		%>
        
        
			
			
		</ul>
		<div class="pager subMainVisualPager"></div>
		<a href="" class="btnPrev"><img class="lazy" data-src="../images/main/visualbtnPrev.png" alt="이전"></a>
		<a href="" class="btnNext"><img class="lazy" data-src="../images/main/visualbtnNext.png" alt="다음"></a>
        
<!--		<div class="mainQuick">
			<div class="auto">
				<dl>
					<dd>한국IT직업전문학교 융합스마트계열</dd>
					<dt><%=ArySelection(0).item("Study_year")%>학년도 신입생 모집</dt>
				</dl>
				<span>
					<strong><%=period%></strong> <span>까지</span>
				</span>
				<ul>
					<li><a href="/new/ad_lead/support_apply.asp" target="_blank">원서접수</a></li>
					<li><a href="/new/ad_lead/admission.asp" target="_blank">모집요강</a></li>
					<li><a href="/new/board_skin/sangdam_board/board_index.asp" target="_blank">입학상담</a></li>
				</ul>
			</div>
		</div>-->
        
	</div>

<div id="mainContents">
    <div id="mainBanner03" class="mainContentsImg">
        <!--<img class="lazy" data-src="../images/main/2019/part_1.jpg" />-->
        <img class="lazy" data-src="../images/main/2019/part_security2020.jpg" alt="" src="../images/main/2019part_security2020.jpg">
        <!-- <img class="lazy" data-src="../images/main/2019/part.jpg" />
        <img class="lazy" data-src="../images/main/2019/part_4.jpg" />
        <img class="lazy" data-src="../images/main/2019/part_5.jpg" />
        <img class="lazy" data-src="../images/main/2019/part_6.jpg" />-->
    </div>
</div>
<div class="introduce08">
		<h2><span>NEWS & EVENT</span>소식 및 행사</h2>
		<a href="http://www.koreait.ac.kr/new/school/security/html/board_index.asp" class="mainFocusMore">더보기</a>
		<ul>
        
        
        
				<%
                For i = 0 To UBound(smart_event)
                
                %>
                
                <li>
                	<a href="http://www.koreait.ac.kr/new/school/security/html/board_index.asp?page=1&take_idx=<%=smart_event(i).item("take_idx")%>">
	                    <div><img src="/upload_files/ckeditor/board/list/<%=smart_event(i).item("listimg")%>" alt="" /></div>                  	
                        <p>
                        	<b><%=smart_event(i).item("title")%></b>
                        </p>
               		 </a>                
                </li>
                
                
                <%
                
                NEXT
                %>
		
		</ul>
	</div>
    
<div class="introduce09">
		<div class="in09">
			<div class="notice_job">
				<h3>공지사항 <span>ANNOUNCEMENTS</span></h3>
				<a href="http://www.koreait.ac.kr/new/board_skin/board_index01.asp" class="mainFocusMore">더보기</a>
				<ul>
                
					<%
                   	 For i = 0 To Ubound(getNotice) '
                    %>
                    
                    <li>                    	
						<a href="http://www.koreait.ac.kr/new/board_skin/board_index01.asp?code=con&id=<%=getNotice(i).item("take_idx")%>">
							<%=getNotice(i).item("title")%>
                        </a>
                    </li>
                    
                    <%
                    NEXT
                    %>
        
        
										
				</ul>
			</div>
			<div class="notice_job">
				<h3>취업 <span>JOB</span></h3>
				<a href="http://www.koreait.ac.kr/new/board_skin/jobinfo2_board/board_index02.asp" class="mainFocusMore">더보기</a>
				<ul>

					<%
                   	 For i = 0 To Ubound(getJob) '
                    %>
                    
                    <li>                    	
						<a href="http://www.koreait.ac.kr/new/board_skin/jobinfo2_board/board_index02.asp?code=con&id=<%=getJob(i).item("take_idx")%>">
							<%=getJob(i).item("title")%>
                        </a>
                    </li>
                    
                    <%
                    NEXT
                    %>
				</ul>
			</div>
		</div>
	</div>

</div>
<!-- #include file="../include/footer2020.asp" -->