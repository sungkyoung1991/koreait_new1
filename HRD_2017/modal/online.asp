<!--#include virtual="/_include/Service_Inc.inc"-->
<%
	Dim AryCourse, getCourse, AryConfig, getConfig
	Set getCourse = New Course
	Set getConfig = New SiteConfig
	
	AryConfig = getConfig.getCourseSchoolCode()
	AryCourse = getCourse.getCourseCateLis()
%>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link href="http://job.ac.kr/css/jquery.ajax.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/modal/modal_online.css">

<!-- jquery ajax -->
<link href="/css/jquery.ajax.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js" charset="utf-8"></script>
<script src="/js/jquery.ajax.js" charset="utf-8"></script>

<script src="js/modal/modal_online.js" charset="utf-8"></script>

<div class="online_Popup">
	<div class="sprite"></div>
    <div class="sprite2"></div>
	<div class="title_Wrap">
    	한국IT 대표번호 <a href="#close-modal" class="fas fa-times close-modal" rel="modal:close"></a>
    </div>
    <div class="subTitle">
    	지금 <span>상담신청</span> 하면 <span class="">그뤠잇!</span>
    </div>
    <div class="formWrap">
        <form name="onlineFrm" id="onlineFrm" action="/entrance/online/online_proc.asp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="scode" value="0" />
            <input type="hidden" name="gubun" value="simple"/>
                <dl>
                    <dt>성 명</dt>
                    <dd>
                        <input class="han" type="text" name="toname" value=""  />
                    </dd>
                </dl>
            	<dl>
                    <dt>연락처</dt>
                    <dd class="telWrap">
                       <input type="text" name="m1" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="3" class="inputBox">
                       -
                       <input type="text" name="m2" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="4" class="inputBox">
                       -
                       <input type="text" name="m3" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" maxlength="4" class="inputBox">
                    </dd>
                </dl>
                <dl>
                    <dt>과정선택</dt>
                    <dd>
                        <select name="todiv">
                			<option value=""> 선택 </option>
                            <%
								IF isArray(AryConfig) AND isArray(AryCourse)  Then
									For i = 0 To UBound(AryConfig)
							%>
								<optgroup label="<%=AryConfig(i).item("sname")%>">
                            <%
										For j = 0 To UBound(AryCourse)
											IF 	StrComp(AryConfig(i).item("scode"), AryCourse(j).item("scode")) = 0 Then
							%>
                                	<option value="<%=AryCourse(j).item("divcd")%>"><%=AryCourse(j).item("divname")%></option>
                            <%
											END IF
										NEXT
							%>
                            	</optgroup>
                            <%
									NEXT
								END IF
							%>
                    	</select>
                    </dd>
                </dl>
                <a class="btn" href="javascript:" onClick="chkVal();"><!--onMouseDown="javascript:_AceTM.PV('/online/click_online_proc.asp');"-->
                	신청하기
                </a>
        </form>
  	</div>
    <ul>
    	<li class="tel">1588 - 5517</li>
        <li class="sangdam">전화상담 - 오전 9:00 ~ 오후 6:00 </li>
        <li>1번 - 한국IT직업전문학교(양재)</li>
        <li>2번 - 한국IT아카데미(구로)</li>
        <li>3번 - 교육상담 및 예약 관련 </li>
        
	</ul>
    <ul>
    	<li class="tel">010.3361.5517</li>
        <li class="sangdam">카카오톡 플친 문의 / 문자문의</li>
        <li>플러스 친구 "한국IT아카데미" 검색</li>
	</ul>
</div>