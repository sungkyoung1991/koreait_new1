$(document).ready(function () {
	init();
});
function isTXTEmpty(chkValue) {
	var isEmpty = true;
	if (chkValue.length == 0) {
		return isEmpty;
	} else {
		for (i = 0; i < chkValue.length; i++) {
			var chk = chkValue.charAt(i);
			if (chk != " ")
				isEmpty = false;
		}
	}
	return isEmpty;
}

/* 파일명 추출 */
function getNameFromPath(strFilepath) {
	var objRE = new RegExp(/([^\/\\]+)$/);
	var strName = objRE.exec(strFilepath);
	if (strName == null) {
	   return null;
	}
	else {
		return strName[0].split(".")[0];
	}
}

function fix() {
	var addr=location.href;
	var temp=getNameFromPath(addr);
	switch (temp){
		case "hankookitacademy-greeting":          allFix({mainSel:0,lnbSel:0}); break;
		case "hankookitacademy-history":          	allFix({mainSel:0,lnbSel:1}); break;
		case "hankookitacademy-foundation":        allFix({mainSel:0,lnbSel:2}); break;
		case "hankookitacademy-teacher":           allFix({mainSel:0,lnbSel:3}); break;
		case "press":     					      	allFix({mainSel:0,lnbSel:4}); break;
		case "pressView":  					      	allFix({mainSel:0,lnbSel:4}); break;
//---------------------------------------------------------------------------------------
		case "campusinfo-koreait":           		allFix({mainSel:1,lnbSel:0}); break;
		case "campusinfo-yangjae":           		allFix({mainSel:1,lnbSel:0}); break;
		case "campusinfo-nowon":           			allFix({mainSel:1,lnbSel:1}); break;
		case "campusinfo-guro":          			allFix({mainSel:1,lnbSel:1}); break;
		case "hankookitacademy-teacher":          	allFix({mainSel:1,lnbSel:1}); break;
//------------------------------------------------------------------------------------------
		case "course-gamegraphic":                	allFix({mainSel:2,lnbSel:0}); break;
		case "course-picture":                		allFix({mainSel:2,lnbSel:1}); break;
		case "course-itprogram":               		allFix({mainSel:2,lnbSel:2}); break;
		case "course-web":                			allFix({mainSel:2,lnbSel:3}); break;
		case "course-game1":             			allFix({mainSel:2,lnbSel:0}); break;
		case "course-view":             			allFix({mainSel:2,lnbSel:-1}); break;
		case "course-view_test":             		allFix({mainSel:2,lnbSel:-1}); break;
		case "course-fashion":                		allFix({mainSel:2,lnbSel:0}); break;
		case "course-office":                		allFix({mainSel:2,lnbSel:0}); break;
		case "course-highschool-newpage":          	allFix({mainSel:2,lnbSel:5}); break;
		case "course-highschool":               	allFix({mainSel:2,lnbSel:5}); break;
        case "course-nomal-design":               	allFix({mainSel:2,lnbSel:6}); break;
        case "course-processcourse":                allFix({mainSel:2,lnbSel:8}); break;
        case "course-woker":                		allFix({mainSel:2,lnbSel:7}); break;

		case "collabo-training":               	allFix({mainSel:2,lnbSel:10}); break;

//------------------------------------------------------------------------------------------
		case "vocationaltraining-NCS":             	allFix({mainSel:3,lnbSel:0}); break;
		case "vocationaltraining-unemployed":      allFix({mainSel:3,lnbSel:1}); break;
		case "vocationaltraining-worker":			allFix({mainSel:3,lnbSel:2}); break;
		case "vocationaltraining-highschool":      allFix({mainSel:3,lnbSel:3}); break;
		case "vocationaltraining-jobpakage":      allFix({mainSel:3,lnbSel:4}); break;
		case "vocationaltraining-licenseget":      allFix({mainSel:3,lnbSel:5}); break;
//------------------------------------------------------------------------------------------
		case "online-counselling":					allFix({mainSel:4,lnbSel:0}); break;
		case "online-counselling-view":				allFix({mainSel:4,lnbSel:0}); break;
		case "online-counseling-write":				allFix({mainSel:4,lnbSel:0}); break;
		case "online":								allFix({mainSel:4,lnbSel:1}); break;
		case "newpage":								allFix({mainSel:4,lnbSel:2}); break;
		case "notice-list":                			allFix({mainSel:4,lnbSel:3}); break;
		case "notice-view":                		    allFix({mainSel:4,lnbSel:3}); break;
		case "course-review":                		allFix({mainSel:4,lnbSel:5}); break;
		case "complete-jobinterview":			    allFix({mainSel:4,lnbSel:6}); break;
		case "jobinterview":			  			allFix({mainSel:4,lnbSel:6}); break;
		case "photogallery":                		allFix({mainSel:4,lnbSel:7}); break;
		case "photogallery-view":                	allFix({mainSel:4,lnbSel:7}); break;
		case "schedule-yangjae":                	allFix({mainSel:4,lnbSel:8}); break;
		case "schedule-nowon":                		allFix({mainSel:4,lnbSel:9}); break;
		case "schedule-guro":                		allFix({mainSel:4,lnbSel:9}); break;
		case "event_list":      					allFix({mainSel:4,lnbSel:10}); break;
		case "event_view":      					allFix({mainSel:4,lnbSel:10}); break;

		case "event_list2":      					allFix({mainSel:4,lnbSel:11}); break;
		case "event_view2":      					allFix({mainSel:4,lnbSel:11}); break;

		case "cardnews":      						allFix({mainSel:4,lnbSel:12}); break;
//------------------------------------------------------------------------------------------
		case "project-game":           				allFix({mainSel:5,lnbSel:0}); break;
		case "project-game-view":           		allFix({mainSel:5,lnbSel:0}); break;
		case "project-web":           				allFix({mainSel:5,lnbSel:1}); break;
		case "project-web-view":           			allFix({mainSel:5,lnbSel:1}); break;
		case "project-picture":           			allFix({mainSel:5,lnbSel:2}); break;
		case "project-picture-view":           		allFix({mainSel:5,lnbSel:2}); break;
		case "project-security":           			allFix({mainSel:5,lnbSel:3}); break;
		case "project-security-view":           	allFix({mainSel:5,lnbSel:3}); break;
		case "project-fashion":           			allFix({mainSel:5,lnbSel:4}); break;
		case "project-fashion-view":           		allFix({mainSel:5,lnbSel:4}); break;
		case "brochure_rquest":                  	allFix({mainSel:5,lnbSel:5}); break;
//------------------------------------------------------------------------------------------
		case "professor":           				allFix({mainSel:6,lnbSel:0}); break;
//------------------------------------------------------------------------------------------
        case "hankookitacademy-dasan":          	allFix({mainSel:7,lnbSel:0}); break;
		case "hankookitacademy-jobprocess":      	allFix({mainSel:7,lnbSel:1}); break;
		case "job_success":                     	allFix({mainSel:7,lnbSel:2}); break;
		case "complete-interview":                	allFix({mainSel:7,lnbSel:3}); break;
		case "student-interview":                	allFix({mainSel:7,lnbSel:3}); break;
		case "hankookitacademy-dasan-interview":    allFix({mainSel:7,lnbSel:4}); break;
		case "recruit_write":           			allFix({mainSel:7,lnbSel:5}); break;
		case "recruit_list":	           			allFix({mainSel:7,lnbSel:6}); break;
		case "recruit_view":	           			allFix({mainSel:7,lnbSel:6}); break;
		case "recruit_edit":      	     			allFix({mainSel:7,lnbSel:6}); break;
		case "recruit":           					allFix({mainSel:7,lnbSel:5}); break;
		case "recruit_detail":           			allFix({mainSel:7,lnbSel:5}); break;
		case "resume_List":           				allFix({mainSel:7,lnbSel:6}); break;	 // 이력서 관리
		case "resume_insert":           			allFix({mainSel:7,lnbSel:6}); break;
//------------------------------------------------------------------------------------------
		case "license":           					allFix({mainSel:8,lnbSel:0}); break;
		case "license_game":           				allFix({mainSel:8,lnbSel:1}); break;
		case "license_it":           				allFix({mainSel:8,lnbSel:2}); break;
		case "license_design":           			allFix({mainSel:8,lnbSel:3}); break;
		case "license_multi":           			allFix({mainSel:8,lnbSel:4}); break;
//------------------------------------------------------------------------------------------
		case "login_new":           				allFix({mainSel:9,lnbSel:0}); break;   //로그인
		case "join_new":           					allFix({mainSel:9,lnbSel:1}); break;	//회원가입
		case "join_form_new":           			allFix({mainSel:9,lnbSel:1}); break;
		case "IDandPW":           					allFix({mainSel:9,lnbSel:2}); break;  //ID/PW 찾기

//------------------------------------------------------------------------------------------
		case "mypage":           					allFix({mainSel:9,lnbSel:0}); break;	  // 회원정보 수정
		case "deactivate":         					allFix({mainSel:9,lnbSel:1}); break;	//회원탈퇴


//------------------------------------------------------------------------------------------
		case "terms":           					allFix({mainSel:9,lnbSel:3}); break;
		case "privacy":           					allFix({mainSel:9,lnbSel:4}); break;


//------------------------------------------------------------------------------------------

		default:allFix({mainSel:-1,lnbSel:-1}); isMain=true;
	}
}

function allFix(obj){
	var addr=location.href;
	var temp=getNameFromPath(addr);
	var defaults={};
	var option=$.extend(defaults,obj);
	var mainSel = option.mainSel;
	var lnbSel = option.lnbSel;
	var subSel = 0;

	try{
		if (temp.indexOf("notice") >= 0 && temp != null){
			var scode =  parseInt(getParameters("scode"));
			if(scode == 3){
				lnbSel = lnbSel+1;
			}
		}
	}catch (e){}


	lnbLoad(mainSel,lnbSel);
	subLoad(mainSel,lnbSel);
	reSetTitle(mainSel,lnbSel);


	try{
		if(temp.indexOf("course-view") >= 0 ){
			//thirdLoad(mainSel,lnbSel,subSel);
			$(".thirdLnbWrap").css("display","");
		}else if(temp.indexOf("course") >= 0 && temp != "course-review" ){
			thirdLoad(mainSel,lnbSel,subSel);

			$(".thirdLnbWrap").css("display","none");
		}
	}catch (e){}
}
function getParameters(paramName){
	// 현재 URL 가져오기
	var url = location.href;
	// get 파라미터 값을 가져올 수 있는 ? 를 기점으로 slice 한 후 split 으로 나눔
	var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
	// 나누어진 값의 비교를 통해 paramName 으로 요청된 데이터의 값만 return
	for (var i = 0; i < parameters.length; i++) {
		var varName = parameters[i].split('=')[0];
		if (varName.toUpperCase() == paramName.toUpperCase()) {
			returnValue = parameters[i].split('=')[1];
			return decodeURIComponent(returnValue);
		}
	}
}

function reSetTitle(mainSel,lnbSel) {
	var subTitleKor;
	var contentsTitle;
	var contentsTitleText;

	subTitleKor = $(".gnbList > li").eq(mainSel).find("a").eq(0).text();
	contentsTitle=$(".gnbList > li").eq(mainSel).find(".sub > li").eq(lnbSel).find("a").clone();
	contentsTitleText=$(".gnbList > li").eq(mainSel).find(".sub > li").eq(lnbSel).find("a").text();

	makeSubTitle(subTitleKor);
	makeContentsTitle(contentsTitle);
	makeContentsTitleText(contentsTitleText);
}

function lnbLoad(mainSel,lnbSel) {

	if(mainSel != 2){
		$("#lnb .subLnb").append($(".gnbList > li").eq(mainSel).find(".sub > li").clone());
		$("#lnb .subLnb > li").removeClass("color-red");
		$("#lnb .subLnb > li").removeClass("color-blue");
		$("#lnb .subLnb > li").removeClass("color-yellow");
	}
	else {
		$("#lnb .subLnb").append($(".navbar > .container > .depth01").find("li").clone());
	}

	//$("#lnb .mainLnb li").eq(mainSel).remove();
	//$("#lnb .subLnb li").eq(lnbSel).remove();
	$("#lnb .subLnb li h3").contents().unwrap();


	var mainTxt =  $(".gnbList > li").eq(mainSel).find("a").eq(0).text();
	var subTxt = $(".gnbList > li").eq(mainSel).find(".sub li").eq(lnbSel).find("a").text();


	$("#lnb .mainLnbWrap .menu-list").text(mainTxt);
	$("#lnb .subLnbWrap .menu-list").text(subTxt);

}

function subLoad(mainSel,lnbSel) {
	if(mainSel != 2)	{
		$(".left-menu .menuList").append($(".gnbList > li").eq(mainSel).find(".sub > li").clone());
		$(".left-menu .menuList > li").removeClass("color-red");
		$(".left-menu .menuList> li").removeClass("color-blue");
		$(".left-menu .menuList > li").removeClass("color-yellow");
	}
	else {
		$(".left-menu .menuList").append($(".navbar > .container > .depth01").find("li").clone());
	}
	//$(".left-menu .menuList li").eq(lnbSel+1).remove();
	//if(mainSel != 2)
	$(".left-menu .menuList li").eq(lnbSel+1).addClass("select");
	$(".left-menu .menuList li h3").contents().unwrap();


	var mainTxt = $(".gnbList > li").eq(mainSel).find("a").eq(0).text();
	var subTxt = $(".gnbList > li").eq(mainSel).find(".sub li").eq(lnbSel).find("a").text();


	$(".menuTitle").text(mainTxt);


}

function thirdLoad(mainSel,lnbSel,subSel) {
	if(subSel >= 0){
	var subTitleKor = $(".navbar > .container > .depth01 > li").eq(lnbSel).find("a").text();
	var contentsTitle;
	var contentsTitleText;
	var thirdTxt = $(".sub_wrap .submenu ").eq(lnbSel).find(".submenuInner .depth02 li ").eq(subSel).find("a").text();

	$("#lnb .subLnbWrap .menu-list").text(subTitleKor);
	$("#lnb .thirdLnbWrap .menu-list").text(thirdTxt);
	$(".left-menu .menuList li").eq(lnbSel+1).addClass("select");

		makeSubTitle(subTitleKor);
		makeContentsTitle(contentsTitle);
		var addr=location.href;
		var temp=getNameFromPath(addr);


		if(temp.indexOf("course-view") >= 0){

			makeContentsTitleText(thirdTxt);
		}else{
			makeContentsTitleText(subTitleKor);
		}


		//$(".left-menu .menuList > li").eq(lnbSel+1).append($(".sub_wrap .submenu ").eq(lnbSel).find(".submenuInner .depth02").clone());

		$("#lnb .third_Lnb").append($(".sub_wrap .submenu").eq(lnbSel).find(" .submenuInner .depth02 > li ").clone());
		$("#lnb .third_Lnb li").eq(subSel).remove();

		for(var i = 0; i <$(".left-menu .menuList > li").length; i++){
			$(".left-menu .menuList > li").eq(i+1).append($(".sub_wrap .submenu ").eq(i).find(".submenuInner .depth02").clone());
		}

		$(".left-menu .menuList > li").find(".depth02 li").attr('class','');
		$(".left-menu .menuList > li").find(".depth02").attr('class','subMenuList');
		try{
			var crcd = -1;
		if (temp.indexOf("course-view") >= 0 && temp != null){
			if(crcd < 0){
				 crcd  = getParameters("crcd");
			}
			if (crcd > 0){
				$(".left-menu .menuList > li").eq(lnbSel+1).find(".subMenuList li a").eq(subSel).attr('class','point');			}
		}
	}catch (e){}

		$(".left-menu .menuList > li").eq(lnbSel+1).find(".subMenuList").attr('class','subMenuList open');

	}
}
function makeSubTitle (kor) {
	$(".subTitle").text(kor);
}

function makeContentsTitle (mainTxt) {
	$(".contentsTitle").append(mainTxt);
	$(".contentsTitle").contents().unwrap();
}
function makeContentsTitleText (mainTxt) {
	$(".contentsTitleText").text(mainTxt);
}
function fitImageSize(obj, href, maxWidth, maxHeight) {
	var image = new Image();

	image.onload = function(){

		var width = image.width;
		var height = image.height;
		if(width > 300 || height > 240 ) {

		var scalex = maxWidth / width;
		var scaley = maxHeight / height;

		var scale = (scalex < scaley) ? scalex : scaley;
		if (scale > 1)
			scale = 1;

		obj.width = scale * width;
		obj.height = scale * height;

		obj.style.display = "";
		}
	}
	image.src = href;
}

// 쿠키 가져오기
function getCookie( name ) {
		var nameOfCookie = name + "=";
		var x = 0;
		while ( x <= document.cookie.length )
		{
				var y = (x+nameOfCookie.length);
				if ( document.cookie.substring( x, y ) == nameOfCookie ) {
						if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
								endOfCookie = document.cookie.length;
						return unescape( document.cookie.substring( y, endOfCookie ) );
				}
				x = document.cookie.indexOf( " ", x ) + 1;
				if ( x == 0 )
						break;
		}
		return "";
}
// 24시간 기준 쿠키 설정하기
// expiredays 후의 클릭한 시간까지 쿠키 설정
function setCookie( name, value, expiredays ) {
		var todayDate = new Date();
		todayDate.setDate( todayDate.getDate() + expiredays );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}
function  setLazyload(){
	var windowWidth = $( window ).width();
	if(windowWidth > 1023){
		$(".submenuInner img.mlazy").lazyload({
  			threshold : 500,
		});

	}
	$(".lazy").lazyload({
  		threshold : 1000,
	});

}

function online(){
	$(".online_Popup").css('display','block');
}

function onlineClose(){
	$(".online_Popup").css('display','none');
}

function init() {
	var addr=location.href;
	var temp=getNameFromPath(addr);
	var chk_url = window.location.href.replace( /[\?#].*|$/, "");
	temp=getNameFromPath(chk_url);
	if(temp == null){
			MainInit();
			temp = "index"
	}
	$("body").addClass(temp);
	if($('img[usemap]').length > 0){
		$('img[usemap]').rwdImageMaps();
	}
	try{
		setLazyload();
	}catch (e){}

	layoutInit();
	try{
		MainInit();
		middle_menu();
		//캠퍼스 시설안내
		campusImg();

		hankookit_history();
		teacher_list();
		/*HRD수강후기*/
		courseReview();
		// 메인페이지가 아닐떄
		fix();
	}catch (e){
		var e = new Error('Could not parse input');
	}

}

//구로일반과정 제이쿼리 페이지
function middle_menu() {
	try{
		/*구로 일반과정 tab*/
		var daumMap =  new daum.roughmap.Lander({
										"timestamp": "1536308844766",
										"key": "pw4t",
										/* "mapWidth": "600",
										 "mapHeight": "300"*/
									});
		var isMap = false;
		$('.middle-bottom>div').click(function () {
			$('.middle-bottom>div>a').removeClass('active');
			$(this).children('a').addClass('active');
			var i = $(this).index();

			$('.middletabGroup>div').eq(i).addClass('active').siblings().removeClass('active');
			if($('.middletabGroup>div.active').hasClass("middletab3") && !isMap){
				isMap  = !isMap;
				<!-- 3. 다음지도실행 스크립트 -->
				daumMap.render();
			}
			return false;
		})
	}catch (e){}
}

function courseReview(){
	/*HRD수강후기*/
	$('div.course-review ul li').click(function(){
		var idx = $(this).index();
		var liClass = $(this).hasClass('on');
		if(liClass == true){
			$(this).removeClass('on');
		}else{
			$('div.course-review ul li').removeClass("on");
			$('div.course-review ul li').eq(idx).addClass("on");
		}
	})

}
function teacher_list(){
	/*교수소개 tab*/
	$('div.campus-list>ul>li').click(function(){
		$('div.campus-list>ul>li>a').removeClass('active');
		$(this).children('a').addClass('active');
		var i = $(this).index();
		$('div.teacher-list>div').eq(i).addClass('active').siblings().removeClass('active');
		return false;
	})
}

function hankookit_history(){
	/*학교연혁 dot 애니메이션*/
	$(window).scroll(function () {
		var sct = $(window).scrollTop()+200;
		$('div.pos-l dl').each(function () {
			var tg = $(this);
			var i = tg.index();
			if (tg.offset().top <= sct) {
				 /*$('div.pos-l dl').removeClass('over');*/
				 $('div.pos-l dl').eq(i).children('dt').addClass('over');
				 /*('div.pos-l dl').eq(i).find('dd').addClass('over');*/
				 $('div.pos-l dl').eq(i).addClass('over');
			}else{
				$('div.pos-l dl').eq(i).children('dt').removeClass('over');
				$('div.pos-l dl').eq(i).removeClass('over');
			}
			var footPos = $('footer').offset().top - 700
			if(sct > footPos){
				$('div.pos-l dl').children('dt').addClass('over');
				$('div.pos-l dl').addClass('over');
			}else{

			}
		})
	})
}
function campusImg(){
	/*구로캠퍼스 시설*/
	/*var slider = $('div.guro-image-slide .bxslider').bxSlider({
		pagerCustom: '#bx-pager'
	});

	var thumslider  = $('div.guro-image-slide .thum-slide').bxSlider({
        adaptiveHeight : true,
        slideWidth: 162,
		minSlides: 2,
		maxSlides: 4,
		slideMargin: 40,
		infiniteLoop: false,
		pager: false
	});


	$( '#bx-pager').find('.bx-next').on( 'click', function () {
		var current = thumslider.getCurrentSlide();
		slider.goToSlide(current*4);

	   return false;
	  } );

	$( '#bx-pager').find('.bx-prev').on( 'click', function () {
		var current = thumslider.getCurrentSlide();
		slider.goToSlide(current*4);

	   return false;
	  } );



	$( '.guro-image-slide > .bx-wrapper > .bx-controls').find('.bx-prev').on( 'click', function () {
		var current = slider.getCurrentSlide();
		if( (current % 4) == 3){
			thumslider.goToSlide(Math.floor(current / 4) );
		}

	   return false;
	  } );

	$( '.guro-image-slide > .bx-wrapper > .bx-controls').find('.bx-next').on( 'click', function () {
		var current = slider.getCurrentSlide();

		if( (current % 4) == 0){
		thumslider.goToSlide(current / 4);
		}
	   return false;
	  } );*/
	/*구로캠퍼스 시설 190617slick교체*/
	$('.single-item').slick({
			slidesToShow:1,
			slidesToScroll: 1,
			fade: false,
			asNavFor: '.slider-nav',
			/*autoplay : true,*/
			/*dots: true,*/
			speed : 300 /* 이미지가 슬라이딩시 걸리는 시간 */,
			/*infinite: true,*/
			arrows: true,
			centerMode: true,
			focusOnSelect: true,
			arrows: true,
			/*prevArrow: false,
			nextArrow: false,*/
			responsive:[
				{
					breakpoint:1024,
					settings: {
					slidesToShow:1,
					slidesToscroll:1,
					centerMode: true,
					}
				}
			]
		});

		$('.slider-nav').slick({
			slidesToShow:5, //작은이미지 몇개 보여줄것인지..
			slidesToScroll: 5,
			asNavFor: '.single-item',
			focusOnSelect: true,
			centerMode: true,
			focusOnSelect: true,
			/*arrows: true,*/
			responsive:[
				{
					breakpoint:1024,
					settings: {
					slidesToShow:4,
					slidesToscroll:4,
					centerMode: true,
					}
				},
				{
					breakpoint:800,
					settings: {
					slidesToShow:3,
					slidesToscroll:3,
					arrows: false,
					centerMode: true,
					}
				},
				{
					breakpoint:480,
					settings: {
					slidesToShow:3,
					slidesToscroll:3,
					arrows: false,
					centerMode: true,
					}
				}

			]
		});
}
