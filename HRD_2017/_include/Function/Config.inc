<%
'Font Awesome 4.6.1 by @davegandy - http://fontawesome.io - @fontawesome
'License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)

Dim fa_desktop : fa_desktop = "&#xf108;"
Dim fa_pencil : fa_pencil = "&#xf040;"
Dim fa_book : fa_book = "&#xf02d;"
Dim fa_comments : fa_comments = "&#xf086;"
Dim fa_group : fa_group = "&#xf0c0;"
Dim fa_check_square_o : fa_check_square_o = "&#xf046;"

Dim fa_paper_plane : fa_paper_plane = "&#xf1d8;"
Dim fa_home : fa_home = "&#xf015;"
Dim fa_mortar_board : fa_mortar_board = "&#xf19d;"
Dim fa_list_ul : fa_list_ul = "&#xf0ca;"
Dim fa_eject : fa_eject = "&#xf052;"
Dim fa_university : fa_university = "&#xf19c;" 
Dim html_head_title : html_head_title = "한국 IT 직업전문학교"

'------------------------
' SESSION Valiables
'------------------------
Dim MEM_CD, MEM_ID, MEM_NAME, MEM_STATUS, UPLOAD_PATH
MEM_CD		= Session("MEM_CD")
MEM_ID		= Session("MEM_ID")
MEM_NAME	= Session("MEM_NAME")
MEM_STATUS	= Session("MEM_STATUS")
UPLOAD_PATH	= Request.ServerVariables("APPL_PHYSICAL_PATH") & "upload\"

'------------------------
' Path Constant
'------------------------
Const ROOT_URL	= "/"
Const ROOT_URL2	= "/"

'------------------------
' sms 문자발송 - 온라인접수, 입학상담 (SMS_INFO_PHONE: 2개이상 전화번호 등록시 ,(쉼표)로 구분)
'------------------------
'양재
Const SMS_INFO_PHONE = "010-5146-9553"				'2018-10-11 변경 남미진 주임
Const SMS_INFO_PHONE_4 = "010-2304-6532"		'송미경 대리
Const SMS_INFO_PHONE_5 = "010-6272-3197"		'최정우 실장
Const SMS_INFO_PHONE_6 = "010-8000-0533"		'박정수 원장

Const SMS_CALLBACK_PHONE = "02-597-5731"

Const SERVICE_INFO_TEL = "02-597-5731"
Const SERVICE_INFO_FAX = "02-578-9797"

'구로
Const SMS_INFO_PHONE_GURO1 = "010-8900-9875"		'한용환 학부장
Const SMS_INFO_PHONE_GURO2 = "010-5356-0039"		'임정아 대리
Const SMS_INFO_PHONE_GURO3 = "010-2324-1196"		'신밍경 대리
Const SMS_INFO_PHONE_GURO4 = "010-9991-9546"		'이도하 주임
Const SMS_INFO_PHONE_GURO5 = "010-4560-0989"		'신기섭 주임
Const SMS_INFO_PHONE_GURO6 = "010-9858-7376"		'신종혁
Const SMS_CALLBACK_PHONE_GURO = "02-597-5156"

Const SERVICE_INFO_TEL_GURO = "02-597-5156"
Const SERVICE_INFO_FAX_GURO = "02-578-9797"

'노원
Const SMS_INFO_PHONE_NOWON = "010-4902-5553"
Const SMS_CALLBACK_PHONE_NOWON = "02-577-8998"

Const SERVICE_INFO_TEL_NOWON = "02-577-8998"
Const SERVICE_INFO_FAX_NOWON = "02-578-9956"

'마케팅
Const SMS_INFO_PHONE_MARKETING = "010-3361-5517"
Const SMS_CALLBAK_PHONE_MARKETING = "1588-5517"


'------------------------
' 캠퍼스 연락처
'------------------------
Dim arrCampusTel(3)

arrCampusTel(0) = "02-578-5551"		'한국IT직업전문학교
arrCampusTel(1) = "02-597-5731"		'양재캠퍼스
arrCampusTel(2)	= "02-577-8998"		'노원캠퍼스
arrCampusTel(3) = "02.597.5156" 	'구로캠퍼스

'------------------------
' 과정 대분류 배열
'------------------------
Dim arrClassCata(5)
arrClassCata(0) = "과정 대분류"
arrClassCata(1) = "국가기간" 		'"국기직종훈련"
arrClassCata(2) = "실업자"
arrClassCata(3) = "재직자"
arrClassCata(4) = "일반고 특화과정" 	'"고교위탁" '위탁교육
arrClassCata(5) = "일반"

'출력시 제외메뉴
Dim arrClassCataNotStr : arrClassCataNotStr = ""

'------------------------
' 과정 상태값 배열
'------------------------
Dim arrCrStatusCDs(4), arrCrStatusNames(4)
arrCrStatusCDs(0) = "A"
arrCrStatusCDs(1) = "B"
arrCrStatusCDs(2) = "C"
arrCrStatusCDs(3) = "D"
arrCrStatusCDs(4) = "E"
arrCrStatusNames(0) = "모집중"
arrCrStatusNames(1) = "교육진행중"
arrCrStatusNames(2) = "종료"
arrCrStatusNames(3) = "사후관리종료"
arrCrStatusNames(4) = "과정보류"

'------------------------
' 이메일 도메인 배열
'------------------------
Dim arrDomains(15), arrDomainNames(11)

arrDomains(0) = "naver.com"
arrDomains(1) = "daum.net"
arrDomains(2) = "hanmail.net"
arrDomains(3) = "nate.com"
arrDomains(4) = "yahoo.co.kr"
arrDomains(5) = "yahoo.com"
arrDomains(6) = "paran.com"
arrDomains(7) = "empal.com"
arrDomains(8) = "hotmail.com"
arrDomains(9) = "korea.com"
arrDomains(10) = "lycos.co.kr"
arrDomains(11) = "dreamwiz.com"
arrDomains(12) = "hanafos.com"
arrDomains(13) = "chol.com"
arrDomains(14) = "gmail.com"
arrDomains(15) = "empas.com"

'arrDomains(0) = "netian.com"
'arrDomains(1) = "naver.com"
'arrDomains(2) = "nate.com"
'arrDomains(3) = "dreamx.net"
'arrDomains(4) = "lycos.co.kr"
'arrDomains(5) = "yahoo.com"
'arrDomains(6) = "unitel.co.kr"
'arrDomains(7) = "gmail.com"
'arrDomains(8) = "chollian.net"
'arrDomains(9) = "korea.com"
'arrDomains(10) = "hanmail.net"
'arrDomains(11) = "hotmail.com"


arrDomainNames(0) = "네띠앙"
arrDomainNames(1) = "네이버"
arrDomainNames(2) = "네이트"
arrDomainNames(3) = "드림엑스"
arrDomainNames(4) = "라이코스"
arrDomainNames(5) = "야후"
arrDomainNames(6) = "유니텔"
arrDomainNames(7) = "지메일"
arrDomainNames(8) = "천리안"
arrDomainNames(9) = "코리아닷컴"
arrDomainNames(10) = "한메일(다음)"
arrDomainNames(11) = "핫메일"


Dim cur_url : cur_url = Request.ServerVariables("SCRIPT_NAME")
Dim cur_file : cur_file = Mid(cur_url, InstrRev(cur_url,"/")+1)


Dim first_img, prevBlock, nextBlock, last_img
first_img = "<img src='/images/arrow_left2.png' width='10px'>"
prevBlock = "<img src='/images/arrow_left1.png' width='10px'>"
nextBlock = "<img src='/images/arrow_right1.png' width='10px'>"
last_img = "<img src='/images/arrow_right2.png' width='10px'>"

Dim msg_wrongpath, msg_nopermission, msg_complete
msg_wrongpath		= "잘못된 경로로 들어오셨습니다."
msg_nopermission	= "권한이 없습니다."
msg_complete		= "성공적으로 처리되었습니다."

Dim self, tb, width, sql, whsql, rs, rst, schtype, scode, sname, schval, i, j, k, tmplogin, mno, tmp, tmp2, tmp3, num, linkHead, linkTail, page_title, adoCmd, intReturn
Dim mode, mode2, wtype, psize, bsize, cpage, args, link_file, rcount, pcount, chk, slt, msg, fileForm, fileField, ext, cata, crcd, spcd, rpcd

Dim rsArray, rsArray2, rsArray3

'form 에 mno 파라미터 값 추가로 인한 오류방지 - 2016.07.05
If Request.QueryString("mno").Count >= 1 Then
	mno = trim(replace(request.QueryString("mno")(1), "'", ""))
Else
	mno = ""
End If

'처리시간 계산
Dim timesSecArr(2) : timesSecArr(0) = timer()
%>