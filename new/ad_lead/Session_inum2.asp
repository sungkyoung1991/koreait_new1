<!-- #include virtual="/_include/$dbconnect.asp" -->
<!-- #include virtual="/_include/inc_config.asp" -->
<!-- #include virtual="/_include/inc_conn_sms.asp" -->
<%
if Not Ddb.state = 1 Then
	response.write "한국IT.원서가정상적으로접수되었습니다.<br>자세한내용은1-2일안으로전화안내드리겠습니다"
	URL = "pay_req.asp"
	response.redirect URL
End If

name = request.Form("name")
jumin = request.Form("jumin")
pname = request.Form("pname")
regdate = request.Form("regdate")
mobile = request.Form("mobile")

sql = "select top 1 num, name, part1 from Student where name='" & name & "' and jumin='" & jumin & "' and pname ='"&pname&"' and regdate = '"&regdate & "'"
'response.write sql

set result = conn.Execute(sql)

'등록된 접수가 없을 경우 - 2016-05-02
If result.eof Or result.bof Then
	response.write "한국IT.원서가정상적으로접수되었습니다.<br>자세한내용은1-2일안으로전화안내드리겠습니다"
	URL = "pay_req.asp"
	response.redirect URL
	Response.end
End If

Student_Num = result("num")
session("inum") = result("num")
session("iname") = result("name")
Dim msg_course : msg_course = result("part1")

dim nowdate : nowdate = Int(Year(Now()) & right("00" & Month(Now()),2) & right("00" & Day(Now()),2) & right("00" & hour(now()),2) & right("00" & Minute(now()),2))

If ( nowdate >=	200709010101 ) then
	SendMessage = "한국IT.원서가정상적으로접수되었습니다자세한내용은1-2일안으로전화안내드리겠습니다"
ELSE
	SendMessage = "한국IT.원서가정상적으로접수되었습니다자세한내용은1-2일안으로전화안내드리겠습니다"
end if

'====================================================문자보내기===================================================
If mobile <> "" Then 
	'SQL = "INSERT  INTO  SC_TRAN (TR_SENDDATE, TR_ID, TR_SENDSTAT, TR_MSGTYPE, TR_PHONE, TR_CALLBACK ,TR_MSG, TR_ETC1,TR_ETC2)"
	'SQL = SQL & "VALUES ("
	'SQL = SQL & "GetDate()"
	'SQL = SQL & ",'Auto', '0', '0', '"&Replace(mobile,"-","")&"', '" & KOREA_IT_INFO_TEL & "', '"&SendMessage&"','"&Student_Num&"','"&name&"')"
	'response.write sql
	'Ddb.execute sql
	Dim part_url
	IF inStr(msg_course,"스마트") > 0 Then 
		part_url = "?part=1"
	ElseIF inStr(msg_course,"보안") > 0 Then 
		part_url = "?part=2"
	ElseIF inStr(msg_course,"디자인") > 0 Then 
		part_url = "?part=3"
	ElseIF inStr(msg_course,"게임") > 0 Then 
		part_url = "?part=4"
	END IF
	'MMS - 2016.07.05
	MMS_SUBJECT = "[한국IT] 원서접수 완료"
	SendMessage = "[한국IT] 안녕하세요? " & name & "님의 원서가 정상적으로 접수되었습니다. " & VbNewLine & VbNewLine
	SendMessage = SendMessage & "1) 안내 " & VbNewLine
	SendMessage = SendMessage & "	면접일정은 유선을 통해 안내되며 지속적인 부재 시 원서는 취소되어 재지원 불가하오니  " & VbNewLine
	SendMessage = SendMessage & "	통화 가능한 시간대를 카카오톡 플러스친구(한국IT전문학교)를 통해 남겨주시기 바랍니다. " & VbNewLine & VbNewLine
	SendMessage = SendMessage & "2) 학과별 안내 " & VbNewLine
	SendMessage = SendMessage & "	아래주소는 접수하신 " & msg_course & "에 대한 안내URL입니다. " & VbNewLine
	SendMessage = SendMessage & "	클릭하여 둘러보시기 바랍니다. 꼭! " & VbNewLine
	SendMessage = SendMessage & "	http://m.koreait.ac.kr/info.asp"& part_url & VbNewLine & VbNewLine
	SendMessage = SendMessage & msg_course & " 특징" & VbNewLine
	IF inStr(msg_course,"게임") > 0 Then 
		SendMessage = SendMessage & "	- 국내 유일 IT 특성화 학교" & VbNewLine
		SendMessage = SendMessage & "	- 일반정규대학과 동등한 학력 인정" & VbNewLine
		SendMessage = SendMessage & "	- 국내 최초의 게임학과 설치" & VbNewLine
		SendMessage = SendMessage & "	- 게임전공관련 과목 국내 최다 승인" & VbNewLine
		SendMessage = SendMessage & "	- 지스타 14년 연속 학생작품 출품" & VbNewLine
		SendMessage = SendMessage & "	- 기획, 프로그래밍, 그래픽전공 세분화로 팀 프로젝트 교육" & VbNewLine
		SendMessage = SendMessage & "	- 게임 연구소 보유, 인턴쉽 체험가능" & VbNewLine
		SendMessage = SendMessage & "	- 최첨단 장비 보유(모션캡쳐장비,VR장비,가상시뮬레이터(R-CRAFT), 멀티센싱 스포츠 시뮬레이터 등)" & VbNewLine
		SendMessage = SendMessage & "	- 국내 최초 가상현실 게임센터 개관" & VbNewLine
		SendMessage = SendMessage & "	- 2014년 국내 교육기관 최초 가상현실게임 개발 성공" & VbNewLine
		SendMessage = SendMessage & "	- 지스타 15년 연속 학생작품 출품" & VbNewLine
		SendMessage = SendMessage & "	- CCG(글로벌 게임챌린지) 및 GIGDC(글로벌 인디 게임 경진대회) 등 대회 다수 수상" & VbNewLine
		SendMessage = SendMessage & "	- 취업률 90%이상" & VbNewLine
		SendMessage = SendMessage & "	- 게임업계 취업생 최다배출" & VbNewLine		
		SendMessage = SendMessage & "	- 일본취업 활성화(일본어 무료강좌)" & VbNewLine
		SendMessage = SendMessage & "	- 국내 최초 창의인재육성캠프 실시" & VbNewLine & VbNewLine
		
	ElseIF inStr(msg_course,"보안") > 0 Then 
		SendMessage = SendMessage & "	- 국내 유일 IT 특성화 학교" & VbNewLine
		SendMessage = SendMessage & "	- - 일반정규대학과 동등한 학력 인정" & VbNewLine
		SendMessage = SendMessage & "	- 국내 최초의 정보보호학과 설치" & VbNewLine
		SendMessage = SendMessage & "	- 정보보호관련 과목 국내 최다 승인" & VbNewLine
		SendMessage = SendMessage & "	- 전공을 세분화하여 해킹-보안-역추적 등 보안 회사에서 하는 업무 그대로 실습" & VbNewLine
		SendMessage = SendMessage & "	- 기업형 프로젝트교육을 통하여 기술이력서 보유" & VbNewLine
		SendMessage = SendMessage & "	- 최첨단 디지털포렌식센터, 보안관제센터 보유" & VbNewLine
		SendMessage = SendMessage & "	- 기업형 프로젝트 교육을 통하여 기술이력서 보유" & VbNewLine
		SendMessage = SendMessage & "	- 최첨단 디지털포렌식센터, 보안관제센터 보유" & VbNewLine
		SendMessage = SendMessage & "	- “해킹보안세미나” 재학생 참여 기회" & VbNewLine
		
		SendMessage = SendMessage & "	- 숭실대학교 정보과학대학원 업무협약 체결" & VbNewLine
		SendMessage = SendMessage & "	- 실제 기업에서 사용하는 S/W, H/W 활용교육" & VbNewLine
		SendMessage = SendMessage & "	- 매년 군입대 특기생 최다배출" & VbNewLine
		SendMessage = SendMessage & "	(보안학사장교, 사이버특기병, 정보보호기술병)" & VbNewLine
		
		SendMessage = SendMessage & "	- 국내교육기관최초 “윤리선포식”개최" & VbNewLine
		SendMessage = SendMessage & "	- 취업률95%이상" & VbNewLine
		SendMessage = SendMessage & "	- 일본 취업 활성화(일본어무료강좌)" & VbNewLine
		SendMessage = SendMessage & "	- 국내 최초 창의인재육성캠프 실시" & VbNewLine & VbNewLine


	ElseIF inStr(msg_course,"스마트") > 0 Then 
		SendMessage = SendMessage &  "	- 국내 유일 IT 특성화 학교" & VbNewLine
		SendMessage = SendMessage &  "	- 일반정규대학과 동등한 학력 인정" & VbNewLine
		SendMessage = SendMessage &  "	- 컴퓨터공학,소프트웨어공학,사물인터넷,인공지능,자율주행 등 세분화 된 전공설치" & VbNewLine
		SendMessage = SendMessage &  "	- 외부기업 공동 프로젝트 참여 기회" & VbNewLine
		SendMessage = SendMessage &  "	- ICT 로봇개발 과정 교육진행" & VbNewLine
		SendMessage = SendMessage &  "	- 지능형 IoT 페스티벌 개최" & VbNewLine
		SendMessage = SendMessage &  "	- 외부 기업공동 개발" & VbNewLine
		SendMessage = SendMessage &  "	- R-BIZ 챌린지 자율주행 경진대회 2년 연속수상" & VbNewLine
		SendMessage = SendMessage &  "	- 2년 연속 취업률100%" & VbNewLine
		SendMessage = SendMessage &  "	- 직업교육 및 인재양성 교육실시" & VbNewLine 
		
		SendMessage = SendMessage &  "	- 1+1+1제도 (1년에 한 사람이 최소 1개의 프로젝트 제작)" & VbNewLine
		SendMessage = SendMessage &  "	- 인터넷을 통한 스마트사물과의 상호작용 교육" & VbNewLine
		SendMessage = SendMessage &  "	- 융·복합 드론개발 과정 도입" & VbNewLine
		SendMessage = SendMessage &  "	- 일본 취업 활성화(일본어무료강좌)" & VbNewLine
		SendMessage = SendMessage &  "	- 국내 최초 창의인재육성캠프 실시" & VbNewLine & VbNewLine

	ElseIF inStr(msg_course,"디자인") > 0 Then 
		SendMessage = SendMessage &"	- 국내 유일 4차산업혁명 특성화 학교" & VbNewLine
		SendMessage = SendMessage & "	- 일반정규대학과 동등한 학력 인정" & VbNewLine
		SendMessage = SendMessage & "	- 입시학원의 주입식 교육이 아닌 실무현장에 적합한 디자이너/작가 양성" & VbNewLine
		SendMessage = SendMessage & "	- 외외부기업 공동 프로젝트 참여 기회" & VbNewLine
		SendMessage = SendMessage & "	- 국내 3대 디자인 페어 개인작품 출품" & VbNewLine
		SendMessage = SendMessage & "	- 디자인 분야 최다 취업생 배출" & VbNewLine
		SendMessage = SendMessage & "	- 국내최초로 3D 프린팅 교육도입" & VbNewLine
		SendMessage = SendMessage & "	- 웹툰 창작 스튜디오 개관(와콤 씬티크22 액정 타블렛 설치)" & VbNewLine
		SendMessage = SendMessage & "	- 입학과 동시에 전임교수별 학습지도와 진로상담 진행" & VbNewLine
		SendMessage = SendMessage & "	- 중국 최대 글로벌 콘텐츠 기업 'IIE-STAR' 산학협력  (국내 대학 중 본교와 홍익대학교 선정)" & VbNewLine
		SendMessage = SendMessage & "	- 국제만화공모전 “오공배” 재학생 수상 쾌거" & VbNewLine
		SendMessage = SendMessage & "	- 웹툰작가 4명배출 (대표작 네이버 월요웹툰 ‘이것도 친구라고’)" & VbNewLine
		SendMessage = SendMessage & "	- 경기 방송 시사 웹툰작가로 10여명 등단" & VbNewLine
		
		SendMessage = SendMessage & "	- 일본 취업 활성화(일본어무료강좌) " & VbNewLine
		SendMessage = SendMessage & "	- 국내 최초 창의인재육성캠프 실시" & VbNewLine & VbNewLine
		
	END IF
	SendMessage = SendMessage & "3) 문의  " & VbNewLine
	SendMessage = SendMessage & "	기타 문의사항은 아래 입학처로 연락주세요." & VbNewLine & VbNewLine
	SendMessage = SendMessage & "	입학처 : 02-578-5551" & VbNewLine & VbNewLine
	SendMessage = SendMessage & "	감사합니다." & VbNewLine


	SQL = "INSERT INTO MMS_MSG (SUBJECT,ID,PHONE,CALLBACK,STATUS,REQDATE,MSG,TYPE) "
	SQL = SQL & " VALUES "
	SQL = SQL & " ('" & MMS_SUBJECT & "','0','"& Replace(mobile,"-","") &"','"& KOREA_IT_INFO_TEL &"','0',GetDate(),'"& SendMessage &"','0') "
	'response.write sql
'	Ddb.execute sql 20200211 카카오 알림톡으로 인한 주석처리 김성경주임.

	'전송할 휴대폰이 없을 경우 차단 - 2016.04.20
	If Len(KOREA_IT_SUPPORT_RESULT_HP) >= 1 Then
		'SendMessage2 = name&"님 원서가"&regdate& "에 접수되었습니다(한국IT)"
		SendMessage2 = name&"님 " & msg_course & "에 지원 원서가 접수되었습니다(한국IT)"
		SQL = "INSERT  INTO  SC_TRAN (TR_SENDDATE, TR_ID, TR_SENDSTAT, TR_MSGTYPE, TR_PHONE, TR_CALLBACK ,TR_MSG, TR_ETC1,TR_ETC2)"
		SQL = SQL & "VALUES ("
		SQL = SQL & "GetDate()"
		SQL = SQL & ",'Auto', '0', '0', '" & KOREA_IT_SUPPORT_RESULT_HP & "', '" & KOREA_IT_INFO_TEL & "', '"&SendMessage2&"','"&Student_Num&"','"&name&"')"
		'response.write sql
		Ddb.execute sql
	End If

	'전송할 휴대폰이 없을 경우 차단 - 2016.04.20
	If Len(KOREA_IT_SUPPORT_RESULT_HP2) >= 1 Then
		'SendMessage2 = name&"님 원서가"&regdate& "에 접수되었습니다(한국IT)"
		SendMessage2 = name&"님 " & msg_course & "에 지원 원서가 접수되었습니다(한국IT)"
		SQL = "INSERT  INTO  SC_TRAN (TR_SENDDATE, TR_ID, TR_SENDSTAT, TR_MSGTYPE, TR_PHONE, TR_CALLBACK ,TR_MSG, TR_ETC1,TR_ETC2)"
		SQL = SQL & "VALUES ("
		SQL = SQL & "GetDate()"
		SQL = SQL & ",'Auto', '0', '0', '" & KOREA_IT_SUPPORT_RESULT_HP2 & "', '" & KOREA_IT_INFO_TEL & "', '"&SendMessage2&"','"&Student_Num&"','"&name&"')"
		'response.write sql
	'	Ddb.execute sql 20200211 카카오 알림톡으로 인한 주석처리 김성경주임.
	End If
End If
'=================================================================================================================

'IF request("regyear") = "2009" THEN
	'URL = "/renewal/02_enter/aptitude_test.asp"
	'URL = "pay_req.asp"
	'URL = "/ad_lead/support_applynotice.asp"
	'URL = "http://koreait.ac.kr/ad_lead/support_apply_pay_finish.asp"
'ELSE
	'URL = "pay_req.asp"
	'URL = "/ad_lead/support_applynotice.asp"
	'URL = "http://koreait.ac.kr/ad_lead/support_apply_pay_finish.asp"
'END IF

URL = "pay_req.asp"
response.redirect URL
%>

