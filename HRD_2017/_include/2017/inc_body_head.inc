
</head>

<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/x-javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "f26f970c-d66a-448d-8948-55b622ebbc61"
  });
</script>
<!-- End Channel Plugin --><body>


<%
Dim arrHashMap
Dim arrCourseCate, arrCourseSub, arrMainCate, arrSubCate
Dim aryCourseCate, aryCourseSub, aryMainCate, arySubCate
Dim key, subKey, CourseKey, CourseSubKey
Set arrHashMap = New RsToHashMap

'과정 메뉴
 FUNCTION getMainCourseLis()
 	Dim aryHashMap
 	Set aryHashMap = New RsToHashMap
 	sql ="[dbo].[HRD_메뉴관리_L] @site='HRD', @position = 'TOP', @gubun='MainCourse'"
	getMainCourseLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
 END FUNCTION

'과정 메뉴 하위 목록
 FUNCTION getMainSubCourseLis()
 	Dim aryHashMap
 	Set aryHashMap = New RsToHashMap
 	sql ="[dbo].[HRD_메뉴관리_L] @site='HRD', @position = 'TOP', @gubun='SubCourse'"
	getMainSubCourseLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
 END FUNCTION

'사이트맵 메뉴
 FUNCTION getMainCateLis()
 	Dim aryHashMap
 	Set aryHashMap = New RsToHashMap
 	sql ="[dbo].[HRD_메뉴관리_L] @site='HRD', @position = 'SiteMap', @gubun='MainCate'"
	getMainCateLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
 END FUNCTION

'사이트맵 하위 메뉴
 FUNCTION getMainSubCateLis()
 	Dim aryHashMap
 	Set aryHashMap = New RsToHashMap
 	sql ="[dbo].[HRD_메뉴관리_L] @site='HRD', @position = 'SiteMap', @gubun='SubCate'"
	getMainSubCateLis = aryHashMap.GetRowsQuery(CONNSTRING_WEB, sql)
 END FUNCTION

aryCourseCate = getMainCourseLis()
aryCourseSub = getMainSubCourseLis()
aryMainCate = getMainCateLis()
arySubCate = getMainSubCateLis()


arrCourseCate = aryCourseCate
arrCourseSub = aryCourseSub
arrMainCate = aryMainCate
arrSubCate = arySubCate

 %>
	<header class="pc-header">
		<!-- TOP 띠 배너 -->
		<!--<div class="promotionBanner">
		  <a class="bannerLink lazy" href="http://job.ac.kr/curriculum/course-professionalEdu-newpage.asp"
		  	data-src="/images/2018/topbanner-200928.png"></a>
		  <a href="javascript:" class="btnClose fas fa-times"></a>
		</div>-->
		<!-- TOP 띠 배너 END -->
        <nav class="topNav">
            <div class="container con-center clearfix">
                <div class="float-left clearfix campusList">
					<a href="/campusinfo/campusinfo-yangjae.asp">양재 캠퍼스(한국IT직업전문학교)</a>
					<a href="/campusinfo/campusinfo-guro.asp">구로 캠퍼스(한국IT아카데미)</a>
                </div>
                <div class="float-right rightmenu">
					<% If MEM_ID = "" Then %>
						<a href="/membership/login_new.asp">로그인</a>
						<a href="/membership/join_new.asp">회원가입</a>
					<% Else %>
						<a href="/membership/logout.asp">Logout</a></li>
						<a href="/membership/mypage.asp">MyPage</a></li>
					<% End If %>
					<a class="insta sns_icon" href="https://www.instagram.com/koritjob" target="_blank" title="인스타그램"></a>
					<a class="navercafe sns_icon" href="http://cafe.naver.com/ayschool" target="_blank" title="네이버카페"></a>
					<a class="facebook sns_icon" href="https://www.facebook.com/KoreaIt.Guro" target="_blank" title="페이스북"></a>
					<a class="blog sns_icon" href="https://blog.naver.com/edu4it" target="_blank" title="네이버블로그"></a>
					<a class="youtube sns_icon" href="https://www.youtube.com/channel/UCuCkjYtskEkOjYQJbUPuPmA" target="_blank" title="유투브"></a>
					<a class="post sns_icon" href="https://post.naver.com/edu4it" target="_blank" title="네이버포스트"></a>
                </div>
            </div>

			<!-- 재단소개 / leftsidebarstart-->
			<div class="nav sidebar2" id="side">
				<div class="academihome">
					<div class="title">재단소개</div>
				</div>
				<div class="lnblist">
				  <div class="koreait-icon">한국IT아카데미</div>
				  <div class="sublist">
					  <a href="/intro/hankookitacademy-greeting.asp">이사장 인사말</a>
					  <a href="/intro/hankookitacademy-history.asp">학교연혁 및 주요수상</a>
					  <a href="/intro/hankookitacademy-foundation.asp">재단법인 소개</a>
					  <a href="/intro/hankookitacademy-dasan.asp">한국IT취업지원센터</a>
					  <a href="/intro/hankookitacademy-teacher.asp">교수소개</a>
					  <a href="/community/pressView.asp">언론보도</a>
				  </div>
			  </div>
			</div>
        </nav>
        <a class="logo" href="/" title="한국IT아카데미"></a>
        <nav class="navbar">
            <div class="container con-center">
                <ul class="depth01 clearfix">

<%
					If isArray(arrCourseCate) Then
						For each Key in arrCourseCate    '과정 카테고리
%>
							<li class="<%=Key("classNM")%>">
								<a href='<%=Key("url")%>?crcd=<%=Key("crcd")%>'><%=ChgHTMLReplace(Key("divname"))%></a>
							</li>

					<%
						Next
						ENd IF
					%>
	                 <!--<li class="haksa"><a href="http://job.ac.kr/inovationsite/inovation.html" target="_blank">청년인재과정</a></li>-->
	                 <li class="haksa"><a href="http://job.ac.kr/intro/hankookitacademy-dasan.asp" target="_blank">취업지원센터</a></li>

	                 <!--<li class="haksa"><a href="http://www.koreait.ac.kr/new/" target="_blank">학위과정</a></li>-->
	                 <li class="haksa"><a href="http://joint.koreait.kr/" target="_blank">공동훈련센터</a></li>
                </ul>
<div class="sub_wrap">
<%
If isArray(arrCourseCate) Then
	For each Key in arrCourseCate '과정 하위
%>
		 <div class="submenu container con-center clearfix ">
             <div class="submenuInner">
                 <ul>
                     <li><img class="mlazy" data-src="/upload/subMenu/<%=Key("cmifile")%>"  alt="<%=Key("divname")%>" src="/images/srcimg.png"></li>
                 </ul>
                  <ul class="depth02">
<%
		If isArray(arrCourseSub) Then
			For each subKey in arrCourseSub '과정 하위
				If strcomp(Key("divcd"), subKey("divcd")) = 0 Then
%>
				<li class='<%=subKey("icon") & " " & subKey("scicon")%>'>
					<a href="/curriculum/course-view.asp?crcd=<%=subKey("crcd")%>">
					<%= subKey("crtitle") &  " " & subKey("crinning") %></a>

				</li>
<%
				End IF
			NEXT
		End IF

%>
				</ul>
			</div>
		</div>
<%
	Next
End If

%>
</div>
</div>
           <!-- /.container -->
</nav>
</header>
    <header class="m-header" >
        <div class="line-bg"></div>
        <h1 class="logo"><a href='<%=MainIndex%>'><img src="/images/2017/logo_new.png" alt="한국IT아카데미"></a></h1>
        <div class="mbtn">
            <div class="nav-icon">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </header>
	<div class="mobile-menu">
        <ul class="first-menu clearfix">
			<% If MEM_ID = "" Then %>
				<li><a href="/membership/login_new.asp">로그인</a></li>

				<li><a href="/membership/join_new.asp">회원가입</a></li>
			<% Else %>
				<li><a href="/membership/logout.asp">Logout</a></li>
				<li><a href="/membership/mypage.asp">MyPage</a></li>
			<% End If %>
        </ul>
         <div class="main-menu">
            <ul class="m-depth01">
            <%
				chk = 0
				if isArray(arrMainCate) Then
					for each Key in arrMainCate
						IF strComp(key("SEQ_NO"), 10) <> 0 Then
			 %>
            	<li>
					<a href="#none"><%=key("TITLE")%></a>
					<ul class="m-depth02">
               <%
			   			IF isArray(arrSubCate) Then
							for each subKey in arrSubCate
								IF strComp(key("SEQ_NO"),subKey("SEQ_NO")) = 0 Then
									IF strComp(key("SEQ_NO"),2) = 0 AND strComp(subKey("SEQ_NO"),2) = 0 AND strComp(subKey("CATEGORY1"),1) = 0 Then
									 	If isArray(arrCourseCate) Then
                          For each CourseKey in arrCourseCate    '과정 카테고리
												IF strComp(CourseKey("divcd"), 9) <> 0 Then     ' 9 :  일반고 특화
				%>
                			 <li class="<%=CourseKey("classNM")%>">
                        		<a class="course-menu" href='#'><%=CourseKey("divname")%></a>
                        		<ul class="m-depth03">
                <%
													If isArray(arrCourseSub) Then
														For each CourseSubKey in arrCourseSub '과정 하위
															If strcomp(CourseKey("divcd"), CourseSubKey("divcd")) = 0 Then
     			%>
                	                <li class='<%=CourseSubKey("icon") & " " & CourseSubKey("scicon")%>'>
                                    	<a href="/curriculum/course-view.asp?crcd=<%=CourseSubKey("crcd")%>">
                                   		<%= CourseSubKey("crtitle") &  CourseSubKey("crinning") %></a>

                            		</li>
                <%
															END IF
														NEXT
													END IF
				%>
                                </ul>
                             </li>
                <%
												END IF
											NEXT
										END IF
									ELSEIF strComp(key("SEQ_NO"),3) = 0 AND chk = 0 Then    '일반 고특화
										If isArray(arrCourseSub) Then
											For each CourseSubKey in arrCourseSub '과정 하위
												If strcomp(CourseSubKey("divcd"), 9) = 0 Then   ' 9 :  일반고 특화
     			%>
                	                <li class='<%=CourseSubKey("icon") & " " & CourseSubKey("scicon")%>'>
                                    	<a href="/curriculum/course-view.asp?crcd=<%=CourseSubKey("crcd")%>">
                                   		<%= CourseSubKey("crtitle") & CourseSubKey("crinning") %></a>
                            		</li>
                <%
															END IF
														NEXT
													END IF
										chk = 1
									ElseIF strComp(key("SEQ_NO"),3) <> 0 AND strComp(key("SEQ_NO"),2) <> 0 Then
				%>
                						<li><a href="<%=subKey("URL")%>"><%=subKey("TITLE")%></a></li>
                <%
									END IF
								END IF
							NEXT
						END IF
			   %>
                    </ul>
                </li>
            <%
						END IF
					NEXT
				END IF
			%>
            </ul>
         </div>
   	</div>
