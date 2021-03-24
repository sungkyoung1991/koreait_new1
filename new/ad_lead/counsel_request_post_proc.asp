<!-- #include virtual="/new/_include/inc_header_ajax.asp" -->
<%
'����
Function GetInsertListToIdx()
	Dim SQL : SQL = "select IsNull(max(idx),0) + 1 as maxnum from " & table_name & " where dept1 = '"& course1 &"'"
	Dim rsArray : rsArray = GetRowsQuery(CONNSTRING_WEB, SQL)
	Dim maxnum : maxnum = rsArray(0,0)

	Dim FiledArr(18,2)
	FiledArr(1,1) = "idx" :	FiledArr(1,2) = maxnum
	FiledArr(2,1) = "name1" : FiledArr(2,2) = name1
	FiledArr(3,1) = "dept1" : FiledArr(3,2) = course1
	FiledArr(4,1) = "part1" : FiledArr(4,2) = part1
	FiledArr(5,1) = "email1" : FiledArr(5,2) = email1
	FiledArr(6,1) = "school1" : FiledArr(6,2) = school1
	FiledArr(7,1) = "zipcode1" : FiledArr(7,2) = zipcode1
	FiledArr(8,1) = "zipcode2" : FiledArr(8,2) = zipcode2
	FiledArr(9,1) = "address1" : FiledArr(9,2) = address1
	FiledArr(10,1) = "address2" :	FiledArr(10,2) = address2
	FiledArr(11,1) = "memo" :	FiledArr(11,2) = memo
	FiledArr(12,1) = "hp" :	FiledArr(12,2) = hp
	FiledArr(13,1) = "r_status" : FiledArr(13,2) = r_status
	FiledArr(14,1) = "now1" : FiledArr(14,2) = now()
	FiledArr(15,1) = "request_year" : FiledArr(15,2) = regyear
	FiledArr(16,1) = "school_year" : FiledArr(16,2) = school_year
	FiledArr(17,1) = "Harea" : FiledArr(17,2) = Harea
	FiledArr(18,1) = "scode" : FiledArr(18,2) = 5

	'Call LogWrite(InsertQueryArrayStr(table_name, FiledArr),"Counsel_Request_Post")

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetInsertListToIdx = InsertQueryArray(CONNSTRING_WEB, table_name, FiledArr)
End Function

table_name = "DataRequest2008"

'���� �г⵵
regyear = FormatCheckNum(request("regyear")) : If Len(regyear) <> 4 Then GetSelectionDateArrayToStr(0)



name1 = Trim(request("name1"))
part1 = Trim(request("part1"))
course1 = Trim(request("course1"))

If Trim(request("email3")) <> "" Then
	email1 = Trim(request("email1")) + "@" + Trim(request("email3"))
else
	email1 = Trim(request("email1")) + "@" + Trim(request("email2"))
End if

hp = FormatCheckNum(request("hp1")) & "-" & FormatCheckNum(request("hp2")) & "-" & FormatCheckNum(request("hp3"))
If Len(hp) <= 10 Then hp = ""

school1 = Trim(request("school1"))

'�ſ�����ȣ ���� - 2016.04.07
zipcode = FormatCheckNum(request("zipcode"))
If Len(zipcode) >= 5 Then
	zipcode1 = zipcode
	zipcode2 = ""
Else
	zipcode1 = FormatCheckNum(request("zipcode1"))
	zipcode2 = FormatCheckNum(request("zipcode2"))
	zipcode = zipcode1 & "-" & zipcode2
End If

address1 = Trim(request("address1"))
address2 = Trim(request("address2"))

add = "(" & zipcode & ") " & address1 & " " & address2

memo = Trim(request("memo"))
r_status = Trim(request("r_status"))

'�г��߰� - 2016.06.23
school_year = Trim(XssFilter(request("school_year")))

'�б����� - 2016.11.09
Harea = Trim(request("Harea")) : Harea = Left(Harea,2)

If Len(part1) >= 1 And Len(course1) >= 1 Then
	'����
	tIdx = GetInsertListToIdx()
End If
%>
<script type="text/javascript">
alert("입시자료 신청이 완료되었습니다");
window.location.reload(true);
</script>
