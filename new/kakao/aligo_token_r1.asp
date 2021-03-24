
<%
response.ContentType = "application/json"

Dim xmlHttp
Dim Xurl 
Dim DataToSend


DataToSend = "userid=korit2020&apikey=ttwbkw523tl6sws8mau1ed9h1qhp0wxe"

Xurl = "https://kakaoapi.aligo.in/akv10/token/create/30/s/"

SET xmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
xmlHttp.open "POST", Xurl, False

xmlHttp.setRequestHeader  "Content-Type", "application/x-www-form-urlencoded"
xmlHttp.send DataToSend

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