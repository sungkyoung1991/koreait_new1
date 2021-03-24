<!-- #include file="../include/subHeader.asp" -->
<% 
page = FormatCheckNumZero(request("page")) : If StrComp(page,0) = 0 Or Not isNumeric(request("page")) Then page = 1
take_idx = formatCheckNumZero(Request("take_idx")) : If Not isNumeric(request("take_idx")) Then take_idx = 0 
part = "정보보안"
board_gubun_code_str = "'classlife','itgallery','prointerview','itstar','pressboard'"
%>
	<div class="auto">
    	<% If StrComp(take_idx,0) = 0 Then %>
		<!-- #include virtual = "/new/school/board/inc_board_list.asp" -->
        <% Else %>
		<!-- #include virtual = "/new/school/board/inc_board_view.asp" -->
        <% End If %>
	</div>
<!-- #include file="../include/subFooter.asp" -->