<%
'경로 재설정
Function GetGlobalCategoryUrl(ByVal Set_Url)
	If Len(Set_Url) = 0 Then
		GetGlobalCategoryUrl = ""
		Exit Function
	End If

	If Not (StrComp(Left(Set_Url,7),"http://") = 0 Or StrComp(Left(Set_Url,8),"https://") = 0) Then
		If StrComp(Left(Set_Url,8),"/school/") = 0 Then
			Set_Url = TEMPLATE_SCHOOL_DIRECTORY & Mid(Set_Url,8)
		Else
			Set_Url = TEMPLATE_DIRECTORY & Set_Url
		End If
	End If

	GetGlobalCategoryUrl = Set_Url
End Function
%>
<header id="header" class="header">
	<div class="headerTopbar">
		<a href="#">login</a>
		<a href="#">serch</a>
		<span><img src="" alt="korea it logo" /></span>
	</div>
	<div class="headerTop">
		<div class="auto">
			<span class="tel"><i class="fa fa-phone" aria-hidden="true"></i><span>신입학상담 <%=formatPhone(KOREA_IT_INFO_TEL)%></span></span>
			<span class="tel"><i class="fa fa-phone" aria-hidden="true"></i><span>교학처(재학생문의) <%=formatPhone(KOREA_IT_OFFICE_TEL)%></span></span>
			<span class="tel"><span class="kakao"><a href="https://pf.kakao.com/_YBxixixd" target="_blank">
			<img class="lazy" data-src="/images/2018/main/kakao_icon.png"> 카카오톡 실시간 상담@한국IT전문학교</a></span></span>
			<div class="util">
				<span class="dasan"><img class="lazy" data-src="/images/2017/layout/dasan.png" alt="다산 인재 개발원"></span>
				<span class="hrd"><a href="http://job.ac.kr/" target="_blank">국비지원훈련과정</a></span>
				<ul>
					<li><a href="<%=template_directory%>/">home</a></li>

<% If Not GetLoginCheckToBool() Then %>
					<li><a href="<%=template_directory%>/mypage/login.asp?goURL=<%=Server.UrlEncode(Request.ServerVariables("PATH_INFO"))%>">login</a></li>
					<li><a href="<%=template_directory%>/mypage/membership01.asp">joinus</a></li>
<% Else %>
					<li><a href="<%=template_directory%>/mypage/logout.asp">logout</a></li>
					<li><a href="<%=template_directory%>/mypage/modify.asp">modify</a></li>
<% End If %>

					<li><a href="<%=template_directory%>/mypage/sitemap.asp">sitemap</a></li>
					<li><a href="/eng/">english</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="gnbWrap">
		<div class="auto">
			<h1 class="logo">
				<a href="http://www.koreait.ac.kr/">
					<img class="lazy" data-src="/images/2017/layout/logo.png" alt="한국IT직업전문학교">
					<span class="hidden">한국IT직업전문학교</span>
				</a>
			</h1>
			<nav id="gnb">
				<ul class="gnbList">
<%
' 0 : ID, SEQ_NO, TITLE, URL, TARGET, CATEGORY0, CATEGORY1, CATEGORY2 [7]
GlobalCategoryArray = GetGlobalCategoryToArray()
If IsArray(GlobalCategoryArray) Then
	For i = 0 To UBound(GlobalCategoryArray,2)
		GlobalCategory_ID = GlobalCategoryArray(0,i)
		GlobalCategory_SEQ_NO = GlobalCategoryArray(1,i)
		GlobalCategory_TITLE = GlobalCategoryArray(2,i)
		GlobalCategory_URL = GlobalCategoryArray(3,i)
		GlobalCategory_TARGET = GlobalCategoryArray(4,i)
		GlobalCategory_CATEGORY0 = GlobalCategoryArray(5,i)
		GlobalCategory_CATEGORY1 = GlobalCategoryArray(6,i)
		GlobalCategory_CATEGORY2 = GlobalCategoryArray(7,i)

		If CDbl(GlobalCategory_SEQ_NO) > 9 Then
			Exit For
		End If

		If Len(GlobalCategory_CATEGORY0) = 0 And Len(GlobalCategory_CATEGORY1) = 0 And Len(GlobalCategory_CATEGORY2) = 0 Then
			'If InStr(GlobalCategory_URL,"http://") = 0 Then
			'	GlobalCategory_URL = template_directory & GlobalCategory_URL
			'End If

			GlobalCategory_URL = GetGlobalCategoryUrl(GlobalCategory_URL)

			If CDbl(GlobalCategory_SEQ_NO) = 9  Then
'			If strcomp(GlobalCategory_TITLE,"JOIN US") = 0  Then
				Response.Write "<li class=""blind"">"
			Else
				Response.Write "<li>"
			End If

				Response.Write "<h2><a href=""" & GlobalCategory_URL & """>" & GlobalCategory_TITLE & "</a></h2>"
				Response.Write "<ul class=""sub"">"


			For j = 0 To UBound(GlobalCategoryArray,2)
				GlobalCategory2_ID = GlobalCategoryArray(0,j)
				GlobalCategory2_SEQ_NO = GlobalCategoryArray(1,j)
				GlobalCategory2_TITLE = GlobalCategoryArray(2,j)
				GlobalCategory2_URL = GlobalCategoryArray(3,j)
				GlobalCategory2_TARGET = GlobalCategoryArray(4,j)
				GlobalCategory2_CATEGORY0 = GlobalCategoryArray(5,j)
				GlobalCategory2_CATEGORY1 = GlobalCategoryArray(6,j)
				GlobalCategory2_CATEGORY2 = GlobalCategoryArray(7,j)

				If Len(GlobalCategory2_CATEGORY0) >= 1 Then
					If CDbl(GlobalCategory2_CATEGORY0) > CDbl(GlobalCategory_SEQ_NO) Then
						Exit For
					End If
				End If

				'If InStr(GlobalCategory2_URL,"http://") = 0 Then
				'	GlobalCategory2_URL = template_directory & GlobalCategory2_URL
				'End If

				GlobalCategory2_URL = GetGlobalCategoryUrl(GlobalCategory2_URL)

				If StrComp(GlobalCategory_SEQ_NO, GlobalCategory2_CATEGORY0) = 0 And Len(GlobalCategory_CATEGORY1) = 0 And Len(GlobalCategory_CATEGORY2) = 0 Then

					If GetLoginCheckToBool() AND CDbl(GlobalCategory2_CATEGORY0) = 9 Then

						If CDbl(GlobalCategory2_SEQ_NO) = 1 Then
							Response.Write "<li><h3><a href=""http://www.koreait.ac.kr/new/mypage/modify.asp"">정보수정</a></h3></li>"
						ElseIf CDbl(GlobalCategory2_SEQ_NO) = 2 Then
							Response.Write "<li><h3><a href=""http://www.koreait.ac.kr/new/mypage/deactivate.asp"">회원탈퇴</a></h3></li>"
						Else
							Response.Write "<li><h3><a href=""" & GlobalCategory2_URL & """>" & GlobalCategory2_TITLE & "</a></h3></li>"
						End If
					Else

						If StrComp(GlobalCategory2_TARGET,"_blank") = 0 Then
							Response.Write "<li><h3><a href=""" & GlobalCategory2_URL & """ target=""_blank"">" & GlobalCategory2_TITLE & "</a></h3></li>"
						Else
							Response.Write "<li><h3><a href=""" & GlobalCategory2_URL & """>" & GlobalCategory2_TITLE & "</a></h3></li>"
						End IF
					End IF
				End If
			Next
			Response.Write "</ul>"
			Response.Write "</li>" & VbNewLine
		End If
	Next
End If
%>
				</ul>
			</nav>
			<!--<h2 class="support_btn"><a href="<%=TEMPLATE_DIRECTORY%>/ad_lead/support_apply.asp" >원서접수</a></h2>-->
			<h2 class="support_btn" ><a href="/new/board/pressboard.asp?code=con&id=156">국가평생교육진흥원 우수기관 선정. 한국 IT는 IT교육을 통해 인재를 양성해 국가와 사회발전에 기여한 공을 인정받아 국가평생교육진흥원 학점은행제 우수기간 표창를 받았다.</a></h2>
		</div>
	</div>
	<div class="bgSub">
		<div class="auto">
				<div class="gnbRecruit lazy">
					<div class="txtBoxTop">
						<span class="txt01"><%=ArySelection(0).item("Study_year")+1%>학년도 신·편입생 모집.</span>
						<span class="txt02"><strong><%=ArySelection(0).item("To_Date")+1%></strong><span>까지.</span></span>
					</div>
					<div class="txtBoxBottom">
						<p>수능/내신 미반영(계열별 면접 선발)</p>
						<p>면접&적성검사 100%선발</p>
<!--						<p>일본어 수업&선행학습 무료지원</p>-->
						<p class="blind">우선선발 합격자 장학금 지원</p>
						<p class="blind"></p>
					</div>
					<div class="btnWrap">
						<a href="<%=template_directory%>/ad_lead/support_apply.asp">원서접수</a>
						<a href="<%=template_directory%>/ad_lead/admission.asp">모집요강</a>
					</div>
				</div>
			</div>
	</div>
</header>
<div class="Aptitude">
		<a href="http://www.koreait.ac.kr/community/2018/AptitudeTest.asp" target="_blank">
		<div class="AptitudeWrap" id="AptitudeIcon" data-idx="1"></div>
		</a>
	</div>
