<%
response.redirect "http://www.koreait.ac.kr/new/ad_lead/admission.asp"
%>

<%
category="8"
menu="1"
sub_menu="11"
title="s01_88"
%>
<!-- #include virtual="/_include/inc_header.asp" -->
<!-- #include file="../top.asp" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->
<%
'오늘 날짜 구하기.
YYYY	= Cstr(year(now))
MM	= Cstr(month(now))
DD	= Cstr(day(now))

if len(MM) = 1 then
  MM = "0" & MM
end if
if len(DD) = 1 then
  DD = "0" & DD
end if

YMD1 = YYYY &"-"& MM &"-"& DD

if MMDD > "0310" then
	Study_year = Cstr(YYYY+1)
else
	Study_year = Cstr(YYYY)
end if

sql = "select * from Selection where '"& YMD1 &"' between From_Date and To_Date"

set rs = conn.execute(sql)

if not rs.eof then
	Study_year = rs("Study_year")
	selection = rs("selection")
	If Left(selection,2)="수시" Then
	selection=Replace(selection,"수시","예비")
	ElseIf Left(selection,2)="정시" Then 
	selection=Replace(selection,"정시","")
	End If 
'	If Study_year="2013" And MM="03" And (DD>14 Or DD<26) Then	 '홍보부 모집일정 전에 모집한 경우 예비수시지원으로 표시	2012-03-26 JDS
'	selection	="예비"&selection
'	End If 
	From_Date = rs("From_Date")
	FD = split(From_Date,"-")
	From_Date = FD(0) &"년 "& Cint(FD(1)) &"월 "& Cint(FD(2)) &"일"
	To_Date = rs("To_Date")
	TD = split(To_Date,"-")
	if FD(0) <> TD(0) then
		To_Date =  TD(0) &"년 "& Cint(TD(1)) &"월 "& Cint(TD(2)) &"일"
	else
		To_Date =  Cint(TD(1)) &"월 "& Cint(TD(2)) &"일"
	end if
	From_To = From_Date &" ~ "& To_Date
	Document = rs("Document")
	selection_pay = rs("selection_pay")
	Pass_announce = rs("Pass_announce")
	Payment = rs("Payment")
end if

rs.close
set rs = nothing
%>
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
	if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
  	document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
	else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>


          	<!-- <table width="616" border="0" align="center" cellpadding="0" cellspacing="0">
            	<tr>
              	<td width="13">&nbsp;</td>
                <td><img src="images/title_1_1.gif"></td>
              	<td><div align="right"><img src="/images/common_icon_navi.gif" width="13" height="13" align="absmiddle">Home &gt; 입학안내 &gt; <strong>모집요강</strong></div></td>
            	</tr>
        		</table> -->
  
					<table width="616"  border="0" align="center" cellpadding="0" cellspacing="0">
     
				<tr id="tab01">
          <td>
						      			<table width="100%" border="0" cellspacing="0" cellpadding="0">
      				<tr>
      					<td height="60" valign="top">
      						<table width="100%" border="0" cellspacing="0" cellpadding="0">
      							<tr>
								<td>
				<ul class="tapButton3">
					<li class="on"><a href="javascript:;" onClick="hideshow('tab03','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab10');">입학문의처</a></li>
				</ul>
				</td>	
      								
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
									<div class="v3_subject1">2014학년도 신입생 모집요강<br><span  class="txt_blue_b">한국IT직업전문학교에서 2014학년도 신입생을 모집합니다. 학생 여러분의 꿈을 현실로 만들어 행복을 준비하시길 바랍니다.</span></div>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 전형일정</td></tr>
                    <tr>
											<td>
												<table id="v3">
													<tr>
                            <th class="topfirst">모집구분 </th>
                            <th class="topmenu">전형기간</th>
                            <th class="topmenu">합격자발표</th>
                            <th class="topmenu">서류제출</th>
                            <th class="toplast">등록금납부</th>
                          </tr>
                          <tr>
                            <td class="subfirst" style="text-align:center; height:100px;"><%=Study_year%>학년 신입생 모집</td>
                            <td class="span"><%=From_To%></td>
                            <td class="span"><%=Pass_announce%></td>
                            <td class="span"><%=Document%></td>
                            <td class="sublast" style="text-align:center; "><%=Payment%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;&nbsp;* 전형료 : <%=selection_pay%></td></tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td valign="top" style="padding-top:30px;">
									<%
									Set rs = Server.CreateObject("ADODB.Recordset")
									Set rsc = Server.CreateObject("ADODB.Recordset")

									Ssql = "select Pname, count(Hname) Hcnt, sum(jungwon1) Tjungwon,min(jungwon1) as jungwon1 ,min(degree) as degree , sum(orderby) orderby from dbo.ClassName"
									Ssql = Ssql & " where Study_year = '"& Study_year &"' and Course in ('1','2','3','6') and Status = '1'"
									Ssql = Ssql & " group by Pname order by orderby"

									rsc.Open Ssql, conn, 1, 1
									%>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> 모집학과 및 인원</td></tr>
              			<tr>
              				<td valign="top">
              					<table id="v3">
												
              						<tr>
              							<th class="topfirst">스 쿨</th>
              							<th class="topmenu">학 과</th>
														<th class="topmenu">학 위</th>
              							<th class="toplast">수시정원</th>
              						</tr>
	              					<%
	              					if not rsc.eof then
	              						do until rsc.eof
	              							
	              							Select Case rsc("Pname")
	              								Case "게임학부"
	              									homeurl = "/v3/school/game/"
																	Rname="게임스쿨"
	              								Case "정보보안학부"
	              									homeurl = "/v3/school/jungbo/"
																		Rname="정보보안스쿨"
	              								Case "디지털디자인학부"
	              									homeurl = "/v3/school/design/"
																		Rname="디지털디자인스쿨"
																	Case "스마트산업학부"
	              									homeurl = "/v3/school/smart/"
																		Rname="스마트산업스쿨"
	              							end Select
	              							
              								sql = "select * from dbo.ClassName"
              								sql = sql & " where Study_year = '"& Study_year &"' and Pname = '"& rsc("Pname") &"'"
              								sql = sql & " and Course in ('1','2','3','6') and Status = '1' order by orderby"
          										'response.write sql

															rs.Open sql, conn, 1, 1

															if not rs.eof then
              						%>
              						<tr>
              							<td rowspan="<%=rsc("Hcnt")%>"  class="td"><a href="<%=homeurl%>"><b><%=rsc("Pname")%></b></a></td>
              							<td><b><%=rs("Hname")%></b><br>
              								<% if not isnull(rs("Major")) and rs("Major") <> "" then response.write " ("& rs("Major") &")" end if %></td>
															<td><%=rs("degree")%></td>
                            <td class="span"><%=rsc("jungwon1")%></td>
                          </tr>
                          <%
                          			rs.movenext
                          			do until rs.eof
                          %>
                          <tr>
                          	<td><b><%=rs("Hname")%></b><br>
                          		<% if not isnull(rs("Major")) and rs("Major") <> "" then response.write " ("& rs("Major") &")" end if %></td>
															<td><%=rs("degree")%></td>
															<td class="span"><%=rsc("jungwon1")%></td>
                          </tr>
                          <%
                          				rs.movenext
                          			loop
                          		end if
                          		rs.close
                          		tot_jungwon = tot_jungwon + Cint(rsc("Tjungwon"))
                          		rsc.movenext
                        		loop
                        	%>
                        	<tr>
                            <td colspan="2" class="subfirst" style="text-align:center;"><b>예비수시정원</b></td>
                            <td></td>
														<td class="sublast" style="text-align:center;"><%=tot_jungwon%></td>
                          </tr>
                        	<%
                        	else
                        	%>
                        	<tr bgcolor="#FFFFFF">
                            <td height="30" colspan="3" align="center" class="txt_blue">등록 자료가 없습니다.</td>
                          </tr>
                          <%
                        	end if

                        	set rs = nothing
													rsc.close
													set rsc = nothing
                        	%>
                        </table>
                      </td>
                    </tr>
                  </table>

                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab03" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="54" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
            				<tr>
							<td>
				<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab03','tab01');">요강</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab04','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab10');">입학문의처</a></li>
				</ul>
				</td>	
            		
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class="v3_subject1"><img src="/images/point_red.gif"> <span  class="txt_blue_b">본교의 신입생 선발 기준은 획일화 된 수능과 내신성적이 아닌 학생의 잠재능력과 인성을 선발 기준으로 합니다.</span></td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 지원 자격</td></tr>
                    <tr>
                    	<td>
                    		<table id="v3">
                    			<tr>
                    				<th class="topfirst">구분</th>
                            <th class="toplast">내용</th>
                          </tr>
                          <tr>
                            <td class="td">고등학교 졸업(예정자)</td>
                            <td>고등학교 졸업자나 2014년 졸업 예정자</td>
                          </tr>
                          <tr>
                            <td class="td">검정고시 합격자</td>
                            <td>검정고시 합격증 제출</td>
                          </tr>
                          <tr>
                            <td class="td">타 대학 지원자 또는 합격자</td>
                            <td>타 대학 지원 시에도 복수지원 가능(등록자 포함)</td>
                          </tr>
                          <tr>
                            <td class="subfirst">타 대학 중퇴자,휴학자</td>
                            <td class="sublast">타 대학을 중퇴했거나 휴학중인 자</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr><td height="40">&nbsp;</td></tr>
                    <tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> 관련자격 및 경력우수자</td></tr>
                    <tr><td class="admission_bg01">
                    		<ul class="v3_frame">
													<li>● 각종 경진대회 입상자
													<li>● IT 관련 기업체에서 6개월 이상 근무자
													<li>● 국가기술자격증 기능사 이상 소지자
													<li>● 공인된 기관에서 봉사 활동한자
													<li>● 고교 담임교사 또는 교과목 담당교사의 추천을 받은자
												</ul>
												
												
										</td></tr>
                    <tr><td height="70">&nbsp;</td></tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab04" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="64" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
            				<tr>
            					<td>
				<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab04','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab03');">지원자격</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab05','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab10');">입학문의처</a></li>
				</ul>
				</td>	
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="616" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 입학특전</td></tr>
              			<tr>
              				<td class="admission_bg02">
                    		<ul class="v3_frame">
													<li style="height:130px;">
												</ul>
              				</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <!--tr><td height="30" valign="top"><img src="images/al_ad_04_stitle2.gif" width="133" height="17"></td></tr>
                    <tr>
                    	<td style="padding-left:20px">
                    		수시 1차 전형에 지원하여 최종 합격하여 등록을 마친 학생에게 지급되는 장학금으로 본교에
                        마련된 <br>
                        다양한 장학제도 중 하나입니다.
                      </td>
                    </tr-->
                    <tr>
                      <td align="right"><a href="/edu_intro/scholar.asp" target="_self"><img src="/ad_lead/images/al_ad_04_bt1.gif" width="86" height="18" border="0"></a></td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> 선행학습이란?</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	선행학습은 수시 합격생을 대상으로 진행되며 학과 특성에 맞는 자격증이나 기초과목에 대한 내용을<br>
                      	제공하는 온라인 강의입니다.<br>
                      	시간과 장소에 구애받지 않고 여유있는 시간에 학습할 수 있으며 이해가 가지 않는 부분은<br>
                      	담당 지도 교수님께 문의하여 다양한 도움을 받을 수 있는 사전학습 제도입니다.
                     	</td>
                    </tr>
                    <tr>
                      <td align="right"><a href="http://www.koreait.ac.kr/prestudyTest/mystudy.asp" target="_self"><img src="/ad_lead/images/al_ad_04_bt2.gif" width="69" height="18" border="0"></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab05" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
          		<tr>
          			<td height="64" valign="top">
          				<table width="100%" border="0" cellspacing="0" cellpadding="0">
          					<tr>
          						<td>
				<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab05','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab04');">특전</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab06','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab10');">입학문의처</a></li>
				</ul>
				</td>	
                     
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="616" border="0" cellspacing="0" cellpadding="0">
              			<tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> 전형방법</td></tr>
                    <tr><td class="admission_bg03">
                    		<ul class="v3_frame">
													<li style="height:130px;">
												</ul></td></tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 원서접수</td></tr>
                    <tr>
                      <td style="padding-left:20px">학교홈페이지<span class="txt_blue">(http://www.koreait.ac.kr</span>)을 통해 온라인 원서접수를 합니다.</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 면접일 확정</td></tr>
                    <tr>
                      <td style="padding-left:20px">입학상담자 전화를 통해 <span class="txt_blue">지원자가 편리한 날짜와 시간을 확정</span>합니다.</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 잠재능력 검사</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	학생 선발기준을 획일화된 성적보다 학생의 창의력,잠재능력 등을 최우선으로 적용하기 위한 검사로<br>
                        지원 학부 별로 시험 안이 준비되어 있으며 본인이 생각하는 다양한 아이디어를 자유롭게 기술하는 방식입니다.
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 입학상담/교수면접</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	면접 전 학사일정 및 수업시간, 학교시설 및 특징등 학생들이 개별적으로 궁금했던 내용들을 안내 받으실 수 있으며 상담 이후 해당 <span class="txt_blue">학부장님과 1:1 심층면접</span>이 진행됩니다.<br>
                        학과에 대한 적성 및 열의, 포부등을 보기 위한 면접이니 본인에 생각을 면접을 보시는 교수님께 잘 전달 할 수 있도록 준비하시면 됩니다.<br>
                        <br>
												<b>[ 스쿨별 전형방법 ]</b>
												<table id="v3">
													<tr>
                            <th class="topfirst" style="width:100px">스쿨 </th>
														<th class="topfirst" style="width:150px">학과 </th>
                            <th class="toplast">전형방법</th>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" rowspan="4">게임스쿨</td>
                            <td class="td" style="text-align:center;">게임기획</td>
                            <td>
															<ol>
																<li>1. 전공 관련 잠재 능력 검사 (40%)
																<li>2. 면접 시험 (50%)
																<li>3. 자기 소개서 작성하여 면접시 제출(10%)<div style="padding-left:15px;"> - 분량 A4 2~3장 내외<div>
															</ol>
														</td>
                          </tr>
													<tr>
                            <td class="td" style="text-align:center;">게임그래픽</td>
                            <td>
															<ol>
																<li>1. 전공 관련 잠재 능력 검사 (40%)
																<li>2. 면접 시험 (60%)
																<li>3. 포트폴리오 지참시 가산점 부여
															</ol>
														</td>
                          </tr>
													<tr>
                            <td class="td" style="text-align:center;">게임프로그래밍</td>
                            <td>
															<ol>
																<li>1. 전공 관련 잠재 능력 검사 (40%)
																<li>2. 면접 시험 (60%)
															</ol>
														</td>
                          </tr>
													<tr>
                            <td class="td" style="text-align:center;">게임마케팅</td>
                            <td>
															<ol>
																<li>1. 전공 관련 잠재 능력 검사 (40%)
																<li>2. 면접 시험 (60%)
																<li>3. 다양한 게임 플레이 이력 가산점 부여<div style="padding-left:15px;"> - (게임별 랭킹, 레벨)<div>
															</ol>
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >정보보안스쿨</td>
                            <td class="td" style="text-align:center;">융합컴퓨터보안학과(3년제)<br>컴퓨터보안학과<br>스마트보안학과<br>사이버포렌식학과<br>해킹바이러스대응학과</td>
                            <td>
															<ol>
																<li>1. 적성검사(20%) <div style="padding-left:15px;">:  학생의 창의력, 잠재능력 등을 최우선으로 적용하기 위한 검사</div>
																<li>2. 전공기초(20%) <div style="padding-left:15px;">: 보안 분야에 대한 기본 지식을 비롯한 최근 동향에 대한 관심도 측정을 위한 시험</div>
																<li>3. 면접(60%) <div style="padding-left:15px;">: 학업에 대한 목표나 열의 및 앞으로 학업 설계 등에 대한 평가<br>보안 전문가가 되기 위한 기본 마인드와 인성을 평가</div>
															</ol>
															
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">디지털디자인스쿨</td>
                            <td class="td" style="text-align:center;">시각디자인학과(3년제)<br>
														비쥬얼웹디자인학과<br>만화예술학과<br>일러스트레이션학과<br>디지털스토리텔링학과<br>방송콘텐츠학과
														</td>
                            <td>
															<ol>
																<li>1. 전공 관련 잠재 능력 검사 (40%)
																<li>2. 면접 시험 (60%)
																<li>3. 포트폴리오나 습작집 지참시 가산점 부여
															</ol>
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >스마트산업스쿨</td>
                            <td class="td" style="text-align:center;">스마트콘텐츠기획학과<br>스마트콘텐츠개발학과<br>정보통신학과<br>컴퓨터공학과</td>
                            <td>
															<ol>
																<li>1. 전공 관련 잠재 능력 검사 (40%)
																<li>2. 면접 시험 (60%)
															</ol>
														</td>
                          </tr>
                          <tr>
                            <td class="subfirst"  style="text-align:center;" colspan="2">전학과 공통</td>
                            <td class="sublast" >
															자격증 취득자의 경우 가산점 부여<br>
															공모전 당선자 가산점 부여
															<div style="padding-left:15px;"> - 관련 서류를 면접시 제출해야 함<div>
														</td>
                          </tr>
                        </table>
												<br>
												<b>[ 전형요소 별 성적 반영 방법 ]</b>   <br>
											① 각 전형요소 별 성적을 100점 만점으로 산출 한 후 점수 반영 <br>
											② 면접 시험 시에 각종 수상경력, 자격증사본, 작품 지참, 외국어 가능자 등은 적용기준에 의한 가산점 부여(10점 내외)  <br><br>
											<b>[ 자격증 점수 산정 기준 ]</b>
												<table id="v3">
													<tr>
                            <th class="topfirst" style="width:100px">자격증 </th>
														<th class="topfirst" style="width:150px">가산점 </th>
                            <th class="toplast" >기타</th>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >정보처리 기사<br>
													정보보안 기사<br>
													CISA<br>
													CISSP<br>
													CEH<br>
													CCNA</td>
                            <td class="td" style="text-align:center;">10점</td>
                            <td rowspan=4>
															이 외 자격증에 대해서는 자격증 난이도에 따라 부여
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >정보처리 산업기사<br>
														정보보안 산업기사<br>
														컴퓨터운용사<br>
														네트워크 관리사<br>
														컴퓨터 활용능력 1급</td>
                            <td class="td" style="text-align:center;">7점</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >컴퓨터 활용능력 2급<br>
													리눅스 마스터 1급</td>
                            <td class="td" style="text-align:center;">5점</td>
                          </tr>
                          <tr>
                            <td class="subfirst"  style="text-align:center;" >워드, MOS</td>
                            <td class="sublast" style="text-align:center;">3점
														</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 합격자 발표</td></tr>
                    <tr>
                      <td style="padding-left:20px">
												면접에 합격한 학생은 휴대폰 문자로 합격통보가 전송되며 <span class="txt_blue">홈페이지를 통해 합격조회가 가능</span>합니다.<br><br>
												<b>[ 최종 합격자 선발 방법 ]</b> <br>
											① 적성검사와 전공기초 시험, 면접시험 점수를 합산하여 60점 이상이어야 함(절대평가 기준에 의한 선발)   <br>
											② 정원 초과 일 경우 상위 점수 순서대로 선발 함   <br>
											③ 절대 평가 기준에 의하여 선발하므로 정원 충족이 되지 않더라도 총점 평균이 60점이하인 자는 선발하지 않음   <br><br>
														
											- 다음 각 호에 해당되는 자는 불합격 처리함   <br>
											① 지원 자격 미달자   <br>
											② 필기시험, 전공 기초 시험, 면접시험 중 하나의 고사라도 응시하지 않은 자   <br>
											③ 절대 평가 기준에 의한 총점이 60점 이상이라 하더라도 정원 초과 일 경우 상위 점수 순서에서 제외된 자 
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab06" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="64" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
            				<tr>
            					<td>
				<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab06','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab05');">전형방법</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab07','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab10');">입학문의처</a></li>
				</ul>
				</td>	
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="616" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 제출서류</td></tr>
                    <tr><td class="admission_bg04">
                    		<ul class="v3_frame">
													<li style="height:130px;">
												</ul></td></tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 사진/도장</td></tr>
                    <tr>
                      <td style="padding-left:20px">면접 일에 반명함판(3X4cm) 사진 2장과 본인 도장을 준비해 오시면 됩니다.</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 취득 자격증/상장</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	현재 취득한 자격증이나 상장을 가져오시면 됩니다.(원본 제출 시 복사 후 돌려드립니다.)<br>
                        만약 취득한 자격증이 없으시면 그냥 오시면 됩니다.
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> 열정적인 마음, 예의바른 태도</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	면접 시 가장 중요하게 여기는 것은 잠재된 여러분의 능력과 열정적인 마음입니다.<br>
                        또한 기본적인 예의는 꼭 챙기셔야겠지요^^
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab07" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="64" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
            				<tr>
            		<td>
					<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab07','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab06');">제출서류</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab08','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab10');">입학문의처</a></li>
				</ul></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td valign="top">
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> 등록금 안내</td></tr>
                    <tr><td class="admission_bg05">
                    		<ul class="v3_frame">
													<li style="height:130px;">
													<img src="/images/admission_bg05.jpg">
												</ul></td></tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> 합격자 발표</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	면접일을 기준하여 1주일 후 본교 홈페이지를 통해 합격조회가 가능하며 합격자에게는 개별 SMS 및 우편물이<br>
                      	발송됩니다.
                     	</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 합격 및 고지서 출력</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	1. 합격자는 본교 홈페이지를 통해 등록금고지서 및 합격통지서를 출력하시면 됩니다<br>
						2. 합격자에게는 합격우편물(등록금고지서 및 합격통지서,입학안내문)이 댁으로 발송됩니다.
						

                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> 등록금 납부</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	고지서에 기재된 납부기간 안에 등록금을 납부해주시면 됩니다.<br>
                      	<span class="txt_red">* 납부계좌번호 : 641-028873-13-101(우리은행) 예금주 : (재)다산인재개발원<br>
												<span style="padding-left:93px;">630-006752-196(외환은행) 예금주 : (재)다산인재개발원</span></span>
                      </td>
                    </tr>
                    <tr><td height="20" valign="top">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> 선행학습</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	학부 별로 입학식전까지 신입생들을 위한 선행학습이 이루어집니다. (수시전형 등록자 대상)<br>
                      	선행학습은 등록금 납부 후 교재가 우편으로 발송되며 홈페이지에 회원가입을 하셔야 권한이 부여됩니다.<br>
                      	선행학습 페이지를 통해 학습하시면 됩니다.
                     	</td>
                    </tr>
                    <tr><td height="20" valign="top">&nbsp;</td></tr>
                    <tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> 입학</td></tr>
                    <tr>
                      <td style="padding-left:20px">2014년 3월 입학식이 있을 예정이며 예비신입생들에게는 사전 전화 및 우편으로 공지합니다. </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab08" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="64" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
            				<tr>
            					<td>
								<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab08','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab07');">등록금안내</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab09','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab10');">입학문의처</a></li>
				</ul>
				</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> 지원자/합격자 유의사항</td></tr>
                    <tr>
                      <td>
												<ul class="v3_frame">
													<li>
														<table>
														<tr>
                            <td width="100" valign="top" class="v3_subject">지원자 유의사항</td>
                            <td>
                            	- 접수된 서류와 전형료는 반환하지 않습니다.<br>
                              - 기재착오,누락,오기 및 구비서류 미비 등의 사유로 발생하는 불이익에 대한 책임은 지원자에게 <br>
                              &nbsp;&nbsp; 있습니다.<br>
                              - 모든 기록사항은 기재요령에 의하여 정확히 기재하여야 합니다.<br>
                              - 원서 및 첨부서류에 허위 기재사실 기재하거나 기타 부정한 방법으로 합격 또는 신 입학한 사실이 <br>
                              &nbsp;&nbsp;확인될 경우에는 신 입학 전후는 물론 재학 중이라도 신 입학 허가를 취소할 수 있습니다.
                            </td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" valign="top"  class="v3_subject">합격자 유의사항</td>
                            <td>
                            	- 합격자는 기간 내에 입학금과 수업료를 납부하지 않을 경우 합격 취소될 수 있습니다.<br>
                              - 등록을 마친 자 중 본교에 입학포기 및 등록금 환불 요구 시에는 학교를 방문하여 입학포기서를 <br>
                              &nbsp;&nbsp;제출하여 환불 받을 수 있으며, 등록금 반환은 본교 학칙에 의거 처리합니다.
                            </td>
                          </tr>
													</table>
												</ul>

                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
				<tr id="tab09" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="64" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                   	<tr>
                   		<td>
						<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab09','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab08');">지원자/합격자유의사항</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab10','tab09');">개별학습과목개설정보</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab10');">입학문의처</a></li>
				</ul>
				</td>
                    </tr>
                  </table>
                </td>
              </tr>
                      <tr>
              	<td>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="v3_subject"><img src="/images/arrow_blue.gif"> 시간제 접수자를 위한 강좌 개설정보</td>
                    </tr>
										<tr>
											<td style="padding-left:20px">
                    		<ul class="v3_frame">
													<li>● 강좌는 매년 2회 개설됩니다
													<li>● 개설 강좌리스트는 매년 2월과 8월에 갱신됩니다
													<li>● 개설 강좌 상세 시간표와 접수문의는 02-578-2200으로 문의 주시기 바랍니다
												</ul>
											</td>
										</tr>
										<tr><td height="20">&nbsp;</td></tr>
										 <tr>
                      <td class=v3_subject><img src="/images/arrow_blue.gif"> 2013년 개설과목</td>
                    </tr>
                    <tr>
                      <td style="padding-left:20px">
												<ul class="v3_frame">
													<li>
														<table>
														<tr>
                            <td width="100" class="v3_subject">접수기간</td>
                            <td valign="top"  >
                            	<span class="txt_blue">2월중 
                            </td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" class="v3_subject" >개강일</td>
                            <td valign="top"  >2013년 3월 4일 일괄개강</td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" class="v3_subject" >종강일</td>
                            <td valign="top"  >2013년 6월15일 (15주수업)</td>
                          </tr>
													</table>
												</ul>

                      </td>
                    </tr>
                    <tr>
                    	<td style="padding-left:20px"><br>
                    		<table id="v3">
                    			<tr>
														<th class="topfirst" style="width:40px;">No</th>
                    				<th>과목명</th>
														<th style="width:40px;">No</th>
                            <th class="toplast">과목명</th>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">01.</td>
                            <td>2D컴퓨터그래픽</td>
														<td style="text-align:center;">32.</td>
                            <td>멀티미디어디자인I</td>
                          </tr>
                          <tr>
														<td class="td" style="text-align:center;">02.</td>
                            <td>3D컴퓨터애니메이션I</td>
														<td style="text-align:center;">33.</td>
                            <td>발상과표현</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">03.</td>
                            <td>3D퓨터애니메이션I</td>
														<td style="text-align:center;">34.</td>
                            <td>사무자동화실습</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">04.</td>
                            <td>AV디자인</td>
														<td style="text-align:center;">35.</td>
                            <td>시각디자인</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">05.</td>
                            <td>C언어I</td>
														<td style="text-align:center;">36.</td>
                            <td>아이디어발상</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">06.</td>
                            <td>PC활용I</td>
														<td style="text-align:center;">37.</td>
                            <td>암호학</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">07.</td>
                            <td>게임그래픽기초</td>
														<td style="text-align:center;">38.</td>
                            <td>암호학사포2A</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">08.</td>
                            <td>게임그래픽프로그래밍II</td>
														<td style="text-align:center;">39.</td>
                            <td>영상디자인스튜디오I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">09.</td>
                            <td>게임기획사례연구</td>
														<td style="text-align:center;">40.</td>
                            <td>운영체제</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">10.</td>
                            <td>게임기획사례연구</td>
														<td style="text-align:center;">41.</td>
                            <td>운영체제보안</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">11.</td>
                            <td>게임네트워크프로그래밍</td>
														<td style="text-align:center;">42.</td>
                            <td>운영체제실습</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">12.</td>
                            <td>게임마케팅</td>
														<td style="text-align:center;">43.</td>
                            <td>웹프로그래밍실습</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">13.</td>
                            <td>게임배경디자인</td>
														<td style="text-align:center;">44.</td>
                            <td>윈도우즈프로그래밍II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">14.</td>
                            <td>게임분석</td>
														<td style="text-align:center;">45.</td>
                            <td>윈도우즈프로그래밍실습II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">15.</td>
                            <td>게임비즈니스</td>
														<td style="text-align:center;">46.</td>
                            <td>인터넷보안</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">16.</td>
                            <td>게임시나리오</td>
														<td style="text-align:center;">47.</td>
                            <td>인터넷프로그래밍</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">17.</td>
                            <td>게임시스템구조</td>
														<td style="text-align:center;">48.</td>
                            <td>인터넷활용I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">18.</td>
                            <td>게임이팩트디자인</td>
														<td style="text-align:center;">49.</td>
                            <td>인터넷활용II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">19.</td>
                            <td>게임인터페이스디자인</td>
														<td style="text-align:center;">50.</td>
                            <td>인터페이스디자인</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">20.</td>
                            <td>게임캐릭터디자인</td>
														<td style="text-align:center;">51.</td>
                            <td>전산개론</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">21.</td>
                            <td>게임툴프로그래밍</td>
														<td style="text-align:center;">52.</td>
                            <td>전자계산기구조</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">22.</td>
                            <td>게임프로그래밍기초</td>
														<td style="text-align:center;">53.</td>
                            <td>정보보호개론</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">23.</td>
                            <td>게임학개론</td>
														<td style="text-align:center;">54.</td>
                            <td>침입차단시스템</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">24.</td>
                            <td>게임학개론</td>
														<td style="text-align:center;">55.</td>
                            <td>침입차단시스템사포2A</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">25.</td>
                            <td>기초디자인</td>
														<td style="text-align:center;">56.</td>
                            <td>컴퓨터그래픽I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">26.</td>
                            <td>데이터베이스</td>
														<td style="text-align:center;">57.</td>
                            <td>컴퓨터그래픽스I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">27.</td>
                            <td>디자인론</td>
														<td style="text-align:center;">58.</td>
                            <td>컴퓨터그래픽스II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">28.</td>
                            <td>디지털애니메이션Ⅰ</td>
														<td style="text-align:center;">59.</td>
                            <td>컴퓨터그래픽스II(Photoshop)</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">29.</td>
                            <td>디지털이미지처리</td>
														<td style="text-align:center;">60.</td>
                            <td>컴퓨터그래픽스III</td>
                          </tr>
													 <tr>
                            <td class="subfirst" style="text-align:center;">30.</td>
														<td>디지털일러스트레이션Ⅰ</td>
														<td style="text-align:center;">61. </td>
                            <td class="sublast">컴퓨터그래픽스IV</td>
                          </tr>
													<tr>
                            <td class="subfirst" style="text-align:center;">31.</td>
														<td>디지털조형</td>
														<td style="text-align:center;">62. </td>
                            <td class="sublast">표현기법</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>
					</td>
				</tr>
				<tr id="tab10" style="display:none;">
          <td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
            	<tr>
            		<td height="64" valign="top">
            			<table width="100%" border="0" cellspacing="0" cellpadding="0">
                   	<tr>
                   		<td>
						<ul class="tapButton3">
					<li><a href="javascript:;" onClick="hideshow('tab10','tab01');">요강</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab03');">지원자격</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab04');">특전</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab05');">전형방법</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab06');">제출서류</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab07');">등록금안내</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab08');">지원자/합격자유의사항</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab09');">개별학습과목개설정보</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab01','tab10');">입학문의처</a></li>
				</ul>
				</td>
                    </tr>
                  </table>
                </td>
              </tr>
			<tr>
              	<td>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="v3_subject"><img src="/images/arrow_blue.gif"> 입학문의처</td>
                    </tr>
                    <tr>
                      <td>
												<ul class="v3_frame">
													<li>
														<table>
														<tr>
                            <td width="100" valign="top" class="v3_subject">전화상담</td>
                            <td>
                            	<span class="txt_blue">입학관리과 : 02-578-5551&nbsp;&nbsp; fax :02-578-2720</span><br>
                              운영시간 : 오전 9시 ~ 오후 7시
                            </td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" valign="top"  class="v3_subject" >온라인 상담</td>
                            <td>
                            	<p>입학상담실 : <a href="/board_skin/sangdam_board/board_index.asp" target="_self">[바로가기</a>]<br>
                              <br>
                              <span class="txt_blue_b">실시간 상담이란? </span><br>
                              홈페이지 운영자와 자유로운 채팅 형식으로 입학에 관련한 문의를 할 수 있는 <br>
                              온라인 상담실입니다. 접속해 주시면 실시간으로 답변드립니다.</p>
                            </td>
                          </tr>
													</table>
												</ul>

                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
					</td>
				</tr>


     
			</table>
<!-- #include file="../bottom.asp" -->
<map name="Map">
  <area shape="rect" coords="-2,2,305,152" href="http://koreait.ac.kr/center_intro/game.asp" target="_parent">
  <area shape="rect" coords="310,1,622,152" href="http://koreait.ac.kr/center_intro/information.asp" target="_parent">
  <area shape="rect" coords="-14,159,202,353" href="http://koreait.ac.kr/center_intro/design.asp" target="_parent">
  <area shape="rect" coords="414,159,615,353" href="http://koreait.ac.kr/center_intro/beauty.asp" target="_parent">
</map>
