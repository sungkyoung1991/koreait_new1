


<div class="footerTelWrap">
	<div>
		<a href="tel:025782200" class="btnMainTel btnMainTel01">
		<img src="/images/2020/tel_ban01.jpg" />
			<!--<span class="telIcon"><img class="lazy" src="/images/2020/tel_ban01.jpg" alt="재학생 문의"></span>
			<span class="telTit">재학생 문의</span><br>02-578-2200-->
		</a>
		<a href="tel:025785551" class="btnMainTel btnMainTel02">
			<img src="/images/2020/tel_ban02.jpg" />
			<!--<span class="telIcon"><img class="lazy" src="/images/2020/tel_ban02.jpg" alt="신입학상담문의"></span>
			<span class="telTit">신입학상담문의</span><br>02-578-5551-->
		</a>
	</div>
</div>

<footer id="footer">
	<address>
		<p>(06751) 서울특별시 서초구 바우뫼로 87 (양재동 145-5)</p>
		<p>(재)한국아이티교육재단  229-82-01663</p>
		<p>통신판매업신고번호: 제 2005-07099호 </p>
		<p>대표자 : 김명용 / 개인정보관리책임자 : 김영일</p>
		<p>Tel : 02-578-5551 / Fax : 02-578-9866</p>
		<p class="copyright">COPYRIGHT ⓒ 2018 DASAN HRD Foundation. ALL RIGHTS RESERVED</p>
	</address>
	<ul class="footerBtn">
			<li><a href="http://www.koreait.ac.kr/new/?m=web">PC버전</a></li>
			<li><a href="javascript:;" class="btn_top">맨위로</a></li>
		</ul>
</footer>

<%
'원서접수 일자
Function GetSelectionDateAry(ByVal sch, ByVal Set_type)
 	Dim AryHash
 	Set AryHash = new RsToHashMap

 sql = " HAkSA_원서접수일정_조회_L @mode='test2', @type='" & Set_type & "' "

   ' response.write " sk : " & sql


 	GetSelectionDateAry = AryHash.GetRowsQuery(CONNSTRING_WEB, sql)

END Function

Dim Selection : Selection = GetSelectionDateAry("Selection", 102)
%>



<div class="apply">

	<div class="applyWrap">

	<dl>
		<dt>
			<span class="year" style="margin-left:5px;">
				<!--<%=GetSelectionDateArrayToStr(0)%>-->
				2022
				<strong>
					<ruby>

						신
						<rt>
							<span class="dot"></span>
						</rt>

						·
						<rt>
							<span class="dot"></span>
						</rt>

						편
						<rt>
							<span class="dot"></span>
						</rt>

						입
						<rt>
							<span class="dot"></span>
						</rt>

						생
						<rt>
							<span class="dot"></span>
						</rt>

					</ruby>
				</strong> 모집 중
			</span>
		</dt>
		<dd style="margin-left:5px">
			<strong><%=GetSelectionDateArrayUTF8ToStr(3)%></strong> 까지
		</dd>
	</dl>


	</div>

			<div class="btnWrap">





       <a class="entrance" href="/2018/2020_application.asp" data-rel="external" data-ajax="false">
				예비 고3<br>우선선발
			</a>

<!--
		 <a class="entrance" href="/2018/2020_reference.asp" data-rel="external" data-ajax="false">
				입학자료<br>신청하기
			</a> -->


				<a style="margin-top:0px; margin-right:5px; color:white;" href="/2018/2020_application.asp" data-rel="external" data-ajax="false">
					원서접수<br>바로가기
				</a>



			<a style="color:white; " class="entrance2" href="/2018/2020_check.asp" data-rel="external" data-ajax="false">
				신입생 등록금<br>조회하기
			</a>

		</div>
</div>

<!--#include Virtual= "/inc/2018/inc_body_popup.inc"-->
