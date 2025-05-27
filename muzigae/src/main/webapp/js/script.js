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
	
	
	
	let selectedOptions = [];
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

		

    // 옵션 선택
    $("#buy_prod_option").change(function () {
		const selectedColor = $(this).val();
		if(!selectedColor) return;
		
		const exists = selectedOptions.find(opt => opt.color == selectedColor);
		if(exists) {
			alert("이미 선택된 옵션입니다.");
			return;
		}
		
		selectedOptions.push({
			color: selectedColor,
			quantity: 1,
			price: productPrice
		});
		renderSelectedOptions();
		updateTotal();
    });


	function renderSelectedOptions() {
	    const $list = $(".buy_select_list");
	    $list.empty(); // 기존 삭제

	    selectedOptions.forEach((opt, index) => {
	        const total = opt.price * opt.quantity;
	        const html = `
	            <ul class="flex_between" data-index="${index}">
	                <li>
	                    <p>${productName}</p>
	                    <span>${opt.color}</span>
	                </li>
	                <li class="quan_btns flex_center">
	                    <a class="quan_minus click_area">-</a>
	                    <input type="text" class="quan" value="${opt.quantity}" />
	                    <a class="quan_plus click_area">+</a>
	                    <i class="btn_remove_option click_area">x</i>
	                </li>
	                <li><p class="item_price">${total.toLocaleString()}원</p></li>
	            </ul>
	        `;
	        $list.append(html);
	    });

	    $list.show();
	}
	
	
	//수량증가
	$(".buy_select_list").on("click", ".quan_plus", function(){
		const index = $(this).closest("ul").data("index");
		selectedOptions[index].quantity++;
		renderSelectedOptions();
		updateTotal();
	});
	
	//수량감소
	$(".buy_select_list").on("click",".quan_minus", function(){
		const index = $(this).closest("ul").data("index");
		if(selectedOptions[index].quantity > 1) {
			selectedOptions[index].quantity--;
			renderSelectedOptions();
			updateTotal();
		}
	});
	
	//삭제
	$(".buy_select_list").on("click", ".btn_remove_option", function(){
		const index = $(this).closest("ul").data("index");
		selectedOptions.splice(index, 1);
		renderSelectedOptions();
		updateTotal();
	});
	
	
	function updateTotal() {
		let totalCount = 0;
		let totalPrice = 0;
		
		selectedOptions.forEach(opt => {
			totalCount += opt.quantity;
			totalPrice += opt.quantity*opt.price;
		});
		$("#total_price").html(`${totalPrice.toLocaleString()}원 <span>(${totalCount}개)</span>`);
		$("#totalPrice").text(totalPrice.toLocaleString());
		$("#totalCount").text(totalCount);
	}
	
	
	
	/**
	 * buy_hidden_btn 모바일.. 구매 버튼 클릭시 결제창 토글
	 */
	$(".hidden_btn_buy").click(function(){
		$(".buy_frame").slideToggle(300);
	});
	
	let isRecentlyResized = false;

	$(window).on('resize',function(){
		if(window.innerWidth > 767) {
			$(".buy_frame").show();
			isRecentlyResized = true;
			setTimeout(() => {
				isRecentlyResized = false;
			}, 500);
		} else {
			$(".buy_frame").hide();
		}
	});
	
	$(document).click(function(e) {
		if(isRecentlyResized) return;	//resize 직후 안닫히게
		
		if(window.innerWidth > 767) return;
		
	    if (!$(e.target).closest('.click_area').length) {
	        $(".buy_frame").slideUp(300);
	    }
	});
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

