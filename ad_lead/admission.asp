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
'���� ��¥ ���ϱ�.
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
	If Left(selection,2)="����" Then
	selection=Replace(selection,"����","����")
	ElseIf Left(selection,2)="����" Then 
	selection=Replace(selection,"����","")
	End If 
'	If Study_year="2013" And MM="03" And (DD>14 Or DD<26) Then	 'ȫ���� �������� ���� ������ ��� ��������������� ǥ��	2012-03-26 JDS
'	selection	="����"&selection
'	End If 
	From_Date = rs("From_Date")
	FD = split(From_Date,"-")
	From_Date = FD(0) &"�� "& Cint(FD(1)) &"�� "& Cint(FD(2)) &"��"
	To_Date = rs("To_Date")
	TD = split(To_Date,"-")
	if FD(0) <> TD(0) then
		To_Date =  TD(0) &"�� "& Cint(TD(1)) &"�� "& Cint(TD(2)) &"��"
	else
		To_Date =  Cint(TD(1)) &"�� "& Cint(TD(2)) &"��"
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
              	<td><div align="right"><img src="/images/common_icon_navi.gif" width="13" height="13" align="absmiddle">Home &gt; ���оȳ� &gt; <strong>�����䰭</strong></div></td>
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
					<li class="on"><a href="javascript:;" onClick="hideshow('tab03','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab01','tab10');">���й���ó</a></li>
				</ul>
				</td>	
      								
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
									<div class="v3_subject1">2014�г⵵ ���Ի� �����䰭<br><span  class="txt_blue_b">�ѱ�IT���������б����� 2014�г⵵ ���Ի��� �����մϴ�. �л� �������� ���� ���Ƿ� ����� �ູ�� �غ��Ͻñ� �ٶ��ϴ�.</span></div>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ��������</td></tr>
                    <tr>
											<td>
												<table id="v3">
													<tr>
                            <th class="topfirst">�������� </th>
                            <th class="topmenu">�����Ⱓ</th>
                            <th class="topmenu">�հ��ڹ�ǥ</th>
                            <th class="topmenu">��������</th>
                            <th class="toplast">��ϱݳ���</th>
                          </tr>
                          <tr>
                            <td class="subfirst" style="text-align:center; height:100px;"><%=Study_year%>�г� ���Ի� ����</td>
                            <td class="span"><%=From_To%></td>
                            <td class="span"><%=Pass_announce%></td>
                            <td class="span"><%=Document%></td>
                            <td class="sublast" style="text-align:center; "><%=Payment%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;&nbsp;* ������ : <%=selection_pay%></td></tr>
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
              			<tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> �����а� �� �ο�</td></tr>
              			<tr>
              				<td valign="top">
              					<table id="v3">
												
              						<tr>
              							<th class="topfirst">�� ��</th>
              							<th class="topmenu">�� ��</th>
														<th class="topmenu">�� ��</th>
              							<th class="toplast">��������</th>
              						</tr>
	              					<%
	              					if not rsc.eof then
	              						do until rsc.eof
	              							
	              							Select Case rsc("Pname")
	              								Case "�����к�"
	              									homeurl = "/v3/school/game/"
																	Rname="���ӽ���"
	              								Case "���������к�"
	              									homeurl = "/v3/school/jungbo/"
																		Rname="�������Ƚ���"
	              								Case "�����е������к�"
	              									homeurl = "/v3/school/design/"
																		Rname="�����е����ν���"
																	Case "����Ʈ����к�"
	              									homeurl = "/v3/school/smart/"
																		Rname="����Ʈ�������"
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
                            <td colspan="2" class="subfirst" style="text-align:center;"><b>�����������</b></td>
                            <td></td>
														<td class="sublast" style="text-align:center;"><%=tot_jungwon%></td>
                          </tr>
                        	<%
                        	else
                        	%>
                        	<tr bgcolor="#FFFFFF">
                            <td height="30" colspan="3" align="center" class="txt_blue">��� �ڷᰡ �����ϴ�.</td>
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
					<li><a href="javascript:;" onClick="hideshow('tab03','tab01');">�䰭</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab04','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab03','tab10');">���й���ó</a></li>
				</ul>
				</td>	
            		
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class="v3_subject1"><img src="/images/point_red.gif"> <span  class="txt_blue_b">������ ���Ի� ���� ������ ȹ��ȭ �� ���ɰ� ���ż����� �ƴ� �л��� ����ɷ°� �μ��� ���� �������� �մϴ�.</span></td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ���� �ڰ�</td></tr>
                    <tr>
                    	<td>
                    		<table id="v3">
                    			<tr>
                    				<th class="topfirst">����</th>
                            <th class="toplast">����</th>
                          </tr>
                          <tr>
                            <td class="td">����б� ����(������)</td>
                            <td>����б� �����ڳ� 2014�� ���� ������</td>
                          </tr>
                          <tr>
                            <td class="td">������� �հ���</td>
                            <td>������� �հ��� ����</td>
                          </tr>
                          <tr>
                            <td class="td">Ÿ ���� ������ �Ǵ� �հ���</td>
                            <td>Ÿ ���� ���� �ÿ��� �������� ����(����� ����)</td>
                          </tr>
                          <tr>
                            <td class="subfirst">Ÿ ���� ������,������</td>
                            <td class="sublast">Ÿ ������ �����߰ų� �������� ��</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr><td height="40">&nbsp;</td></tr>
                    <tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> �����ڰ� �� ��¿����</td></tr>
                    <tr><td class="admission_bg01">
                    		<ul class="v3_frame">
													<li>�� ���� ������ȸ �Ի���
													<li>�� IT ���� ���ü���� 6���� �̻� �ٹ���
													<li>�� ��������ڰ��� ��ɻ� �̻� ������
													<li>�� ���ε� ������� ���� Ȱ������
													<li>�� �� ���ӱ��� �Ǵ� ������ ��米���� ��õ�� ������
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
					<li><a href="javascript:;" onClick="hideshow('tab04','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab03');">�����ڰ�</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab05','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab04','tab10');">���й���ó</a></li>
				</ul>
				</td>	
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="616" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ����Ư��</td></tr>
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
                    		���� 1�� ������ �����Ͽ� ���� �հ��Ͽ� ����� ��ģ �л����� ���޵Ǵ� ���б����� ������
                        ���õ� <br>
                        �پ��� �������� �� �ϳ��Դϴ�.
                      </td>
                    </tr-->
                    <tr>
                      <td align="right"><a href="/edu_intro/scholar.asp" target="_self"><img src="/ad_lead/images/al_ad_04_bt1.gif" width="86" height="18" border="0"></a></td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> �����н��̶�?</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	�����н��� ���� �հݻ��� ������� ����Ǹ� �а� Ư���� �´� �ڰ����̳� ���ʰ��� ���� ������<br>
                      	�����ϴ� �¶��� �����Դϴ�.<br>
                      	�ð��� ��ҿ� ���ֹ��� �ʰ� �����ִ� �ð��� �н��� �� ������ ���ذ� ���� �ʴ� �κ���<br>
                      	��� ���� �����Բ� �����Ͽ� �پ��� ������ ���� �� �ִ� �����н� �����Դϴ�.
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
					<li><a href="javascript:;" onClick="hideshow('tab05','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab04');">Ư��</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab06','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab05','tab10');">���й���ó</a></li>
				</ul>
				</td>	
                     
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="616" border="0" cellspacing="0" cellpadding="0">
              			<tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> �������</td></tr>
                    <tr><td class="admission_bg03">
                    		<ul class="v3_frame">
													<li style="height:130px;">
												</ul></td></tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ��������</td></tr>
                    <tr>
                      <td style="padding-left:20px">�б�Ȩ������<span class="txt_blue">(http://www.koreait.ac.kr</span>)�� ���� �¶��� ���������� �մϴ�.</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ������ Ȯ��</td></tr>
                    <tr>
                      <td style="padding-left:20px">���л���� ��ȭ�� ���� <span class="txt_blue">�����ڰ� ���� ��¥�� �ð��� Ȯ��</span>�մϴ�.</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ����ɷ� �˻�</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	�л� ���߱����� ȹ��ȭ�� �������� �л��� â�Ƿ�,����ɷ� ���� �ֿ켱���� �����ϱ� ���� �˻��<br>
                        ���� �к� ���� ���� ���� �غ�Ǿ� ������ ������ �����ϴ� �پ��� ���̵� �����Ӱ� ����ϴ� ����Դϴ�.
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ���л��/��������</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	���� �� �л����� �� �����ð�, �б��ü� �� Ư¡�� �л����� ���������� �ñ��ߴ� ������� �ȳ� ������ �� ������ ��� ���� �ش� <span class="txt_blue">�к���԰� 1:1 ��������</span>�� ����˴ϴ�.<br>
                        �а��� ���� ���� �� ����, ���ε��� ���� ���� �����̴� ���ο� ������ ������ ���ô� �����Բ� �� ���� �� �� �ֵ��� �غ��Ͻø� �˴ϴ�.<br>
                        <br>
												<b>[ ���� ������� ]</b>
												<table id="v3">
													<tr>
                            <th class="topfirst" style="width:100px">���� </th>
														<th class="topfirst" style="width:150px">�а� </th>
                            <th class="toplast">�������</th>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" rowspan="4">���ӽ���</td>
                            <td class="td" style="text-align:center;">���ӱ�ȹ</td>
                            <td>
															<ol>
																<li>1. ���� ���� ���� �ɷ� �˻� (40%)
																<li>2. ���� ���� (50%)
																<li>3. �ڱ� �Ұ��� �ۼ��Ͽ� ������ ����(10%)<div style="padding-left:15px;"> - �з� A4 2~3�� ����<div>
															</ol>
														</td>
                          </tr>
													<tr>
                            <td class="td" style="text-align:center;">���ӱ׷���</td>
                            <td>
															<ol>
																<li>1. ���� ���� ���� �ɷ� �˻� (40%)
																<li>2. ���� ���� (60%)
																<li>3. ��Ʈ������ ������ ������ �ο�
															</ol>
														</td>
                          </tr>
													<tr>
                            <td class="td" style="text-align:center;">�������α׷���</td>
                            <td>
															<ol>
																<li>1. ���� ���� ���� �ɷ� �˻� (40%)
																<li>2. ���� ���� (60%)
															</ol>
														</td>
                          </tr>
													<tr>
                            <td class="td" style="text-align:center;">���Ӹ�����</td>
                            <td>
															<ol>
																<li>1. ���� ���� ���� �ɷ� �˻� (40%)
																<li>2. ���� ���� (60%)
																<li>3. �پ��� ���� �÷��� �̷� ������ �ο�<div style="padding-left:15px;"> - (���Ӻ� ��ŷ, ����)<div>
															</ol>
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >�������Ƚ���</td>
                            <td class="td" style="text-align:center;">������ǻ�ͺ����а�(3����)<br>��ǻ�ͺ����а�<br>����Ʈ�����а�<br>���̹��������а�<br>��ŷ���̷��������а�</td>
                            <td>
															<ol>
																<li>1. �����˻�(20%) <div style="padding-left:15px;">:  �л��� â�Ƿ�, ����ɷ� ���� �ֿ켱���� �����ϱ� ���� �˻�</div>
																<li>2. ��������(20%) <div style="padding-left:15px;">: ���� �о߿� ���� �⺻ ������ ����� �ֱ� ���⿡ ���� ���ɵ� ������ ���� ����</div>
																<li>3. ����(60%) <div style="padding-left:15px;">: �о��� ���� ��ǥ�� ���� �� ������ �о� ���� � ���� ��<br>���� �������� �Ǳ� ���� �⺻ ���ε�� �μ��� ��</div>
															</ol>
															
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">�����е����ν���</td>
                            <td class="td" style="text-align:center;">�ð��������а�(3����)<br>
														��������������а�<br>��ȭ�����а�<br>�Ϸ���Ʈ���̼��а�<br>�����н��丮�ڸ��а�<br>����������а�
														</td>
                            <td>
															<ol>
																<li>1. ���� ���� ���� �ɷ� �˻� (40%)
																<li>2. ���� ���� (60%)
																<li>3. ��Ʈ�������� ������ ������ ������ �ο�
															</ol>
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >����Ʈ�������</td>
                            <td class="td" style="text-align:center;">����Ʈ��������ȹ�а�<br>����Ʈ�����������а�<br>��������а�<br>��ǻ�Ͱ��а�</td>
                            <td>
															<ol>
																<li>1. ���� ���� ���� �ɷ� �˻� (40%)
																<li>2. ���� ���� (60%)
															</ol>
														</td>
                          </tr>
                          <tr>
                            <td class="subfirst"  style="text-align:center;" colspan="2">���а� ����</td>
                            <td class="sublast" >
															�ڰ��� ������� ��� ������ �ο�<br>
															������ �缱�� ������ �ο�
															<div style="padding-left:15px;"> - ���� ������ ������ �����ؾ� ��<div>
														</td>
                          </tr>
                        </table>
												<br>
												<b>[ ������� �� ���� �ݿ� ��� ]</b>   <br>
											�� �� ������� �� ������ 100�� �������� ���� �� �� ���� �ݿ� <br>
											�� ���� ���� �ÿ� ���� ������, �ڰ����纻, ��ǰ ����, �ܱ��� ������ ���� ������ؿ� ���� ������ �ο�(10�� ����)  <br><br>
											<b>[ �ڰ��� ���� ���� ���� ]</b>
												<table id="v3">
													<tr>
                            <th class="topfirst" style="width:100px">�ڰ��� </th>
														<th class="topfirst" style="width:150px">������ </th>
                            <th class="toplast" >��Ÿ</th>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >����ó�� ���<br>
													�������� ���<br>
													CISA<br>
													CISSP<br>
													CEH<br>
													CCNA</td>
                            <td class="td" style="text-align:center;">10��</td>
                            <td rowspan=4>
															�� �� �ڰ����� ���ؼ��� �ڰ��� ���̵��� ���� �ο�
														</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >����ó�� ������<br>
														�������� ������<br>
														��ǻ�Ϳ���<br>
														��Ʈ��ũ ������<br>
														��ǻ�� Ȱ��ɷ� 1��</td>
                            <td class="td" style="text-align:center;">7��</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;" >��ǻ�� Ȱ��ɷ� 2��<br>
													������ ������ 1��</td>
                            <td class="td" style="text-align:center;">5��</td>
                          </tr>
                          <tr>
                            <td class="subfirst"  style="text-align:center;" >����, MOS</td>
                            <td class="sublast" style="text-align:center;">3��
														</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> �հ��� ��ǥ</td></tr>
                    <tr>
                      <td style="padding-left:20px">
												������ �հ��� �л��� �޴��� ���ڷ� �հ��뺸�� ���۵Ǹ� <span class="txt_blue">Ȩ�������� ���� �հ���ȸ�� ����</span>�մϴ�.<br><br>
												<b>[ ���� �հ��� ���� ��� ]</b> <br>
											�� �����˻�� �������� ����, �������� ������ �ջ��Ͽ� 60�� �̻��̾�� ��(������ ���ؿ� ���� ����)   <br>
											�� ���� �ʰ� �� ��� ���� ���� ������� ���� ��   <br>
											�� ���� �� ���ؿ� ���Ͽ� �����ϹǷ� ���� ������ ���� �ʴ��� ���� ����� 60�������� �ڴ� �������� ����   <br><br>
														
											- ���� �� ȣ�� �ش�Ǵ� �ڴ� ���հ� ó����   <br>
											�� ���� �ڰ� �̴���   <br>
											�� �ʱ����, ���� ���� ����, �������� �� �ϳ��� ���� �������� ���� ��   <br>
											�� ���� �� ���ؿ� ���� ������ 60�� �̻��̶� �ϴ��� ���� �ʰ� �� ��� ���� ���� �������� ���ܵ� �� 
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
					<li><a href="javascript:;" onClick="hideshow('tab06','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab05');">�������</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab07','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab06','tab10');">���й���ó</a></li>
				</ul>
				</td>	
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="616" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ���⼭��</td></tr>
                    <tr><td class="admission_bg04">
                    		<ul class="v3_frame">
													<li style="height:130px;">
												</ul></td></tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ����/����</td></tr>
                    <tr>
                      <td style="padding-left:20px">���� �Ͽ� �ݸ�����(3X4cm) ���� 2��� ���� ������ �غ��� ���ø� �˴ϴ�.</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> ��� �ڰ���/����</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	���� ����� �ڰ����̳� ������ �������ø� �˴ϴ�.(���� ���� �� ���� �� �����帳�ϴ�.)<br>
                        ���� ����� �ڰ����� �����ø� �׳� ���ø� �˴ϴ�.
                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td  class=v3_subject><img src="/images/arrow_blue.gif"> �������� ����, ���ǹٸ� �µ�</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	���� �� ���� �߿��ϰ� ����� ���� ����� �������� �ɷ°� �������� �����Դϴ�.<br>
                        ���� �⺻���� ���Ǵ� �� ì��ž߰�����^^
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
					<li><a href="javascript:;" onClick="hideshow('tab07','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab06');">���⼭��</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab08','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab07','tab10');">���й���ó</a></li>
				</ul></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td valign="top">
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> ��ϱ� �ȳ�</td></tr>
                    <tr><td class="admission_bg05">
                    		<ul class="v3_frame">
													<li style="height:130px;">
													<img src="/images/admission_bg05.jpg">
												</ul></td></tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> �հ��� ��ǥ</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	�������� �����Ͽ� 1���� �� ���� Ȩ�������� ���� �հ���ȸ�� �����ϸ� �հ��ڿ��Դ� ���� SMS �� ������<br>
                      	�߼۵˴ϴ�.
                     	</td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> �հ� �� ������ ���</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	1. �հ��ڴ� ���� Ȩ�������� ���� ��ϱݰ����� �� �հ��������� ����Ͻø� �˴ϴ�<br>
						2. �հ��ڿ��Դ� �հݿ���(��ϱݰ����� �� �հ�������,���оȳ���)�� ������ �߼۵˴ϴ�.
						

                      </td>
                    </tr>
                    <tr><td height="20">&nbsp;</td></tr>
                    <tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> ��ϱ� ����</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	�������� ����� ���αⰣ �ȿ� ��ϱ��� �������ֽø� �˴ϴ�.<br>
                      	<span class="txt_red">* ���ΰ��¹�ȣ : 641-028873-13-101(�츮����) ������ : (��)�ٻ����簳�߿�<br>
												<span style="padding-left:93px;">630-006752-196(��ȯ����) ������ : (��)�ٻ����簳�߿�</span></span>
                      </td>
                    </tr>
                    <tr><td height="20" valign="top">&nbsp;</td></tr>
                    <tr><td class=v3_subject><img src="/images/arrow_blue.gif"> �����н�</td></tr>
                    <tr>
                      <td style="padding-left:20px">
                      	�к� ���� ���н������� ���Ի����� ���� �����н��� �̷�����ϴ�. (�������� ����� ���)<br>
                      	�����н��� ��ϱ� ���� �� ���簡 �������� �߼۵Ǹ� Ȩ�������� ȸ�������� �ϼž� ������ �ο��˴ϴ�.<br>
                      	�����н� �������� ���� �н��Ͻø� �˴ϴ�.
                     	</td>
                    </tr>
                    <tr><td height="20" valign="top">&nbsp;</td></tr>
                    <tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> ����</td></tr>
                    <tr>
                      <td style="padding-left:20px">2014�� 3�� ���н��� ���� �����̸� ������Ի��鿡�Դ� ���� ��ȭ �� �������� �����մϴ�. </td>
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
					<li><a href="javascript:;" onClick="hideshow('tab08','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab07');">��ϱݾȳ�</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab09','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab08','tab10');">���й���ó</a></li>
				</ul>
				</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
              	<td>
              		<table width="100%" border="0" cellspacing="0" cellpadding="0">
              			<tr><td class="v3_subject"><img src="/images/arrow_blue.gif"> ������/�հ��� ���ǻ���</td></tr>
                    <tr>
                      <td>
												<ul class="v3_frame">
													<li>
														<table>
														<tr>
                            <td width="100" valign="top" class="v3_subject">������ ���ǻ���</td>
                            <td>
                            	- ������ ������ ������� ��ȯ���� �ʽ��ϴ�.<br>
                              - ��������,����,���� �� ���񼭷� �̺� ���� ������ �߻��ϴ� �����Ϳ� ���� å���� �����ڿ��� <br>
                              &nbsp;&nbsp; �ֽ��ϴ�.<br>
                              - ��� ��ϻ����� �����ɿ� ���Ͽ� ��Ȯ�� �����Ͽ��� �մϴ�.<br>
                              - ���� �� ÷�μ����� ���� ������ �����ϰų� ��Ÿ ������ ������� �հ� �Ǵ� �� ������ ����� <br>
                              &nbsp;&nbsp;Ȯ�ε� ��쿡�� �� ���� ���Ĵ� ���� ���� ���̶� �� ���� �㰡�� ����� �� �ֽ��ϴ�.
                            </td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" valign="top"  class="v3_subject">�հ��� ���ǻ���</td>
                            <td>
                            	- �հ��ڴ� �Ⱓ ���� ���бݰ� �����Ḧ �������� ���� ��� �հ� ��ҵ� �� �ֽ��ϴ�.<br>
                              - ����� ��ģ �� �� ������ �������� �� ��ϱ� ȯ�� �䱸 �ÿ��� �б��� �湮�Ͽ� �������⼭�� <br>
                              &nbsp;&nbsp;�����Ͽ� ȯ�� ���� �� ������, ��ϱ� ��ȯ�� ���� ��Ģ�� �ǰ� ó���մϴ�.
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
					<li><a href="javascript:;" onClick="hideshow('tab09','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab08');">������/�հ������ǻ���</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab10','tab09');">�����н����񰳼�����</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab09','tab10');">���й���ó</a></li>
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
                      <td class="v3_subject"><img src="/images/arrow_blue.gif"> �ð��� �����ڸ� ���� ���� ��������</td>
                    </tr>
										<tr>
											<td style="padding-left:20px">
                    		<ul class="v3_frame">
													<li>�� ���´� �ų� 2ȸ �����˴ϴ�
													<li>�� ���� ���¸���Ʈ�� �ų� 2���� 8���� ���ŵ˴ϴ�
													<li>�� ���� ���� �� �ð�ǥ�� �������Ǵ� 02-578-2200���� ���� �ֽñ� �ٶ��ϴ�
												</ul>
											</td>
										</tr>
										<tr><td height="20">&nbsp;</td></tr>
										 <tr>
                      <td class=v3_subject><img src="/images/arrow_blue.gif"> 2013�� ��������</td>
                    </tr>
                    <tr>
                      <td style="padding-left:20px">
												<ul class="v3_frame">
													<li>
														<table>
														<tr>
                            <td width="100" class="v3_subject">�����Ⱓ</td>
                            <td valign="top"  >
                            	<span class="txt_blue">2���� 
                            </td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" class="v3_subject" >������</td>
                            <td valign="top"  >2013�� 3�� 4�� �ϰ�����</td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" class="v3_subject" >������</td>
                            <td valign="top"  >2013�� 6��15�� (15�ּ���)</td>
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
                    				<th>�����</th>
														<th style="width:40px;">No</th>
                            <th class="toplast">�����</th>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">01.</td>
                            <td>2D��ǻ�ͱ׷���</td>
														<td style="text-align:center;">32.</td>
                            <td>��Ƽ�̵�������I</td>
                          </tr>
                          <tr>
														<td class="td" style="text-align:center;">02.</td>
                            <td>3D��ǻ�;ִϸ��̼�I</td>
														<td style="text-align:center;">33.</td>
                            <td>�߻��ǥ��</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">03.</td>
                            <td>3Dǻ�;ִϸ��̼�I</td>
														<td style="text-align:center;">34.</td>
                            <td>�繫�ڵ�ȭ�ǽ�</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">04.</td>
                            <td>AV������</td>
														<td style="text-align:center;">35.</td>
                            <td>�ð�������</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">05.</td>
                            <td>C���I</td>
														<td style="text-align:center;">36.</td>
                            <td>���̵��߻�</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">06.</td>
                            <td>PCȰ��I</td>
														<td style="text-align:center;">37.</td>
                            <td>��ȣ��</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">07.</td>
                            <td>���ӱ׷��ȱ���</td>
														<td style="text-align:center;">38.</td>
                            <td>��ȣ�л���2A</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">08.</td>
                            <td>���ӱ׷������α׷���II</td>
														<td style="text-align:center;">39.</td>
                            <td>��������ν�Ʃ���I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">09.</td>
                            <td>���ӱ�ȹ��ʿ���</td>
														<td style="text-align:center;">40.</td>
                            <td>�ü��</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">10.</td>
                            <td>���ӱ�ȹ��ʿ���</td>
														<td style="text-align:center;">41.</td>
                            <td>�ü������</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">11.</td>
                            <td>���ӳ�Ʈ��ũ���α׷���</td>
														<td style="text-align:center;">42.</td>
                            <td>�ü���ǽ�</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">12.</td>
                            <td>���Ӹ�����</td>
														<td style="text-align:center;">43.</td>
                            <td>�����α׷��ֽǽ�</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">13.</td>
                            <td>���ӹ�������</td>
														<td style="text-align:center;">44.</td>
                            <td>�����������α׷���II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">14.</td>
                            <td>���Ӻм�</td>
														<td style="text-align:center;">45.</td>
                            <td>�����������α׷��ֽǽ�II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">15.</td>
                            <td>���Ӻ���Ͻ�</td>
														<td style="text-align:center;">46.</td>
                            <td>���ͳݺ���</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">16.</td>
                            <td>���ӽó�����</td>
														<td style="text-align:center;">47.</td>
                            <td>���ͳ����α׷���</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">17.</td>
                            <td>���ӽý��۱���</td>
														<td style="text-align:center;">48.</td>
                            <td>���ͳ�Ȱ��I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">18.</td>
                            <td>��������Ʈ������</td>
														<td style="text-align:center;">49.</td>
                            <td>���ͳ�Ȱ��II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">19.</td>
                            <td>�����������̽�������</td>
														<td style="text-align:center;">50.</td>
                            <td>�������̽�������</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">20.</td>
                            <td>����ĳ���͵�����</td>
														<td style="text-align:center;">51.</td>
                            <td>���갳��</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">21.</td>
                            <td>���������α׷���</td>
														<td style="text-align:center;">52.</td>
                            <td>���ڰ��ⱸ��</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">22.</td>
                            <td>�������α׷��ֱ���</td>
														<td style="text-align:center;">53.</td>
                            <td>������ȣ����</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">23.</td>
                            <td>�����а���</td>
														<td style="text-align:center;">54.</td>
                            <td>ħ�����ܽý���</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">24.</td>
                            <td>�����а���</td>
														<td style="text-align:center;">55.</td>
                            <td>ħ�����ܽý��ۻ���2A</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">25.</td>
                            <td>���ʵ�����</td>
														<td style="text-align:center;">56.</td>
                            <td>��ǻ�ͱ׷���I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">26.</td>
                            <td>�����ͺ��̽�</td>
														<td style="text-align:center;">57.</td>
                            <td>��ǻ�ͱ׷��Ƚ�I</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">27.</td>
                            <td>�����η�</td>
														<td style="text-align:center;">58.</td>
                            <td>��ǻ�ͱ׷��Ƚ�II</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">28.</td>
                            <td>�����оִϸ��̼ǥ�</td>
														<td style="text-align:center;">59.</td>
                            <td>��ǻ�ͱ׷��Ƚ�II(Photoshop)</td>
                          </tr>
													<tr>
														<td class="td" style="text-align:center;">29.</td>
                            <td>�������̹���ó��</td>
														<td style="text-align:center;">60.</td>
                            <td>��ǻ�ͱ׷��Ƚ�III</td>
                          </tr>
													 <tr>
                            <td class="subfirst" style="text-align:center;">30.</td>
														<td>�������Ϸ���Ʈ���̼ǥ�</td>
														<td style="text-align:center;">61. </td>
                            <td class="sublast">��ǻ�ͱ׷��Ƚ�IV</td>
                          </tr>
													<tr>
                            <td class="subfirst" style="text-align:center;">31.</td>
														<td>����������</td>
														<td style="text-align:center;">62. </td>
                            <td class="sublast">ǥ�����</td>
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
					<li><a href="javascript:;" onClick="hideshow('tab10','tab01');">�䰭</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab03');">�����ڰ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab04');">Ư��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab05');">�������</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab06');">���⼭��</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab07');">��ϱݾȳ�</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab08');">������/�հ������ǻ���</a></li>
					<li><a href="javascript:;" onClick="hideshow('tab10','tab09');">�����н����񰳼�����</a></li>
					<li class="on"><a href="javascript:;" onClick="hideshow('tab01','tab10');">���й���ó</a></li>
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
                      <td class="v3_subject"><img src="/images/arrow_blue.gif"> ���й���ó</td>
                    </tr>
                    <tr>
                      <td>
												<ul class="v3_frame">
													<li>
														<table>
														<tr>
                            <td width="100" valign="top" class="v3_subject">��ȭ���</td>
                            <td>
                            	<span class="txt_blue">���а����� : 02-578-5551&nbsp;&nbsp; fax :02-578-2720</span><br>
                              ��ð� : ���� 9�� ~ ���� 7��
                            </td>
                          </tr>
													</table>
													<li>
													<hr>
														<table>
														<tr>
                            <td width="100" valign="top"  class="v3_subject" >�¶��� ���</td>
                            <td>
                            	<p>���л��� : <a href="/board_skin/sangdam_board/board_index.asp" target="_self">[�ٷΰ���</a>]<br>
                              <br>
                              <span class="txt_blue_b">�ǽð� ����̶�? </span><br>
                              Ȩ������ ��ڿ� �����ο� ä�� �������� ���п� ������ ���Ǹ� �� �� �ִ� <br>
                              �¶��� �����Դϴ�. ������ �ֽø� �ǽð����� �亯�帳�ϴ�.</p>
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
