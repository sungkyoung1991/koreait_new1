<!--#include virtual="/_include/Service_Inc.inc"-->
<!--#include virtual="/_include/2017/inc_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_sub_head.inc"-->

<style type="text/css">
.counsel { display:none; padding:2px 5px; width:50%; height:25px; padding-left:20px; background: url(../images/lock.png) no-repeat 2px 6px; background-color: #fff; }
.counsel form > input[type="password"] { padding-left: 5px; padding-right: 4px; }
.counsel form > input.button_green { vertical-align: top; }
input.pwd { width:100px;padding-left:5px; }
.reply::before {
  content:url(/images/2017/icon_reply.gif);
  vertical-align:middle;; margin-left:10px; padding-top: 10px;
}
.closed::after {
  content:url(../images/lock.png);
  vertical-align:middle; margin-left:10px;
}
</style>
<script language="javascript">
var curObj = "";
function showPwd(cd) {
	if (curObj != "") {
		var tmpObj = document.getElementById("counsel" + curObj);
	
		tmpObj.style.display = "none";
		
	}

	curObj = cd;
	var obj = document.getElementById("counsel" + cd);
	obj.style.display = "block";
	obj.style.position = "absolute";
	//obj.style.top = event.y+"px";
	//obj.style.left = event.x+"px";

	$("#password"+cd).html("<input type='password' name='pwd' class='pwd' placeholder='비밀번호' />");
}

function chkVal(frm) {
	var pwd = frm.pwd.value;
	if (isTXTEmpty(pwd)) {
		alert("암호를 입력하세요.");
		frm.pwd.focus();	return false;
	}

	return true;
}
</script>


   			<div class="contentTitle">
                <h2>ONLINE COUNSELLING</h2>
         		<div class="conselling-wrap">
            	<table id="counselling-list">
                  	<tr>
                      <th>No</th>
                      <th class="board-title">제목</th>
                      <th>글쓴이</th>
                      <th>등록일</th>
                      <th>조회</th>
              		</tr>
<%
Dim vccd, sctitle, atitle
bsize = 10
psize = 10
cpage = getQuery("page")
If Len(cpage) = 0 Or Not isNumeric(cpage) Then
	cpage = 1
Else
	cpage = CInt(cpage)
End If

sql = "select count(sccd) recCount from TBL_SiteCounsel where (del_yn = 'N' or del_yn is null) and scode != '2' "
sql = sql & " and parentcd not in (select sccd from TBL_SiteCounsel where del_yn = 'y') "
Set rs = conn.Execute(sql)
rcount = rs("recCount")
pcount = Int((rcount - 1) / psize) + 1

sql = "select top(" & psize & ") sccd, parentcd, sctitle, scwriter, "
sql = sql & " case when (scissecret = scisanswer and B.parentcd=sccd And sccd=parentcd ) then 'Y' "
sql = sql & " when (scissecret != scisanswer ) then scissecret end scissecret, " 
sql = sql & " scisanswer, scread, scwdate, "
sql = sql & " isnull((SELECT A.scissecret FROM TBL_SiteCounsel A WHERE B.parentcd=A.sccd And A.sccd=parentcd),'N') pscissecret, sname "
sql = sql & " from TBL_SiteCounsel B "
sql = sql & " inner join TBL_AdminSchool s on s.scode = b.scode"
sql = sql & " where sccd NOT IN ("
sql = sql & " select top((" & cpage & " - 1) * " & psize & ") sccd from TBL_SiteCounsel c"
sql = sql & " where (del_yn = 'N' or del_yn is null) and c.scode != '0' "
sql = sql & " and c.parentcd not in (select sccd from TBL_SiteCounsel where del_yn = 'y' ) order by parentcd desc, sccd) "
sql = sql & " and (del_yn = 'N' or del_yn is null) and b.scode != '0' "
sql = sql & " and b.parentcd not in (select sccd from TBL_SiteCounsel where del_yn = 'y' ) order by parentcd desc, b.sccd"

'Response.Write sql 
Set rs = conn.Execute(sql)
If Not rs.EOF Then
	i = 1
	num = rcount - (cpage - 1) * psize
	Do Until rs.EOF
		tmp = ""
		If rs("scissecret") = "Y" Then		tmp = " class='closed'"
		tmp2 = ""
		If rs("scisanswer") = "Y" Then		tmp2 = " class='reply'"
%>
              <tr>
                <td><%=num%></td>
                <td class="text-title">
		<%		
		If rs("scissecret") = "Y" or rs("pscissecret")="Y" Then
		
			if rs("scissecret") = "Y" then
				vccd = rs("sccd")
			elseif  rs("pscissecret")="Y" then
				vccd = rs("parentcd")
				tmp2 = " class='reply closed'"
			end if
			
			atitle = ""
			sctitle = rs("sctitle")
			if (chrbyte(sctitle)>36) then 
				sctitle = chrbyteRtn(sctitle,36) & "..."
				atitle = " title=""" & rs("sctitle") & """"
			end if
			
		%>
				  <div id="counsel<%=i%>" class="counsel">
				  <form name="frm_<%=i%>" action="online-counseling-preview.asp?cpage=<%=cpage%>&sccd=<%=rs("sccd")%>&vccd=<%=vccd%>" method="post" onsubmit="return chkVal(this);">
					<span id="password<%=i%>"><!--<input type="password" name="pwd" placeholder="비밀번호" style="width:100px;" />--></span>
					<input type="submit" class="button_green" value="입 력" style="padding: 2px 10px 4px 10px">
				  </form>
				  </div>
				  <a id = "counsel_<%=i%>" href="javascript:showPwd('<%=i%>');"<%=tmp & tmp2%> <%=atitle%>>
                  	<% IF tmp2 = "" Then %>[<%=rs("sname")%>] <%END IF%><%= sctitle & getIsNew(rs("scwdate"))%></a>
<%		Else %>
				  <a id = "counsel_<%=i%>" href="online-counselling-view.asp?cpage=<%=cpage%>&sccd=<%=rs("sccd")%>"<%=tmp & tmp2%> <%=atitle%>><%= sctitle & getIsNew(rs("scwdate"))%></a><span class=""></span>
<%		End If %>
                </td>
                <td><%=rs("scwriter")%></td>
                <td><%=getDate(rs("scwdate"), "-")%></td>
                <td><%=rs("scread")%></td>
              </tr>
<%
		rs.MoveNext
		i = i + 1
		num = num - 1
	Loop
	link_file = "online-counselling.asp?cpage="
%>
          </table>
         
<%
Else
%>
		<tr class="list_row">
		  <td class="list_col center" colspan="5">현재 등록된 입학상담 정보가 없습니다.</td>
		</tr>
		</table>
		
<%
End If
%>
				<% CALL PageCounterWeb(cpage,pcount,bsize,"","") %>
              <div class="btn"><a href="online-counseling-write.asp?cpage=<%=cpage%>" >글쓰기</a></div>
			  
           </div>
        </div>
      </div>
</section>  


<!-- footer -->
<!--#include virtual="/_include/2017/inc_footer.inc"-->
<!-- side-bar -->
<!--#include virtual="/_include/2017/inc_side_menu.inc"-->
<!-- Web Log Writer -->
<!-- #include virtual="/_include/inc_LogWriter.inc" -->

</body>

</html>

<%
'===========Byte 길이 체크루틴================
function chrbyte(stran_msg)
	Dim wLen, ii_pos, charat
	wLen = 0
	If Not IsNull(stran_msg) then   
		for ii_pos=1 to len(stran_msg)        
			charat=mid(stran_msg, ii_pos, 1)        
			if asc(charat)>0 and asc(charat)<255 then            
				wLen=wLen+1        
			else            
				wLen=wLen+2        
			end if
		Next
	End If    
	chrbyte = wLen
End function

'===========Byte 특정 길이만큼 잘라내는 루틴=================
function chrbyteRtn(stran_msg,pos)
	Dim wLen, tmp, ii_pos, charat
	wLen = 0
	tmp = ""
	If Not IsNull(stran_msg) then
		for ii_pos=1 to pos
			if (wLen <= pos) then
				charat=mid(stran_msg, ii_pos, 1)
				if asc(charat)>0 and asc(charat)<255 then 
					wLen=wLen+1
				else
					wLen=wLen+2
				end if
				tmp = tmp + charat
			end if 
		Next
	End If    
	chrbyteRtn = tmp
End function
%>