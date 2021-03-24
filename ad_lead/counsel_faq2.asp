<%
category="3"
menu="2"
sub_menu="21"
%>
<!-- #include virtual="/_include/inc_header.asp" -->
<!-- #include file="../top.asp" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->
<script LANGUAGE="VBScript" RUNAT="Server">
Function CheckWord(CheckValue)
CheckValue = replace(CheckValue, "&lt;", "<")
CheckValue = replace(CheckValue, "&gt;", ">")
CheckValue = replace(CheckValue, "&quot;","'")
CheckValue = replace(CheckValue, "&amp;", "&" )

CheckWord = CheckValue
End Function 

</script>
<%
  
  find = request("find")
  search = request("search")
  bbscode=Trim(request("bbscode"))
  
 ' 과종목 선택후 검색시 에러 디버그************
 if bbscode <> "" then  
  if find <> "" then
    if search = "content" then
      subsql = " and " & search&" LIKE '%" & find & "%'" 
    else
      subsql = " and Lower(" & search&") LIKE '%" & LCase(find) & "%'" 
    end if

    searching="&search=" & search & "&find=" & find
  else
    subsql=""
  end if
 else
  if find <> "" then
    if search = "content" then
      subsql = " where " & search&" LIKE '%" & find & "%'" 
    else
      subsql = " where Lower(" & search&") LIKE '%" & LCase(find) & "%'" 
    end if

    searching="&search=" & search & "&find=" & find
  else
    subsql=""
  end if
 end if
'************************************************


  if request("page")="" then
		page=1
	else
		page=request("page")
	end if

	session("page")=page

	If page <> "" Then
         cPage = page
         If cPage < 1 Then 
            cPage = 1
         End If
    Else
         cPage = 1
    End If

  pagesize=10
  if bbscode <> "" then  
  sql = "select count(*) from faq_board where bbscode='"&bbscode&"'"&sbsql
  else
  sql = "select count(*) from faq_board "&sbsql
  end if
  
  set rs = conn.execute(sql)
  totalrecord = cint(rs(0))
  totalpage   = int(rs(0)/ pagesize * -1) * -1 
  rs.close

  Set rs = Server.Createobject("ADODB.Recordset")
  rs.CursorLocation = 3
  rs.CacheSize  = pagesize
	
	
   if bbscode <> "" then 	
	rssql = "SELECT * FROM faq_board where bbscode='"&bbscode&"' "&subsql&" order by top_view desc,ref desc, step "
   else
    rssql = "SELECT * FROM faq_board  "&subsql&" order by top_view desc, ref desc, step "
   end If
   

  rs.PageSize=10

  rs.Open rssql, conn, 1
	
	page_count=10
	totalpage=rs.PageCount		

  Set rs.ActiveConnection = Nothing

%>
<SCRIPT language=javascript>


function switchContent(no)
{
	var Cfrm = eval("document.all.frmContent" + no);

     if (Cfrm.style.display=='none') 
	 {
		Cfrm.style.display='block';
     } 
	 else 
	 {
		Cfrm.style.display='none';
     }
}

</SCRIPT>

	<script language="JavaScript" >
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
	</script>
          	<table width="616" border="0" align="center" cellpadding="0" cellspacing="0">
            	<tr>
              	<td width="13">&nbsp;</td>
                <td><img src="images/title_2_3.gif"></td>
              	<td><div align="right"><img src="/images/common_icon_navi.gif" width="13" height="13" align="absmiddle">Home &gt; 입학안내 &gt; <strong>입학FAQ</strong></div></td>
            	</tr>
        		</table>
					<table width="616"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="20" style="padding-top:35px;">&nbsp;</td>
        </tr>
        <tr> 
          <td>


        <form action="counsel_faq.asp" Method="POST" id="form1" name="form1">
        <input type="hidden" name="bbscode" value="<%=bbscode%>">
        <input type="hidden" name="search" value="title">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr > 
                <td height="2" colspan="2"  bgcolor="ff3333"></td>
              </tr>
              <tr> 
                <td width="92" rowspan="2"><img src="images/al_cs_faq_img.gif" width="92" height="75"></td>
                <td height="32" valign="bottom" bgcolor="F2F2F2" class="line_h16">궁금하신 
                  내용을 입력하시면 원하시는 답변을 찾아드립니다.<br>
                  <span style="color:ff3333;">예) 취업, 편입, 수능, 내신... 등</span></td>
              </tr>
              <tr> 
                <td valign="top" bgcolor="F2F2F2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="86%"> 
                      <input type="text" name="Find" value="<%=find%>" class="in_faq" style="width:447;height:19"></td>
                      <td width="14%"> 
                        <input name="imageField" type="image" src="images/al_btn_search.gif" width="48" height="18" border="0"></td>
              </tr>
            </table>
  
		  </form>          
				
				
				
				
				
				</td>
              </tr>
          </table>		
			</td>
        </tr>
        <tr> 
          <td width="670" height="25"></td>
        </tr>
        <tr> 
          <td><div id="tab01" style="position:absolute; z-index:1; background-color: #FFFFFF; layer-background-color: #FFFFFF; border: 1px none #000000;"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
  if rs.eof then
%>                         
							<tr> 
                              <td width="8%" height="28" align="center">&nbsp;</td>
                              <td width="92%">등록된 게시물이 없습니다.</td>
                            </tr>							
                <%
    else 
    i = 1
    rs.AbsolutePage=cPage
    do until rs.EOF or i>rs.PageSize
        width=""
        news=""
        name = (rs("name"))
        wdate = left(rs("writeday"),10)
        title = replace(trim(rs("title")),"&quot;","'")
        readnum = rs("readnum")
        power=rs("bbscode")
		top_view=rs("top_view")
		writer_id=rs("writer_id")
        content =CheckWord(rs("content"))

		Select Case bbscode
		Case "0001"
		bbscode_pr="입학"
		Case "0002"
		bbscode_pr="등록금"
		Case "0003"
		bbscode_pr="장학금"
		Case "0004"
		bbscode_pr="수업/학사"
		Case "0005"
		bbscode_pr="진학/취업"
		Case "0006"
		bbscode_pr="학교특징"
		Case "0007"
		bbscode_pr="기타"
        End select


        If Len(title) > 45 Then
          title = Mid(title,1,43) & ".."
        End If
        if rs("re_level") > 0 then
          wid = rs("re_level")
          for k=1 to wid
            width=width&"&nbsp;"
          next
          reply = width&"<img src='/information/images/ico_re.gif'>&nbsp;"
        else
          reply = ""
        end if

        if DateDiff("h",rs("writeday"),Now()) < 24 then
          news = "&nbsp;&nbsp;<font color='#ff9900'>new</font>"
        end if
%>				


							
							
							<tr> 
                              <td width="8%" height="28" align="center"><img src="images/al_cs_faq_q.gif" width="23" height="16"></td>
                              <td width="92%"><A href="javascript:switchContent('<%=i%>');" class="faq_stit3"><%=title%></a></td>
                            </tr>
							<tr> 
                              <td height="1" colspan="2" ><img src=images/al_cs_faq_dotline.gif></td>
                            </tr>

							<tr> 
                              <td colspan="2" style="padding:0 0 0 0">
                               <SPAN id=frmContent<%=i%> style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; DISPLAY: none; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px">                     
								
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                   <tr > 
                                    <td width="8%" height="30" align="center" valign="top" style="padding-top:10px;"><img src="images/al_cs_faq_a.gif" width="23" height="16"></td>
                                    <td width="92%"  ><fieldset style="background-color:#F2F2F2; border:0; padding:10 ;"><%=content%></fieldset></td></tr>
																		<tr> 
                                    <td height="1" colspan="2" ><img src=images/al_cs_faq_dotline.gif></td>
                            </tr>
                                </table>
                                </span>
                                </td>
                            </tr>

							
<%
     rs.Movenext
     i = i + 1
     Loop
%>                   
<% end if '게시판 소스의 끝 %>							
							

                          </table>
                        </td>
                      </tr>
                      <tr>
                        <td height="2" bgcolor="E5BBBB"></td>
                      </tr>
                      <tr>
                        <td height="10"></td>
                      </tr>
                      <tr>
                        <td align="center">
						
<%
  If cPage/PAGE_COUNT = Int(cPage/PAGE_COUNT) Then	
    BlockStart = cPage - PAGE_COUNT + 1
  Else								
    BlockStart = Int(cPage/PAGE_COUNT) * PAGE_COUNT + 1
  End If
  

  BlockEnd = BlockStart + (PAGE_COUNT-1)
  If BlockEnd > totalpage then
    BlockEnd = totalpage
  End If
    
  if page=1 then
    response.write "<img src=images/al_cs_icon_prv01.gif width=12 height=11 border=0 align=absmiddle>&nbsp;&nbsp;&nbsp;"
  else
    Response.Write "<a href='counsel_faq.asp?bbscode="&bbscode&"&page=" & page-1 &searching& "'><img src=images/al_cs_icon_prv01.gif width=12 height=11 border=0 align=absmiddle></a></small>&nbsp;&nbsp;&nbsp;"
  end if

  for j = BlockStart to BlockEnd
    If j = CInt(cPage) and BlockEnd <> 0 Then	
      Response.Write "<strong>" & j & "</strong>&nbsp;&nbsp;&nbsp;"
    Elseif BlockEnd = 0 Then
      Response.Write ""
      Else
      Response.Write "<a href='counsel_faq.asp?bbscode="&bbscode&"&page=" & j &searching& "'>" & j & "</a>&nbsp;&nbsp;&nbsp;"
    End If
  Next

  If cint(page) < cint(totalpage) Then
    Response.Write "&nbsp;&nbsp;&nbsp;<a href='counsel_faq.asp?bbscode="&bbscode&"&page=" & page+1 &searching& "&'><img src=images/al_cs_icon_nxt02.gif width=14 height=11 border=0 align=absmiddle></a>"
  else
    Response.Write "&nbsp;&nbsp;&nbsp;<img src=images/al_cs_icon_nxt02.gif width=14 height=11 border=0 align=absmiddle>"
  End If
   ' response.write "&nbsp;[총 "&totalpage&" page]"
%>						
	  
						  
						  </td>
                      </tr>
                    </table></td>
                </tr>
              </table>
            </div>
         </td>
        </tr>
      </table>      
<!-- #include file="../bottom.asp" -->
<% 
   rs.Close
   conn.Close
   Set rs = Nothing
   Set conn = Nothing
%>