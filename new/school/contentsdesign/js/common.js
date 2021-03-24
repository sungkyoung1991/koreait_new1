var language = "kor";
var addr = location.href;
var temp = getNameFromPath(addr);
var st = $(window).scrollTop();
var isWide;

function getNameFromPath(strFilepath) {
    var objRE = new RegExp(/([^\/\\]+)$/);
    var strName = objRE.exec(strFilepath);
    if (strName == null) {
        return null;
    } else {
        return strName[0].split(".")[0];
    }
}

function getParameter(strParamName) {
    var arrResult = null;
    if (strParamName) {
        arrResult = location.search.match(new RegExp("[&?]" + strParamName + "=(.*?)(&|$)"));
    }
    return arrResult && arrResult[1] ? arrResult[1] : null;
}

function mod(a, b) {
    if (a % b < 0) {
        return b + a % b;
    } else {
        return a % b;
    }
}

function addZero(num) {
    if (num < 10) {
        return "0" + num;
    } else {
        return num;
    }
}

function winResize() {
    $(window).on("resize", function(e) {
        var w = $(window).width();
        if (w < 980) {
            $("body").addClass("mobile");
        } else {
            $("body").removeClass("mobile");
        }
    })
    $(window).trigger("resize")
}

function gnb() {
    $("#gnb > .gnbList > li").on("mouseenter", function(e) {
        $("#header").stop().animate({
            height: 400
        }, 600, "easeOutQuint");
        $('.gnbList > li > .sub ').css('display', '');
        $('.gnbFixed').css('height', '279px');
        return false;
    })
    $("#header").on("mouseleave", function(e) {
        $("#header").stop().animate({
            height: 179
        }, 600, "easeOutQuint");
        $('.gnbList > li > .sub ').css('display', 'none');
        $('.gnbFixed').css('height', '58px');
        return false;
    })
    $("#header").on('mousewheel DOMMouseScroll', function(e) {
        $('.gnbList > li > .sub ').css('display', '');
        return false;
    })
}

function mainVisual() {
    var mainVisual = new Swiper('#mainVisual', {
        loop: true,
        direction: "horizontal",
        speed: 1000,
        autoplay: 3000,
        pagination: "#mainVisual .pager",
        paginationClickable: true,
        nextButton: ".btnNext",
        prevButton: ".btnPrev"
    });
    $(".mainQuick a").click(function(event) {
        var ahref = $(this).attr("href");
        window.open(ahref);
        event.preventDefault()
    });
}

function fix() {
    var addr = location.href
    var temp = getNameFromPath(addr);
    switch (temp) {
        case "introduce":            	allFix({mainSel: 0, lnbSel: 0});break;
        case "lecture01":            	allFix({mainSel: 1, lnbSel: 0});break;
        case "lecture02":           	allFix({mainSel: 1, lnbSel: 1});break;
        case "lecture03":           	allFix({mainSel: 1,lnbSel: 2});break;
		case "lecture04":            	allFix({mainSel: 1,lnbSel: 3});break;
		case "lecture05":            	allFix({mainSel: 1,lnbSel: 4});break;
		case "lecture06":            	allFix({mainSel: 1,lnbSel: 5});break;
        case "gallery":              	allFix({mainSel: 2,lnbSel: 0});break;
        case "story":            		allFix({mainSel: 3,lnbSel: 0});break;
        case "news":           			allFix({mainSel: 4,lnbSel: 0});break;
        case "news_view":            	allFix({mainSel: 4,lnbSel: 0});break;
        case "board_index":            	allFix({mainSel: 4,lnbSel: 0});break;
        case "professor":           	allFix({mainSel: 5,lnbSel: 0});break;
        default:           			allFix({mainSel: -1,lnbSel: -1});            
	isMain = true;
    }
}

function makeSubTitle(kor, eng) {
    $(".subTitle .kor").text(kor);
    $(".subTitle .eng").text(eng);
}

function makeContentsTitle(mainTxt) {
    $(".contentsTitle > span").append(mainTxt);
    $(".contentsTitle > span a").contents().unwrap();
	var str = $(".contentsTitle > span").text().replace("디자인계열 소개", "컨텐츠 디자인계열 소개");
	$(".contentsTitle > span").text(str);
}

function makeBreadCrumb(depth01, depth02, depth03, depth04) {
    $(".breadCrumb li").eq(1).remove();
    $(".breadCrumb li").eq(2).remove();
    $(".breadCrumb li").eq(3).remove();
    $(".breadCrumb li").eq(4).remove();
    $(".breadCrumb").append(depth01);
    $(".breadCrumb").append(depth02);
    $(".breadCrumb").append(depth03);
    $(".breadCrumb").append(depth04);
    $(".breadCrumb li a").addClass("fa fa-angle-right")
    $(".breadCrumb li").eq(2).find("ul").remove();
    $(".breadCrumb li").eq(3).find("ul").remove();
    $(".breadCrumb li").eq(4).find("ul").remove();
}

function subVisual(mainSel,lnbSel) {
    $("#subVisual").removeClass();
	$("#subVisual").addClass("subVisual01");
    $("#subVisual").addClass("lazy");
}

function lnbLoad(mainSel, lnbSel) {
    $("#lnb .mainLnb").append($("#header #gnb .gnbList > li").clone());
    $("#lnb .mainLnb li .sub").remove();
    $("#lnb .mainLnb li h3").contents().unwrap();
    $("#lnb .subLnb").append($("#header #gnb .gnbList > li").eq(mainSel).find(".sub > li").clone());
    $("#lnb .subLnb li h3").contents().unwrap();
    var mainTxt = $("#gnb .gnbList > li").eq(mainSel).find("h2 a").text();
    var subTxt = $("#gnb .gnbList > li").eq(mainSel).find(".sub li").eq(lnbSel).find("h3 a").text();
    $("#lnb .mainLnbWrap .mainBtn").text(mainTxt);
    $("#lnb .subLnbWrap .mainBtn").text(subTxt);
    $("#lnb .mainBtn").on("click", function(e) {
        $(this).next().slideToggle(100, "easeOutQuint");
        return false;
    })
}

function snbLoad(mainSel, lnbSel) {
    $("#snb > ul").remove();
    $("#snb").append($("#header #gnb .gnbList > li").eq(mainSel).find(".sub > li").eq(lnbSel).find(".depth03").clone().removeClass("blind"));
    $("#snb").find(".depth04").remove();
    $("#snb li h4").contents().unwrap();
    $("#snb").trigger("mouseleave");
    if ($("#snb li").length <= 0) {
        $("#snb").remove();
    }
}

function lnbFix(lnbSel) {
    $("#lnb > ul > li").on("mouseenter", function(e) {
        $("#lnb > ul > li").removeClass("on");
        $(this).addClass("on")
    })
    $("#lnb > ul > li").on("mouseleave", function(e) {
        $("#lnb > ul > li").removeClass("on")
        $("#lnb > ul > li").eq(lnbSel).addClass("on")
    })
    $("#lnb > ul > li").trigger("mouseleave");
}

function snbFix(tabSel) {
    $("#snb > ul > li").on("mouseenter", function(e) {
        $("#snb > ul > li").removeClass("on");
        $(this).addClass("on")
    })
    $("#snb > ul > li").on("mouseleave", function(e) {
        $("#snb > ul > li").removeClass("on")
        $("#snb > ul > li").eq(tabSel).addClass("on")
    })
    $("#snb > ul > li").trigger("mouseleave");
}

function allFix(obj) {
    var addr = location.href
    var temp = getNameFromPath(addr);
    var defaults = {};
    var option = $.extend(defaults, obj);
    var mainSel = option.mainSel;
    var lnbSel = option.lnbSel;
    var tabSel = option.tabSel;
    var depth04Sel = option.depth04Sel;
    var depth01 = $(".gnbList > li").eq(mainSel).clone();
    var depth02 = depth01.find(".sub > li").eq(lnbSel).clone();
    var depth03 = depth02.find(".depth03 > li").eq(tabSel).clone();
    var depth04 = depth03.find(".depth04 > li").eq(depth04Sel).clone();
    depth01.find("ul").remove();
    depth02.find("ul").remove();
    depth03.find("ul").remove();
    depth04.find("ul").remove();
    depth01.find("a").unwrap();
    depth02.find("a").unwrap();
    depth03.find("a").unwrap();
    depth04.find("a").unwrap();
    var bread01 = depth01;
    var bread02 = depth02;
    var bread03 = depth03;
    var bread04 = depth04;
    makeBreadCrumb(bread01, bread02, bread03, bread04);
    $("#subContents").addClass(temp);
    var subTitleKor = $("#gnb > .gnbList > li").eq(mainSel).find("h2 > a").text();
    var subTitleEng = $("#gnb > .gnbList > li").eq(mainSel).find("h2 > a").attr("data-eng-title");
    var contentsTitle;
    contentsTitle = $("#gnb > .gnbList > li").eq(mainSel).find(".sub > li").eq(lnbSel).find("h3 a").clone();
    lnbLoad(mainSel, lnbSel);
    lnbFix(lnbSel);
    snbFix(tabSel);
    subVisual(mainSel,lnbSel);
    makeSubTitle(subTitleKor, subTitleEng);
    makeContentsTitle(contentsTitle)
}

function faq() {
    $(".faq li dt").on("click", function(e) {
        $(this).parent().parent().siblings().find("dd").stop().slideUp(400, "easeOutQuint");
        $(this).next("dd").stop().slideToggle(400, "easeOutQuint");
        return false;
    })
}

function entryBox() {
    var entryBox = new Swiper('.entryBox', {
        loop: false,
        direction: "vertical",
        speed: 1000,
        autoplay: 3000,
        pagination: ".entryBox .pager",
        paginationClickable: true,
    })
}

function campusLifeListBox() {
    var campusLifeListBox = new Swiper(".campusLifeListBox", {
        loop: true,
        speed: 400,
        autoplay: 3000,
        slidesPerView: 5,
        spaceBetween: 20,
        nextButton: "#campusLife .btnNext",
        prevButton: "#campusLife .btnPrev",
    })
}

function videoWrap() {
    var videoWrap = new Swiper('#videoWrap .mask', {})
    $("#videoWrap .thumb li").on("click", function(e) {
			 var iframeCnt = $(".mask > ul > li").find("iframe").length;
 		for (var i = 0; i < iframeCnt; i++) {
            var iframe = $(".mask > ul > li").find("iframe").get(i).contentWindow;
            iframe.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
        }
		
        videoWrap.slideTo($(this).index(), 500);
        $("#videoWrap .thumb li").removeClass("on");
        $(this).addClass("on")
        return false;
    });
}

function rollingUtil() {
    var videoWrap = new Swiper('.rollingUtil', {
        loop: true,
        speed: 1000,
        autoplay: 3000,
        pagination: ".rollingUtil .pager",
        paginationClickable: true,
    })
}

function topMenu() {
    var gnbOffset = $('#gnb').offset();
    $(window).scroll(function() {
        if ($(document).scrollTop() > gnbOffset.top) {
            $('.gnbWrap').addClass('gnbFixed');
			$('.gnbWrap > .auto').addClass('bbline');
            $('.logo').addClass('hidden_logo');
            $('.btnAllMenu').css('top', '0px');
            $('.gnbList > li > .sub ').css('display', 'none');
        } else {
            $('.gnbWrap').removeClass('gnbFixed');
			$('.gnbWrap > .auto').removeClass('bbline');
            $('.logo').removeClass('hidden_logo');
            $('.btnAllMenu').css('top', '121px');
            $('.gnbList > li > .sub ').css('display', '');
        }
    });
}

function quickMenu() {
    var quickState = "close";
    $("#quickMenu .btnQuickMenu").on("click", function(e) {
        if (quickState == "close") {
            $("#quickMenu").stop().animate({
                left: 0
            }, 600, "easeOutQuint");
            $("#quickMenu .btnQuickMenu").css({
                background: 'url("../images/layout/btnClose.png") no-repeat'
            });
            quickState = "open";
        } else {
            $("#quickMenu").stop().animate({
                left: -191
            }, 600, "easeOutQuint");
            $("#quickMenu .btnQuickMenu").css({
                background: 'url("../images/layout/btnOpen.png") no-repeat'
            });
            quickState = "close";
        }
    })
    return false
}

function allMenuOpen() {
    $("#allMenu").stop().animate({
        right: 0
    }, 600, "easeOutQuint");
}

function allMenuClose() {
    $("#allMenu").stop().animate({
        right: -350
    }, 600, "easeOutQuint");
}

function mainGallery() {
    var mainGallery = new Swiper('#mainUtil .mainGallery .swiper-container', {
        nextButton: "#mainUtil .btnNext",
        prevButton: "#mainUtil .btnPrev",
        slidesPerView: 1,
        paginationClickable: true,
        spaceBetween: 20,
        freeMode: true
    });
    return false
}

function btnTop() {
    $(document).ready(function(e) {
        var footerPos = $("#footer").outerHeight();
        var topMakeHtml = '<a href="javascript:" id="btnTop"><img src="../images/layout/iconTop.png" alt="제일 위로" /></a>';
        $("body").append(topMakeHtml);
        $("#btnTop").css({
            position: "fixed",
            right: "7%",
            bottom: "15%",
        })
        TweenMax.set($("#btnTop"), {
            autoAlpha: 0
        })
        $("#btnTop").on("click", function(e) {
            TweenMax.to($("html,body"), 1, {
                scrollTop: 0,
                ease: Expo.easeOut
            })
        })
        $(window).on("scroll", function(e) {
            var st = $(this).scrollTop();
            if (st > 100) {
                TweenMax.to($("#btnTop"), 0.5, {
                    autoAlpha: 1
                })
            } else {
                TweenMax.to($("#btnTop"), 0.5, {
                    autoAlpha: 0
                })
            }
        })
    })
}

function stopVideo() {
    var div = document.getElementsByClassName("galleryViewWrap");
    var youtube_command = window.JSON.stringify({
        event: 'command',
        func: 'pauseVideo'
    });
    try {
        var iframe = div.getElementsByTagName("iframe")[0];
        iframe.contentWindow.postMessage(youtube_command, '*');
    } catch (e) {
        $(".galleryView .galleryViewWrap iframe").attr("src", "");
    }
}

function professorView() {
    $(".professorList .btnMore").on("click", function(e) {
        var idx = $(this).data("value");
        professorDetailView(idx);
        $(".professorView").css({
            display: "block"
        });
        $(".cover").css({
            display: "block"
        });
        return false;
    });
    $(".professorView .btnClose").on("click", function(e) {
        $(".professorView").css({
            display: "none"
        });
        $(".cover").css({
            display: "none"
        });
        return false;
    })
}

function professorDetailView(idx) {
    var param = {
        "idx": idx
    };
    $(".professorView .clearFix").html("");
    $.post("professor_view_form.asp", param, function(data) {
        var result = $(data);
        $(".professorView .clearFix").html(data);
		 setLazyload();
    });
}

function getRequest() {
    if (location.search.length > 1) {
        var get = new Object();
        var ret = location.search.substr(1).split('&');
        for (var i = 0; i < ret.length; i++) {
            var r = ret[i].split('=');
            get[r[0]] = r[1];
        }
        return get;
    } else {
        return false;
    }
}

function getGalleryView() {
    var get = getRequest();
    var byTrigger = get['trigger'];
	var idx = decodeURIComponent(get['idx']);
    var uri = decodeURIComponent(get['uri']);
    var title = decodeURIComponent(get['title']);
    switch (byTrigger) {
        case "view":
            $(document).on('click', '[data-toggle="lightbox_m"]', function(event) {
                event.preventDefault();
                return $(this).ekkoLightbox({
                    alwaysShowClose: true
                });
            });
            var galleryView = document.createElement("a");
            document.getElementById('contents').appendChild(galleryView);
            $('#contents > a').eq(0).attr("id", "maingallery");
            $('#contents > a').eq(0).attr("href", uri);
            $('#contents > a').eq(0).attr("data-toggle", "lightbox_m");
            $('#contents > a').eq(0).attr("data-gallery", "gallery");
            $('#contents > a').eq(0).attr("data-max-width", "1360");
            $('#contents > a').eq(0).attr("data-width", "680");
            $('#contents > a').eq(0).attr("data-title", title);
            $('#contents > a').eq(0).css("display", "none");
            $('#contents > a').eq(0).text(title);
            var galleryEvent = document.createEvent("HTMLEvents");
            galleryEvent.initEvent("click", true, false);
            document.getElementById("maingallery").dispatchEvent(galleryEvent);
			history.replaceState({},null, location.pathname);
            break;
    }
}

function setLazyload() {
    $("img.lazy").lazyload({
         threshold: 300,
    });
}
function setAptitude_Icon(){
	var img_num = $("#AptitudeIcon").data("idx")+1;
	if(img_num > 3) img_num =1;
	$("#AptitudeIcon").data("idx", img_num);
	var img_root = "/images/2018/main/Aptitude_Icon0"+img_num + ".png";
	$("#AptitudeIcon").css("background-image","url('"+img_root+"')");
}
function init() {
    $(document).ready(function(e) {
        gnb();
        fix();
        mainVisual();
        faq();
        entryBox();
        campusLifeListBox();
        videoWrap();
        rollingUtil();
        topMenu();
        quickMenu();
        allMenuOpen();
        allMenuClose();
        mainGallery();
        btnTop();
        professorView();
        getGalleryView();
        setLazyload();
		setInterval(setAptitude_Icon, 4000);
		$(".Aptitude").draggable();
    })
}
init();