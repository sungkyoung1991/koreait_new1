<!-- #include virtual="/inc/Service_Inc.inc" -->
<!-- #include Virtual="/inc/2018/inc_html_head2020.inc" -->
<style>
    .paging{margin-bottom: 50px;}
</style>

<%
' 0 : Pname, Course
'희망학과(part)
Function GetPartListToArray(ByVal regyear)
	Dim SQL : SQL = "select distinct Pname, Course from dbo.ClassName where study_year='" & regyear & "' and scode='5' and Status='1' and pname != 'e-스포츠계열' order by Course"

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetPartListToArray = GetRowsQuery(CONNSTRING_WEB, SQL)
End Function

' 0 : PName, Hname
'희망학과(Course)
Function GetCourseListToArray(ByVal regyear)
	Dim SQL : SQL = "select PName, Hname from ClassName where Study_year='" & regyear & "' and scode='5' and Status='1' and pname != 'e-스포츠계열' order by orderby"

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetCourseListToArray = GetRowsQuery(CONNSTRING_WEB, SQL)
End Function

' 0 : From_To, Study_year, selection, From_Date, To_Date, Document, selection_pay, Pass_announce, Payment, RegType [9]
SelectionListToArray = GetSelectionListToArray()

If IsArray(SelectionListToArray) Then
	RegYear = SelectionListToArray(1)
	interviewtype = SelectionListToArray(2)
	regtype = SelectionListToArray(9)
Else
	RegYear = Year(Date())
	regMonth = Month(Date())
	If CDbl(regMonth) >= 3 Then
		RegYear = RegYear + 1
	End If

	regtype = 0
	interviewtype = ""
End IF
%>
<%
	Dim AryBanner : AryBanner = GetMobileBanner()

	Dim dorm_chk : dorm_chk = request("gubun")
%>

<!-- S: page -->
<!-- #include Virtual="/inc/2018/inc_body_header2020.inc" -->

<div id="subContents">
	<div data-role="page" class="slidePage" id="itstoryPage" data-next="" data-prev=""  data-defaults="ture" >
		<section class="sub_in_wrap">
		    <!--#include Virtual= "/inc/2018/inc_body_greetings_bannner.inc"-->
			<!--- contents start --->
			<!-- 고등학교 검색 인클루드 -->
			<!-- #include virtual="/common/HfindSchool_dialog.asp" -->

			<script type="text/javascript">
			$(document).ready(function() {
				$("#zipcode").on("click", function(e) {
					goJusoPopup();
				});
				$("#zip_btn").on("click", function(e) {
					e.preventDefault();
					goJusoPopup();
				});

				//계열선택
				$("select.select-part-course").change(function() {
					var index = $("select.select-part-course").index(this);
					var val = "";
					var $obj = $("option:selected", this).closest("optgroup");
					if ($obj.length == 1) {
						val = $obj.attr("label");
					}
					$("input.input-part").eq(index).val(val);
				}).trigger("change");
			});

			function SendFn() {
				var str;

				str = document.theForm.course1.value;
				if (str == "") {
					alert("관심전공을 선택해주세요");
					document.theForm.course1.focus();
					return;
				}

				str = document.theForm.name1.value;
				if (str == "") {
					alert("이름을 입력해주세요");
					document.theForm.name1.focus();
					return;
				}

				str = document.theForm.hp1.value;
				if (str == "") {
					alert("핸드폰 번호를 입력해주세요");
					document.theForm.hp1.focus();
					return;
				}

				str = document.theForm.hp2.value;
				if (str == "") {
					alert("핸드폰 번호를 입력해주세요");
					document.theForm.hp2.focus();
					return;
				}

				str = document.theForm.hp3.value;
				if (str == "") {
					alert("핸드폰 번호를 입력해주세요");
					document.theForm.hp3.focus();
					return;
				}

			//	str = document.theForm.Hname.value;
			//	if (str == "") {
			//		alert("출신고교를 입력해주세요");
			//		document.theForm.Hname.focus();
			//		return;
			//	}

				str = document.theForm.school_year.value;
				if (str == "") {
					alert("학년을 선택해주세요");
					document.theForm.school_year.focus();
					return;
				}

				if (document.theForm.email.value.length == 0) {
					alert ("이메일 주소를 입력해 주세요");
					document.theForm.email.focus();
					return;
				}

			//	str = document.theForm.Hname.value;
			//	if (str == "") {
			//		alert("고등학교를 입력해주세요");
			//		document.theForm.Hname.focus();
			//		return;
			//	}

				str = document.theForm.address1.value;
				if (str == "") {
					alert("주소를 입력해주세요");
					goJusoPopup();
					return;
				}

				str = document.theForm.address2.value;
				if (str == "") {
					alert("나머지 주소를 입력해주세요");
					document.theForm.address2.focus();
					return;
				}

				//document.theForm.action = "counsel_request_post_proc.asp";
				//document.theForm.submit();

				var url = $("#theForm").attr("action");
				var post = $("#theForm").attr("method");
				var params = $("#theForm").serialize();
				var targetID = "";
				var resultFn = "";


				ajaxSendParam(url, params, post, targetID, resultFn);
			}
			</script>


			<Form name="theForm" id="theForm" action="counsel_request_post_proc.asp" method="post">
			<div class="entrance pwrap" data-enhance="false">
			<h3 class="title frist" style="text-align:left;">본교의 입학자료를 보내드립니다.</h3>
				<table class="contentsTable inputForm" summary="신입생 원서접수 지원자 인적사항" >
					<caption>신입생 원서접수 지원자 인적사항</caption>
					<colgroup>
						<col width="25%">
						<col width="*">
					</colgroup>
					<tbody>
						<tr>
							<th class="txtLeft"><label for="course1" style="font-size:1.2rem;">관심계열</label></th>
							<td class="txtLeft">
			<%
			'지원학과 값 불러오기 - 2016.04.19
			PartListArray = GetPartListToArray(regyear) : CourseListArray = GetCourseListToArray(regyear)

			Response.Write "<input type=""hidden"" name=""regyear"" id=""regyear"" value=""" & regyear & """ />"
			Response.Write "<input type=""hidden"" name=""part1"" id=""part1"" class=""input-part"" value="""" />"
			Response.Write "<select name=""course1"" id=""course1"" class=""select-part-course"">"
			Response.Write "<option value="""">관심계열선택...</option>"

			If IsArray(PartListArray) Then
				For i = 0 To Ubound(PartListArray,2)
					' 0 : Pname, Course
					rs_pname = PartListArray(0,i)

					Response.Write "<optgroup label=""" & Replace(rs_pname, "스쿨", "계열") & """>"

					If IsArray(CourseListArray) Then
						For j = 0 To Ubound(CourseListArray,2)
							' 0 : PName, Hname
							rs_pname2 = CourseListArray(0,j)
							rs_hname2 = CourseListArray(1,j)

							If StrComp(rs_pname, rs_pname2) = 0 Then
								'Response.Write "<option value=""" & rs_hname2 & """> - " & Replace(rs_hname2,"전공","") & "</option>"
								Response.Write "<option value=""" & rs_hname2 & """> - " & Replace(Replace(rs_hname2,"시각디자인전공(3년제)","시각디자인"),"전공","") & "</option>"
							End If
						Next
					End If


					Response.Write "</optgroup>"
				Next
			End If

			Response.Write "</select>"
			%>

					</td>
				</tr>

				<tr>
				    <th class="txtLeft"><label for="name1" style="font-size:1.2rem;">이름 </label></th>
					<td class="txtLeft">
						<input id="name1" name="name1" value="" type="text" placeholder="한글성명을 입력해주세요." autocomplete="on" />
					</td>
					</tr>


					<tr>
						<th class="txtLeft">
						<label for="hp1" style="font-size:1.2rem;">휴대폰:</label></th>
						<td class="txtLeft">
						<span data-role="controlgroup" datatype="horizontal">
							<select name="hp1" id="hp1" class="in_talk" placeholder="휴대폰 앞번호를 입력해주세요." >
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>

							<label for="hp2"></label>
							<input name="hp2" type="tel" id="hp2" maxlength="4" placeholder="휴대폰 가운데번호를 입력해주세요." />

							<label for="hp3"></label>
							<input name="hp3" type="tel" id="hp3" maxlength="4" placeholder="휴대폰 뒷번호를 입력해주세요." />
						</span>
					</td>
					</tr>

					<tr>
						<th class="txtLeft">
						<label for="Hname" style="font-size:1.2rem;">고등학교:</label>
						</th>
							<td class="txtLeft">
							<dd>
								<!--<span data-role="controlgroup" datatype="horizontal">-->
                                <span>
									<input id="Hname" name="Hname" value="" type="text" placeholder="고등학교를 입력해주세요." maxlength="100" />
									<input name="Hcode" type="hidden" />
									<input name="Harea" type="hidden" />
										<!--<a href="#" class="btnZip btnSearch mr10 w20 gray2020" style="padding:0px; font:inherit;"  id="school_btn" data-enhance="false">검색</a>-->
								</span>
							</dd>
						<dd>
							<label for="school_year"></label>
							<span data-role="controlgroup" datatype="horizontal">
								<div style="padding-top:10px;">
									<select name="school_year" id="school_year">
										<option value="">== 학년 ==</option>
										<option value="중1학년">중1학년</option>
										<option value="중2학년">중2학년</option>
										<option value="중3학년">중3학년</option>
										<option value="고1학년">고1학년</option>
										<option value="고2학년">고2학년</option>
										<option value="고3학년">고3학년</option>
										<option value="검정고시">검정고시</option>
										<option value="외국계">외국계</option>
									</select>
								</div>
							</span>
							</dd>
						</td>
					</tr>
					<tr>
							<th class="txtLeft">
						<label for="email" style="font-size:1.2rem;">이메일:</label></th>
						<td class="txtLeft">
						<input id="email" name="email" value="" type="email"  placeholder="Email을 입력해주세요." />
						</td>
					</tr>

					<tr>
							<th class="txtLeft">
						<label for="zipcode" style="font-size:1.2rem;">주소:</label></th>
						<td class="txtLeft">
						<span data-role="controlgroup" datatype="horizontal">
							<div style="vertical-align:middle;height: 40px;">
								<div style="width:30%; float:left;margin-right:1rem;">
									<input name="zipcode" type="text" id="zipcode" style="width:70px;" data-inline="true" readonly />
								</div>

								<div class="ui-corner-all">
									<a href="#" title="우편번호검색"  data-role="button" data-theme="d" data-inline="true" data-mini="true" class="btnZip btnPost mb05" id="zip_btn">우편번호검색</a>
								</div>
							</div>

							<input name="address1" type="text" id="address1" maxlength="100" readonly title="주소입력: 일반주소" />
							<input name="address2" type="text" id="address2" maxlength="100"  title="주소입력: 상세주소" />
						</span>
						</td>
					</tr>
				</tbody>
			</table>
				<div class="btnWrap">
						<a class="btnReceipt gray2020" data-theme="b" data-icon="refresh" data-mini="true" onClick="location.reload();">새로작성</a>
						<a class="btnReceipt blue2020" data-theme="b" data-icon="check" data-mini="true" onClick="SendFn();">자료신청</a>
					</div>
			</div><!-- /자료신청 -->
			</form>

			<%
			table = "DataRequest2008"

			'Page 검사 - 2016.06.22
			If Not isNumeric(request("page")) Or request("page") = "" Or request("page") = "0" Then
				page = 1
			else
				page = request("page")
			end if

			session("page") = page

			subsql = " scode=5 And (deleter is null or deleter='' or deleter='[student]') And (regdatetemp Between 20160301000000 And CONVERT([bigint],CONVERT([varchar](8),getdate(),(112))+replace(CONVERT([varchar](8),getdate(),(114)),':',''),(0))) and name1<>'' "

			' 페이징 리스트
			' Set_PageSize : 페이지 사이즈
			' Set_PageNum : 현재페이지
			' Set_Field : 필드명
			' Set_Table : 테이블명
			' Set_Where : 검색조건
			' Set_OrderBy : 정렬조건
			' Set_PageCount : 전체페이지 갯수(반환)
			' Set_RecordCount : 전체리스트 갯수(반환)

			page_count = 5

			PageSize = 10
			PageNum = page

			Field = "name1, now1, send_check"
			WhereStr = subsql
			OrderBy = "Order by regdatetemp desc, seq desc"
			PageCount = 0 : RecordCount = 0

			'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
			rsArray = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, table, WhereStr, OrderBy, PageCount, RecordCount)

			If IsArray(rsArray) Then
			%>

			<!-- /신청리스트 -->
			<div id="questWrap">
				<div class="quest mt50 pwrap">
				<!-- 게시판 삽입 시작 -->
					<table class="contentsTable board_list" style="display:none;">
						<caption>게시판 리스트</caption>
						<colgroup>
							<col width="20%">
							<col width="*%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">이름</th>
								<th scope="col">신청일</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<%
						For i = 0 To UBound(rsArray,2)
							news = ""
							width = ""
							name = rsArray(0,i)
							'wdate = left(rsArray(1,i),13)
							wdate = rsArray(1,i)
							send_check = rsArray(2,i)

							If StrComp(send_check,1) = 0 Then
								send_check_str = "<span style=""font-weight:bold;letter-spacing:1px;"">발송</span>"
							Else
								send_check_str = "<span style=""color:#666;"">대기중</span>"
							End If
					%>
						<tr class="notice_list">
							<td><%=name%><%=news%></td>
							<td><%=wdate%></td>
							<td><%=send_check_str%></td>

						</tr>
					<%
						Next
					%>
					</table>
				</div>
			</div>

			<%'' Call PageCounterMobile(Page, PageCount, page_count,"", "") %>

			<% End If %>

			<!--- contents end ---->

			<!-- 팝업 -->
			<!--#include Virtual= "/inc/2018/inc_campus_pop.inc"-->
            <!-- footer (하단) -->
            <!--#include Virtual= "/inc/2018/inc_body_footer.inc"-->
		</section>
	</div>
</div>
<!-- page END-->

<!-- <script>
  fbq('track', 'ViewContent');
</script> -->

<!--푸터부분 인클루드-->
<!-- include virtual="/inc/inc_web_log_script_utf8.inc" -->

<script type='text/javascript' src='/js/2018/main.js'></script>
</body></html>
