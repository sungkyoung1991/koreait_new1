<!--#include virtual="/_include/Service_Inc.inc"-->
<!--#include virtual="/_include/2017/inc_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_sub_head.inc"-->

<%
if Request.ServerVariables("REMOTE_ADDR") =  "5.188.210.61" then 
Response.Write "<script>"
Response.Write "alert('Sorry')"
Response.Write "</script>"
Response.Redirect "http://job.ac.kr"
end if
 
Dim sccd, sctitle, scwriter, scissecret, scemail, scmobile, sccontents, e1, e2, m1, m2, m3
cpage = getQuery("cpage")
wtype = getQuery("wtype")
sccd = getQuery("sccd")

msg = "수정과 삭제 시 필요합니다."
If wtype = "up" Then
	msg = "등록시 입력한 비밀번호를 적으세요."
	sql = "select * from TBL_SiteCounsel where scisanswer = N'N' and sccd = " & sccd
	Set rs = conn.Execute(sql)
	If Not rs.EOF Then
		sctitle		= rs("sctitle")
		scwriter	= rs("scwriter")
		scissecret	= rs("scissecret")
		If Len(rs("scemail")) > 5 Then
			scemail	= Split(rs("scemail"), "@")
			e1 = scemail(0)
			e2 = scemail(1)
		End If
		If Len(rs("scmobile")) > 5 Then
			scmobile= Split(rs("scmobile"), "-")
			m1 = scmobile(0)
			m2 = scmobile(1)
			m3 = scmobile(2)
		End If
		sccontents	= rs("sccontents")
	Else
%>
<script language="javascript">
	alert("상담내용이 없습니다.");
	history.back();
</script>
<%
		Response.write "상담내용이 없습니다."
		response.End
	End If
Else
	wtype = "in"
End If
%>

<script language="javascript">
function chkVal() {
	var frm = document.frm_counsel;
	var sctitle = frm.sctitle.value;	var scwriter = frm.scwriter.value;	var scpwd = frm.scpwd.value;
	var m2 = frm.m2.value;				var m3 = frm.m3.value;				var sccontents = frm.sccontents.value;
	var campus = frm.scode.value;
	
	if (isTXTEmpty(campus)) {
		alert("캠퍼스를 선택하세요.");
		frm.campus.focus();			return false;
	}
		
	if (isTXTEmpty(sctitle)) {
		alert("제목을 입력하세요.");
		frm.sctitle.focus();			return false;
	}
	if (isTXTEmpty(scwriter)) {
		alert("글쓴이 이름을 입력하세요.");
		frm.scwriter.focus();			return false;
	}
	if (isTXTEmpty(scpwd)) {
		alert("비밀번호를 입력하세요.");
		frm.scpwd.focus();				return false;
	}
	if (isTXTEmpty(m2) || isTXTEmpty(m3)) {
		alert("휴대폰 번호를 입력하세요.");
		frm.m2.focus();					return false;
	}
	if (isTXTEmpty(sccontents)) {
		alert("글내용을 입력하세요.");
		frm.sccontents.focus();			return false;
	}
		frm.submit();
	return true;
}

function chDomain(frm, val) {
	if (val == "") {
		frm.e2.value = "";		frm.e2.focus();
	} else {
		frm.e2.value = val;
	}
}

function isNum(obj) {
	if (!isCommaNumber(obj)) {
		alert("숫자로만 입력하세요.");
		obj.value = "";		obj.focus();
	}
}
</script>


<div class="contentTitle">
                <h2>ONLINE COUNSELLING</h2>
                <form name="frm_counsel" action="online-counseling-proc.asp?cpage=<%=cpage%>&wtype=<%=wtype%>" method="post" >
                	<input type="hidden" name="sccd" value="<%=sccd%>" />
                    <table id="counselling-board">
                        <tr>
                            <th><span>캠퍼스선택</span></th>
                            <td>
                                <select name="scode" id="campus-select">
                                    <option value="">선택하세요</option>
                                    <%
                                    	sql = "select * from TBL_AdminSchool where (scode != '0' and scode != '2') order by scode asc"
										Set rs = conn.Execute(sql)
										If Not rs.EOF Then
											Do Until rs.EOF
											%>
                                            	<option value='<%=rs("scode")%>'><%=rs("schoolName")%></option>
                                            <%
												rs.MoveNext
											Loop
										End If
									%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span>글제목</span></th>
                            <td><input type="text" name="sctitle" value="<%=sctitle%>"  maxlength="100"></td>
                        </tr>
                        <tr>
                            <th><span>글쓴이</span></th>
                            <td><input type="text" name="scwriter" value="<%=scwriter%>" maxlength="10"></td>
                        </tr>
                        <tr>
                            <th><span>비밀번호</span></th>
                            <td><input type="password" name="scpwd" maxlength="20">&nbsp;&nbsp;<%=msg%></td>
                        </tr>
                        <tr>
                            <th><span>비밀글설정</span></th>
                            <td><label><input type="checkbox" name="scissecret" value="Y" <% If scissecret = "Y" Then %>checked<% End If %>> 온라인상담자만 볼 수 있는 기능입니다.</label></td>
                        </tr>
                        <tr>
                            <th><span>이메일</span></th>
                            <td>
                            	<input type="text" name="e1" value="<%=e1%>" maxlength="50">
                            	<!--
                            	<input type="text" name="e1" value="<%=e1%>" maxlength="25"> @ <input type="text" name="e2" value="<%=e2%>" id="email" maxlength="24">
                                <select name="" id="email-list" onchange="chDomain(this.form, this.value);">
                                  <option value="">---------------------</option>
            						<% For i = 0 To UBound(arrDomains) %>
                                    <option value="<%=arrDomains(i)%>" <% If e2 = arrDomains(i) Then %>selected<% End If %>><%=arrDomains(i)%></option>
            						<% Next %>
                                </select>
                                -->
                            </td>
                        </tr>
                        <tr>
                            <th><span>연락처</span></th>
                            <td>
                            	<select name="m1">
                                  <option value="010" <% If m1 = "010" Then %>selected<% End If %>>010</option>
                                  <option value="011" <% If m1 = "011" Then %>selected<% End If %>>011</option>
                                  <option value="016" <% If m1 = "016" Then %>selected<% End If %>>016</option>
                                  <option value="017" <% If m1 = "017" Then %>selected<% End If %>>017</option>
                                  <option value="018" <% If m1 = "018" Then %>selected<% End If %>>018</option>
                                  <option value="019" <% If m1 = "019" Then %>selected<% End If %>>019</option>
                                </select> -
                                <input type="text" maxlength="4" name="m2" value="<%=m2%>" onkeyup="isNum(this);" style="width:20%;max-width:50px;"> -
                                <input type="text" maxlength="4" name="m3" value="<%=m3%>" onkeyup="isNum(this);" style="width:20%;max-width:50px;">
                            </td>
                        </tr>
                        <tr class="view_row">
                            <td class="view_content" colspan="2">
                                <textarea name="sccontents" style="width:100%; height:300px;" maxlength="1000"><%=sccontents%></textarea>
                            </td>
                        </tr>
                    </table>
                    <div class="btns-wrap">
                        <input type="button" onClick="return chkVal();" value="<% If wtype = "up" Then %>수 정<% Else %>등 록<% End If %>">
                        <a href="online-counselling.asp">목록보기</a>
                    </div>
                </form>
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
