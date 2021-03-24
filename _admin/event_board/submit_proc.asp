<!-- #include virtual = "/inc/Admin_Inc_Ajax_utf8.inc" -->
<!-- #include virtual="/_admin/board_list/inc_config.inc" -->
<%
'등록
Function GetInsertListToIdx()
	Dim FiledArr(32,2)
	FiledArr(1,1) = "bbscode" :	FiledArr(1,2) = bbscode
	FiledArr(2,1) = "part" : FiledArr(2,2) = part
	FiledArr(3,1) = "writeday" : FiledArr(3,2) = writeday
	FiledArr(4,1) = "top_view" : FiledArr(4,2) = top_view
	FiledArr(5,1) = "title" : FiledArr(5,2) = title
	FiledArr(6,1) = "summery" : FiledArr(6,2) = summery
	FiledArr(7,1) = "content" : FiledArr(7,2) = content
	FiledArr(8,1) = "content_txt" : FiledArr(8,2) = content_txt
	FiledArr(9,1) = "listimg" : FiledArr(9,2) = listimg
	FiledArr(10,1) = "status" :	FiledArr(10,2) = 1
	FiledArr(11,1) = "writer_id" :	FiledArr(11,2) = ID
	FiledArr(12,1) = "name" :	FiledArr(12,2) = k_name
	FiledArr(13,1) = "mainimg" : FiledArr(13,2) = mainimg
	FiledArr(14,1) = "main_check" : FiledArr(14,2) = main_check
	FiledArr(15,1) = "orderCode" : FiledArr(15,2) = orderCode
	FiledArr(16,1) = "url" : FiledArr(16,2) = url
	FiledArr(17,1) = "press_name1" : FiledArr(17,2) = press_name1
	FiledArr(18,1) = "press_url1" : FiledArr(18,2) = press_url1
	FiledArr(19,1) = "press_logo1" : FiledArr(19,2) = press_logo1
	FiledArr(20,1) = "press_name2" : FiledArr(20,2) = press_name2
	FiledArr(21,1) = "press_url2" : FiledArr(21,2) = press_url2
	FiledArr(22,1) = "press_logo2" : FiledArr(22,2) = press_logo2
	FiledArr(23,1) = "press_name3" : FiledArr(23,2) = press_name3
	FiledArr(24,1) = "press_url3" : FiledArr(24,2) = press_url3
	FiledArr(25,1) = "press_logo3" : FiledArr(25,2) = press_logo3
	FiledArr(26,1) = "readnum" : FiledArr(26,2) = readnum
	FiledArr(27,1) = "mlistImg" : FiledArr(27,2) = mlistImg
	FiledArr(28,1) = "esdate" : FiledArr(28,2) = esdate
	FiledArr(29,1) = "eedate" : FiledArr(29,2) = eedate
	FiledArr(30,1) = "isView" : FiledArr(30,2) = isView
	FiledArr(31,1) = "filename1" : FiledArr(31,2) = filename1
	FiledArr(32,1) = "filename2" : FiledArr(32,2) = filename2

	If strcomp(part,"인공지능(AI)") = 0 Then
		part = "융합스마트"
	end if

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetInsertListToIdx = InsertQueryArray(CONNSTRING_WEB, DB_TABLE_NAME, FiledArr)
End Function

'변경
Function GetUpdateListToCnt(ByVal take_idx)
	Dim FiledArr(32,2)
	FiledArr(1,1) = "bbscode" :	FiledArr(1,2) = bbscode
	FiledArr(2,1) = "part" : FiledArr(2,2) = part
	FiledArr(3,1) = "writeday" : FiledArr(3,2) = writeday
	FiledArr(4,1) = "top_view" : FiledArr(4,2) = top_view
	FiledArr(5,1) = "title" : FiledArr(5,2) = title
	FiledArr(6,1) = "summery" : FiledArr(6,2) = summery
	FiledArr(7,1) = "content" : FiledArr(7,2) = content
	FiledArr(8,1) = "content_txt" : FiledArr(8,2) = content_txt
	FiledArr(9,1) = "listimg" : FiledArr(9,2) = listimg
	FiledArr(10,1) = "mainimg" : FiledArr(10,2) = mainimg
	FiledArr(11,1) = "main_check" : FiledArr(11,2) = main_check
	FiledArr(12,1) = "orderCode" : FiledArr(12,2) = orderCode
	FiledArr(13,1) = "url" : FiledArr(13,2) = url
	FiledArr(17,1) = "press_name1" : FiledArr(17,2) = press_name1
	FiledArr(18,1) = "press_url1" : FiledArr(18,2) = press_url1
	FiledArr(19,1) = "press_logo1" : FiledArr(19,2) = press_logo1
	FiledArr(20,1) = "press_name2" : FiledArr(20,2) = press_name2
	FiledArr(21,1) = "press_url2" : FiledArr(21,2) = press_url2
	FiledArr(22,1) = "press_logo2" : FiledArr(22,2) = press_logo2
	FiledArr(23,1) = "press_name3" : FiledArr(23,2) = press_name3
	FiledArr(24,1) = "press_url3" : FiledArr(24,2) = press_url3
	FiledArr(25,1) = "press_logo3" : FiledArr(25,2) = press_logo3
	FiledArr(26,1) = "readnum" : FiledArr(26,2) = readnum
	FiledArr(27,1) = "mlistImg" : FiledArr(27,2) = mlistImg
	FiledArr(28,1) = "esdate" : FiledArr(28,2) = esdate
	FiledArr(29,1) = "eedate" : FiledArr(29,2) = eedate
	FiledArr(30,1) = "isView" : FiledArr(30,2) = isView
	FiledArr(31,1) = "filename1" : FiledArr(31,2) = filename1
	FiledArr(32,1) = "filename2" : FiledArr(32,2) = filename2
	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetUpdateListToCnt = UpdateQueryArray(CONNSTRING_WEB, DB_TABLE_NAME, FiledArr, "take_idx='"& take_idx & "' And Status=1")
End Function

'삭제
Function GetDeleteListToCnt(ByVal take_idx)
	Dim FiledArr(2,2)
	FiledArr(1,1) = "status" :	FiledArr(1,2) = 10
	FiledArr(2,1) = "deleter" : FiledArr(2,2) = id
	GetDeleteListToCnt = UpdateQueryArray(CONNSTRING_WEB, DB_TABLE_NAME, FiledArr, "take_idx='"& take_idx & "' And Status=1")
End Function

'정렬코드 업데이트
Function GetUpdateOrderCodeToCnt(ByVal take_idx)
	Dim FiledArr(1,2)
	FiledArr(1,1) = "orderCode" :	FiledArr(1,2) = orderCode

	'CONNSTRING_WEB, CONNSTRING_HAKSA_COMMON, CONNSTRING_HAKSA_STAFF
	GetUpdateOrderCodeToCnt = UpdateQueryArray(CONNSTRING_WEB, DB_TABLE_NAME, FiledArr, "take_idx='"& take_idx & "' And Status=1")
End Function

'배너 이미지 등록
function setInsertBannerLisToIdx(ByVal event_idx, ByVal event_gubun, ByVal position)
	Dim FiledArr(11,2)
	FiledArr(1,1) = "event_idx" :	FiledArr(1,2) = event_idx
	FiledArr(2,1) = "gubun" : FiledArr(2,2) = event_gubun
	FiledArr(3,1) = "position" : FiledArr(3,2) = position
	FiledArr(4,1) = "title" : FiledArr(4,2) = title
	If event_gubun = "w" Then
		FiledArr(5,1) = "bbs_url" : FiledArr(5,2) = "/new/board/eventboard.asp?code=con&id=" & event_idx
		FiledArr(7,1) = "imagefile" : FiledArr(7,2) = WebMainBanner
	Else
		FiledArr(5,1) = "bbs_url" : FiledArr(5,2) = "/event/2018/event_board.asp?code=con&id=" & event_idx
		FiledArr(7,1) = "imagefile" : FiledArr(7,2) = mlistImg
	END IF
	FiledArr(6,1) = "use_yn" : FiledArr(6,2) = isView

	FiledArr(8,1) = "sdate" : FiledArr(8,2) = esdate
	FiledArr(9,1) = "edate" : FiledArr(9,2) = eedate
	FiledArr(10,1) = "regadmin" : FiledArr(10,2) = id
	FiledArr(11,1) = "lastupdater" : FiledArr(11,2) = id
	setInsertBannerLisToIdx = InsertQueryArray(CONNSTRING_WEB, "dbo.TBL_SiteBanner", FiledArr)
END Function

'배너 이미지 업데이트
function setUpdateBannerLisToIdx(ByVal event_idx, ByVal Idx, ByVal event_gubun)
	Dim FiledArr(7,2)
	FiledArr(1,1) = "title" : FiledArr(1,2) = title
	FiledArr(2,1) = "use_yn" : FiledArr(2,2) = isView
	If event_gubun = "w" Then
		FiledArr(3,1) = "imagefile" : FiledArr(3,2) = WebMainBanner
	Else
		FiledArr(3,1) = "imagefile" : FiledArr(3,2) = mlistImg
	END IF
	FiledArr(4,1) = "sdate" : FiledArr(4,2) = esdate
	FiledArr(5,1) = "edate" : FiledArr(5,2) = eedate
	FiledArr(6,1) = "lastupdater" : FiledArr(6,2) = id
	setUpdateBannerLisToIdx = UpdateQueryArray(CONNSTRING_WEB, "dbo.TBL_SiteBanner", FiledArr, "idx='"& Idx & "' And event_idx = '"& event_idx & "'")
END Function

%>
<%
Set abc = Server.CreateObject("ABCUpload4.XForm")
abc.AbsolutePath = False
abc.Overwrite = False
abc.CodePage = 65001

mode = Trim(abc.item("mode")(1))
searching = Trim(abc.item("searching")(1))
'
take_idx = FormatCheckNumZero(abc.item("take_idx")(1))
bbscode = Trim(abc.item("bbscode")(1))

'mode = request("mode")
'take_idx = request("take_idx")
'searching = request("searching")
'bbscode = request("bbscode")



IF bbscode = "" THen
	bbscode = "eventboard"
END IF
part = Trim(abc.item("part")(1))
writeday = Trim(abc.item("writeday")(1))
top_view = FormatCheckNumZero(abc.item("top_view")(1))
isView = Trim(abc.item("isView")(1))
title = Trim(abc.item("title")(1))
summery = Trim(abc.item("summery")(1))
content = Trim(abc.item("content")(1))
content_txt = Trim(abc.item("content_txt")(1))
listimg = Trim(abc.item("listimg")(1))
'모바일 이벤트 리스트 이미지
mListIdx = Trim(abc.item("mListIdx")(1))
mlistimg = Trim(abc.item("mList")(1))
'웹 배너 이미지
WebMainBannerIdx = Trim(abc.item("WebMainBannerIdx")(1))
WebMainBanner = Trim(abc.item("WebMainBanner")(1))

esdate = Trim(abc.item("esdate")(1))
eedate = Trim(abc.item("eedate")(1))
url = Trim(abc.item("url")(1))

'메인화면 하단 게시글 - 2016.06.02
mainimg = Trim(abc.item("mainimg")(1))
main_check = FormatCheckNumZero(abc.item("main_check")(1))

'언론홍보
press_name1 = Trim(abc.item("press_name1")(1))
press_url1 = Trim(abc.item("press_url1")(1))
press_logo1 = Trim(abc.item("press_logo1")(1))
press_name2 = Trim(abc.item("press_name2")(1))
press_url2 = Trim(abc.item("press_url2")(1))
press_logo2 = Trim(abc.item("press_logo2")(1))
press_name3 = Trim(abc.item("press_name3")(1))
press_url3 = Trim(abc.item("press_url3")(1))
press_logo3 = Trim(abc.item("press_logo3")(1))

readnum = FormatCheckNumZero(abc.item("readnum")(1))

filename1 = Trim(abc.item("filename1")(1))
filename2 = Trim(abc.item("filename2")(1))


'정렬코드 - 2016.06.07
orderCode = top_view & "-" & writeday & "-" & take_idx

Select Case CStr(mode)
Case "insert"
	tNum = GetInsertListToIdx()
	If CDbl(tNum) >= 1 Then
		take_idx = tNum
		orderCode = top_view & "-" & writeday & "-" & take_idx

		'정렬코드 업데이트
		Call GetUpdateOrderCodeToCnt(take_idx)
		IF WebMainBanner <> "" Then
			'배너 이미지 등록
			WebMainBannerIdx = setInsertBannerLisToIdx(take_idx,"w", "EventBanner")
		END IF
		'모바일 이벤트 리스트 이미지 등록
		IF mlistimg <> "" Then
			mListIdx = setInsertBannerLisToIdx(take_idx, "m", "EventList")
		END IF
		msg = "등록되었습니다."
		pagename = "event_view.asp?take_idx=" & tNum & searching
		Session("board_list_view_idx") = tNum
	Else
		msg = "실패되었습니다."
		pagename = "event_list.asp?page=" & session("page") & searching
	End If

Case "update"
	tNum = GetUpdateListToCnt(take_idx)
	If CDbl(tNum) >= 1 Then
		'웹 배너 이미지 등록
		IF WebMainBanner <> "" Then

			'배너 이미지 등록
			IF WebMainBannerIdx >= 1 Then
				WebMainBannerIdx = setUpdateBannerLisToIdx(take_idx, WebMainBannerIdx, "w")
			Else
				WebMainBannerIdx = setInsertBannerLisToIdx(take_idx,"w", "EventBanner")
			END IF
		END IF
		'모바일 이벤트 리스트 이미지 등록
		IF mlistimg <> "" Then
			IF mListIdx >= 1 Then
				mListIdx = setUpdateBannerLisToIdx(take_idx, mListIdx, "m")
			Else
				mListIdx = setInsertBannerLisToIdx(take_idx, "m", "EventList")
			END IF
		END IF
		msg = "변경되었습니다."
		pagename = "event_view.asp?take_idx=" & take_idx & searching
	Else
		msg = "실패되었습니다."
		pagename = "event_view.asp?take_idx=" & take_idx & searching
	End If

Case "delete"
	tNum = GetDeleteListToCnt(take_idx)
	If CDbl(tNum) >= 1 Then
		msg = "삭제되었습니다."
		pagename = "event_list.asp?page=1" & searching
	Else
		msg = "실패되었습니다."
		pagename = "event_list.asp?page=1" & searching
	End If

Case Else
	msg = "잘못된 접근입니다."
	pagename = "event_list.asp"

End Select
%>
<script type="text/javascript">
	alert("<%=msg%>");
	if("<%=WebMainBannerIdx%>" >= 1){
		$("#WebMainBannerIdx").val("<%=WebMainBannerIdx%>")
	}
	if("<%=id%>" == "webmaster"){
	}else{

	}
	document.location.href="<%=pagename%>";
</script>
