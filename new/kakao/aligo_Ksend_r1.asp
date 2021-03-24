<%@Language="VBScript" CODEPAGE="65001" %>
<%
Response.CharSet="utf-8"
Session.codepage="65001"
Response.codepage="65001"
Response.ContentType="text/html;charset=utf-8"
%>

<%
Dim button_1
apikey = "ttwbkw523tl6sws8mau1ed9h1qhp0wxe"
userid = "korit2020"
token = Request.form("token") '생성한 토큰 문자열
senderkey = "631862bf89e41600e8dd26d1cfbb5f0d953fdb1f"
tpl_code = "TA_8053"
sender = "025785551" '발신자번호
'senddate = date("YmdHis", strtotime("+10 minutes")),
'receiver_1 = "01031347181" '첫번째 알림톡을 전송받을 휴대폰 번호
receiver_1 = Request.form("receiver_1") '첫번째 알림톡을 전송받을 휴대폰 번호
subject_1 = "접수완료안내" ' 첫번째 알림톡 제목
failover = "Y"
fsubject_1 = "접수완료안내"


fmessage_1  = "[한국IT]"&vbCrLf
fmessage_1  = fmessage_1  & "안녕하세요, 한국IT 입시홍보실입니다."&vbCrLf&vbCrLf
fmessage_1  = fmessage_1  & "정성껏 작성해 주신 지원서의 접수가 완료되었습니다!"&vbCrLf&vbCrLf
fmessage_1  = fmessage_1  & "지원해 주셔서 진심으로 감사드리며 면접일정은 1-2일내에 전화로 안내될 예정입니다."&vbCrLf&vbCrLf
fmessage_1  = fmessage_1  & "지속적인 부재시 원서는 취소되어 재지원 불가하오니 통화가 어려운 지원자는 통화 가능한 시간대를 카카오톡 채널로 남겨주시기 바랍니다."&vbCrLf&vbCrLf
fmessage_1  = fmessage_1  & "저희 학교로 지원해주신 모든 분들에게 좋은 결과가 있기를 진심으로 바랍니다."&vbCrLf


message_1 = "[한국IT]"&vbCrLf
message_1 = message_1 & "안녕하세요, 한국IT 입시홍보실입니다."&vbCrLf&vbCrLf
message_1 = message_1 & "정성껏 작성해 주신 지원서의 접수가 완료되었습니다!"&vbCrLf&vbCrLf
message_1 = message_1 & "지원해 주셔서 진심으로 감사드리며 면접일정은 1-2일내에 전화로 안내될 예정입니다."&vbCrLf&vbCrLf
message_1 = message_1 & "지속적인 부재시 원서는 취소되어 재지원 불가하오니 통화가 어려운 지원자는 통화 가능한 시간대를 카카오톡 채널로 남겨주시기 바랍니다."&vbCrLf&vbCrLf
message_1 = message_1 & "저희 학교로 지원해주신 모든 분들에게 좋은 결과가 있기를 진심으로 바랍니다."&vbCrLf


Dim arr(13)
arr(0) = "userid=korit2020"
arr(1) = "apikey=ttwbkw523tl6sws8mau1ed9h1qhp0wxe" 
arr(2) = "button_1={""button"":[{""name"":""한국IT 카톡 채널"",""linkType"":""WL"",""linkM"":""http://pf.kakao.com/_YBxixixd"",""linkP"":""http://pf.kakao.com/_YBxixixd""}]}"
arr(3) = "token="& token
arr(4) = "senderkey=631862bf89e41600e8dd26d1cfbb5f0d953fdb1f"
arr(5) = "tpl_code=TA_8053"
arr(6) = "sender=025785551"
arr(7) = "receiver_1="&receiver_1
arr(8) = "subject_1=접수완료안내"
arr(9) = "message_1="&message_1
arr(10) = "failover=Y"
arr(11) = "fsubject_1=접수완료안내"
arr(12) = "fmessage_1="&fmessage_1
 
arr(13) = arr(0) & "&" & arr(1) & "&" & arr(2) & "&" & arr(3) & "&" & arr(4) & "&" & arr(5) & "&" & arr(6) & "&" & arr(7) & "&" & arr(8) & "&" & arr(9)  & "&" & arr(10)  & "&" & arr(11)  & "&" & arr(12)

Dim xmlHttp
Dim Xurl 

Xurl = "https://kakaoapi.aligo.in/akv10/alimtalk/send/"

SET xmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
xmlHttp.open "POST", Xurl, false

xmlHttp.setRequestHeader  "Content-Type", "application/x-www-form-urlencoded"
xmlHttp.send arr(13)

if xmlHttp.status = 200 then


	set xmldoc = Server.CreateObject("Microsoft.XMLDOM") 
	xmldoc.async = false ' OK 
	xmldoc.validateOnParse = false ' OK 
	rtlValue = xmldoc.loadXML(xmlHttp.responseText)
	
	Response.Write xmlHttp.responseText
	
Else
	result = "900"
End if

SET xmlHttp = Nothing
%>