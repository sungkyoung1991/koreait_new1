<!--#include virtual="/_include/Service_Inc.inc"-->
<!--#include virtual="/_include/2017/inc_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_head.inc"-->
<!--#include virtual="/_include/2017/inc_body_sub_head.inc"-->

<%
Dim sortKey,  sortVal
Dim crtitle, crscode, cate

'과정대분류 검색
cate = getQuery("clscata")
crcd = getQuery("crcd")
scode = getQuery("scode")

if scode = "" then
	scode = 0
END IF
if sortKey="" then
sortKey = "regdate"
end if

if sortVal="" then
	sortVal = "asc"
end if

	
%>
<script language="javascript">
<%
For i = 1 To UBound(arrClassCata)
	sql = "select r.crcd, r.crtitle, r.crinning, r.edusdate, r.eduedate, Rtrim(r.scode) as scode from TBL_CourseClass c, TBL_CourseReal r "
	sql = sql & "where c.clscd = r.clscd and r.crstatus = N'A' and c.clscata = " & i & " and scode != '0' order by scode, crcd"
	Set rs = conn.Execute(sql)
	If Not rs.EOF Then
		j = 1
%>
var arrClassCata<%=i%> = new Array();
arrClassCata<%=i%>[0] = new Option("", "-----------과정명-----------");
<%
		Do Until rs.EOF
'			crtitle = "[" & getDate(rs("edusdate"), "-") & "~" & getDate(rs("eduedate"), "-") & "] " & rs("crtitle") & " " & rs("crinning") & "회차"
			crtitle = rs("crtitle") & " " & rs("crinning") & "회차"
			crscode = rs("scode")
%>
arrClassCata<%=i%>[<%=j%>] = new Option("[<%=crscode%>]<%=rs(0)%>", "<%=crtitle%>");
<%
			rs.MoveNext
			j = j + 1
		Loop
	End If
	rs.close()
Next
%>

function setClsCourse(scode, cls ,crcd) {
	try{
		if(scode.value == 1){
			$(".campus_tel").text("한국IT직업전문학교(양재) TEL. 02-597-5731");
		}else if (scode.value == 2){
			$(".campus_tel").text("한국IT아카데미 노원캠퍼스 TEL. 02-577-8998");
		}else if (scode.value == 3){
			$(".campus_tel").text("한국IT아카데미(구로) TEL. 02-597-5156");
		}else {
			$(".campus_tel").text("한국IT직업전문학교 / 한국IT아카데미");
		}
	}
	catch (e){
		$(".campus_tel").text("한국IT직업전문학교 / 한국IT아카데미");
	}

	if(scode.value == 0){
		cls.options[0].selected = true;
		crcd.options[0].selected = true;
	}
	
	
	
	var x = cls.value == ""? 0 : cls.value;
	var scode = "[" + scode.value+"]";
	var cnt = 0;
	for (m = crcd.options.length - 1; m > 0; m--){
			crcd.options[m] = null;
	}
	if (x != "") {
		try{
			selectedarray = eval("arrClassCata" + x);
			for (i = 0; i < selectedarray.length; i++){
				if(cnt == 0) {
					crcd.options[cnt] = 	new Option(selectedarray[0].value, selectedarray[0].text);
					cnt++;
				}
				if(selectedarray[i].text.substr(0,3) == scode){
					crcd.options[cnt] = new Option( selectedarray[i].value, selectedarray[i].text.replace(scode, ''));
					cnt++;
				}
			}

			crcd.options[0].selected = true;
		}catch (e){
				crcd.options[cnt] = 	new Option(selectedarray[0].value, selectedarray[0].text);
				crcd.options[0].selected = true;
		}
	}
}

function chkVal(){
	if(!frm_join.chk_term1.checked){
		alert("약관에 동의하셔야 합니다.");
		frm_join.chk_term1.focus();			return false;
	}
	if (frm_join.scode.value  == "" || frm_join.scode.value == 0){
		alert("캠퍼스를 선택하세요"); 
		frm_join.scode.focus(); 
		return false;	
	}
 	if(frm_join.smname.value  == ""){
		alert("이름을 입력하세요"); 
		frm_join.smname.focus(); 
		return false;	
	}
	if(frm_join.smbirth.value  == "" || frm_join.smbirth.value.length < 6){
		alert("생년월일을 입력하세요"); 
		frm_join.smbirth.focus(); return false;
	}
	/*if(frm_join.e1.value == ""){
		alert("E-Mail을 입력하세요"); 
		frm_join.e1.focus(); return false;
	}*/
	if(isTXTEmpty(frm_join.m2.value)){
		
		alert("전화번호를 입력하세요"); 
		frm_join.m2.focus(); return false;
	}if(isTXTEmpty(frm_join.m3.value)){
		alert("전화번호를 입력하세요"); 
		frm_join.m3.focus(); return false;
	}

	frm_join.submit();
	return true;
}
</script>
   			<div class="contentTitle">
                <h2>온라인 접수</h2>
                    <form name="frm_join" action="online_proc.asp" method="post">
                    <input type="hidden" name="wtype" value="in" />
                    <div class="joinus">
                        <div class="access-terms">
                            <h3 class="jointitle">개인정보 취급방침</h3>
                            <div class="term_box" style="height:120px;">
                             	원서접수 시 아래내용과 같이 개인정보를 활용하고 있습니다.<br />
                                    ◎ 활용 정보항목<br />
                                    입학원서 접수 및 상담, 공지 알림 등을 위해 아래와 같은 개인정보를 활용하고 있습니다.<br />
                                    - 수집항목 : 이름, 이메일, 전화번호, 휴대폰번호<br />
                                    - 수집방법 : 원서접수<br />
                                    ◎ 본교는 활용목적이외에 어떠한 목적으로도 개인정보를 활용 및 제공하지 않습니다.
                            </div>
                            <div class="check-wrap">
                                <label><input type="checkbox" name="chk_term1" value="Y"> 개인정보보호정책에 동의합니다.</label>
                            </div>
                        </div>
                   </div>
                
		<div class="joinForm">
          <input type="hidden" name="chkid" value="" />
          <table id="join-board">
           <caption style="caption-side: bottom; margin-top:10px;"> * 신청서류 접수 순서대로 해당캠퍼스 전문 상담자가 개별 연락을 드리겠습니다.</caption>
          <tr>
          		<th colspan="2" class="campus_tel">
                	한국IT직업전문학교 / 한국IT 아카데미
                </th>
          </tr>
          <tr>
          	<th>지원과정</th>
            <td class="selectBoxWrap">
            	<select name="scode"  onchange="setClsCourse(this, this.form.clscd,this.form.crcd);" >
                <option value="0" <%IF scode = "" THEN %> selected <%END IF%>>--------캠퍼스선택--------</option>
                	<option value="1" <%IF scode = 1 THEN %> selected <%END IF%>>한국IT직업전문학교(양재)</option>
                    <!--<option value="2" <%IF scode = 2 THEN %> selected <%END IF%>>노원캠퍼스</option>-->
                    <option value="3" <%IF scode = 3 THEN %> selected <%END IF%>>한국IT아카데미(구로)</option>
                </select>
					<select name="clscd" onchange="setClsCourse(this.form.scode, this, this.form.crcd);">
						<option value="">--------훈련구분--------</option>
<%	For i = 1 To UBound(arrClassCata) %>
		<option value="<%=i%>" <% If Cstr(i) = cate Then %>selected<% End If %>><%=arrClassCata(i)%></option>
<%	Next %>
</select>
                <select name="crcd">                    <option value="">-----------과정명-----------</option>
<%
	If cate <> "" And crcd <> "" Then
	sql = "select r.crcd, r.crtitle, r.crinning, r.edusdate, r.eduedate from TBL_CourseClass c, TBL_CourseReal r "
	sql = sql & "where c.clscd = r.clscd and r.crstatus = N'A' and scode like '" & scode & "%' And c.clscata= '" & cate  & "' order by crcd"
	Set rs = conn.Execute(sql)
	If Not rs.EOF Then
		Do Until rs.EOF
			crtitle = rs("crtitle") & " " & rs("crinning") & "회차"
%>
					  <option value="<%=rs("crcd")%>" <% If rs("crcd") & "" = crcd Then %>selected<% End If %>><%=rs("crtitle") & " " & rs("crinning")%>회차</option>
<%
			rs.MoveNext
		Loop
	End If
END IF
%>
		</select>
            </td>
          </tr>
              <tr>
                  <th><span>이름</span></th>
                  <td>
                      <input type="text" name="smname">
                  </td>
              </tr>
              <tr>
                  <th><span>생년월일</span></th>
                  <td>
                      <input type="text" maxlength="6" name="smbirth" onkeyup="isNum(this);">
                      <span class="small_txt">&nbsp;주민등록번호 앞6자리를 입력해주세요.</span>
                  </td>
              </tr>
              <tr>
                  <th><span>이메일</span></th>
                  <td>
                  	<input type="text" name="e1" maxlength="100">
                  	<!--
                      <input type="text" name="e1"> @ <input type="text" name="e2">
                      <select class="join-emailList" name="tmpDomain" onchange="chDomain(this.form, this.value);">
                      	<option value="">---------------------</option>
						<% For i = 0 To UBound(arrDomains) %>
						<option value="<%=arrDomains(i)%>"><%=arrDomains(i)%></option>
						<% Next %>
                      </select>
                      -->
                  </td>
              </tr>
              <tr>
                  <th><span>휴대폰</span></th>
                  <td>
                      <select name="m1">
                          <option value="010" selected>010</option>
                          <option value="011">011</option>
                          <option value="016">016</option>
                          <option value="017">017</option>
                          <option value="018">018</option>
                          <option value="019">019</option>
                      </select> -
                      <input type="text" maxlength="4" name="m2" size="4"> -
                      <input type="text" maxlength="4" name="m3" size="4">
                      <span class="small_txt">&nbsp;연락 가능한 휴대전화번호를 입력하여 주십시오 </span>
                  </td>
              </tr>
          </table>
          
          <div class="joinbtnWrap">
              <input type="button" class="button_green" onClick="chkVal();" value="접수">&nbsp;&nbsp;
              <input type="reset" class="button_green" value="다시입력">
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