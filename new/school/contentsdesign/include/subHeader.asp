<!-- #include file="../include/header2020.asp" -->
<div id="subVisual">
	
</div>
<div id="subContents">
	<div id="lnb">
		<div class="auto">
			<a href="index.asp" class="btnHome"><img class="lazy" data-src="../images/contents/lnbIcon.png" alt=""></a>
			<div class="mainLnbWrap">
				<a href="" class="mainBtn"></a>
				<ul class="mainLnb">

				</ul>
			</div>
			<div class="subLnbWrap">
				<a href="" class="mainBtn"></a>
				<ul class="subLnb">

				</ul>
			</div>
		</div>
	</div>
	<div id="contents">
    
    <%		
		Dim k,ks
		k = cstr(request.servervariables("HTTP_url") )
'		Response.Write(k) /new/school/contentsdesign/html/lecture01.asp
		ks=split(k,"/")
		if instr(ks(5),"lecture")=0 then
	%>
		<h2 class="contentsTitle"><span></span></h2>

	<%
		end if
	%>
    
		<div class="contentsWrap">
