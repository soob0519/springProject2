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
	
	
    
    $("#slide_menu").hide();
    $(".menu_btn").click(function(){
        $(".siteMapBtn p").toggle();
        $('#slide_menu').animate({width:'toggle'});
    })
	
	
	
	let unitPrice = productPrice; // 콤마 제거하고 정수 변환
    let quantity = 1;

    // 금액 및 수량 갱신 함수
    function updateTotal() {
        let qty = parseInt($("#quan").val());
        if (isNaN(qty) || qty < 1) qty = 1;

        quantity = qty;
        let total = unitPrice * quantity;

        // 금액 콤마 적용
        const formatted = total.toLocaleString();

        // 금액 및 수량 출력
        $("#total_price").html(`${formatted}원 <span>(${quantity}개)</span>`);
        $("#totalPrice").text(formatted);
        $("#totalCount").text(quantity);
		
		// 수량 옆 개별 금액도 갱신
		$(".item_price").text(formatted + "원");
    }

    // 수량 조정 버튼
    $(".quan_plus").click(function () {
        let $qt = $(this).siblings(".quan");
        let currentVal = parseInt($qt.val()) || 1;
        $qt.val(currentVal + 1);
        updateTotal();
    });

    $(".quan_minus").click(function () {
        let $qt = $(this).siblings(".quan");
        let currentVal = parseInt($qt.val()) || 1;
        if (currentVal > 1) {
            $qt.val(currentVal - 1);
        } else {
            $qt.val(1);
        }
        updateTotal();
    });

    // 옵션 선택
    $("#buy_prod_option").change(function () {
        let selectColor = $(this).val();
        if (selectColor !== "") {
            $(".buy_select_list span").text(selectColor);
            $(".buy_select_list p:first").text(productName);
            $(".buy_select_list p:last").text(productPrice);

            $(".buy_select_list").slideDown();
            $("#quan").val(1);
            quantity = 0;
            updateTotal();
        } else {
            $(".buy_select_list").slideUp();
			$("#total_price").html(`0원 <span>(0개)</span>`);
			$("#totalPrice").text("0");
			$("#totalCount").text("0");
        }
    });

    // 수량 직접 입력 시
    $("#quan").on("input", function () {
        updateTotal();
    });

    // 페이지 로드 시 초기화
    updateTotal();

});




/*
function updateTotalPrice() {
    let unitPrice = parseInt(productPrice.replace(/,/g, "")); // ${dto.price} 를 JS 변수로 받아온 상태
    let quantity = parseInt($(".quan").val());
    
    if (!isNaN(unitPrice) && !isNaN(quantity)) {
        let total = unitPrice * quantity;
        $(".buy_total i").html("금액 <span>(" + quantity + "개)</span> : " + total.toLocaleString() + "원");
    }
}
*/





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