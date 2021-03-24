	/*2020메인포토갤러리슬라이드*/
	$(document).ready(function () {
		slide();
		mheader();
		mbtn();
		subMenu();
		subqna();
		print();
		subMenuPlus();
		
		$(window).resize(function(){
		}).resize();
		
		var width=window.innerWidth;

		$(window).resize(function(){
			if(width < 1024){
				jQuery('#tab1 img').attr('src','../img/sub/organization_mobile.png')
			}
		}).resize();
		
		function slide() {
			$('.slick-item').slick({
				autoplay: true,
				dots: true
			});
		};

		function mheader() {
			$('ul.m-depth01 > li > a').click(function () {
				var mdisplay = $(this).next('ul').css('display');
				if (mdisplay == 'none') {
					$('ul.m-depth02').slideUp();
					$(this).next('ul').slideDown();
				} else {
					$(this).next('ul').slideUp();
				}
			});
		}

		function mbtn() {
			$('.nav-icon').click(function () {
				$('.mobile-menu').toggleClass('mopen');
				$(this).toggleClass('mopen');
			});
		};

		/*function subMenu() {;
			$('ul.side-nav > li > a').click(function (e) {
				e.preventDefault();
				var subdisplay = $(this).next('ul').css('display');
			
				if (subdisplay == 'none') {
					$('.side-depth02').addClass('subopen')
					
				} else {
					$('.side-depth02').removeClass('subopen')
				}
				
			});
		};*/

		function subMenuPlus() {
			$('.menu-left').click(function () {
				$(this).toggleClass('openm');
			});
		};
		
		function subMenu() {
			$('ul.side-nav > li').click(function (e) {
				var subdisplay = $(this).find('ul').css('display');
				if (subdisplay == 'none') {
					$(this).find('ul').addClass('subopen');
				} else {
					$(this).find('ul').removeClass('subopen');
				}
			});
		};
		
		

		function subqna() {
			$('ul.qna-wrap > li > a').click(function (e) {
				e.preventDefault();
				var viewqna = $(this).next('div').css('display');
				if (viewqna == 'none') {
					$('.answer').slideUp();

					$(this).next('div').slideDown();
				} else {
					$(this).next('div').slideUp();
				}
			});
		}

		function print() {
			$('#printbtn').on('click', function () {
				$('.printview').printThis();
			});

			$('#easyView-setting').easyView({
				//container: '#buttons',
				increaseSelector: '.increase-me',
				decreaseSelector: '.decrease-me',
				normalSelector: '.reset-me',
				contrastSelector: '.change-me'
			});
		};

	});