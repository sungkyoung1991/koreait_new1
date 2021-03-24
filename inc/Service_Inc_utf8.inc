<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!-- #include File="Function_utf8/Fn_MSSQL.inc" -->
<!-- #include File="Function_utf8/Fn_DBHelper.inc" -->
<!-- #include File="Function_utf8/Fn_System.inc" -->
<!-- #include File="Function_utf8/Fn_Service.inc" -->
<!-- #include File="Function_utf8/Fn_List.inc" -->
<!-- #include File="Function_utf8/Fn_Sms.inc" -->
<!-- #include File="Function_utf8/Fn_Script.inc" -->
<!-- #include File="Function_utf8/Config.inc" -->
<!-- #include File="Function_utf8/inc_config.inc" -->
<!-- #include File="Function_utf8/inc_login.inc" -->
<!-- #include File="Function_utf8/RsToHashMap.asp" -->
<%

'Line 2		:	Fn_MSSQL.inc		:	일반적 으로 사용하는 각종 쿼리 사용자 함수 , SQL 연결문 상수
'Line 3		:	Fn_DBHelper.inc		:	사용자 쿼리인 DBHelper 함수
'Line 4		:	Fn_System.inc		:	SERVER 정보 확인 사용자 함수, Log 내용 저장
'Line 5		:	Fn_Service.inc		:	각종 사용자 함수
'Line 6		:	Fn_List.inc			:	페이징 사용자 함수
'Line 7		:	Fn_Sms.inc			:	문자발송 사용자 함수
'Line 8		:	Fn_Script.inc		:	js 사용자 함수
'Line 9		:	Config.inc			:	각종 서비스관련 상수, 리뉴열 시 작업경로 설정, 게시판 구분 배열
'Line 10	:	inc_config.inc		:	IIS Application 에 사용되는 GNB 쿼리 사용자 함수 , 원서접수일정 쿼리 사용자 함수
'Line 11	:	inc_login.inc		:	로그인 확인 사용자 함수 및 쿠키

'기본설정
Response.ContentType = "text/html;charset=utf-8"
Response.Expires = 0
Response.AddHeader "Pragma", "no-cache"
Response.AddHeader "Cache-Control", "no-store"
%>