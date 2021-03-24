<%
Response.Redirect "support_apply_pay_finish.asp"
Response.End
%>
<!-- #include file="md5.asp" -->
<%
response.write "<font color=white>" & session("inum") & "</font>"


mertkey = "1701f89479ecfc2922f2fc798312a751"     '데이콤에서 상점아이디별 발급
mertid = "koreait"		                         '상점아이디
oid = CStr(session("inum"))
''''테스트용으로 넣어둔거입니다.
'session("inum") = 1
''''테스트용으로 넣어둔거입니다.
If Trim(session("inum")) = "" Then 
response.write "<font color=red size=2><center><br><br><br><b>Order Number Error"
response.end
End If 
amount = "20000"	                                     '결제금액 (반드시 문자열로 넘겨주셔야 합니다.)
note_url ="http://koreait.ac.kr/ad_lead/note_url.asp"                       '결제성공여부 확인 경로
ret_url = "http://koreait.ac.kr/ad_lead/support_apply_pay_finish.asp"                        '결제완료후 부모창 경로

'////////////////////////////// hashdata 생성 - 결제요청무결성검증 //////////////////////////////
hashdata = md5( mertid & oid & amount & mertkey )
'/////////////////////////////////////////////////////////////////////////////////////////////


'////////////////////////////// 전송필드 암호화(DES) ///////////////////////////////////////////
' 객체 생성
set eDes = Server.CreateObject("mapiEnc.Encrypt")

' 키설정
eDes.setHashKey = mertkey						'해쉬키 설정

' 암호화
encrypted_amount	= eDes.DesEncrypt(amount)
encrypted_note_url	= eDes.DesEncrypt(note_url)
encrypted_ret_url	= eDes.DesEncrypt(ret_url)
encrypted_oid		= eDes.DesEncrypt(oid)
'/////////////////////////////////////////////////////////////////////////////////////////////
%>


<script language = 'javascript'>
<!--
function openWindow()
{

var Type;

if (document.mainForm.Ttype[0].checked == true) {
Type = "1";
}else if (document.mainForm.Ttype[1].checked == true) {
Type = "2";
}else if (document.mainForm.Ttype[2].checked == true) {
Type = "3";
}

if (Type != "") {
   if (Type == "1") {
   window.open("","Window","width=330, height=430, status=yes, scrollbars=no,resizable=yes, menubar=no");
   document.mainForm.action="http://pg.dacom.net/card/cardAuthAppInfo.jsp";
   document.mainForm.target = "Window";
   document.mainForm.submit();
   }else if (Type == "2") {
   window.open("","Window","width=330, height=430, status=yes, scrollbars=no,resizable=yes, menubar=no");
   document.mainForm.action="http://pg.dacom.net/wireless/wirelessAuthAppInfo1.jsp";
   document.mainForm.target = "Window";
   document.mainForm.submit();
   }else if (Type == "3") {
   alert("본교에 직접 방문하셔서 제출 바랍니다.");
   top.location.href="http://koreait.ac.kr/ad_lead/support_apply_pay_finish.asp"
   }



}else{

alert("결제할 형태를 선택하여 주시기 바랍니다.");

}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>


<BODY  BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 onLoad="MM_preloadImages('/renewal/images/02_enter/m_write_o.gif','/renewal/images/02_enter/m_data_o.gif','/renewal/images/02_enter/m_pass_o.gif','/renewal/images/02_enter/m_receive_o.gif','/renewal/images/02_enter/m_fee_o.gif','/renewal/images/02_enter/m_faq_o.gif','/renewal/images/02_enter/m_principle_o.gif');HselFn1(1);HselFn1(2);InitializeStaticMenu();">

<!-- #include virtual="/_include/inc_header.asp" -->
<!-- #include virtual="/_include/inc_quick.asp" -->


<table width="910" height="152" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><!-- 서브 탑메뉴 include --> <script language="javascript">FLASH(910,152,"/flash/menu_top<%=login_chk%>.swf?a=33");</script></td>
  </tr>
</table>
<table width="1000" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="240" valign="top" background="/images/common_sub_bgleft.gif"><!-- 서브 레프트메뉴 include --> <script language="javascript">FLASH(240,686,"/flash/menu_left.swf?a=331");</script></td>
    <td width="670" valign="top" bgcolor="#FFFFFF"><table width="670" height="67" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top" background="/images/common_sub_bgtop.gif">
          <table width="616" height="32" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="13">&nbsp;</td>
            </tr>
          </table>
          <table width="616" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="13">&nbsp;</td>
                <td><img src="images/al_su_apply_title.gif" width="75" height="21"></td>
              <td><div align="right"><img src="/images/common_icon_navi.gif" width="13" height="13" align="absmiddle">Home 
                    &gt; 입학안내 &gt; 입학지원센터 &gt; <strong>원서접수</strong></div></td>
            </tr>
        </table></td>
      </tr>
    </table>
	      
      <table width="616" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="20"></td>
        </tr>
        <tr> 
          <td>
					<!-- 전형료 유료일때 -->
		  <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="23" valign="top"><img src="images/al_su_apply_pay_stitle.gif" width="82" height="14"></td>
              </tr>
              <tr> 
                <td><table width="616" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="2" colspan="5" bgcolor="DD3A39"></td>
                    </tr>
                    <tr> 
                      <td width="1" bgcolor="E5BBBB"><img src=images/none.gif width=1 height=1></td>
                      <td width="93"><img src="images/al_su_apply_pay_price.gif" width="93" height="28"></td>
                      <td width="1" bgcolor="E5BBBB"><img src=images/none.gif width=1 height=1></td>
                      <td width="520" class="font_11" style="padding-left:8">20,000원<!-- 결재 내용 시작-->
											<form name="mainForm" method="POST" action="">
											<input type="hidden" name="hashdata" value="<%=hashdata%>">			
											<input type="hidden" name="mid" value="<%=mertid%>">					
											<input type="hidden" name="encrypted_oid" value="<%=encrypted_oid%>">						
											<input type="hidden" name="encrypted_amount" value="<%=encrypted_amount%>">				
											<input type="hidden" name="encrypted_ret_url" value="<%=encrypted_ret_url%>">				
											<input type="hidden" name="buyer" value="<%=session("iname")%>">						
											<input type="hidden" name="productinfo" value="원서접수비">				
<input type="hidden" name="encrypted_note_url" value="<%=encrypted_note_url%>"></td>
                      <td width="1" bgcolor="E5BBBB"><img src=images/none.gif width=1 height=1></td>
                    </tr>
                    <tr > 
                      <td height="1" colspan="5" bgcolor="E5BBBB"></td>
                    </tr>
                    <tr> 
                      <td width="1" bgcolor="E5BBBB"></td>
                      <td width="93"><img src="images/al_su_apply_pay_pay.gif" width="93" height="28"></td>
                      <td width="1" bgcolor="E5BBBB"></td>
                      <td width="50" style="padding-left:8"> <table width="512" border="0" cellspacing="0" cellpadding="0">
<tr>
                            <td> 
<table border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><input type="radio" name="Ttype" value="1" checked></td>
                                  <td class="font_11" style="padding-top:3">신용카드 </td>
                                
                                </tr>
                              </table></td>
                            <td> 
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><input  type="radio" name="Ttype" value="2" ></td>
                                  <td class="font_11" style="padding-top:3">휴대폰</td>
                                </tr>
                              </table></td>
                            <td> 
                              <table border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><input  type="radio" name="Ttype" value="3"></td>
                                  <td class="font_11" style="padding-top:3">방문결제(현금결제)</td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
                        
                      </td>
                      <td width="1" bgcolor="E5BBBB"></td>
                    </tr>
                    <tr> 
                      <td height="1" colspan="5" bgcolor="E5BBBB"></td>
                    </tr>
                    
                  </table></td>
              </tr>
 
              <tr> 
                <td height="25">&nbsp;</td>
              </tr>
              <tr> 
                <td align="center"><!--<a  href="javascript:history.back(-1)"><img src="images/al_su_apply_btn_prev.gif" width="148" height="37" border="0"></a>&nbsp;--><img src="images/al_su_apply_btn_pay.gif" width="148" height="37"  onclick="openWindow()" style=":cursor:hand"></td>
              </tr>
			  <tr> 
                <td height="25">&nbsp;</td>
              </tr>
			  <tr> 
                <td><font color=red>* &nbsp;원서접수 후 결제된 전형료는 반환되지 않습니다.</font>
</td>
              </tr>
            </table>
			<!-- 유료 끝 -->
			<!-- 전형료 무료일때 -->
            <!--table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="23" valign="top"><img src="images/al_su_apply_pay_stitle.gif" width="82" height="14"></td>
              </tr>
              <tr> 
                <td><table width="616" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="2" colspan="5" bgcolor="DD3A39"></td>
                    </tr>
                    <tr> 
                      <td width="1" bgcolor="E5BBBB"><img src=images/none.gif width=1 height=1></td>
                      <td width="93"><img src="images/al_su_apply_pay_price.gif" width="93" height="28"></td>
                      <td width="1" bgcolor="E5BBBB"><img src=images/none.gif width=1 height=1></td>
                      <td width="520" class="font_11" style="padding-left:8">무료 
                        (수시 1차 접수 혜택)</td>
                      <td width="1" bgcolor="E5BBBB"><img src=images/none.gif width=1 height=1></td>
                    </tr>
                    <tr > 
                      <td height="1" colspan="5" bgcolor="E5BBBB"></td>
                    </tr>                    
                  </table></td>
              </tr>
              <tr> 
                <td height="25">&nbsp;</td>
              </tr>
              <tr> 
                <td align="center"> <img src="images/al_su_apply_btn_prev.gif" width="148" height="37">&nbsp;<a href="support_apply_pay_finish.asp"><img src="images/al_su_apply_btn_next.gif" width="148" height="37" border="0"></a></td>
              </tr>
            </table--><!-- 무료 끝 -->
			</td>
        </tr>
        <tr>
          <td height="70">&nbsp;</td>
        </tr>
      </table>      
    </td>
    <td width="90" valign="top" background="/images/common_sub_bgright.gif"><table width="90" height="82" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td background="/images/common_sub_bgright2.gif">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>
<!-- #include virtual="/_include/inc_footer.asp" -->
