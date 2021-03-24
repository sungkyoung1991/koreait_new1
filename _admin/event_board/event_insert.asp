<!-- #include virtual = "/inc/Admin_Inc_utf8.inc" -->
<!-- #include virtual="/_admin/board_list/inc_config.inc" -->
<!-- #include virtual="/_include/$dbconnect.asp" -->
<%
mode = request("mode")
take_idx = FormatCheckNumZero(request("take_idx"))
IF bbscode = "" Then
	bbscode = "eventboard"
END IF

if mode = "update" then
	'게시판
	' 0 : take_idx, dt, bbscode, part, top_view, writeday, readnum, title,  content, summery
	'10: listimg, writer_id, name, mainimg, main_check, url, press_name1, press_url1, press_logo1, press_name2
	'20: press_url2, press_logo2, press_name3, press_url3, press_logo3 [24]
	rsArray = GetBoardListToArray(take_idx)

	sql ="exec TBL_SiteBoard_V @gubun='A', @bbscode='" & bbscode & "', @take_idx =  " & take_idx
	'Response.Write sql
	set rs = conn.execute(sql)
	If Not Rs.Eof Then
		rsArray = rs.getrows()
	Else
		rsArray = NULL
	End If
	If Not IsArray(rsArray) Then
		Response.Write "<script>alert('수정할 글이 없습니다.'); history.back();</script>"
		Response.end
	End If

	take_idx = rsArray(0,0)
	dt = rsArray(1,0)
	bbscode = rsArray(2,0)
	part = rsArray(3,0)
	top_view = rsArray(4,0)
	writeday = rsArray(5,0)
	readnum = rsArray(6,0)
	title = rsArray(7,0)
	content = rsArray(8,0)
	summery = rsArray(9,0)
	listimg = rsArray(10,0)
	writer_id = rsArray(11,0)
	name = rsArray(12,0)
	mainimg = rsArray(13,0)
	main_check = FormatCheckNumZero(rsArray(14,0))
	url = rsArray(15,0)

	'언론홍보
	press_name1 = rsArray(16,0)
	press_url1 = rsArray(17,0)
	press_logo1 = rsArray(18,0)
	press_name2 = rsArray(19,0)
	press_url2 = rsArray(20,0)
	press_logo2 = rsArray(21,0)
	press_name3 = rsArray(22,0)
	press_url3 = rsArray(23,0)
	press_logo3 = rsArray(24,0)

	'이벤트
	isView		= rsArray(25,0)
	mlistImg	= rsArray(26,0)
	esdate		= rsArray(27,0)
	eedate		= rsArray(28,0)
	WebMainBannerIdx = rsArray(29,0)
	WebMainBanner = rsArray(30,0)
	mListIdx 	= rsArray(31,0)
	filename1	= rsArray(32,0)
	filename2	= rsArray(33,0)



	'리스트 이미지
	If Len(listimg) >= 5 Then
		listimg_str = IMG_BOARD_UPLOAD_PATH & listimg
	Else
		listimg_str = IMG_BOARD_NONAME_PATH
	End If

	'리스트 이미지
	If Len(mainimg) >= 5 Then
		mainimg_str = IMG_BOARD_UPLOAD_PATH & mainimg
	Else
		mainimg_str = IMG_BOARD_NONAME_PATH
	End If




		'파일이름
	If Len(filename1) >= 5 Then
		filename1_str = FILE_BOARD_UPLOAD_PATH & filename1
	Else
		filename1_str = FILE_BOARD_NONAME_PATH
	End If





	if Len(mlistImg) >= 5 Then
		mlistimg_str = "http://m.koreait.ac.kr/" & replace(mIMG_BOARD_UPLOAD_PATH,"/mobile/","")  & mlistImg
	Else
		mlistimg_str = IMG_BOARD_NONAME_PATH
	END IF
	if Len(WebMainBanner) >= 5 Then
		wbannerimg_str = IMG_WEB_BANNER_UPLOAD_PATH  & WebMainBanner
	Else
		wbannerimg_str = IMG_BOARD_NONAME_PATH
	END IF

	menu = "수정"
Else
	url = ""
	writeday = Date()

	menu = "쓰기"
	listimg = ""
	listimg_str = IMG_BOARD_NONAME_PATH

	main_check = "0"
	mainimg = ""
	mainimg_str = IMG_BOARD_NONAME_PATH




	filename1 = ""
	file_str = FILE_BOARD_UPLOAD_PATH




	readnum = 0
end If

Dim arrPart, arrCourse
sql ="exec TBL_PartList @regyear=2019, @gubun='p'"
set rs = conn.execute(sql)
If Not Rs.Eof Then
	arrPart = rs.getrows()
Else
	arrPart = Null
End If

sql ="exec TBL_PartList @regyear=2019, @gubun='c'"
set rs = conn.execute(sql)
If Not Rs.Eof Then
	arrCourse = rs.getrows()
Else
	arrCourse = Null
End If
%>
<!DOCTYPE html>
<html>
<head>
<!-- #include virtual="/_admin/inc/inc_head.inc" -->

<style type="text/css">
#wrap { width:860px; padding:30px 0 0 15px; }
.button-area { text-align:center; margin:20px auto 30px; }
textarea { font-size:12px; line-height:1.4; }

.admin_tit2 {
    color: #000000;
    font-size: 22px;
    font-weight: bold;
	border-bottom:3px solid #663300;
	margin-bottom:10px;
	line-height:30px;
}

td, th { height: 30px; color: #000000; font-size: 12px; line-height: 22px; }

td {
	color: #000000;
	border: 1px solid #FFFFFF;
	background-color: #F5F5F5;
	font-size: 12px;
	padding-left: 3px;
	line-height: 22px;
	text-align: left;
}

th {
	color: #000000;
	border: 1px solid #FFFFFF;
	background-color: #CEDAEE;
	font-size: 12px;
	padding-right: 3px;
	line-height: 22px;
	text-align: center;
	font-weight: bold;
}

#submit_progress { position:relative; width:550px; border: 1px solid #ddd; padding: 1px; }
#submit_bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
#submit_percent { position:absolute; display:inline-block; top:3px; left:48%; }

.contentWarp img {width:100%;}
table {width:100%; max-width:1150px;}
table  th {font-weight: bold;background-color: #E8EDFD;}
</style>

<!-- ckeditor file -->
<!-- #include virtual="/_include/ckeditor/inc_ckeditor.js.asp" -->
<script type="text/javascript">
$(document).ready(function() {
	CKEDITOR.replace('content', {
		customConfig: '<%=Left(request.servervariables("PATH_INFO"), InStrRev(request.servervariables("PATH_INFO"),"/"))%>ckeditor_config.js',
		width: "720px",
		height: "600px"
	});
	$("#frmSubmit").click(function(e) {
		e.preventDefault();

/*
		for ( instance in CKEDITOR.instances ) {
			CKEDITOR.instances[instance].updateElement();
		}
*/
		var contents = CKEDITOR.instances.content.getData();
		var contents_txt = GetCharCodeReplace(removeTag($("<div>"+contents+"</div>").text()));
		if (contents.length < 10) {

			window.alert("글내용은 최소 10자 이상 작성 해야합니다.");
			CKEDITOR.instances.content.focus();
			return;
		}

		$("#content").val(GetCharCodeReplace(contents));
		$("#content_txt").val(contents_txt);

		var summery_txt = removeTag($("<div>"+$("#summery").val()+"</div>").text());
		$("#summery").val(summery_txt);

		sendit();
	});

});
</script>
<script type="text/javascript">
function sendit(){
	var frm = document.insert_form;

	if(frm.bbscode.value=="") {
		alert("게시판을 선택하세요.");
		frm.bbscode.focus();
		return;
	}

	if(frm.part.value=="") {
		alert("학부를 선택하세요.");
		frm.part.focus();
		return;
	}

	if(frm.title.value=="") {
		alert("제목을 입력해주세요.");
		frm.title.focus();
		return;
	}

	/*if(frm.summery.value=="") {
		alert("내용 요약을 입력해주세요.");
		frm.summery.focus();
		return;
	}*/

	// 리스트이미지 등록확인
	if( $("#ListImg").val() == "") {
		alert("리스트이미지를 등록해 주세요.");
		$("#listimgfile").trigger("click");
		return;
	} else {
		var ext = $('#ListImg').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			return;
		}
	}
/*	// ajaxSend
	var url = "submit_proc.asp";
	var params = $("#frmWrite").serialize();
	var post = "POST";
	var targetID = "";
	var resultFn = "";
	ajaxSendParam(url, params, post, targetID, resultFn);*/

	// ajaxForm
	var frmID = "frmWrite";
	var url = "submit_proc.asp";
	var targetID = "";
	var resultFn = "";
	ajaxFormParam(frmID, url, targetID, resultFn);
}

function setFileReset() {
	try { $("#listimgfile").replaceWith( $("#listimgfile").clone(true) ); }	catch (e) { }
	try { $("#listimgfile").val(""); }	catch (e) { }

	try { $("#mainimgfile").replaceWith( $("#mainimgfile").clone(true) ); }	catch (e) { }
	try { $("#mainimgfile").val(""); }	catch (e) { }
}
</script>
</head>
<body>
<div id="wrap">

<form id="frmWrite" name="insert_form"  enctype="multipart/form-data" method="post">
<input type="hidden" name="mode" id="mode" value="<%=mode%>">
<input type="hidden" name="take_idx" value="<%=take_idx%>">
<input type="hidden" name="searching"  value="<%=searching%>">

	<div class="admin_tit2">이벤트 게시판 관리</div>
	<table border="0" cellspacing="1" width="100%" cellpadding="0">
		<colgroup>
			<col width="15%" /><col width="35%" />
			<col width="15%" /><col width="35%" />
		</colgroup>
		<tr>
			<th>게시판</th>
			<td>
<%
Response.Write "<select name=""bbscode"" id=""bbscode"" disabled >"
If IsArray(board_bbscode_array) Then
	For i = 0 To UBound(board_bbscode_array,2)
		If StrComp(bbscode,board_bbscode_array(0,i)) = 0 OR  StrComp("eventboard",board_bbscode_array(0,i)) = 0 Then
			Response.Write "<option value=""" & board_bbscode_array(0,i) & """ selected='selected'>" & board_bbscode_array(1,i) & "</option>"
		Else
			Response.Write "<option value=""" & board_bbscode_array(0,i) & """>" & board_bbscode_array(1,i) & "</option>"
		End If
	Next
End If
Response.Write "</select>"
%>

			</td>
			<th>학부</th>
			<td>
<%
rsArray = GetClassNameToArray()
' Response.Write "<select name=""part"" id=""part"">"
' Response.Write "<option value="""">[학부 선택]</option>"
' Response.Write "<option value=""통합""" & IIf(StrComp(part,"통합")=0," selected='selected'","") & ">통합</option>"
' If IsArray(rsArray) Then
' 	For i = 0 To Ubound(rsArray,2)
' 		pname = rsArray(0,i)
' 		sname = rsArray(1,i)
'
' 		If StrComp(part,sname) = 0 Then
' 			Response.Write "<option value=""" & sname & """ selected=""selected"">" & sname & "</option>"
' 		Else
' 			Response.Write "<option value=""" & sname & """>" & sname & "</option>"
' 		End If
' 	Next
' End If
' Response.Write "</select>"
%>

<select name="part" id="part">
<option value="">[학부 선택]</option>
<option value="통합">통합</option>
<option value="게임계열">게임</option>
<option value="콘텐츠디자인계열" >디지털디자인</option>
<option value="융합스마트계열">인공지능AI</option>
<option value="전기공학계열" >전기공학</option>
<option value="정보보안계열">정보보안</option>



			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>
				<input type="text" name="writeday" id="writeday" value="<%=writeday%>" maxlength="10" class="datepicker" >

				<span style="padding-left:20px;">조회수: <input type="text" name="readnum" value="<%=FormatCheckNumZero(readnum)%>" style="width:80px;text-align:right;padding-right:10px;"/></span>
			</td>
			<th>우선순위</th>
			<td>
				<label><input type="checkbox" name="top_view" value="1" <%If top_view=1 then%>checked<%End if%> /> 우선순위</label>

				<label style="padding-left:20px;"><input type="checkbox" name="main_check" value="1" <%If main_check=1 then%>checked<%End if%> /> 메인노출</label>
                <label style="padding-left:20px;"><input type="checkbox" name="isView" value="N" <%If isView="N" then%>checked<%End if%> />이벤트 종료</label>
			</td>
		</tr>
        <tr>
        	<th>게시기간</th>
            <td colspan="3">
            	<input type="text" name="esdate" id="esdate" value="<%=esdate%>" class="datepicker" >
                ~
                <input type="text" name="eedate" id="eedate" value="<%=eedate%>" class="datepicker" >
            </td>
        </tr>
		<tr>
			<th>영상 URL</th>
			<td colspan="3">
				<input type="text" name="url" id="url" value="<%=ChgHTMLReplace(url)%>" maxlength="100" size="45" style="width:98%;" />
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">
				<input type="text" name="title" id="title" value="<%=ChgHTMLReplace(title)%>" maxlength="100" size="45" style="width:98%;" />
			</td>
		</tr>
		<tr>
			<th>내용 요약</th>
			<td colspan="3">
				<textarea rows="5" name="summery" id="summery" cols="80" maxlength="2000" style="width:98%;"><%=summery%></textarea>
			</td>
		</tr>
		<tr>
			<th><font class=admin_tit>내용<br/>(이미지 등록시<br/>폭 최대 1024px로<br/>변환됩니다.<br/>너비와 높이 값은<br/>지워주세요.)</font></th>
			<td colspan="3" class="contentWarp">
				<textarea rows="40" name="content" cols="90" id="content"><%=content%></textarea>
				<input type="hidden" name="content_txt" id="content_txt" />
			</td>
		</tr>
		<tr>
			<th>리스트<br/>이미지</th>
			<td colspan="3">
<!-- 파일업로드 추가-->
				<div style="width:133px; height:100px; float:left; border:2px solid #999; padding:2px; margin:2px;">
					<img src="<%=listimg_str%>" style="width:133px; height:100px;" id="listimg_img" onERROR="this.src='<%=IMG_BOARD_NONAME_PATH%>'"/>
                    <input name="ListImg" id="ListImg" type="hidden" value="<%=listimg%>" />
				</div>
				<div style="float:left; padding:5px 0 0 10px;">
					<input name="listimgfile" id="listimgfile" type="button" data-id="listimg_img" data-cate="ListImg"  value="이미지 선택" onClick="setFile(this);" />
                      <span class="ListImgFileName"><%=listimg%></span>
					<div style="padding:5px 0; color:#000;"></div>
				</div>
<!-- 파일업로드 추가 끝-->
			</td>
		</tr>

		<tr style="display:none;">
			<th>메인<br/>이미지</th>
			<td colspan="3">
<!-- 파일업로드 추가-->
				<div style="width:90px; height:114px; float:left; border:2px solid #999; padding:2px; margin:2px;">
					<img src="<%=mainimg_str%>" style="width:90px; height:114px;" id="mainimg_img" onERROR="this.src='<%=IMG_BOARD_NONAME_PATH%>'"/>
                    <input name="mainimg" id="mainimg" type="hidden" value="<%=mainimg%>" />
				</div>
				<div style="float:left; padding:5px 0 0 10px;">
					<input name="mainimgfile" id="mainimgfile" type="file" />
					<div style="padding:5px 0; color:#000;">
                    	※ list 의 메인이미지 사이즈: 272px X 343px <br/>
                        ※ 메인에 노출시만 등록하세요.</br>
                    </div>
				</div>
<!-- 파일업로드 추가 끝-->
			</td>
		</tr>
        <tr>
			<th>웹 배너 이미지</th>
			<td colspan="3">
<!-- 파일업로드 추가-->
				<form name="WebMainBanner" id="WebMainBanner">
				<div style="width:117px; height:182px; float:left; border:2px solid #999; padding:2px; margin:2px;">
					<img src="<%=wbannerimg_str%>" style="width:117px; height:182px;" id="WebMainBannerImg" onERROR="this.src='<%=IMG_BOARD_NONAME_PATH%>'"/>
                    <input name="WebMainBannerIdx" id="WebMainBannerIdx"  type="hidden"  value="<%=WebMainBannerIdx%>" />
                    <input name="WebMainBanner" id="WebMainBanner" type="hidden" value="<%=wbannerimg%>" />
				</div>
				<div style="float:left; padding:5px 0 0 10px;">
					<input name="WebMainBannerfile" id="WebMainBannerfile" type="button"  data-id="WebMainBannerImg" data-cate="WebMainBanner" value="이미지 선택" onClick="setFile(this);" />
                     <span class="WebMainBannerFileName"><%=wbannerimg%></span>
					<div style="padding:5px 0; color:#000;">※ list 의 메인이미지 사이즈: 352px X 546px <br/>※ 메인에 배너 노출시만 등록하세요.</div>
				</div>
                </form>
<!-- 파일업로드 추가 끝-->
			</td>
		</tr>
		<tr>
			<th>모바일 이벤트<br/>리스트 이미지</th>
			<td colspan="3">
<!-- 파일업로드 추가-->
				<div style="width:213px; height:60px; float:left; border:2px solid #999; padding:2px; margin:2px;">
					<img src="<%=mlistimg_str%>" style="width:213px; height:60px;" id="mListimg" onERROR="this.src='<%=IMG_BOARD_NONAME_PATH%>'" />
                    <input name="mListIdx" id="mListIdx"  type="hidden"  value="<%=mListIdx%>" />
                    <input name="mList" id="mList" type="hidden" value="<%=mlistImg%>"/>
				</div>
				<div style="float:left; padding:5px 0 0 10px;">
					<input name="mListfile" id="mListfile" type="button" onClick="setFile(this);" data-id="mListimg" data-cate="mList"  value="이미지 선택"/>
                    <span class="mListFileName"><%=mlistImg%></span>
					<div style="padding:5px 0; color:#000;"></div>
				</div>
<!-- 파일업로드 추가 끝-->
			</td>
		</tr>


        <!-- 파일첨부 추가-->
        <tr>
			<th>파일첨부</th>
			<td colspan="3">

				<div style="float:left; padding:5px 0 0 10px;">
					<input name="filename1_file" id="filename1_file" type="file"/>
					<div style="padding:5px 0; color:#000;">※zip 파일, 10MB 이하</div>
				</div>
                    <input type="hidden" name="filename1" id="filename1" value="<%=filename1%>" />
                    <input type="hidden" name="filename2" id="filename2"  value="<%=filename2%>">

			</td>
		</tr>
  <!-- 파일업로드 추가 끝-->


		<tr>
			<th></th>
			<td colspan="3">
				<div id="submit_progress"  style="margin:0 auto;">
					<div id="submit_bar"></div>
					<div id="submit_percent">0%</div>
				</div>
			</td>
		</tr>

<script type="text/javascript" src="/_admin/press_board/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
function BrowseServer1(startupPath, functionData) {
	var finder = new CKFinder();
	finder.basePath = '../';
	finder.startupPath = startupPath;
	finder.selectActionFunction = SetFileField1;
	finder.selectActionData = functionData;
	finder.popup();
}

function SetFileField1( fileUrl, data ) {
	document.getElementById( data["selectActionData"] ).value = fileUrl;
}
function setFile(obj){
	var btn = obj;
	var imgTegName = $(btn).data("cate");
	var old_file = $("#"+imgTegName).val();
	$("#frmImg input[name=imgCate]").val($(btn).data("cate"));
	$("#frmImg input[name=old_imgName]").val(old_file);
	$("#frmImg input[name=imgTegName]").val($(btn).data("id"));
	$("#frmImg input[name=imgFile]").click();

}



/* 첨부파일 바로등록 */
	$("#filename1_file").on("change", function(e) {

			var ext = $(this).val().split(".").pop().toLowerCase();
			if($.inArray(ext, ['zip']) == -1) {
				alert('zip 파일만 업로드 할수 있습니다.');
				return;
			}

			var fileValue = $("#filename1_file").val().split("\\");
			var fileName2 = fileValue[fileValue.length-1]; // 파일명

			$("#filename2").val(fileName2);

		// ajaxForm
		var frmID = "frmWrite";
		var url = "submit3_process.asp";
		var targetID = "";
		var resultFn = "";
		ajaxFormParam(frmID, url, targetID, resultFn);
	});


function setDataURL(obj,id){
	var file = obj;
	var widthm, height;
	var imgTegName = $("#frmImg input[name=imgTegName]").val();

	var fileList = file.files ;
	var fileName = file.value.split("\\"); // 파일명
	var fileNameExt = file.value.split(".").pop().toLowerCase();  //확장자
	fileName = fileName[fileName.length-1]; // 파일명
	$("#frmImg input[name=ImgName]").val(fileName);
	if(file.value == ""){
		alert("메인 배너 이미지를 등록해 주세요.");
		 $(file).trigger("click");
		return;
	}else {
		if($.inArray(fileNameExt, ['gif','png','jpg','jpeg']) == -1) {
			alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
			$(file).val("");
			return;
		}else{
			// 읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList [0]);
			//로드 한 후
			reader.onload = function  () {
				//로컬 이미지를 보여주기
				//썸네일 이미지 생성
				var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
				tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
				tempImage.onload = function() {
					//리사이즈를 위해 캔버스 객체 생성
					var canvas = document.createElement('canvas');
					var canvasContext = canvas.getContext("2d");
					width = tempImage.width,
					height = tempImage.height;
					//캔버스 크기 설정
					canvas.width = width; //가로
					canvas.height = height; //세로

					//이미지를 캔버스에 그리기
					canvasContext.drawImage(this, 0, 0, width, height );
					//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
					if($.inArray(fileNameExt, ['jpg','jpeg']) == 0) {
						var dataURL = canvas.toDataURL("image/jpeg");
					}else if($.inArray(fileNameExt, ['png']) == 0) {
						var dataURL = canvas.toDataURL("image/png");
					}
					var fileMaxSize = 300 * 1024;
					if(fileMaxSize < dataURL.length || fileMaxSize < file.files[0].size ){
						alert("300KB 미만의 이미지파일로 업로드 해 주세요.");
						$(file).val("");
						return false;
					}else{
						if(dataURL.length < file.files[0].size ){
							$("#frmImg input[name=filetype]").val("dataUrl");
						}else {
							$("#frmImg input[name=filetype]").val("file");
						}
						//썸네일 이미지 보여주기
						$("img#"+imgTegName).attr("src",dataURL);
					}

					//$("#frmImg input[name=dataURL]").val(encodeURIComponent(dataURL.replace('data:image/png;base64,', '')));
					$("#frmImg input[name=dataURL]").val(dataURL);
					// ajaxSend
					var frmID ="frmImg";
					var url = "uploadImg_proc.asp";
					var targetID = "";
					var resultFn = "";
					ajaxFormParam(frmID, url, targetID, resultFn);
				};
			};
		}
	}
}



function setFileFormReset(){
	$("#frmImg")[0].reset();


}
</script>

	</table>

	<div class="button-area">
		<button type="button" id="frmSubmit">등록</button>
		<button type="button" onClick="history.back();">취소</button>
	</div>

</form>

<form name="frmImg" id="frmImg" enctype="multipart/form-data" method="post" action="uploadImg_proc.asp">
	<input type="hidden" name="filetype"/>
	<input type="hidden" name="imgCate"/>
    <input type="hidden" name="dataURL"/>
    <input type="hidden" name="ImgName"/>
    <input type="hidden" name="imgTegName"/>
    <input type="hidden" name="old_imgName"/>
    <div style="display:none;">
    	<input type="file" name="imgFile" onChange="setDataURL(this);" accept=".jpg,.jpeg,.png,.gif,.bmp"/>
   </div>
</form>
</div>
</body>
</html>
