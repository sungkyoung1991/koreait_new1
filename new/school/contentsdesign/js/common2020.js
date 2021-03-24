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
            height: 380
        }, 600, "easeOutQuint");
        $('.gnbList > li > .sub ').css('display', '');
        $('.gnbFixed').css('height', '250px');
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

function topMenu() {
    var gnbOffset = $('#gnb').offset();
    $(window).scroll(function() {
        if ($(document).scrollTop() > gnbOffset.top) {
            $('.gnbWrap').addClass('gnbFixed');
            $('.logo').addClass('hidden_logo');
            $('.btnAllMenu').css('top', '0px');
            $('.gnbList > li > .sub ').css('display', 'none');
            // $('#header.new2020 .gnb_bg_org').css({'top':'0','position':'fixed'});
        } else {
            $('.gnbWrap').removeClass('gnbFixed');
            $('.logo').removeClass('hidden_logo');
            $('.btnAllMenu').css('top', '121px');
            $('.gnbList > li > .sub ').css('display', '');
            // $('#header.new2020 .gnb_bg_org').css('top','115px');
        }
    });
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
        case "introduce":
            allFix({
                mainSel: 0,
                lnbSel: 0
            });
            break;
        case "lecture01":
            allFix({
                mainSel: 1,
                lnbSel: 2
            });
            break;
        case "lecture02":
            allFix({
                mainSel: 1,
                lnbSel: 3
            });
            break;
        case "lecture03":
            allFix({
                mainSel: 1,
                lnbSel: 4
            });
            break;
        case "lecture04":
            allFix({
                mainSel: 1,
                lnbSel: 0
            });
            break;
        case "lecture05":
            allFix({ mainSel: 1, lnbSel: 1 });
            break;
        case "lecture06":
            allFix({ mainSel: 1, lnbSel: 5 });
            break;
        case "gallery":
            allFix({
                mainSel: 2,
                lnbSel: 0
            });
            break;
        case "story":
            allFix({
                mainSel: 3,
                lnbSel: 0
            });
            break;
        case "news":
            allFix({
                mainSel: 4,
                lnbSel: 0
            });
            break;
        case "news_view":
            allFix({
                mainSel: 4,
                lnbSel: 0
            });
            break;
        case "board_index":
            allFix({
                mainSel: 4,
                lnbSel: 0
            });
            break;
        case "professor":
            allFix({
                mainSel: 5,
                lnbSel: 0
            });
            break;
        default:
            allFix({
                mainSel: -1,
                lnbSel: -1
            });
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

function subVisual(mainSel) {
    $("#subVisual").removeClass();
    $("#subVisual").addClass("subVisual0" + (mainSel + 1));
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
    subVisual(mainSel);
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

function quickMenu() {
    var quickState = "close";
    $("#quickMenu .btnQuickMenu").on("click", function(e) {
        if (quickState == "close") {
            $("#quickMenu").stop().animate({
                left: 0
            }, 600, "easeOutQuint");
            $("#quickMenu .btnQuickMenu").css({
                background: 'url("../images/layout/btnClose2020.png") no-repeat',
                right: '-42px'
            });
            quickState = "open";
        } else {
            $("#quickMenu").stop().animate({
                left: -209
            }, 600, "easeOutQuint");
            $("#quickMenu .btnQuickMenu").css({
                background: 'url("../images/layout/btnOpen2020.png") no-repeat'
            });
            quickState = "close";
        }
    })
    return false
}

function rollingBanner() {
    var rollingBanner = new Swiper('#rollingBanner .swiper-container', {
        nextButton: "#rollingBanner .btnNext",
        prevButton: "#rollingBanner .btnPrev",
        slidesPerView: 3,
        paginationClickable: true,
        spaceBetween: 30,
        freeMode: true
    });
    return false
}

function quickBannerRolling() {
    var quickBannerRolling = new Swiper('#quickBanner .quickBanner03', {
        loop: true,
        speed: 1000,
        autoplay: 3000,
        freemode: true,
        pagination: "#quickBanner .quickBanner03 .pager",
        paginationClickable: true
    })
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

function galleryView() {
    var imgLoadChk = true;
    $(".galleryWrap .btnMore").on("click", function(e) {
        var posX = 0;
        var gallery_url = $(this).attr("data-value");
        var gubun = $(this).attr("data-field");
        $(".galleryView").css({
            display: "block"
        });
        $(".cover").css({
            display: "block"
        });
        $(".galleryView .galleryViewWrap iframe").attr("src", gallery_url);
        $(".galleryView .galleryViewWrap iframe").css("width", $(".galleryView").outerWidth());
        $(".galleryView .galleryViewWrap iframe").css("height", $(".galleryView").outerHeight() - 50);
        if (gubun == "movie") {
            $(".galleryView .galleryViewWrap iframe").attr("src", gallery_url);
            $(".galleryView .galleryViewWrap iframe").css("display", "");
            $(".galleryView .galleryViewWrap .galleryBox").css("display", "none");
            $(".btnClose").css("right", "0px");
            $(".btnClose").css("top", "-50px");
        } else {
            var imgX = 0;
            $(".galleryView .galleryViewWrap iframe").css("display", "none");
            $(".galleryView .galleryViewWrap .galleryBox").css("display", "");
            $(".galleryView .galleryViewWrap .galleryImg").attr("src", gallery_url);
            $(".galleryImg").load(function() {
                if (imgLoadChk) {
                    posX = $(".galleryImg").width();
                    if (posX > 1360) {
                        posX = 1360;
                    }
                    imgX = posX / 2;
                    $(".galleryBox").css("margin-left", "-" + imgX + "px");
                    $(".galleryBox").css("width", (posX + 20) + "px");
                    if (posX < 1360) {
                        var tmpW = $(".galleryViewWrap").outerWidth();
                        posX = (tmpW - posX - 140) / 2;
                        $(".btnClose").css("right", posX + "px");
                        $(".btnClose").css("top", "0px");
                    }
                    posX = 0;
                } else {
                    return false;
                }
                imgLoadChk = false;
            });
        }
        return false;
    });
    $(".cover").click(function() {
        $(this).hide();
        $(".galleryView").css({
            display: "none"
        });
        stopVideo();
        $(".galleryView .galleryViewWrap .galleryImg").attr("src", "");
        $(".galleryBox").attr("style", "");
        stopVideo();
        imgLoadChk = true;
    });
    $(".galleryView .btnClose").on("click", function(e) {
        $(".galleryView").css({
            display: "none"
        });
        $(".cover").css({
            display: "none"
        });
        $(".galleryView .galleryViewWrap .galleryImg").attr("src", "");
        stopVideo();
        imgLoadChk = true;
        return false;
    });
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

function introduceTab() {
    $(".introduceTab ul li").on("click", function(e) {
        var sel = $(this).index();
        $(".introduceTab ul li").removeClass("on");
        $(this).addClass("on");
        $(".introduceContents > ul > li").css({
            display: "none"
        });
        $(".introduceContents > ul > li").eq(sel).css({
            display: "block"
        });
        return false;
    })
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
    var uri = unescape(get['uri']);
    switch (byTrigger) {
        case "view":
            $(".galleryView").css({
                display: "block"
            });
            $(".cover").css({
                display: "block"
            });
            $(".galleryView .galleryViewWrap iframe").attr("src", uri);
            break;
    }
}

function features() {
    var features = new Swiper('#features .auto', {
        loop: true,
        direction: "horizontal",
        speed: 1000,
        autoplay: 3000,
        nextButton: "#features .btnNext",
        prevButton: "#features .btnPrev"
    })
}

function setLazyload() {
    $("img.lazy").lazyload({
        threshold: 300,
    });
}

function setAptitude_Icon() {
    var img_num = $("#AptitudeIcon").data("idx") + 1;
    if (img_num > 3) img_num = 1;
    $("#AptitudeIcon").data("idx", img_num);
    var img_root = "/images/2018/main/Aptitude_Icon0" + img_num + ".png";
    $("#AptitudeIcon").css("background-image", "url('" + img_root + "')");
}

function init() {
    $(document).ready(function(e) {
        gnb();
        topMenu();
        fix();
        mainVisual();
        faq();
        entryBox();
        campusLifeListBox();
        videoWrap();
        rollingUtil();
        quickMenu();
        rollingBanner();
        quickBannerRolling();
        allMenuOpen();
        allMenuClose();
        btnTop();
        galleryView();
        professorView();
        introduceTab();
        getGalleryView();
        features();
        setLazyload();
        setInterval(setAptitude_Icon, 4000);
        $(".Aptitude").draggable();
    })
}
init();
