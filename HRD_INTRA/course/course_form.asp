<%
wtype	= getQuery("wtype")
cpage	= getQuery("cpage")
psize	= getQuery("psize")
crcd	= getQuery("crcd")
schval	= getQuery("schval")
schtype	= getQuery("schtype")
isCopy	= getQuery("isCopy")
copycd	= getQuery("copycd")
copycls	= getQuery("copycls")


'대분류 검색
schclscata = getQuery("schclscata")

set getConfigCourse = New CourseConfig
arrCourseClass 	= getConfigCourse.getCourseClassList
arrCourseDiv	= getConfigCourse.getCourseDivList
arrSchool		= getConfigCourse.getSchoolList
arrCrcdList		= getConfigCourse.getCrcdList

IF wtype = "in" Then
	setSelect = ""
ElseIF wtype = "up" Then
	setSelect = "disabled readonly"
END IF
If wtype = "up" Or (wtype = "in" And isCopy = "Y") Then
'	sql = "SELECT cr.*,sk.img_path FROM " & tb & " cr, koreaitweb.bannerImg sk WHERE sk.crcd = cr.crcd and cr.crcd = " & crcd
	sql = "SELECT * FROM " & tb & " WHERE crcd = " & crcd
	If wtype = "in" And isCopy = "Y" Then
'		sql = "SELECT * FROM " & tb & " cr, koreaitweb.bannerImg sk WHERE sk.crcd = cr.crcd and cr.crcd = " & copycd
		sql = "SELECT * FROM " & tb & " WHERE crcd = " & copycd
	End If


	Set rs = adminDB.Execute(sql)
	If Not rs.EOF Then
		clscd		= rs("clscd")
		divcd		= rs("divcd")
		scode		= rs("scode")
		crtitle2	= rs("crtitle")
		crinning	= CInt(rs("crinning"))
		edusdate	= getDate(rs("edusdate"), "-")
		eduedate	= getDate(rs("eduedate"), "-")
		edustime	= rs("edustime")
		eduetime	= rs("eduetime")
		edudays		= rs("edudays")
		eduhours	= rs("eduhours")
		isimg		= rs("isimg")
		isncs		= rs("isncs")
		ncscd		= rs("ncscd")
		occcd		= rs("occcd")
		edupay		= rs("edupay")
		govpay		= rs("govpay")
		selfpay		= rs("selfpay")
		teacher		= rs("teacher")
		eduplace	= rs("eduplace")
		isview		= rs("isview")
		crstatus	= rs("crstatus")
		appcnt		= rs("appcnt")
		isadtest	= rs("isadtest")
		basictest	= rs("basictest")
		counseltest	= rs("counseltest")
		educheck	= rs("educheck")
		testcnt		= rs("testcnt")
		unity		= rs("unity_yn")
		regdate		= getDate(rs("regdate"), "-") & " " & getTime(rs("regdate"), ":")
		regadmin	= getAdminID(rs("regadmin")) & " (" & getAdminName(rs("regadmin")) & ")"
		lastupdate	= getDate(rs("lastupdate"), "-") & " " & getTime(rs("lastupdate"), ":")
'		lastupdater	= getAdminID(rs("lastupdater")) & " (" & getAdminName(rs("lastupdater")) & ")"

	'	img_path = rs("img_path")

		'2017.02.22
		teacherGroup = rs("teacherGroup")

		If IsNull(teacherGroup) Then teacherGroup = ""
		teacherGroup = Replace(teacherGroup,"][","|")
		teacherGroup = Replace(teacherGroup,"[","")
		teacherGroup = Replace(teacherGroup,"]","")
		teacherGroup = Replace(teacherGroup," ","")
		If Len(teacherGroup) >= 1 Then teacherGroupArray = Split(teacherGroup,"|")
	Else
		tmp = errPath("error;;", "./")
	End If

ElseIf wtype = "in" Then
	edupay		= 0
	govpay		= 0
	selfpay		= 0
	crtitle2	= ""
	edusdate	= getDate(Now(), "-")
	eduedate	= getDate(Now(), "-")
	testcnt		= 0
	lastupdate	= getDate(Now(), "-")
	regadmin	= getAdminID(ADMIN_CD) & " (" & getAdminName(ADMIN_CD) & ")"

Else
	tmp = errPath("", "/")
End If

args = "&cpage=" & cpage & "&psize=" & psize & "&schtype=" & schtype & "&schval=" & schval & "&schclscata=" & schclscata

sql = "SELECT clscd, clsname FROM TBL_CourseClass Where status=1 order by clsname"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	ReDim arrClsCDs(rs.RecordCount - 1), arrClsNames(rs.RecordCount - 1)
	i = 0
	Do Until rs.EOF
		arrClsCDs(i) = rs("clscd")
		arrClsNames(i) = rs("clsname")
		rs.MoveNext
		i = i + 1
	Loop
End If

sql = "SELECT sName, scode FROM TBL_AdminSchool where status = '1' order by scode asc"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	ReDim arrScodes(rs.RecordCount - 1), arrSnames(rs.RecordCount - 1)
	i = 0
	Do Until rs.EOF
		arrScodes(i) = rs("scode")
		arrSnames(i) = rs("sName")
		rs.MoveNext
		i = i + 1
	Loop
End If
%>

<script language="javascript">
<%
For i = 0 To UBound(arrClsCDs)
	sql = "SELECT crcd, crtitle, crinning, edusdate, eduedate FROM TBL_CourseReal WHERE clscd = " & arrClsCDs(i) & " and scode like  '" & replace(ADMIN_SCODE, 0 , "%") & "%' "
	sql = sql & " and crstatus != 'E' ORDER BY crcd"
	response.Write sql
	Set rs = adminDB.Execute(sql)
	If Not rs.EOF Then
		j = 1
%>
var arrCrCDs<%=arrClsCDs(i)%> = new Array();
arrCrCDs<%=arrClsCDs(i)%>[0] = new Option("", " -- 과정 선택 -- ");
<%
		Do Until rs.EOF
			crtitle = "[" & getDate(rs("edusdate"), "-") & "~" & getDate(rs("eduedate"), "-") & "] " & rs("crtitle") & " " & rs("crinning") & "회차"
%>
arrCrCDs<%=arrClsCDs(i)%>[<%=j%>] = new Option("<%=rs(0)%>", "<%=crtitle%>");
<%
			rs.MoveNext
			j = j + 1
		Loop
	End If
	rs.close()
Next
%>



function setClsCourse(obj, target) {
	var x = obj.value;
	for (m = target.options.length - 1; m > 0; m--)
		target.options[m] = null;

	if (x != "") {
		selectedarray = eval("arrCrCDs" + x);

		for (i = 0; i < selectedarray.length; i++)
			target.options[i] = new Option(selectedarray[i].value, selectedarray[i].text);

		target.options[0].selected = true;
	}
}

function chkVal(frm) {
	var crtitle = frm.crtitle.value;
	var chk1 = frm_old_photo.old_photo2.value;
	if (isTXTEmpty(crtitle)) {
		alert("과정명은 반드시 입력하셔야 합니다.");
		frm.crtitle.focus();	return false;
	}

/*		if ($("#old_photo2").val()=="") {
		alert("이미지를 반드시 등록해주세요.");
		return false;
	}*/


	return true;
}

function chTestCnt(frm, val) {
	var obj = null;
	for (i = 1; i <= 20; i++) {
		obj = document.getElementById("d" + i);
		if (i <= val) {
			obj.style.display = "inline";
		} else {
			obj.style.display = "none";
		}
	}
}

function testCal(frm, chk) {
	var basictest = frm.basictest;
	var counseltest = frm.counseltest;
	var tmp = 0;
	if (chk == "b") {
		if (isNaN(basictest.value)) {
			alert("숫자만 입력하세요.");	basictest.value = "";
		} else if (basictest.value > 100) {
			alert("기초능력평가와 상담점수의 합이 100점이 넘으면 안됩니다.");	basictest.value = "";
		} else {
			counseltest.value = 100 - basictest.value;
		}
	} else if (chk == "c") {
		if (isNaN(counseltest.value)) {
			alert("숫자만 입력하세요.");	counseltest.value = "";
		} else if (basictest.value > 100) {
			alert("기초능력평가와 상담점수의 합이 100점이 넘으면 안됩니다.");	counseltest.value = "";
		} else {
			basictest.value = 100 - counseltest.value;
		}
	}
}

function calcPay(chk, gov, self) {
	var total = document.frm_course.edupay.value;
	if (isNaN(total)) {
		alert("교육금액은 숫자만 입력해야 합니다.");	document.frm_course.edupay.focus();
	} else {
		if (chk == "g") {
			if (isNaN(gov.value)) {
				alert("정부지원금은 숫자만 입력해야 합니다.");		document.frm_course.govpay.focus();
			} else {
				self.value = total - gov.value;
			}
		} else {
			if (isNaN(self.value)) {
				alert("자비부담금은 숫자만 입력해야 합니다.");		document.frm_course.selfpay.focus();
			} else {
				gov.value = total - self.value;
			}
		}
	}
}

<% If wtype = "up" And chkPermission(mno, DELETE) Then %>
function callDel(val) {
	if (confirm("선택한 과목을 삭제하시겠습니까?")) {
		var obj = document.getElementById("del");
		obj.src = "course_subject_del.asp?crcd=<%=crcd%>&ctcd="+val;
	}
}
<% End If %>

function chkValCopy(frm) {
	var copycd = frm.copycd.value;
	if (isTXTEmpty(copycd)) {
		alert("과정명은 반드시 입력하셔야 합니다.");
		frm.copycd.focus();	return false;
	}

	/*if ($("#old_photo2").val()=="") {
		alert("이미지를 반드시 등록해주세요.");
		return false;
	}*/

	return true;
}

function setScode(val){
	$("input[name=scode]").val(val);
}

$(function() {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		//buttonImage: "/images/kr/create/btn_calendar.gif",
		buttonImageOnly: true,
		// showOn :"both",
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		duration:200,
		showAnim:'show',
		showMonthAfterYear: false
		// yearSuffix: '년'
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	$( "#edusdate" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#eday" ).datepicker( "option", "minDate", selectedDate );
		}
	});
	$( "#eduedate" ).datepicker({
		//defaultDate: "+1w",
		changeMonth: true,
		//numberOfMonths: 3,
		dateFormat:"yy-mm-dd",
		onClose: function( selectedDate ) {
			//$( "#sday" ).datepicker( "option", "maxDate", selectedDate );
		}
	});
});


function setImgSrc(){

	var input =  document.getElementById("old_photo2");
	var formData = new FormData();
	var fileSize = input.files[0].size;
	var imgext = input.value;
	imgext = imgext.slice(imgext.indexOf(".") + 1).toLowerCase();

	if(imgext != "jpg" && imgext != "png" &&  imgext != "gif" &&  imgext != "bmp"){ //확장자를 확인합니다.

		alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
		input.value = "";
		return;

	}
	if(fileSize < 2048010) {
		if(input.files && input.files[0]){
			var reader = new FileReader();
				reader.onload = function(e){
				$("#old_photo2").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}

	setImgSubmit();

	}else {
		alert("2MB 이하의 파일만 업로드 가능합니다.");
		input.value = "";
	}


 }

function setImgSubmit()
{
	var gsWin = window.open("about:blank", "winName");
	window.focus();
	/*$("#frm_old_photo").attr("action","<%=self%>&mode=iproc");*/
	$("#frm_old_photo").attr("target","winName");
   $("form#frm_old_photo").submit();

}

</script>
<style>
	td, th { font-size:11px; }
	tr { height:30px; }
</style>

<table width="<%=width%>" border="0" cellspacing="1" cellpadding="3" bgcolor="<%=fptbg%>">
<tr height="40"><td style="color:<%=fptfg%>; font-size:11pt; font-weight:bold;">&nbsp;:: 과정 <% If wtype = "in" Then %>등록.<% Else %>수정<% End If %></td></tr>
</table>
<% If wtype = "in" Then %>
<table width="<%=width%>" border="0" cellspacing="1" cellpadding="3" bgcolor="<%=fbbg%>">
<form name="frm_copy" action="<%=self%>&mode=form<%=args%>&wtype=<%=wtype%>&isCopy=Y" method="post"  enctype="multipart/form-data" onsubmit="return chkValCopy(this);">
<% Response.Write self %>
<tr style="font-size:11pt; font-weight:bold;" height="30">
<td align="center">구분 :
	<select name="copyCls" id="copyCls" style="width:150px;" onchange="setClsCourse(this, this.form.copycd);">
		<option value="">구분 선택</option>
<%	For i = 0 To UBound(arrClsCDs) %>
		<option value="<%=arrClsCDs(i)%>" <% If StrComp(copyCls,arrClsCDs(i))=0 Then %>selected<% End If %>><%=arrClsNames(i)%></option>
<%	Next %>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;
	과정선택 :
	<select name="copycd" id="copycd" style="width:400px;">
<%	If isCopy = "Y" Then %>
<script language="javascript">
	setClsCourse(this.form.copyCls, this.form.copycd);
	/*setClsCourse(<%=copycls%>, <%=copycd%>);*/
</script>
<%
	Else
		Response.write "<option value=''> -- 과정 선택 -- </option>"
	End If
%>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;
<!--	<input type="submit" value="과정 복사" class="btn" />-->
    <input type="text" value="과정 복사" class="btn" id="copybtn" role="button" readonly />
    <script>
		$("#copybtn").click(function(){
				var copycd = $("#copycd").val();
				var copycls = $("#copyCls").val();
				location.href = "<%=self%>&mode=form<%=args%>&wtype=<%=wtype%>&isCopy=Y&copycd="+copycd+"&copycls="+copycls
			});
	</script>
</td>
</tr>
</form>
</table>
<% End If %>
<table width="<%=width%>" border="0" cellspacing="1" cellpadding="3" bgcolor="<%=fcl%>" style="table-layout:fixed;">
<tr height="1">
<td width="10%"></td>
<td width="23%"></td>
<td width="10%"></td>
<td width="23%"></td>
<td width="10%"></td>
<td width="23%"></td>
</tr>
<form name="frm_course" action="<%=self%>&mode=proc<%=args%>&wtype=<%=wtype%>&crcd=<%=crcd%>" method="post" onsubmit="return chkVal(this);">
<% IF ADMIN_SCODE = "%" or CSTR(ADMIN_SCODE) = "0" Then
	'IF ADMIN_SCODE = "%" Then
%>
<tr>
    <th bgcolor="<%=fcbg%>">
    	캠퍼스
    </th>
    <td bgcolor="<%=fcbg2%>">
    	<select name="chkscode" onChange="setScode(this.value)" <%IF  CSTR(ADMIN_SCODE) = "0" Then %><%=setSelect%><%END IF%>>
        <%For i = 0 To UBound(arrSchool)%>
        	<option value="<%=arrSchool(i).Scode%>" <%IF scode = arrSchool(i).Scode Then %> selected <%END IF%> >
			<%=arrSchool(i).Sname%></option>
        <%NEXT%>
        </select>
    </td>
	<th bgcolor="<%=fcbg%>" align="center">
    	관리
    </th>
    <td bgcolor="<%=fcbg2%>"  colspan="3">
    	<select name="unity">
        	<option value="A" <%IF unity = "A" Then %> selected <%END IF%>>통합</option>
        	<option value="Y" <%IF unity = "Y" Then %> selected <%END IF%>>마케팅</option>
            <option value="N" <%IF unity = "N" Then %> selected <%END IF%>>캠퍼스</option>
        </select>
    </td>

</tr>
<%END IF%>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;구분</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<select name="clscd">
<% For i = 0 To UBound(arrCourseClass) %>
		<option value="<%=arrCourseClass(i).Clscd%>" <% If clscd = arrCourseClass(i).Clscd Then %>selected<% End If %>><%=arrCourseClass(i).Clsname%></option>
<% Next %>
	</select>&nbsp;
</td>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;분류</th>
<td bgcolor="<%=fcbg2%>" colspan="3">&nbsp;
	<select name="divcd">
<% For i = 0 To UBound(arrCourseDiv) %>
		<option value="<%=arrCourseDiv(i).Divcd%>" <% If divcd = arrCourseDiv(i).Divcd Then %>selected<% End If %>><%=arrCourseDiv(i).DivName%></option>
<% Next %>
	</select>
</td>
</tr>
<tr>
<th align="center" bgcolor="<%=fcbg%>">&nbsp;<span class="must">*</span> 과정명</th>
<td bgcolor="<%=fcbg2%>" colspan="5">&nbsp;&nbsp;
	<input type="hidden" name="scode" value="<%=scode%>">
	<input type="text" name="crtitle" value="<%=crtitle2%>" size="100" maxlength="100" />
	<select name="crinning">

	<% For i = 1 To 50 %>
		<option value="<%=i%>" <% If i = crinning Then %>selected<% End If %>><%=i%>회차</option>
	<% Next %>
		</select>
</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;과정상태</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<select name="crstatus">
<% For i = 0 To UBound(arrCrStatusCDs) %>
		<option value="<%=arrCrStatusCDs(i)%>" <% If crstatus = arrCrStatusCDs(i) Then %>selected<% End If %>><%=arrCrStatusNames(i)%></option>
<% Next %>
	</select>
</td>
<th bgcolor="<%=fcbg%>" align="center">훈련기간</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<input type="text" name="edusdate" id="edusdate" value="<%=edusdate%>" size="10" class="ipt" /> ~
	<input type="text" name="eduedate" id="eduedate" value="<%=eduedate%>" size="10" class="ipt" />
</td>
<th bgcolor="<%=fcbg%>" align="center">아이콘 사용</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<select name="isimg" class="cmb" style="width:100px;">
		<option value="N" <% If isimg = "N" Then %>selected<% End If %>>사용안함</option>
		<option value="A" <% If isimg = "A" Then %>selected<% End If %>>마감임박</option>
		<option value="B" <% If isimg = "B" Then %>selected<% End If %>>마감</option>
		<option value="C" <% If isimg = "C" Then %>selected<% End If %>>대기접수</option>
	</select>
</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;NCS여부</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<input type="radio" name="isncs" value="Y" <% If isncs = "Y" Then %>checked<% End If %>>적용&nbsp;
	<input type="radio" name="isncs" value="N" <% If isncs = "N" Then %>checked<% End If %>>미적용
</td>
<th bgcolor="<%=fcbg%>" align="center">NCS코드</th>
<td bgcolor="<%=fcbg2%>" colspan="3">&nbsp;
	<select name="ncscd" style="width:400px;">
<%
sql = "select ncscd, ncscode, ncsname from TBL_CourseNCS"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	response.write "<option value=''>NCS코드를 선택하세요.</option>"
	Do Until rs.EOF
%>
		<option value="<%=rs("ncscd")%>" <% If ncscd = rs("ncscd") Then %>selected<% End If %>><%="[" & rs("ncscode") & "] " & rs("ncsname")%></option>
<%
		rs.MoveNext
	Loop
Else
	response.write "<option value=''>등록된 NCS코드가 없습니다.</option>"
End If
%>
	</select>
</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;총훈련일수</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<input type="text" name="edudays" value="<%=edudays%>" size="15" class="ipt2"> 일
</td>
<th bgcolor="<%=fcbg%>" align="center">직종코드</th>
<td bgcolor="<%=fcbg2%>" colspan="3">&nbsp;
	<select name="occcd" style="width:400px;">
<%
sql = "select occcd, occcode, occname from TBL_CourseOccCode"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	response.write "<option value=''>직종코드를 선택하세요.</option>"
	Do Until rs.EOF
%>
		<option value="<%=rs("occcd")%>" <% If occcd = rs("occcd") Then %>selected<% End If %>><%="[" & rs("occcode") & "] " & rs("occname")%></option>
<%
		rs.MoveNext
	Loop
Else
	response.write "<option value=''>등록된 직종코드가 없습니다.</option>"
End If
%>
	</select>
</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;총훈련시간</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<input type="text" name="eduhours" value="<%=eduhours%>" size="15" class="ipt2"> 시간
</td>
<th bgcolor="<%=fcbg%>" align="center">훈련시작시간</th>
<td bgcolor="<%=fcbg2%>" colspan="3">&nbsp;
	<input type="text" name="edustime" value="<%=edustime%>" size="5" class="ipt2" /> ~
	<input type="text" name="eduetime" value="<%=eduetime%>" size="5" class="ipt2" /> * 시간은 네자리로 표현 예) 0900
</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" width="10%" align="center">&nbsp;&nbsp;훈련비총액</th>
<td bgcolor="<%=fcbg2%>" width="23%">&nbsp;&nbsp;<input type="text" name="edupay" value="<%=edupay%>" class="ipt2" size="15" /> 원</td>
<th bgcolor="<%=fcbg%>" width="10%" align="center">&nbsp;&nbsp;정부지원금</th>
<td bgcolor="<%=fcbg2%>" width="23%">&nbsp;&nbsp;<input type="text" name="govpay" value="<%=govpay%>" onkeyup="calcPay('g', this, this.form.selfpay);" class="ipt2" size="15" /> 원</td>
<th bgcolor="<%=fcbg%>" width="10%" align="center">&nbsp;&nbsp;자비부담금</th>
<td bgcolor="<%=fcbg2%>" width="23%">&nbsp;&nbsp;<input type="text" name="selfpay" value="<%=selfpay%>" onkeyup="calcPay('s', this.form.govpay, this);" class="ipt2" size="15" /> 원</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;담임</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<select name="teacher" style="width:180px;">
		<option value="">담당 강사를 선택하세요.</option>
<%
sql = "select admincd, adminname, adminstatus from TBL_AdminList where adminduty in ('전임강사','시간강사') or adminname='이지혜' order by adminduty, adminname"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	teacherArray = rs.GetRows()
End If

If IsArray(teacherArray) Then
	For i = 0 To UBound(teacherArray,2)
		tmp = ""
		If CInt(teacherArray(0,i)) = CInt(teacher) Then	tmp = " selected"
		IF teacherArray(2,i) = "Y" or tmp <> "" Then
			response.write "<option value='" & teacherArray(0,i) & "'" & tmp & ">" & teacherArray(1,i) & "</option>"
		END IF
	Next
End If
%>
	</select>
</td>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;교육장소</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<select name="eduplace" style="width:180px;">
<%
sql = "select cepcd, cepname from TBL_CourseEduPlace"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	response.write "<option value=''>교육장소를 선택하세요.</option>"
	Do Until rs.EOF
		tmp = ""
		If rs("cepcd") = CInt(eduplace) Then	tmp = " selected"
		response.write "<option value='" & rs("cepcd") & "'" & tmp & ">" & rs("cepname") & "</option>"
		rs.MoveNext
	Loop
Else
	response.write "<option value=''>등록된 교육장소가 없습니다.</option>"
End If
%>
		</select>
</td>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;승인인원</th>
<td bgcolor="<%=fcbg2%>">&nbsp;&nbsp;<input type="text" name="appcnt" value="<%=appcnt%>" class="ipt2" size="15" /> 명</td>
</tr>

<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;담당교수</th>
<td bgcolor="<%=fcbg2%>" colspan="5">&nbsp;
<% For j = 0 To 7 %>
	<select name="teacherGroup" style="width:180px;">
		<option value="">담당 교수를 선택하세요.</option>
<%
If IsArray(teacherArray) Then
	For i = 0 To UBound(teacherArray,2)
		tmp = ""

		'등록된 담당교수
		If IsArray(teacherGroupArray) Then
			If LBound(teacherGroupArray,1) <= j And UBound(teacherGroupArray,1) >= j Then
				If StrComp(Trim(teacherGroupArray(j)), teacherArray(0,i)) = 0 Then tmp = " selected"
			End If
		End If
		IF teacherArray(2,i) = "Y" or tmp <> "" Then
		response.write "<option value='" & teacherArray(0,i) & "'" & tmp & ">" & teacherArray(1,i) & "</option>"
		End IF
	Next
End If
%>
	</select>
<%
	If j = 3 Then Response.write "<br/>&nbsp;"
Next
%>
</td>
</tr>

<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;사전평가</th>
<td bgcolor="<%=fcbg2%>">&nbsp;
	<input type="radio" name="isadtest" value="Y" <% If isadtest = "Y" Then %>checked<% End If %>>예&nbsp;
	<input type="radio" name="isadtest" value="N" <% If isadtest = "N" Then %>checked<% End If %>>아니오
</td>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;기초능력평가</th>
<td bgcolor="<%=fcbg2%>">&nbsp;&nbsp;<input type="text" name="basictest" value="<%=basictest%>" class="ipt2" onkeyup="testCal(this.form, 'b');" size="15" /> 점</td>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;상담점수</th>
<td bgcolor="<%=fcbg2%>">&nbsp;&nbsp;<input type="text" name="counseltest" value="<%=counseltest%>" class="ipt2" onkeyup="testCal(this.form, 'c');" size="15" /> 점</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;수강능력점검</th>
<td bgcolor="<%=fcbg2%>" colspan="5">&nbsp;
<%
sql = "select cebcd, cebname from TBL_CourseEduBr"
Set rs = adminDB.Execute(sql)
If Not rs.EOF Then
	Do Until rs.EOF
		chk = ""
		If (wtype = "up" Or isCopy = "Y") Then
			If InStr(educheck, ", ") > 0 Then
				tmp = Split(educheck, ", ")
				For i = 0 To UBound(tmp)
					If rs("cebcd") = CInt(tmp(i)) Then		chk = " checked"
				Next
			ElseIf educheck <> "" Then
				If rs("cebcd") = CInt(educheck) Then	chk = " checked"
			End If
		End If
		response.write "<input type='checkbox' name='educheck' value='" & rs("cebcd") & "'" & chk & " /> " & rs("cebname") & "&nbsp;&nbsp;"
		rs.MoveNext
	Loop
Else
	Response.write "수강능력점검에 필요한 프로그램을 [과정관리]->[세부설정]에서 등록한 후 사용하실 수 있습니다."
End If
%>
</td>
</tr>
<tr>
<th bgcolor="<%=fcbg%>" align="center">&nbsp;&nbsp;시험과목</th>
<td bgcolor="<%=fcbg2%>" colspan="5">&nbsp;
	<select name="testcnt" onchange="chTestCnt(this.form, this.value);">
		<option value="0">시험과목 개수 선택</option>
<% For i = 1 To 20 %>
		<option value="<%=i%>" <% If i = testcnt Then %>selected<% End if%>><%=i%> 과목</option>
<% Next %>
	</select>
	<iframe width="0" height="0" src="" id="del" frameborder="0"></iframe>
	<br />
<%
tmp = 1
If (wtype = "up" And crcd <> "") Or (wtype = "in" And copycd <> "") Then
	If wtype = "up" Then
		sql = "select * from TBL_CourseTest where crcd = " & crcd & " order by ctcd"
	ElseIf wtype = "in" Then
		sql = "select * from TBL_CourseTest where crcd = " & copycd & " order by ctcd"
	End If
	tmp2 = ""
	Set rs = adminDB.Execute(sql)
	If Not rs.EOF Then
		Do Until rs.EOF
			tmp2 = tmp2 & ":,:" & rs("ctcd")
%>
	<table width="30%" id="d<%=tmp%>" style="display:inline; table-layout:fixed;" cellspacing="0" cellpadding="3" border="0">
	<tr>
	<td><input type="text" name="ctname<%=tmp%>" value="<%=rs("ctname")%>" class="ipt" style="width:115px;" maxlength="50" /></td>
	<td>
		<select name="ctmethod<%=tmp%>" style="width:90px; height:20px;">
			<option value="u" <% If rs("ctmethod") = "u" Then %>selected<% End If %>>업로드&점수</option>
			<option value="p" <% If rs("ctmethod") = "p" Then %>selected<% End If %>>점수입력</option>
		</select>
<%			If wtype = "up" Then %>
		<img src="/img/delete.png" class="hand" onclick="callDel('<%=rs("ctcd")%>');" align="absmiddle" />
<%			End If %>
	</td>
	</tr>
	</table>
<%
			rs.MoveNext
			tmp = tmp + 1
		Loop
		response.write "<input type='hidden' name='tmp2' value='" & tmp2 & "' />"
	End If
End If

For i = tmp To 20
%>
	<table width="30%" id="d<%=i%>" style="display:none; table-layout:fixed;" cellspacing="0" cellpadding="3" border="0">
	<tr>
	<td>
		<input type="text" name="ctname<%=i%>" placeholder="시험과목명<%=i%>" style="width:115px;" maxlength="50" />
	</td>
	<td>
		<select name="ctmethod<%=i%>" style="width:90px; height:20px;">
			<option value="u">업로드&점수</option>
			<option value="p">점수입력</option>
		</select>
	</td>
	</tr>
	</table>
<%
Next
%>
</td>
</tr>
<tr height="40">
<td bgcolor="<%=fbbg%>" colspan="6" align="center">
<% If wtype = "up" And chkPermission(mno, UPDATE) Then %>
	<input type="submit" value=" 과정 수정 " class="btn" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% ElseIf wtype = "in" And chkPermission(mno, INSERT) Then %>
	<input type="submit" value=" 과정 등록 " class="btn" onClick="setImgSrc()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% End If %>
<% If wtype = "up" And chkPermission(mno, DELETE) And "a" = "b" Then %>
<script language="javascript">
function courseDel() {
	if (confirm("정말 삭제하시겠습니까?")) {
		location.replace("<%=self%>&mode=proc&wtype=del&crcd=<%=crcd%>");
	} else {
		return;
	}
}


</script>
	<input type="button" value=" 과정 삭제 " class="btn" onclick="courseDel();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<% End If %>
	<input type="reset" value=" 다시 쓰기 " class="btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="  목록 보기  " class="btn" onclick="location.href='<%=self & args & "&mode=list"%>';">
</td>
</tr>

<input type="hidden" name="tbphoto" id="tbphoto" value="<%=img_path%>"/>

</form>

<% if strcomp(wtype,"in")=0 then %>
<tr>
	<th bgcolor="#C1C1C1">이미지첨부</th>
	<td bgcolor="#FFFFFF" colspan="5">
    	<form name='frm_old_photo' action='<%=self%>&mode=iproc&wtype=<%=wtype%>&crcd=<%=crcd%>&clscd=<%=clscd%>&divcd=<%=divcd%>&scode=<%=scode%>' id='frm_old_photo' method='post' enctype='multipart/form-data'>
            <input type="file" id="old_photo2" name="old_photo2" value="<%=img_path%>"/>
         </form>
    </td>
</tr>
<% end if %>


</table><br>
