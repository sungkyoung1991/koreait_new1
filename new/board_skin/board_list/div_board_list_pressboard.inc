<div class="subjectBox">
    	<form class="board_search" action="./pressboard.asp" method="post">
    	<select class="subject" name="subject">
       		<option value=" " <%IF subject = "통합" Then %> selected <%END IF%>>전체</option>
            <option value="디자인" <%IF subject = "디자인" Then %> selected <%END IF%>>디자인</option>
            <option value="게임" <%IF subject = "게임" Then %> selected <%END IF%>>게임</option>
            <option value="정보보안" <%IF subject = "정보보안" Then %> selected <%END IF%>>정보보안</option>
            <option value="스마트" <%IF subject = "스마트" Then %> selected <%END IF%>>인공지능AI</option>
        </select>
        <select name="search" title="검색 유형 선택">
            <option value="title">제목</option>
            <option value="content">내용</option>
		</select>
        <input name="find" value="" class="searchText" title="검색어 입력" type="text">
        <input type="submit" value="검색" class="input_search" >
        </form>
    </div>
<div class="hotnewsList">
		<ul>
<%
If Not IsArray(rsArray) Then
	Response.Write	"<li>"
	Response.Write "<div align='center'>등록된 게시물이 없습니다.</div>"
	Response.Write "</li>"
Else
	ReDim press_arr(3,3)
	For i = 0 To UBound(rsArray,2)
		ReDim press_arr(3,3)

		take_idx = rsArray(0,i)
		name = rsArray(1,i)
		writeday = rsArray(2,i)
		title = rsArray(3,i)
		readnum = rsArray(4,i)
		top_view = rsArray(5,i)
		listimg = rsArray(6,i)
		summery = rsArray(7,i)
		Step = rsArray(8,i)
		re_level = rsArray(9,i)

		'press_name1 = rsArray(10,i)
		'press_url1 = rsArray(11,i)
		'press_logo1 = rsArray(12,i)
		'press_name2 = rsArray(13,i)
		'press_url2 = rsArray(14,i)
		'press_logo2 = rsArray(15,i)
		'press_name3 = rsArray(16,i)
		'press_url3 = rsArray(17,i)
		'press_logo3 = rsArray(18,i)
		partName	= replace(rsArray(19,i),"스쿨","계열")

		IF partName <> "통합" Then
			partName = "[" & partName & "]"
		Else
			partName = ""
		END If
		writeday = FormatDatetimes(writeday)
		wdate = formatDate(writeday)
		title = replace(trim(title),"&quot;","'")
		'summery = replace(summery,chr(13)&chr(10), "<br>")

    if strcomp(partName,"융합스마트계열")=0 Then
    partName ="인공지능AI"
    end if


		If Len(listimg) >= 5 Then
			listimg_str = BOARD_LIST_IMG_PATH & listimg
		Else
			listimg_str = "/center_intro/images/center_intro_noimg.gif"
		End IF

		For j = 1 To UBound(press_arr,1)
			k = 10 + ((j-1) * 3)
			press_arr(j,1) = Trim(rsArray(k,i))
			press_arr(j,2) = Trim(rsArray(k+1,i))
			press_arr(j,3) = Trim(rsArray(k+2,i))

			If Len(press_arr(j,3)) >= 1 Then
				press_arr(j,3)=Replace(press_arr(j,3),"/upload_files/press/images/logo","/upload_files/press/_thumbs/images/logo")
			End If
		Next

		if DateDiff("h",writeday,Now()) < 24  AND StrComp(step,0) = 0 AND StrComp(re_level,0) = 0 Then
			news = "&nbsp;<img class=""lazy"" data-src='/Mat_IT/images/mi_itmania_issue_icon_new.gif' width='9' height='9' align='absmiddle' alt='new' />"
		end If

		ahref = "?code=con"
		If Len(bbscode) >= 1 Then ahref = ahref & "&bbscode=" & bbscode
		ahref = ahref & "&id=" & take_idx & "&page=" & page
		ahref = ahref & searching
%>

				<li>
					<a href="<%=ahref%>">
						<span class="thumb" style="width: 270px;"><img class="lazy" data-src="<%=listimg_str%>" alt="<%=Replace(title,"""","")%>" style="width: 268px;" ></span>
						</a>
				<div class="txtBox">
					<a href="<%=ahref%>">
						<span class="title"><%=partName&" "&title%></span>
						<div class="wdate"><strong>게재일</strong> : <span style="font-style:italic;"><%=wdate%></span>&nbsp; ㅣ <strong>조회수</strong> : <span style="font-style:italic;"><%=FormatNumber(readnum,0)%></span></div>
						<!--<p>
							<%=summery%>
						</p>-->
						</a>

<%
		For j = 1 To UBound(press_arr,1)
			If Len(press_arr(j,2)) >= 1 Then
				Response.Write "<a href=""" & press_arr(j,2) & """ target=""_blank"">"

				If Len(press_arr(j,3)) >= 1 Then
					Response.Write "<img class=""lazy"" data-src=""" & press_arr(j,3) & """ alt=""" & Replace(press_arr(j,1),"""","") & """ style=""float:right;"" />"
				Else
					Response.Write "<span>" & press_arr(j,1) & "</span>"
				End IF

				Response.Write "</a>"
			End If
		Next
%>
					<!--<a href="<%=ahref%>">
					<span  class="btnMore">VIEW MORE +</span>
					</a>-->
				</div>
				</li>

<%
	Next
End If
%>
		</ul>
</div>
