<%@Language="VBScript" CODEPAGE="65001" %>
<%
Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
%>

<!-- #include virtual="/_include/$dbconnect.asp" -->
<%
'//�ܺ��Է� ����
If InStr(Request.ServerVariables("HTTP_REFERER"), Request.ServerVariables("HTTP_HOST"))<=0 Then
	Response.Write "<!DOCTYPE html>"
	Response.Write "<html lang='ko'>"
	Response.Write "<head>"
	Response.Write "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />"
	Response.Write "<meta http-equiv='X-UA-Compatible' content='IE=edge' />"
	Response.Write "<title>한국IT - 잘못된 접근</title>"
	Response.Write "<script type='text/javascript'>"
	Response.Write "alert('잘못된 접근입니다.');"
	Response.Write "</script>"
	Response.Write "</head>"
	Response.Write "</html>"
	Response.End	
End If
%>
<%
Function XssFilter(strTempX)
'	// 캐릭터 타입 검증 'H'-한글, 'E'-영문, 'N'-숫자, 'Z'-기타
	'strTempX = Replace(strTempX, "<", "〈")
	'strTempX = Replace(strTempX, ">", "〉")
	'strTempX = Replace(strTempX, "(", "（")
	'strTempX = Replace(strTempX, ")", "）")
	'strTempX = Replace(strTempX, "[", "［")
	'strTempX = Replace(strTempX, "]", "］")
	'strTempX = Replace(strTempX, "{", "｛")
	'strTempX = Replace(strTempX, "}", "｝")
	'strTempX = Replace(strTempX, "/", "／")
	'strTempX = Replace(strTempX, "%", "％")
	'strTempX = Replace(strTempX, ";", ":")
	'strTempX = Replace(strTempX, "&", "＆")
	strTempX = Replace(strTempX, "'", "´")
	'strTempX = Replace(strTempX, "-", "ㅡ")
	'strTempX = Replace(strTempX, ",", "．")
	'strTempX = Replace(strTempX, ".", "．")
	'strTempX = Replace(strTempX, CHR(34),"˝")
	'strTempX = Server.HTMLEncode(strTempX)

	strTempX = Trim(strTempX)
	XssFilter = strTempX
End Function
%>
<html>
<title></title>
<!-- ��ȯ������ ���� -->
 <script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
 <script type="text/javascript">
var _nasa={};
 _nasa["cnv"] = wcs.cnv("4","1");
</script> 
                
<!-- ���� ���� ��ũ��Ʈ , ��� �������� ����ǵ��� ��ġ. �� ��ȯ������ ���������� �׻� �ϴܿ� ��ġ�ؾ��� --> 
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script> 
<script type="text/javascript"> 
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_49cb760f80a7";
if (!_nasa) var _nasa={};
wcs.inflow();
wcs_do(_nasa);
</script>
<head>
<SCRIPT language="JavaScript" type="text/javascript">
<!-- Overture Korea

window.ysm_customData = new Object();

window.ysm_customData.conversion = "transId=,currency=,amount=";

var ysm_accountid  = "1GBD9FHDVVTN21E8ARR2FT267G8";

document.write("<SCR" + "IPT language='JavaScript' type='text/javascript' "

+ "SRC=//" + "srv3.wa.marketingsolutions.yahoo.com" + "/script/ScriptServlet" + "?aid=" + ysm_accountid

+ "></SCR" + "IPT>");

// -->
</SCRIPT>


</head>
<%
regyear = XssFilter(request("regyear"))
interviewtype = XssFilter(request("interviewtype"))
RegType = XssFilter(request("RegType"))
If RegType = "" Then RegType = 0

name = XssFilter(request("name"))
IF name = "" THEN
	name = "NULL"
END IF

'admission = XssFilter(request("admission")) : If Len(admission) = 0 Then admission = 1



admission_div = XssFilter(request("admission_div"))
sex = XssFilter(request("sex"))
pname = XssFilter(request("pname"))

part1 = XssFilter(request("part1"))
course1 = XssFilter(request("course1"))

part2 = XssFilter(request("part2"))
course2 = XssFilter(request("course2"))

jumin = XssFilter(request("jumin1"))

Picture = XssFilter(request("tempPhoto"))
armytype = XssFilter(request("armytype"))
graduation = XssFilter(request("graduation"))
recommend2 = XssFilter(request("recommend2"))

If Len(request("hopedate2")) <= 1 Then
	hopedate2 = "0" & XssFilter(request("hopedate2"))
Else
	hopedate2 = XssFilter(request("hopedate2"))
End If

If Len(request("hopedate3")) <= 1 Then
	hopedate3 = "0" & XssFilter(request("hopedate3"))
Else
	hopedate3 = XssFilter(request("hopedate3"))
End if

hopedate = XssFilter(request("hopedate1")) & "-" & hopedate2 & "-" & hopedate3

hopedate = XssFilter(request("hopedate"))

'�ſ����ȣ ���� - 2016.04.07
zipcode = XssFilter(request("zipcode"))
If Len(zipcode) <= 4 Then
	zipcode = XssFilter(request("zipcode1") & "-" & request("zipcode2"))
End If

address1 = XssFilter(request("address1"))
address2 = XssFilter(request("address2"))

If request("tel2") <> "" And request("tel3") <> "" Then
	tel = XssFilter(request("tel1")) & "-" & XssFilter(request("tel2")) & "-" & XssFilter(request("tel3"))
Else
	tel = ""
End If

If request("mobile2") <> "" And request("mobile3") <> "" Then
	mobile = XssFilter(request("mobile1")) & "-" & XssFilter(request("mobile2")) & "-" & XssFilter(request("mobile3"))
Else
	mobile = ""
End If

If request("parent_tel2") <> "" And request("parent_tel3") <> "" Then
	parent_tel = XssFilter(request("parent_tel1")) & "-" & XssFilter(request("parent_tel2")) & "-" & XssFilter(request("parent_tel3"))
Else
	parent_tel = ""
End If

If request("parent_mobile2") <> "" And request("parent_mobile3") <> "" Then
	parent_mobile = XssFilter(request("parent_mobile1")) & "-" & XssFilter(request("parent_mobile2")) & "-" & XssFilter(request("parent_mobile3"))
Else
	parent_mobile = ""
End If

Parent_tel_01 = XssFilter(request("parent_tel1"))
Parent_tel_02	= XssFilter(request("parent_tel2"))

IF Parent_tel_01 <> "" THEN
	parent_mobile	= XssFilter(request("parent_tel1"))
END IF

email = XssFilter(request("email"))

If Len(request("Hgdate2")) <= 1 Then
	Hgdate2 = "0" & XssFilter(request("Hgdate2"))
Else
	Hgdate2 = XssFilter(request("Hgdate2"))
End If

Hgdate = XssFilter(request("Hgdate1")) & "/" & Hgdate2

Hcode = Replace(Request("Hcode"),"'","")
Hname = Replace(Request("Hname"),"'","")
Hmajor = Replace(Request("Hmajor"),"'","")
Hgtype = Replace(Request("Hgtype"),"'","")
Harea = Replace(Request("Harea"),"'","")

If request("Cgdate1") <> "" And request("Cgdate2") <> "" Then
	If Len(request("Cgdate2")) <= 1 Then
		Cgdate2 = "0" & XssFilter(request("Cgdate2"))
	Else
		Cgdate2 = XssFilter(request("Cgdate2"))
	End If

	Cgdate = XssFilter(request("Cgdate1")) & "/" & Cgdate2
Else
	Cgdate = ""
End If

school_gubun = XssFilter(request("school_gubun"))
select case CStr(school_gubun)
	case "1"
		Htype = "������"
	case "2"
		Htype = "�ι���"
	case "3"
		Htype = "��ü�ɰ�"
	case "4"
		Htype = "�ܱ���"
	case "5"
		Htype = "�������"
end select

'�����Ź
phigh = XssFilter(request("phigh"))
phigh_name = XssFilter(request("phigh_name"))

select case CStr(phigh)
	case "없음"
		phigh_name = "없음"
	case "있음"
		phigh_name = Cstr(phigh_name)
end select

' === Ÿ���� ������Ȳ ===
ocs_status = XssFilter(request("ocs_status"))
ocs_name = XssFilter(request("ocs_name"))
ocs_major = XssFilter(request("ocs_major"))


academy = XssFilter(request("academy"))
'Htype = XssFilter(request("Htype"))

Cname = XssFilter(request("Cname"))
Cmajor = XssFilter(request("Cmajor"))
Cgtype = XssFilter(request("Cgtype"))
Carea = XssFilter(request("Carea"))
Imotivation = XssFilter(request("Imotivation"))
ImotivationEtc = XssFilter(request("ImotivationEtc"))
recommend = XssFilter(request("recommend"))
'messenger = XssFilter(request("messenger"))
messengerid = XssFilter(request("messengerid"))
'homepy = XssFilter(request("homepy"))
'homepyurl = XssFilter(request("homepyurl"))
name1 = XssFilter(request("name1"))
name2 = XssFilter(request("name2"))
name3 = XssFilter(request("name3"))
name4 = XssFilter(request("name4"))
relation1 = XssFilter(request("relation1"))
relation2 = XssFilter(request("relation2"))
relation3 = XssFilter(request("relation3"))
relation4 = XssFilter(request("relation4"))
age1 = XssFilter(request("age1"))
age2 = XssFilter(request("age2"))
age3 = XssFilter(request("age3"))
age4 = XssFilter(request("age4"))
job1 = XssFilter(request("job1"))
job2 = XssFilter(request("job2"))
job3 = XssFilter(request("job3"))
job4 = XssFilter(request("job4"))

' === ���λ�� ����о� ===
call_request = XssFilter(request("call_request"))

senddate 	= year(now) & "-" & month(now) & "-" & day(now)

'�޸�(�������� �߰�) - 2016.04.20
interviewmemo = XssFilter(request("interviewmemo"))
select case CStr(interviewmemo)
	case "[일반전형]"
		admission = "1"
	case "[편입학전형]"
		admission = "2"
	case "[특별전형]"
		admission = "3"
end select



'�ڱ�Ұ��� �߰�  2018-04-16 
introduction = XssFilter(request.Form("introduction"))

ip = Request.ServerVariables("REMOTE_ADDR")

regdate = Now()

scode="5"	'���������б�:8, �ѱ�IT���������б�:5, ���﹮�������б�:10	 2011-07-05 �߰�
'3�� �б� ���� ����	2011-08-08


'=============================�ߺ�Ȯ��1��-�ֹι�ȣ��ȯ===========================================
If False Then
	SQL = "select num, name, jumin from Student where name = '"& name &"' and Left(jumin,6) = '"& Left(jumin,6) &"' and interviewtype = '"& interviewtype &"' and (deleter is null or deleter = '') and regyear = '"& regyear &"'"
	compType = interviewtype

	Set Jchk1 = conn.execute(SQL)

	If not Jchk1.eof Then
	'jumin=Replace(jumin,"-","+")
		If Mid(jumin,"8","1")="2" Then 

			jumin=Left(jumin,7)&"w"&Mid(jumin,"9","6")
		Else
			jumin=Left(jumin,7)&"m"&Mid(jumin,"9","6")
		End If 
	End If
End If
'=============================�ߺ�Ȯ��===========================================
SQL = "select top 1 num, name, jumin from Student where name = '"& name &"' and Left(jumin,6) = '"& Left(jumin,6) &"' and interviewtype = '"& interviewtype &"' and (deleter is null or deleter = '') and regyear = '"& regyear &"'"
compType = interviewtype

Set Jchk = conn.execute(SQL)

If not Jchk.eof Then
%>
<form name="EditFrm" method="post">
<input type="hidden" name="num" value="<%=Jchk("num")%>">
<input type="hidden" name="name" value="<%=Jchk("name")%>">
<input type="hidden" name="jumin" value="<%=Jchk("jumin")%>">
</form>
<script language="javascript">
	alert('<%=regyear%>학년도 <%=compType%>전형에 이미 등록된 원서가 존재합니다.');
	document.EditFrm.action = "support_apply.asp";
	document.EditFrm.submit();
</script>
<%
	response.end
End If


'=============================�ߺ�Ȯ��===========================================
SQL = "select top 1 num, name, jumin from Student where name = '"& name &"' and Left(jumin,6) = '"& Left(jumin,6) &"' and part1 = '"& part1 &"' and interviewresult='���հ�' and (deleter is null or deleter = '') and regyear = '"& regyear &"'"
compType = interviewtype

Set Rchk = conn.execute(SQL)

If not Rchk.eof Then
%>
<form name="EditFrm2" method="post">
<input type="hidden" name="num" value="<%=Rchk("num")%>">
<input type="hidden" name="name" value="<%=Rchk("name")%>">
<input type="hidden" name="jumin" value="<%=Rchk("jumin")%>">
</form>
<script language="javascript">
	alert('<%=regyear%>학년도 <%=part1%>에 불합격된 원서가 존재합니다.\n다른 스쿨로 재지원하시기 바랍니다.');
	document.EditFrm2.action = "support_apply.asp";
	document.EditFrm2.submit();
</script>
<%
	response.end
End If
'=================================================================================

'����ڵ�(Hcode)�� ��ȸ�Ͽ� ����ڻ��(DamdangNum)�� ����ڼ���(DamdangName)�� �����´�.
'If Trim(Hcode) <> "" then
'	strQuery = "select �����, staffName from ������_V where ID = "& Hcode
	'response.Write( strQuery &"<br>")

'	set rsCode = conn2.execute( strQuery )
'	If Not rsCode.eof Then
'		damdangSabun = rsCode("�����")
'		damdangName = rsCode("staffName")
'	End if
'Else
	damdangSabun = ""
	damdangName = ""
'End If
'response.write rsCode("�����")&rsCode("staffName")

'==== ������� ��Ÿ �Է½�. 19.03.18 === 
If ImotivationEtc<>"" Then
	Imotivation = Imotivation & ":" & ImotivationEtc
end If

SQL = "insert into Student ( RegType, admission,admission_div,name, sex, pname, scode, part1, course1, part2, course2, jumin, hopedate, zipcode,"
SQL = SQL & " address1, address2, tel, mobile, parent_tel, parent_mobile, email, Hgdate, Hname, Hcode,"
SQL = SQL & " Hmajor, Hgtype, Harea, ocs_status, ocs_name, ocs_major, Cgdate, Cname, Cmajor, Cgtype, Carea, Imotivation, recommend, call_request, messenger, messengerid,"
SQL = SQL & " homepy, homepyurl, name1, name2, name3, name4, relation1, relation2, relation3, relation4, age1, age2, age3,"
SQL = SQL & " age4, job1, job2, job3, job4, ip, senddate, regyear, interviewtype, picture, armytype, graduation,"
SQL = SQL & " recommend2, regdate, DamdangNum, DamdangName, DamdangBuseo "
IF interviewtype = "수시 1차" Or interviewtype = "예비수시" THEN
	SQL = SQL & ", interviewcostdate, interviewcosttype"
END IF
SQL = SQL & ", Htype, Parent_tel_01, Parent_tel_02, school_gubun, jubsu_gubun, interviewconfirm, interviewmemo, introduction, academy "
SQL = SQL & ")"
SQL = SQL & "VALUES("
SQL = SQL & RegType & ","
SQL = SQL & "'" & admission & "',"
SQL = SQL & "'" & admission_div & "',"
SQL = SQL & "'" & name & "',"
SQL = SQL & "'" & sex & "',"
SQL = SQL & "'" &  pname & "',"
SQL = SQL & "'" &  scode & "',"
SQL = SQL & "'" &  part1 & "',"
SQL = SQL & "'" &  course1 & "',"
SQL = SQL & "'" &  part2 & "',"
SQL = SQL & "'" &  course2 & "',"
SQL = SQL & "'" &  jumin & "',"
SQL = SQL & "'" &  hopedate & "',"
SQL = SQL & "'" &  zipcode & "',"
SQL = SQL & "'" &  address1 & "',"
SQL = SQL & "'" &  address2 & "',"
SQL = SQL & "'" &  tel & "',"
SQL = SQL & "'" &  mobile & "',"
SQL = SQL & "'" &  parent_tel & "',"
SQL = SQL & "'" &  parent_mobile & "',"
SQL = SQL & "'" &  email & "',"
SQL = SQL & "'" &  Hgdate & "',"
SQL = SQL & "'" &  Hname & "',"
SQL = SQL & "'" &  Hcode & "',"

SQL = SQL & "'" &  phigh_name & "',"

SQL = SQL & "'" &  Hgtype & "',"
SQL = SQL & "'" &  Harea & "',"
SQL = SQL & "'" &  ocs_status & "',"
SQL = SQL & "'" &  ocs_name & "',"
SQL = SQL & "'" &  ocs_major & "',"
SQL = SQL & "'" &  Cgdate & "',"
SQL = SQL & "'" &  Cname & "',"
SQL = SQL & "'" &  Cmajor & "',"
SQL = SQL & "'" &  Cgtype & "',"
SQL = SQL & "'" &  Carea & "',"
SQL = SQL & "'" &  Imotivation & "',"
SQL = SQL & "'" &  recommend & "',"
SQL = SQL & "'" &  call_request & "',"
SQL = SQL & "'" &  messenger & "',"
SQL = SQL & "'" &  messengerid & "',"
SQL = SQL & "'" &  homepy & "',"
SQL = SQL & "'" &  homepyurl & "',"
SQL = SQL & "'" &  name1 & "',"
SQL = SQL & "'" &  name2 & "',"
SQL = SQL & "'" &  name3 & "',"
SQL = SQL & "'" &  name4 & "',"
SQL = SQL & "'" &  relation1 & "',"
SQL = SQL & "'" &  relation2 & "',"
SQL = SQL & "'" &  relation3 & "',"
SQL = SQL & "'" &  relation4 & "',"
SQL = SQL & "'" &  age1 & "',"
SQL = SQL & "'" &  age2 & "',"
SQL = SQL & "'" &  age3 & "',"
SQL = SQL & "'" &  age4 & "',"
SQL = SQL & "'" &  job1 & "',"
SQL = SQL & "'" &  job2 & "',"
SQL = SQL & "'" &  job3 & "',"
SQL = SQL & "'" &  job4 & "',"
SQL = SQL & "'" &  ip & "',"
SQL = SQL & "'" &  senddate & "',"
SQL = SQL & "'" &  regyear & "',"
SQL = SQL & "'" &  interviewtype & "',"
'====================���� �߰��� �κ�
SQL = SQL & "'" &  picture & "',"
SQL = SQL & "'" &  armytype & "',"
SQL = SQL & "'" &  graduation & "',"
SQL = SQL & "'" &  recommend2 & "',"
'====================================
SQL = SQL & "'" &  regdate & "',"
SQL = SQL & "'" &  damdangSabun & "',"
SQL = SQL & "'" &  damdangName & "',"
SQL = SQL & "'21%'"
IF interviewtype = "수시 1차" Or interviewtype = "예비수시" THEN
	'SQL = SQL & ",interviewcostdate,interviewcosttype"
	SQL = SQL & ",'" & Left(now,10) & "','면제'"
END IF
SQL = SQL & ",'" &  Htype & "'"
SQL = SQL & ",'" &  Parent_tel_01 & "'"
SQL = SQL & ",'" &  Parent_tel_02 & "'"
SQL = SQL & ",'" &  school_gubun & "'"
SQL = SQL & ",'online'"
SQL = SQL & ",'신규'"
SQL = SQL & ",'" &  interviewmemo & "'"
SQL = SQL & ",'" &  introduction & "'"
SQL = SQL & ",'" &  academy & "'"
SQL = SQL & ")"


'����Ÿ ���
conn.execute sql

SET rsNum = conn.execute("Select IsNull(SCOPE_IDENTITY(),0)")
Session("student_num") = rsNum(0)

'�ӽõ���Ÿ ���� - 2016.04.08
If CDbl(Session("student_num")) >= 1 Then
	SQL = "Update dbo.Student_temp_list Set deleter='2000000' where name='" & name & "' and mobile='" & mobile & "' and interviewtype='" & interviewtype & "' and (deleter is null or deleter = '') and regyear = '" & regyear & "' and SessionID='" & Session.SessionID & "'"
	conn.execute sql
End If


'IF name = "�׽�Ʈ" THEN
'	'�Խ� ���� �ڵ����
'		'strSQL = " select max(StudentNum) + 1 from Student  where regyear='" & regyear & "' "
'		''���ٸ�
'		'strStudentNum = regyear & "0001"
'	'########### ������� ���� INSERT 	���� 	############
'	DIM strSQL
'	DIM arrParam(6)
'	'response.write jumin
'	'response.write part1
'	'response.write course1
'	'response.write part2
'	'response.write course2
'	'
'
'	arrParam(0)		= dbHelper.MakeParam("@i_jumin",	adVarchar,	adParamInput,	15,	jumin)
'	arrParam(1)		= dbHelper.MakeParam("@i_part1",	adVarchar,	adParamInput,	20,	part1)
'	arrParam(2)		= dbHelper.MakeParam("@i_part2",	adVarchar,	adParamInput,	20,	part2)
'	arrParam(3)		= dbHelper.MakeParam("@i_course1",	adVarchar,	adParamInput,	20,	course1)
'	arrParam(4)		= dbHelper.MakeParam("@i_course2",	adVarchar,	adParamInput,	20,	course2)
'	arrParam(5)		= dbHelper.MakeParam("@i_year",		adVarchar,	adParamInput,	4,	regyear)
'	arrParam(6)		= dbHelper.MakeParam("@O_Result",	adInteger,	adParamOutPut,	,		0)
'
'	dbHelper.ExecSP "std_meeting_add", arrParam, dh_hosting_koreait
'
'	'########### ������� ���� INSERT 	�� 	############
'
'END IF
'======���߿� �ش� Ȩ�Ƿ� �̵��Ϸ��� ���ǿ� �ϴ� ����
session("part1") = part1

''''''''''''''''''���� ���� ����
'	Const cdoSendUsingMethod = _
'
'	"http://schemas.microsoft.com/cdo/configuration/sendusing"
'
'	Const cdoSendUsingPort = 2
'
'	Const cdoSMTPServer = _
'
'	"http://schemas.microsoft.com/cdo/configuration/smtpserver"
'
'	Const cdoSMTPServerPort = _
'
'	"http://schemas.microsoft.com/cdo/configuration/smtpserverport"
'
'	Const cdoSMTPConnectionTimeout = _
'
'	"http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout"
'
'	Const cdoSMTPAccountName = _
'
'	"http://schemas.microsoft.com/cdo/configuration/smtpaccountname"
'
'	Const cdoSMTPAuthenticate = _
'
'	"http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"
'
'	Const cdoBasic = 1
'
'	Const cdoSendUserName = _
'
'	"http://schemas.microsoft.com/cdo/configuration/sendusername"
'
'	Const cdoSendPassword = _
'
'	"http://schemas.microsoft.com/cdo/configuration/sendpassword"
'
'	Set objConfig = Server.CreateObject("CDO.Configuration")
'	Set Fields = objConfig.Fields
'
'	     With Fields
'	      .Item(cdoSendUsingMethod) = cdoSendUsingPort
'	      .Item(cdoSMTPServer) = "smtp.koreait.ac.kr"
'	      '.Item(cdoSMTPServer) = "121.166.229.165"
'	      .Item(cdoSMTPServerPort) = 25
'	      .Item(cdoSMTPAuthenticate) = cdoBasic
'	      .Item(cdoSendUserName) = "koreaitadmin@koreait.ac.kr"
'	      .Item(cdoSendPassword) = "kitadmin07"
'	      .Update
'	     End With
'
'	     Set objMessage = Server.CreateObject("CDO.Message")
'	     Set objMessage.Configuration = objConfig
'
'	     objMessage.From = "�ѱ�IT���������б�<it1998@hanmail.net>"
'	     objMessage.Subject = "�ѱ�IT���������б��Դϴ�."
'
'
'
'
'	Econtent = "<html>"
'	Econtent = Econtent & "<head>  "
'	Econtent = Econtent & "<title>�ѱ�IT���������б�</title>  "
'	Econtent = Econtent & "<meta http-equiv="content-type" content="text/html; charset=euc-kr">  "
'	Econtent = Econtent & "<meta name="keywords" content="�ѱ�IT���������б�, �ѱ�IT���������б�, �ѱ�����Ƽ, �Խ�, ���ø���, �����б�, ���, ����">  "
'	Econtent = Econtent & "<link href="http://www.koreait.ac.kr/_include/inc_text.css" rel="stylesheet" type="text/css">  "
'	Econtent = Econtent & "</head>  "
'	Econtent = Econtent & "<body>  "
'	Econtent = Econtent & "<br>  "
'	Econtent = Econtent & "<table border="0" align="center" cellpadding="0" cellspacing="0">  "
'	Econtent = Econtent & "  <tr>   "
'	Econtent = Econtent & "    <td colspan="3"><img src="http://www.koreait.ac.kr/mail/images/interview_top.gif" width="688" height="81"></td>  "
'	Econtent = Econtent & "  </tr>  "
'	Econtent = Econtent & "  <tr>   "
'	Econtent = Econtent & "'	Econtent = Econtent & "    <td width="4" background="http://www.koreait.ac.kr/mail/images/interview_left_bg.gif">&nbsp;</td>  "
'	Econtent = Econtent & "    <td width="680" align="center"> <table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td height="40" align="center">&nbsp;</td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td align="center"> <table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_img01.gif" width="463" height="151"></td>  "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_img02.gif" width="200" height="151"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "            </table></td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td height="35" align="center">&nbsp;</td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td align="center"><img src="http://www.koreait.ac.kr/mail/images/interview_img03.gif" width="619" height="104"></td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td height="40" align="center">&nbsp;</td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td align="center"><table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "<tr>   "
'	Econtent = Econtent & "                <td colspan="3"><img src="http://www.koreait.ac.kr/mail/images/interview_prepare_text.gif" width="634" height="37"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td width="1" bgcolor="E0E0E0"></td>  "
'	Econtent = Econtent & "                <td width="632"><table width="632" border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "                    <tr>   "
'	Econtent = Econtent & "                     <td width="165" align="right" valign="top"><img src="http://www.koreait.ac.kr/mail/images/interview_prepare_img01.gif" width="158" height="116"></td>  "
'	Econtent = Econtent & "                     <td width="22" valign="top">&nbsp;</td>  "
'	Econtent = Econtent & "                     <td width="445"><table width="100%" border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "                          <tr>  "
'	Econtent = Econtent & "                            <td height="22" valign="top"><img src="http://www.koreait.ac.kr/mail/images/interview_prepare_text2.gif" width="101" height="13"></td>  "
'	Econtent = Econtent & "                          </tr>  "
'	Econtent = Econtent & "                          <tr>  "
'	Econtent = Econtent & "                            <td>�ݸ����� ���� 2��, ���� ����(���ΰ���), <br>  "
'	Econtent = Econtent & "                              ������2����(�̰�����)<br>  "
'	Econtent = Econtent & "                              �ڰ���, ����, ��õ�� (�����ڿ� ����)</td>  "
'	Econtent = Econtent & "                          </tr>  "
'	Econtent = Econtent & "                        </table></td>  "
'	Econtent = Econtent & "                    </tr>  "
'	Econtent = Econtent & "                  </table></td>  "
'	Econtent = Econtent & "                <td width="1" bgcolor="E0E0E0"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td colspan="3"><img src="http://www.koreait.ac.kr/mail/images/interview_prepare_bottom.gif" width="634" height="12"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "            </table>  "
'	Econtent = Econtent & "          </td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td height="30" align="center">&nbsp;</td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td align="center"><table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_text.gif" width="165" height="31"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img01.gif" width="634" height="69"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img02.gif" width="634" height="84"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img03.gif" width="634" height="96"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img04.gif" width="634" height="125"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td height="20">&nbsp;</td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>  "
'	Econtent = Econtent & "                <td align="center"><table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "                    <tr>   "
'	Econtent = Econtent & "                      <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img05.gif" width="316" height="215"></td>  "
'	Econtent = Econtent & "                      <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img06.gif" width="300" height="215"></td>  "
'	Econtent = Econtent & "                    </tr>  "
'	Econtent = Econtent & "                    <tr>   "
'	Econtent = Econtent & "                      <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img07.gif" width="316" height="264"></td>  "
'	Econtent = Econtent & "                      <td><img src="http://www.koreait.ac.kr/mail/images/interview_map_img08.gif" width="300" height="264"></td>  "
'	Econtent = Econtent & "                    </tr>  "
'	Econtent = Econtent & "                  </table></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "            </table></td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>
'	Econtent = Econtent & "          <td height="30" align="center">&nbsp;</td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>  "
'	Econtent = Econtent & "          <td align="center"><table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td colspan="3"><img src="http://www.koreait.ac.kr/mail/images/interview_it_text.gif" width="634" height="37"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td width="1" bgcolor="E0E0E0"></td>  "
'	Econtent = Econtent & "                <td width="632"><table width="632" border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "                    <tr>   "
'	Econtent = Econtent & "                      <td width="165" align="right" valign="top"><img src="http://www.koreait.ac.kr/mail/images/interview_it_img01.gif" width="158" height="132"></td>  "
'	Econtent = Econtent & "                      <td width="22" valign="top">&nbsp;</td>  "
'	Econtent = Econtent & "                      <td width="445"><table width="100%" border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "                          <tr>   "
'	Econtent = Econtent & "                            <td height="22" valign="top"><img src="http://www.koreait.ac.kr/mail/images/interview_it_text2.gif" width="143" height="12"></td>  "
'	Econtent = Econtent & "                          </tr>  "
'	Econtent = Econtent & "                          <tr>   "
'	Econtent = Econtent & "                            <td><strong>1</strong>. �����б� �ְ��� ���� �����<br>  "
'	Econtent = Econtent & "                              <strong>2</strong>. 2�⸸�� �л�����/���п� ����<br>  "
'	Econtent = Econtent & "                              <strong>3</strong>. �ǹ� �߽��� �ְ� ������<br>  "
'	Econtent = Econtent & "                              <strong>4</strong>. IT ����� ����, ���� ��鵿�� ��ġ</td>  "
'	Econtent = Econtent & "                          </tr>  "
'	Econtent = Econtent & "                        </table></td>  "
'	Econtent = Econtent & "                    </tr>  "
'	Econtent = Econtent & "                  </table></td>  "
'	Econtent = Econtent & "                <td width="1" bgcolor="E0E0E0"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "              <tr>   "
'	Econtent = Econtent & "                <td colspan="3"><img src="http://www.koreait.ac.kr/mail/images/interview_prepare_bottom.gif" width="634" height="12"></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "            </table>  "
'	Econtent = Econtent & "          </td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "      </table>  "
'	Econtent = Econtent & "      <table width="634" border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "<tr>   "
'	Econtent = Econtent & "          <td height="50" colspan="2">&nbsp;</td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "        <tr>   "
'	Econtent = Econtent & "          <td width="408" height="40" class="font_11">�� ������ �߽���������Դϴ�.</td>  "
'	Econtent = Econtent & "          <td width="272">   "
'	Econtent = Econtent & "            <table border="0" cellspacing="0" cellpadding="0">  "
'	Econtent = Econtent & "<tr>  "
'	Econtent = Econtent & "                <td width="90"><a href="http://www.koreait.ac.kr" target="_blank"><img src="http://www.koreait.ac.kr/mail/images/btn_homepage.gif" width="78" height="22" border="0"></a></td>  "
'	Econtent = Econtent & "                <td width="90"><a href="http://www.koreait.ac.kr/ad_lead/support_apply.asp" target="_blank"><img src="http://www.koreait.ac.kr/mail/images/btn_apply.gif" width="78" height="22" border="0"></a></td>  "
'	Econtent = Econtent & "                <td><a href="http://www.koreait.ac.kr/ad_lead/admission.asp" target="_blank"><img src="http://www.koreait.ac.kr/mail/images/btn_ipsi.gif" width="78" height="22" border="0"></a></td>  "
'	Econtent = Econtent & "              </tr>  "
'	Econtent = Econtent & "            </table></td>  "
'	Econtent = Econtent & "        </tr>  "
'	Econtent = Econtent & "      </table>  "
'	Econtent = Econtent & "    </td>  "
'	Econtent = Econtent & "    <td width="4" background="http://www.koreait.ac.kr/mail/images/interview_right_bg.gif">&nbsp;</td>  "
'	Econtent = Econtent & "  </tr>  "
'	Econtent = Econtent & "  <tr>   "
'	Econtent = Econtent & "    <td colspan="3"><img src="http://www.koreait.ac.kr/mail/images/interview_footer.gif" width="688" height="86"></td>  "
'	Econtent = Econtent & "  </tr>  "
'	Econtent = Econtent & "</table>  "
'	Econtent = Econtent & "<br>  "
'	Econtent = Econtent & "</body>  "
'	Econtent = Econtent & "</html>  "														"
'
'	'response.write Econtent
'
'	     objMessage.HTMLBody = Econtent
'	     objMessage.To = email & "<"& email &">"
'	     objMessage.Send
'
'	     Set Fields = Nothing
'	     Set objMessage = Nothing
'	     Set objConfig = Nothing
''''''''''''''''''���� ���� ����
''########### ���Ϻ����� 		�� 	############
%>
<body>
<form name="Mfrm" method="post">
<input type="hidden" value="<%=name%>" name="name">
<input type="hidden" value="<%=pname%>" name="pname">
<input type="hidden" value="<%=jumin%>" name="jumin">
<input type="hidden" value="<%=regdate%>" name="regdate">
<input type="hidden" value="<%=mobile%>" name="mobile">
</form>

<Script src='http://adrect.net/Trac.adrect/adver=147&depth=2'></Script>

<!-- Google Code for default Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1060780090;
var google_conversion_language = "ko";
var google_conversion_format = "1";
var google_conversion_color = "666666";
if (1) {
  var google_conversion_value = 1;
}
var google_conversion_label = "default";
//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/1060780090/?value=1&label=default&script=0">
</noscript>

<image width='0' height='0' border='0' src='http://web.ad-cross.co.kr/cgi-bin/adcupidserver.dll?bannersale_cpa?campaignid=20070425114965600000&effectid=00000200000300000000&effect=1'></image>
<!--��� ī���� -->
<iframe width='0' height='0' frameborder='0' marginwidth='0' marginheight='0' src='http://web.ad-cross.co.kr/cgi-bin/adcupidserver.dll?bannersale_posi?campaignid=20070806094675000000&pageid=finish'></iframe>
<!--��� ī���� -->


<!-- WIDERPLANET PURCHASE SCRIPT START 2016.4.8 -->
<div id="wp_tg_cts" style="display:none;"></div>
<script type="text/javascript">
var wptg_tagscript_vars = wptg_tagscript_vars || [];
wptg_tagscript_vars.push(
(function() {
	return {
		wp_hcuid:"",  		     /*Cross device targeting을 원하는 광고주는 로그인한 사용자의 Unique ID (ex. 로그인 ID, 고객넘버 등)를 암호화하여 대입.
					      *주의: 로그인 하지 않은 사용자는 어떠한 값도 대입하지 않습니다.*/
		ti:"27203",            	     /*광고주 코드*/
		ty:"PurchaseComplete",       /*트래킹태그 타입*/
		device:"web",                /*디바이스 종류 (web 또는 mobile)*/
		items:[{i:"원서접수",	     /*전환 식별코드 (한글, 영문, 숫자, 공백 허용)*/
			t:"접수완료",         /*전환명 (한글, 영문, 숫자, 공백 허용)*/
			p:"1",		     /*전환가격 (전환 가격이 없을경우 1로 설정)*/
			q:"1"		     /*전환수량 (전환 수량이 고정적으로 1개 이하일 경우 1로 설정)*/
		}]
	};
}));
</script>
<script type="text/javascript" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
<!-- // WIDERPLANET PURCHASE SCRIPT END 2016.4.8 -->


<script language="javascript">
	alert("입학지원서가 등록되었습니다.");
	document.Mfrm.action = "/new/ad_lead/Session_inum2.asp"
	document.Mfrm.submit();
</script>

<%
'DB ����
'DBHelper.Dispose
'Set DBHelper = Nothing
%>
</body>
</html>