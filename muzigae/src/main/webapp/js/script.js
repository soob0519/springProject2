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
    $('.menu_btn').on('click',function(){
        $('.pop_menu').fadeToggle(300);
    });
    $('.total_menu').mouseleave(function(){
        $('.pop_menu').fadeOut(300);
        $('.menu_btn').removeClass('open_menu');
    });


    $(window).scroll(function(){
        if($(this).scrollTop()>0){
            $('.order_buy').addClass('sticky');
        }else{
            $('.order_buy').removeClass('sticky');
        }
    });
});