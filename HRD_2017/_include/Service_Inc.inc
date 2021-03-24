<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<% Option Explicit %>
<!--#include virtual="/_include/common.asp"-->
<!--#include virtual="/_include/db_conn.asp"-->
<!--#include File= "Function/Fn_MSSQL.inc"-->
<!--#include File= "Function/Fn_DBHelper.inc"-->
<!--#include File= "Function/Fn_System.inc"-->
<!--#include File= "Function/Fn_Service.inc"-->
<!--#include File= "Function/Fn_List.inc"-->
<!--#include File= "Function/Config.inc"-->
<!--#include File= "Function/RsToHashMap.asp"-->
<!--#include File= "2017/menu_list.inc"-->

<% Call connConnect() %>


<%
Response.ContentType = "text/html;charset=utf-8"
Response.Expires = 0
Response.AddHeader "Pragma", "no-cache"
Response.AddHeader "Cache-Control", "no-store"
%>