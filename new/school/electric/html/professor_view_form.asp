<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%
Response.Expires = 0
Response.ExpiresAbsolute = now() - 1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","private"
Response.CacheControl = "no-cache"

Dim sql : sql = "Select chapter, name ,filename2 FROM koreaitweb.prof_info where take_idx=" & Request("idx")
Dim arrRs : arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
infoArr = arrRs
For i = 0 To UBound(infoArr,2)
	chapter = infoArr(0,i)
	name = infoArr(1,i)
	arrName = split(name," ")
	strName = "<strong>" & arrName(0) & "</strong>"
	if ubound(arrName)=0 then
		strTitle = "<span style='vertical-align: bottom;'>교수님</span>"
	else
		strTitle = "<span style='vertical-align: bottom;'>" & arrName(1) & "님</span>"
	end if
	filename = infoArr(2,i)
	if filename="" then
		filename="noimage01.jpg"
	end if
Next

sql = "Select contents FROM koreaitweb.prof_info_scholar where take_idx=" & Request("idx")
arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
scholarArr = arrRs

sql = "Select contents FROM koreaitweb.prof_info_career where take_idx=" & Request("idx")
arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
careerArr = arrRs

sql = "Select contents FROM koreaitweb.prof_info_treatise where take_idx=" & Request("idx")
arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
treatiseArr = arrRs

sql = "Select contents FROM koreaitweb.prof_info_prize where take_idx=" & Request("idx")
arrRs = GetRowsQuery(CONNSTRING_WEB, sql)
prizeArr = arrRs
%>
<div class="conLeft">
	<span><img class="lazy" data-src="/upload_files/prof/<%=filename%>" alt="교수 프로필사진"></span>
	<div class="nameBox">
		<%=strName%> <%=strTitle%>
		<p>꿈이 이루어지는 학교! 한국IT</p>
	</div>
</div>
<div class="conRight">
	<ul>
		<li>
			<dl>
				<dt>주요담당과목</dt>
				<dd><%=chapter%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>학력</dt>
				<% if IsArray(scholarArr) then %>
				<% For i = 0 To UBound(scholarArr,2) %>
				<dd><%=scholarArr(0,i)%></dd>
				<% Next %>
				<% end if %>
			</dl>
		</li>
		<li>
			<dl>
				<dt>경력</dt>
				<% if IsArray(careerArr) then %>
				<% For i = 0 To UBound(careerArr,2) %>
				<dd><%=careerArr(0,i)%></dd>
				<% Next %>
				<% end if %>
			</dl>
		</li>
		<li>
			<dl>
				<dt>논문/저서</dt>
				<% if IsArray(treatiseArr) then %>
				<% For i = 0 To UBound(treatiseArr,2) %>
				<dd><%=treatiseArr(0,i)%></dd>
				<% Next %>
				<% end if %>
			</dl>
		</li>
		<li>
			<dl>
				<dt>수상</dt>
				<% if IsArray(prizeArr) then %>
				<% For i = 0 To UBound(prizeArr,2) %>
				<dd><%=prizeArr(0,i)%></dd>
				<% Next %>
				<% end if %>
			</dl>
		</li>
	</ul>
</div>
