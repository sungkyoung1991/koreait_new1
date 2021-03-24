<!-- #include Virtual="/inc/Service_Inc_utf8.inc" -->
<%

Sub Delay(DelaySeconds)
  SecCount = 0
  Sec2 = 0
  While SecCount < DelaySeconds + 1
  Sec1 = Second(Time())
  if Sec1 <> Sec2 Then
   Sec2 = Second(Time())
   SecCount = SecCount + 1
  end if
  Wend
End Sub

Delay(3)


%>
<!-- hyejin 2020-02 인클루드 파일 변경 :  inc_html_head_utf8.inc -> inc_html_head_utf9.inc -->

<!-- sook 2020-08 인클루드 파일 변경 :  inc_html_head_utf9.inc -> inc_html_head_utf10.inc -->
<!-- #include Virtual="/inc/2017/inc_html_head_utf10.inc" -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

</head>

<body>

<div class="">

</div>
<div class="info-wrap">
                    <div class="input-group">
                        <label for="product">옵션 선택</label>
                        <select id="product" name="productOptNum">
                            <option class="default" value="0">옵션을 선택해주세요.</option>
                            <option value="1" data-name="PS5 리터널" data-price="79800" data-count="11">product1</option>
                        </select>
                    </div>
                    <div class="input-group">
                        <span class="label">결제 방식</span>
                        <div class="radio-group">
                            <input id="bank" type="radio" name="payType" value="0">
                            <label for="bank">계좌이체</label>
                            <input id="etc" type="radio" name="payType" value="1">
                            <label for="etc">현장결제</label>
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="customer-name">예약자 이름</label>
                        <input id="customer-name" type="text" name="customerName" placeholder="예약자 이름을 입력해주세요.">
                    </div>
                    <div class="input-group">
                        <label for="customer-tel">예약자 휴대전화번호</label>
                        <input id="customer-tel" type="text" name="customerTel" placeholder="예약자 휴대전화번호는 띄어쓰기 및 하이픈(-)은 입력 불가합니다.">
                    </div>
                    <div class="input-group">
                        <label for="pwd">비밀번호 (숫자 4자리)</label>
                        <input id="pwd" type="password" name="orderPwd" maxlength="4" placeholder="비밀번호는 숫자 4자리 형식으로 입력해주세요.">
                    </div>
                    <div class="input-group">
                        <label for="re-pwd">비밀번호 확인 (숫자 4자리)</label>
                        <input id="re-pwd" type="password" maxlength="4" placeholder="비밀번호 확인을 위해 다시 한번 입력해주세요.">
                    </div>
                    <p class="warn-txt"><i class="fas fa-exclamation-triangle"></i> 예약 처리 중, 새로고침 버튼(F5)을 누를 경우 예약정보 초기화, 지연 등이 발생할 수 있습니다.</p>
                    <div class="button-group">
                        <button type="button" class="submit-btn" onclick="formValidation()">예약하기</button>
                    </div>
                </div>

<!--  -->

</body>
</html>
