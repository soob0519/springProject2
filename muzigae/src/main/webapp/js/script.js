$(document).ready(function(){

    /* pop_menu */
    $('.menu_btn').click(function() {
        if ( $(this).hasClass('open_menu') ) {
            $(this).removeClass('open_menu')
        }
        else {
            $(this).addClass('open_menu')
        }
    });
    

    
    $(document).ready(function(){
        $("#slide_menu").hide();
        $(".menu_btn").click(function(){
            $(".siteMapBtn p").toggle();
            $('#slide_menu').animate({width:'toggle'});
        })
    })


});

$(window).on('load', function() {
    const $fixedBox = $('.order_buy'); // 고정될 박스 요소
    const $footer = $('footer'); // 페이지 하단의 footer 요소
    const $body = $('body'); // 페이지 본문
    const topMargin = 150; // 고정될 때의 상단, 하단 여백
    const breakpoint = 1200; // 반응형 디자인의 기준 너비

    // 고정 박스가 없으면 함수를 종료합니다.
    if (!$fixedBox.length) return;

    // 고정 박스의 초기 상단 위치를 계산합니다.
    let initialTop = $fixedBox.offset().top;

    // 스크롤 위치와 화면 너비에 따라 고정 박스의 위치를 업데이트하는 함수
    const updatePosition = () => {
        const scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
        const footerHeight = $footer.outerHeight(true); // footer의 높이
        const bodyHeight = $body.outerHeight(true); // body의 높이
        // 고정 박스가 위치할 수 있는 최대 높이를 계산합니다.
        const availableHeight = bodyHeight - footerHeight - $fixedBox.outerHeight(true) - initialTop - topMargin;

        // 스크롤 위치와 화면 너비에 따라 고정 박스의 위치를 조정합니다.
        if (scrollTop > initialTop - topMargin && window.innerWidth > breakpoint) {
            if (availableHeight + initialTop - topMargin > scrollTop) {
                $fixedBox.css({ 'position': 'fixed', 'top': `${topMargin}px` });
            } else {
                $fixedBox.css({ 'position': 'absolute', 'top': `${availableHeight}px` });
            }
        } else {
            if (window.innerWidth > breakpoint){
                $fixedBox.css({ 'position': 'absolute', 'top': `0` }); // 고정 박스 위치가 최상단일 때
            }else{
                $fixedBox.css({ 'position': 'static' }); // 화면이 좁을 때는 기본 위치로 설정
            }
        }
    };
    
    // 창 크기가 변경될 때 고정 박스의 위치를 초기화하고 초기 상단 위치를 다시 계산합니다.
    let resizeTimer;
    let isResize = false;
    $(window).on('resize', () => {
        clearTimeout(resizeTimer);
        isResize = true;
        resizeTimer = setTimeout(function() {
            $fixedBox.css({ 'position': 'absolute', 'top': '0' });
            initialTop = $fixedBox.offset().top;
            isResize = false;
            updatePosition();
        }, 100);
    });

    // 스크롤 할 때 위치 업데이트 함수를 호출합니다. (창 크기가 변경되지 않을 때)
    $(window).on('scroll', function() {
        if(isResize == false){
            updatePosition();
        }
    });

    updatePosition();
});