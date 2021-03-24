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

<style>
#header .headerTop {
    height: 32px;
	background: white;
    border-bottom: white;
    overflow: hidden;

}


.headerTop {
    height: 32px;
     background: white;
    border-bottom: white;
    overflow: hidden;
}

.gnbWrap .logo a img{  width:100%; }
.gnbWrap .logo a{ /* adding:13px 0px 14px 35px; */}
.gnbWrap .amazon{position:absolute; top:26px; left:-190px; background-image:url(/images/2017/layout/aws.png); background-repeat:no-repeat;background-size: 80%; width:230px; height:40px;}

</style>





<header id="header" class="header" style="height:127px; border:none;">
	<div class="headerTopbar">
		<div class="htbIN">
			<div>

			<a href="http://www.koreait.ac.kr/new/">
			<span><img style="float:left; margin-left:-220px;" src="/images/dasan/dasan_ci.png"/></span>
			</a>
				<!--<a href="#" class="login-btn">Login</a>-->

				<% If Not GetLoginCheckToBool() Then %>
					<a class="login-btn" href="<%=template_directory%>/mypage/login.asp?goURL=<%=Server.UrlEncode(Request.ServerVariables("PATH_INFO"))%>">Login</a>
<% Else %>
					<a class="login-btn" href="<%=template_directory%>/mypage/logout.asp">Logout</a>
<% End If %>



				<a href="http://haksa.koreait.kr/" target="_blank" class="srch-btn">한국IT학사정보시스템</a>
				<a href="http://eng.koreait.ac.kr/" target="_blank" class="srch-btn">ENGLISH</a>
				<!--<span><img src="/images/2020/headerTopBar-koreait-logo.png" alt="korea it logo" /></span>-->

			</div>
		</div>
	</div>

	<div class="gnbWrap">
		<div class="auto">

        <a href="http://www.koreait.ac.kr/new/board/pressboard.asp?code=con&id=1055&page=1">
	        <div class="amazon" style=""></div>
        </a>

                <h1 class="logo">
                    <a href="http://www.koreait.ac.kr/">
                        <img src="/images/2020/logo2020new.png">

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

		If CDbl(GlobalCategory_SEQ_NO) > 10 Then
			Exit For
		End If

		If Len(GlobalCategory_CATEGORY0) = 0 And Len(GlobalCategory_CATEGORY1) = 0 And Len(GlobalCategory_CATEGORY2) = 0 Then
			'If InStr(GlobalCategory_URL,"http://") = 0 Then
			'	GlobalCategory_URL = template_directory & GlobalCategory_URL
			'End If

			GlobalCategory_URL = GetGlobalCategoryUrl(GlobalCategory_URL)

			If CDbl(GlobalCategory_SEQ_NO) = 10  Then
'				Response.Write "<li class=""blind"">"
			Else
				Response.Write "<li>"
			End If

				Response.Write "<h2><a href=""" & GlobalCategory_URL & """>" & GlobalCategory_TITLE & "</a></h2>"
				Response.Write "<ul class=""sub"" style=""height:340px;"">"


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
						Elseif StrComp(GlobalCategory2_TITLE,"공지사항") <> 0 Then
							Response.Write "<li><h3><a href=""" & GlobalCategory2_URL & """>" & GlobalCategory2_TITLE & "</a></h3></li>"
						End IF

						if StrComp(GlobalCategory2_TITLE,"공지사항") = 0 Then
							Response.Write "<li><h3><a id=""qcy"" style=""color:#ffff65"" href=""" & GlobalCategory2_URL & """>" & GlobalCategory2_TITLE & "</a></h3></li>"
						end if

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


		</div>
	</div>

	<div class="bgSub" style="top:129px;">
		<div class="auto">
				<div class="gnbRecruit lazy" style="margin-left:-55px;">
					<div class="txtBoxTop">
						<!--<span class="txt01"><%=ArySelection(0).item("Study_year")%>학년도 신·편입생 모집</span>
						<span class="txt02"><strong><%=ArySelection(0).item("To_Date")%></strong><span>까지</span></span>-->

						 <span >

			<%

			Dim NowDate, NowYear, NowMonth, NowDay, NowHour, NowMinute, NowSecond,pk
			NowDate = Date()
			NowYear = Year(Date())
			NowMonth = Month(Date())
			NowDay = Day(Date())
			NextYear = NowYear+1




			if strcomp(ArySelection(0).item("Study_year"),"")<>0 then

			%>

            <span class="txt01"><%=ArySelection(0).item("Study_year")%>학년도 신·편입생 모집</span>

            <%
			else
			%>

			<span class="txt01"><%=NextYear%>학년도 신입생모집</span>

            <% end if%>



			<span class="txt02"><strong>

            <% if strcomp(ArySelection(0).item("To_Date"),"")<>0 then %>
					<%= ArySelection(0).item("To_Date")%>
            <% else
					NowDate+6
				end if
			%>

            </strong><span>까지</span></span>


					</div>
					<div class="txtBoxBottom">
						<p>수능/내신 미반영(계열별 면접 선발)</p>
						<p>면접&적성검사 100%선발</p>
						<!--<p>일본어 수업&선행학습 무료지원</p>-->
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



<script>

function apChk(){
$('#AptitudeIcon').click(function(){


// 		location.href="http://www.koreait.ac.kr/new/index.asp?ap=true";
		window.open("/inc/2017/inc_popup_main_utf8_new.asp","","channelmode");

	});
	}

</script>


<%if request("sk")="" then%>

	<div class="Aptitude">
			<img src="/images/2019/3ba.png" usemap="#Mapq">
			<map name="Mapq">
			  <area shape="rect" coords="5,4,175,63" href="http://www.koreait.ac.kr/new/index.asp?ap=chk">
			  <area shape="rect" coords="5,63,173,125" href="http://www.koreait.ac.kr/new/ad_lead/counsel_request_post.asp">
			  <area shape="rect" coords="4,130,174,197" href="http://www.koreait.ac.kr/new/board/eventboard.asp?code=con&id=740&page=1&tab=0">
			</map>

	</div>

<%else%>

<div class="Aptitude">
		<a href="http://www.koreait.ac.kr/new/index.asp?ap=true" >
			<div class="AptitudeWrap" id="AptitudeIcon" data-idx="1" ></div>
		</a>
	</div>



<%end if%>
