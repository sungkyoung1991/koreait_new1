<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->
<%
category="7"
menu="8"
sub_menu="1"

title_nm = "합격 확인"

Dim regyearChk:regyearChk = GetSelectionDateArrayToStr(0)
Dim regCostType, regCost, CostType

'완납 분납 체크
sql = "Select config_value From TBL_SIteConfig where gubun = 'haksa' AND config_nm = 'regcost' "

set regCost = conn.Execute(SQL)

if NOT regCost.bof or NOT regCost.eof Then
	regCostType = regCost("config_value")
END IF

%>

    <!-- include Virtual="/inc/2017/inc_html_head_utf8.inc" -->
    <!-- S: header 시작 -->
    <!-- include virtual="/inc/2017/inc_body_header_utf8.inc" -->
    <!-- E: header 종료 -->

    <!--2020-->
    <!-- #include Virtual="/inc/2017/inc_html_head_utf9.inc" -->
    <!-- #include virtual="/inc/2017/inc_body_header_utf9.inc" -->

	<!-- #include virtual="/inc/2017/subHeader.asp" -->
<script type="text/javascript">
function na_open_window(name, url, left, top, width, height, toolbar, menubar, statusbar, scrollbar, resizable) {
	toolbar_str = toolbar ? 'yes' : 'no';
	menubar_str = menubar ? 'yes' : 'no';
	statusbar_str = statusbar ? 'yes' : 'no';
	scrollbar_str = scrollbar ? 'yes' : 'no';
	resizable_str = resizable ? 'yes' : 'no';

	cookie_str = document.cookie;
	cookie_str.toString();

	pos_start  = cookie_str.indexOf(name);
	pos_end    = cookie_str.indexOf('=', pos_start);

	cookie_name = cookie_str.substring(pos_start, pos_end);

	pos_start  = cookie_str.indexOf(name);
	pos_start  = cookie_str.indexOf('=', pos_start);
	pos_end    = cookie_str.indexOf(';', pos_start);

	if (pos_end <= 0) pos_end = cookie_str.length;
	cookie_val = cookie_str.substring(pos_start + 1, pos_end);
	if (cookie_name == name && cookie_val  == "done")
	    return;

	window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);
}

$(document).ready(function(){
	setInterval(function() { $(".btn_pay").fadeOut('slow').fadeIn('slow'); },2000);
});
</script>

<div class="entrance">
<%
YYYY = year(now)
MMDD = CDbl(right(Replace(Left(now(),10),"-",""),4))

If MMDD > CDbl(REG_YEAR_LIMIT_1) Then
	If MMDD > CDbl(REG_YEAR_LIMIT_2) then
		regyear = YYYY + 1
		regyearStr = "'" & CStr(YYYY + 1) & "'"
	Else
		regyear = YYYY + 1
		regyearStr = "'" & CStr(YYYY + 1) & "','" & CStr(YYYY) & "'"
	End If
Else
	regyear = YYYY
	regyearStr = "'" & CStr(YYYY) & "'"
End If

jumin=XssFilter(request("jumin1")) & "-" & XssFilter(request("jumin2"))

'session("bbb") = bbb
jumin = Replace(jumin,"'","")
studentnum= XssFilter(request("studentnum"))
name = XssFilter(request("name"))
name = Replace(name,"'","")

sql = "select top 1 * from Student where regyear in (" & regyearStr & ") and studentnum = '"& Trim(studentnum) &"' and rtrim(ltrim(name)) = '"& Trim(name) &"' and (deleter = '' or deleter is null) and scode='5' "
sql = sql & "order by num desc"
'response.write sql
'response.end

set result = conn.Execute(SQL)

%>
	<form name="frm"  method="post"  action="entrance05_pass.asp">
		<input type="hidden" name="selectval">
		<input type="hidden" name="psnum">
	</form>

<% if result.bof or result.eof Then %>

<div class="passInquiryWrap">
		<div class="passInquiry passInquiry02 passInquiry03">
			<div class="inner">
				<div class="passInquiry02Top">
				<span class="title"><span class="blue name"><%=name%></span><span>학생의 작성 완료된 원서가 없습니다.</span></span>
					<p>
						다시한번 확인하시고 원서를 작성해 주시기 바랍니다.<BR>
						감사합니다.
                    </p>
				</div>
				<div class="passInquiry02Bottom">
					<ul style="width:100%">
						<li>
							<dl>
								<dt style="width:28%">입학상담 문의</dt>
								<dd >02-578-5551</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt style="width:25%">온라인 문의</dt>
								<dd >
									<a href="/new/board_skin/sangdam_board/board_index.asp">입학상담게시판 바로가기</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
   <div class="btnWrap">
		<a href="support_passnotice.asp" class="grey">돌아가기</a>
	</div>
<% Else %>
<%
'Select Case CStr(result("part1"))
'Case "디자인스쿨"
'	part1_url = "/new/school/design/"
'Case "게임스쿨"
'	part1_url = "/new/school/game/"
'Case "정보보안스쿨"
'	part1_url = "/new/school/security/"
'Case "스마트스쿨"
'	part1_url = "/new/school/smart/"
'Case "모바일스쿨"
'	part1_url = "/new/school/mobile/"
'Case Else
'	part1_url = "/new/school/"
'End Select
part1_url = "/new/school/"
%>
<%
'=========================================미발표========================================================
	if result("interviewresult") = "미발표" Or (result("interviewresult") = "합격" And result("regcostsdate") = "") then
%>

	<%If result("interviewresult") = "합격" And result("regcostsdate") = "" then%>
<div class="passInquiryWrap">
		<div class="passInquiry passInquiry02 passInquiry03">
			<div class="inner">
				<div class="passInquiry02Top">
				<span class="title"><span class="blue name"><%=result("name")%>학생</span><span>은 합격여부를 심사중입니다.</span></span>
				<p>
					다른문의사항은 입학처(02-578-5551)로 연학주시기바랍니다.<br>
					감사합니다.
                </p>
			</div>
				<div class="passInquiry02Bottom">
					<ul style="width:100%">
						<li>
							<dl>
								<dt style="width:28%">입학상담 문의</dt>
								<dd >02-578-5551</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt style="width:25%">온라인 문의</dt>
								<dd >
									<a href="/new/board_skin/sangdam_board/board_index.asp">입학상담게시판 바로가기</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%else%>

	<!-- 명단에 없을경우 -->
	<div class="passInquiryWrap">
		<div class="passInquiry passInquiry02 passInquiry03">
			<div class="inner">
				<div class="passInquiry02Top">
					<span class="title"><span class="blue name"><%=result("name")%>학생</span><span>은 면접예정자입니다.</span></span>
					<p>
					다른문의사항은 입학처(02-578-5551)로 연학주시기바랍니다<br>
					감사합니다.
                    </p>
				</div>
                <div class="passInquiry02Bottom">
					<ul style="width:100%">
						<li>
							<dl>
								<dt style="width:28%">입학상담 문의</dt>
								<dd >02-578-5551</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt style="width:25%">온라인 문의</dt>
								<dd >
									<a href="/new/board_skin/sangdam_board/board_index.asp">입학상담게시판 바로가기</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%End if%>
	<div class="btnWrap">
	<a href="<%=part1_url%>" class="btnReceipt blue">학부소개로 가기</a>
	&nbsp;<a href="support_passnotice.asp" class="btnReceipt lightGray">다시 조회하기</a>
	</div>
	<!-- 끝 -->

	<% elseIf result("interviewresult") = "합격" And result("regcostsdate") <> "" And result("regcostedate") <> "" Then

	'If IsDate(result("interviewdate")) And CDbl(Replace(result("interviewdate"),"-","")) < CDbl((regyear - 1) & "1031") And StrComp(regyear-1,Year(Date())) = 0 Then
		'PopUrl = "/renewal/02_enter/passlook2.asp"
		'PopUrl = "support_passnotice_print1.asp"
	'Else
		'PopUrl = "/renewal/02_enter/passlook1.asp"
		'PopUrl = "support_passnotice_print2.asp"
	'End If

	'3개 학교 통합 지원	2011-08-08
	part1 = result("part1")

	If Left(result("part1"),6)="공동학위과정" Then

		entrance_money="300000"
		entrance_money_label="삼십만원"

		student_money="30000"
		student_money_label="삼만원"

		lesson_money="4500000"
		lesson_money_label="사백오십만원"
		lesson_money1="4500000"
		lesson_money1_label="사백오십만원"
		lesson_money2="4500000"
		lesson_money2_label="사백오십만원"

		total_money="4500000"
		total_money_label="사백오십만원"
		total_money1="4500000"
		total_money1_label="사백오십만원"
		total_money2="4500000"
		total_money2_label="사백오십만원"

		'은행계좌#1
		bank1_name = KOREA_IT_BANK1_NAME
		bank1_number = KOREA_IT_BANK1_NUMBER
		bank1_person = KOREA_IT_BANK1_PERSON

		'은행계좌#2
		bank2_name = KOREA_IT_BANK2_NAME
		bank2_number = KOREA_IT_BANK2_NUMBER
		bank2_person = KOREA_IT_BANK2_PERSON

		'total_money_rmk="분납금 150만원"
		IF strComp(result("regyear"),2021) = 0 Then
		total_money_rmk = "총 등록금 450만원"
		Else
		total_money_rmk = "총 등록금 450만원"
		END IF

	Else

		entrance_money="300000"
		entrance_money_label="삼십만원"

		student_money="30000"
		student_money_label="삼만원"

		'은행계좌#1
		bank1_name = KOREA_IT_BANK1_NAME
		bank1_number = KOREA_IT_BANK1_NUMBER
		bank1_person = KOREA_IT_BANK1_PERSON

		'은행계좌#2
		bank2_name = KOREA_IT_BANK2_NAME
		bank2_number = KOREA_IT_BANK2_NUMBER
		bank2_person = KOREA_IT_BANK2_PERSON

		'total_money_rmk = "분납금 150만원"

		IF strComp(result("regyear"),2022) = 0 Then
			lesson_money="4500000"
			lesson_money_label="사백오십만원"
			lesson_money1="4500000"
			lesson_money1_label="사백오십만원"
			lesson_money2="4500000"
			lesson_money2_label="사백오십만원"

			total_money="4500000"
			total_money_label="사백오십만원"
			total_money1="4500000"
			total_money1_label="사백오십만원"
			total_money2="4500000"
			total_money2_label="사백오십만원"

			total_money_rmk = "총 등록금 450만원"
		Else
			lesson_money="4500000"
			lesson_money_label="사백오십만원"
			lesson_money1="4500000"
			lesson_money1_label="사백오십만원"
			lesson_money2="4500000"
			lesson_money2_label="사백오십만원"

			total_money="4500000"
			total_money_label="사백오십만원"
			total_money1="4500000"
			total_money1_label="사백오십만원"
			total_money2="4500000"
			total_money2_label="사백오십만원"
			total_money_rmk = "총 등록금 450만원"
		END IF
	End If

	'response.write Result("interviewresultdate")
	%>

	<!-- 합격일경우 -->
  <!--  regyearChk : <%=regyearChk%> , regyear : <%=result("regyear")%>, total_money : <%=total_money%> -->
	<div class="passInquiryWrap">
		<div class="passInquiry passInquiry02">
			<div class="inner">
				<div class="passInquiry02Top">
					<span class="title"><span class="blue name"><%=name%></span><span>학생은 <%=result("part1")%>에 합격하셨습니다. </span></span>
                    <p>
						하단의 등록금고지서 출력 버튼을 누르시면 합격 통지서와 등록금 납입통지서를 보다 신속하고 안전하게 <br>
						확인할 수 있습니다. 다시 한번 합격을 진심으로 축하 드립니다.
					</p>
				</div>
				<div class="passInquiry02Bottom">
                <ul>
						<li>
							<dl>
								<dt>합격전공</dt>
								<dd><%=result("course1")%></dd>
							</dl>
						</li>

						<%
						PopUrl_1 = "support_passnotice_print1.asp"
						PopUrl_2 = "support_passnotice_print2.asp"

						select case result("regcoststatus")
							case "분납"
								'pay_status = "1"
'								CostType = "분납금"
'								If result("regyear") = 2021 Then
'									IF StrComp(regCostType, "완납") = 0 Then
'										pay_money = total_money2
'										pay_money_label = total_money2_label
'									Else
'										pay_money = lesson_money1
'										pay_money_label = total_money1_label
'									END IF
'								Else
'									pay_money = total_money
'									pay_money_label = total_money_label
'								END IF
'								regcostsdate = result("regcostsdate")
'								regcostedate = result("regcostedate")
'								PopUrl = "support_passnotice_print1.asp"

								pay_status = "0"
								'pay_money = total_money1
								'pay_money_label = total_money1_label
								If result("regyear") = regyearChk Then
									IF StrComp(regCostType, "완납") = 0 Then
										pay_money = total_money
										pay_money_label = total_money_label
										CostType = "등록금"
									Else
										pay_money = total_money1
										pay_money_label = total_money1_label
										CostType = "완납금"
									END IF
								Else
									pay_money = total_money
									pay_money_label = total_money_label
									CostType = "등록금"
								END IF
								regcostsdate = result("regcostsdate")
								regcostedate = result("regcostedate")
								PopUrl = "support_passnotice_print1.asp"


							case "미납"
								pay_status = "0"
								'pay_money = total_money1
								'pay_money_label = total_money1_label
								If result("regyear") = regyearChk Then
									IF StrComp(regCostType, "완납") = 0 Then
										pay_money = total_money
										pay_money_label = total_money_label
										CostType = "등록금"
									Else
										pay_money = total_money1
										pay_money_label = total_money1_label
										CostType = "완납금"
									END IF
								Else
									pay_money = total_money
									pay_money_label = total_money_label
									CostType = "등록금"
								END IF
								regcostsdate = result("regcostsdate")
								regcostedate = result("regcostedate")
								PopUrl = "support_passnotice_print1.asp"
							case "완납"
								pay_status = "2"
							case "환불"
								pay_status = "3"
						end select

						select Case cstr(pay_status)
							' =========== 미납, 분납 ===========
							case "0","1"
							%>
						<li>
							<dl>
								<dt>등록금</dt>
								<dd>
                                	<%If result("regyear") = regyearChk Then %>
									<span><%=name%>학생이 납부하셔야 할 <%=CostType%>은</span>
                                    <!--<span><%=name%>학생이 납부하셔야 할 등록금은</span> -->
                                    <%Else%>
									<span><%=name%>학생이 납부하셔야 할 <%=CostType%>은</span>
									<!--<span><%=name%>학생이 납부하셔야 할 등록금은</span>-->
                                    <%END IF%>
                                    <span class="blue"><%=FormatNumber(pay_money,0)%>원</span>(<%=pay_money_label%>)<span>이며</span>
                                    <!--<span class="blue">4,100,000원</span>(사백십만원)<span>이며</span>-->
									<span class="blue"><%=regcostsdate%> ~ <%=regcostedate%>까지</span>
									<span>아래에 있는 계좌로 입금 하시면 됩니다.</span>
								</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt>계좌번호</dt>
								<dd>
									예금주: ( 재)한국아이티교육재단 <br>
									<%=bank1_number%> (<%=bank1_name%>)
									<%If bank2_number<>"" Then %>
									 /
									<%=bank2_number%> (<%=bank2_name%>)
									<% End If %>
								</dd>
							</dl>
						</li>
						<li>
                        	<dl>
                            	<dt>비고</dt>
                                <dd>
                                	다시 한번 합격을 진심으로 축하 드립니다. 감사합니다.<br>
                                    <br>
                                    <div class="font-c-r">* 아래의
									<% if pay_status="1" then %>
                                    <a href="javascript:na_open_window('passlook', '<%=PopUrl_2%>?studentnum=<%=result("studentnum")%>', 0, 0, 710, 1200, 0, 0, 0, 0, 0);" title="완납 고지서 출력" class="blue">고지서 출력하기</a>를 누르시면 잔여금 납부와 합격 통지서를 보다 신속하고 안전하게 확인할 수 있습니다.
									<% end if %>
									<% if pay_status="0" then %>
                                    <a href="javascript:na_open_window('passlook', '<%=PopUrl_2%>?studentnum=<%=result("studentnum")%>', 0, 0, 710, 1200, 0, 0, 0, 0, 0);" title="완납 고지서 출력" class="blue">
                                   		<%=replace(CostType,"등록금", "완납")%> 고지서 출력하기
                                    </a> <%IF Strcomp(CostType,"등록금") = 0 Then%>를 누르시면 합격 통지서와 등록금 납입통지서를 보다 신속하고 안전하게 확인할 수 있습니다.
                                    <%Else %>
                                    	고지서 출력하기</a>를 누르시면 잔여금 납부와 합격 통지서를 보다 신속하고 안전하게 확인할 수 있습니다.
                                        <%END IF%>
									<% end if %>
									</div>
                                </dd>
                            </dl>
                        </li>
							<%
							' =========== 완납 ===========
							case "2"
							%>
						<li>
							<dl>
								<dt>등록금</dt>
								<dd>
									<span><%=name%>학생은 등록금을 (<%=total_money_rmk%>)완납 하셨습니다.</span>
								</dd>
							</dl>
						</li>
						<li>
                        	<dl>
                            	<dt>비고</dt>
                                <dd>
                                	다시 한번 합격을 진심으로 축하 드립니다. 감사합니다.<br>
                                </dd>
                            </dl>
                        </li>
							<%
							' =========== 환불 ===========
							case "3"
							%>
						<li>
							<dl>
								<dt>등록금</dt>
								<dd>
									<span><%=name%>학생은 등록금을 환불 하셨습니다.</span>
								</dd>
							</dl>
						</li>
						<%
						end select
						%>

					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="btnWrap">
	<% if pay_status="1" or pay_status="1" then %>
    <a href="javascript:na_open_window('passlook', '<%=PopUrl_1%>?studentnum=<%=result("studentnum")%>', 0, 0, 710, 1200, 0, 0, 0, 0, 0);" title="완납 고지서 출력" class="blue"><span class="btn_pay">고지서 출력하기</span></a>
	<% end if %>

	<% if pay_status="0" then %>
    	<a href="javascript:na_open_window('passlook', '<%=PopUrl_2%>?studentnum=<%=result("studentnum")%>', 0, 0, 710, 1200, 0, 0, 0, 0, 0);" title="완납 고지서 출력" class="red" style="color:white;">
        	<span class="btn_pay"><%=replace(CostType,"등록금", "완납")%> 고지서 출력하기</span>
            <!--<span class="btn_pay">고지서 출력하기</span>-->
        </a>
	<% end if %>
    <a href="<%=part1_url%>" target="_blank" title="새로작성" class="grey">계열소개로 가기</a>
    </div>

	<!--끝-->
	<%
'==========================================예비합격=======================================================
	elseIf result("interviewresult") = "예비합격" then  '2012-08-20	 예비합격 추가 , 김홍진학장 요청사항
	%>

	<!-- 예비합격일경우 -->
	<div class="passInquiryWrap">
		<div class="passInquiry passInquiry02 passInquiry03">
			<div class="inner">
				<div class="passInquiry02Top">
					<span class="title"><span class="blue name"><%=name%></span><span>학생은 예비합격자 대상자입니다.</span></span>
                    <p>
					현재 담당 학부에서 합격유무를 검토중입니다.<BR>
					합격생발표는 개별통보 드리도록 하겠습니다. <br>
					감사합니다.
                    </p>
                </div>
			<div class="passInquiry02Bottom">
					<ul style="width:100%">
						<li>
							<dl>
								<dt style="width:28%">입학상담 문의</dt>
								<dd >02-578-5551</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt style="width:25%">온라인 문의</dt>
								<dd >
									<a href="/new/board_skin/sangdam_board/board_index.asp">입학상담게시판 바로가기</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="btnWrap">
	<a href="<%=part1_url%>" class="btnReceipt blue">학부소개로 가기</a>
	&nbsp;<a href="support_passnotice.asp" class="btnReceipt lightGray">다시 조회하기</a>
	</div>
	<!--끝-->

	<%
'==========================================불합격=======================================================
	elseIf result("interviewresult") = "불합격" then
	%>

	<!-- 불합격일경우 -->
	<div class="passInquiryWrap">
		<div class="passInquiry passInquiry02 passInquiry03">
			<div class="inner">
				<div class="passInquiry02Top">
					<span class="title"><span class="blue name"><%=name%></span><span>학생은 아쉽게도 합격자 명단에 성함이 없습니다.</span></span>
                  <!--  <p>
					추후진행되는 전형에 다른스쿨로의 재지원이 가능합니다.<BR>
					감사합니다.
                    </p>-->
				</div>
				<div class="passInquiry02Bottom">
					<ul style="width:100%">
						<li>
							<dl>
								<dt style="width:28%">입학상담 문의</dt>
								<dd >02-578-5551</dd>
							</dl>
						</li>
						<li>
							<dl>
								<dt style="width:25%">온라인 문의</dt>
								<dd >
									<a href="/new/board_skin/sangdam_board/board_index.asp">입학상담게시판 바로가기</a>
								</dd>
							</dl>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="btnWrap">
	<a href="<%=part1_url%>" class="btnReceipt blue">학부소개로 가기</a>
	&nbsp;<a href="support_passnotice.asp" class="btnReceipt lightGray">다시 조회하기</a>
	</div>
	<!--끝-->

	<%End if%>
<%End if%>
</div>


	<!--#include Virtual= "/inc/2017/subFooter.asp"-->
    <!-- footer (하단) -->
    <!--#include Virtual= "/inc/2017/inc_body_footer_utf8.inc"-->
