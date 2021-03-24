        <%
        ' 페이징 리스트
        ' Set_PageSize : 페이지 사이즈
        ' Set_PageNum : 현재페이지
        ' Set_Field : 필드명
        ' Set_Table : 테이블명
        ' Set_Where : 검색조건
        ' Set_OrderBy : 정렬조건
        ' Set_PageCount : 전체페이지 갯수(반환)
        ' Set_RecordCount : 전체리스트 갯수(반환)

        PageSize = 16
        PageNum = page

        tableName = "dbo.tbl_board_list"
        Field = "take_idx, dt, bbscode, part, writeday, title, readnum, listimg, summery, writer_id, name, top_view"
        WhereStr = "Status=1 And bbscode In (" & board_gubun_code_str & ")"
		IF bbscode <> "" AND bbscode = "게임" or bbscode = "정보보안" Then
			WhereStr = WhereStr & " and part like '%" & bbscode & "%'"
		ElseIF bbscode = "디자인" Then
			WhereStr = WhereStr & " and (part like'%" & bbscode & "%' or part like '%카툰%')"
		END IF
        OrderBy = "Order by top_view desc, writeday desc, take_idx desc"
        PageCount = 0 : RecordCount = 0

        'Response.write "sk : " + wherestr


        'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
        'rsList = GetListPageToArray(CONNSTRING_WEB, PageSize, PageNum, Field, tableName, WhereStr, OrderBy, PageCount, RecordCount)

		sql = "exec TBL_SiteBoard_L @gubun='C', @bs_gubun='" & replace(board_gubun_code_str, "'","""") & "', @bbscode='" & bbscode & "', @topCnt=4, @pageNumber=" & PageNum & ", @RowPerPage = " & PageSize & " "
		rsArray =  GetRowsQuery(CONNSTRING_WEB, sql)
  'Response.write " / sk1 : " + sql
		If IsArray(rsArray) Then
			PageCount = Int((rsArray(0,0) - 1) / PageSize) + 1
		END IF

		sql = "exec TBL_SiteBoard_L @gubun='L', @bs_gubun='" & replace(board_gubun_code_str, "'","""") & "', @bbscode='" & bbscode & "', @topCnt=4, @pageNumber=" & PageNum & ", @RowPerPage = " & PageSize & " "
		rsList = GetRowsQuery(CONNSTRING_WEB, sql)

		'Response.write " / sk2 : " + sql

        %>
        <div class="newsList">
			<ul><%
            If Not IsArray(rsList) Then
				Response.Write "<div style=""text-align:center; font-size:20px; padding:40px;"">등록된 게시물이 없습니다.</div>"
			Else

            	For i = 0 To Ubound(rsList,2)
                    take_idx = rsList(1,i)
                    dt = rsList(2,i)
                    bbscode = rsList(3,i)
                    part = rsList(4,i)
                    writeday = rsList(6,i)
                    title = rsList(6,i)
                    readnum = rsList(7,i)
                    listimg = rsList(8,i)
                    summery = rsList(9,i)
                    writer_id = rsList(10,i)
                    name = rsList(11,i)
                    top_view = rsList(12,i)

                    tNum = rsList(Ubound(rsList,1),i)

                    If Len(listimg) >= 5 Then
                        listimg_str = IMG_BOARD_UPLOAD_PATH & listimg
                    Else
                        listimg_str = IMG_BOARD_NONAME_PATH
                    End If


                    For j = 1 To Ubound(board_bbscode_array,2)
                        If StrComp(bbscode,board_bbscode_array(0,j)) = 0 Then
                            bbscode_txt = board_bbscode_array(1,j)
                            Exit for
                        End If
                    Next
            	%>


				<li>
					<a href="?page=<%=page%>&take_idx=<%=take_idx%>">
						<div style="background-image:url('<%=listimg_str%>'); height: 243px; width: 343px;background-size: cover;background-repeat: no-repeat;background-position: 50% 50%;"></div>
						<p><%=ChgHTMLReplace(title)%></p>
						<div class="news_cover"></div>
					</a>
				</li>
				<%
				Next
			End If
			%>
			</ul>
		</div>
		<% Call PageCounterWeb2017(Page, PageCount, 10, "", searching) %>
