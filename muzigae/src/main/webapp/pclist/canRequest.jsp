<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes" />
	<title>취소신청</title>
	<link rel="stylesheet" href="/css/style.css">
	<script src="/js/jquery-1.10.2.min.js"></script>
	<script src="/js/script.js"></script>
</head>
<style>
.pc_table {
	width:1600px;
	height:150px;
	border:1px solid #ccc;
}

.pc_table th {
	text-align:left;
	height:50px;
	padding-left:30px;
}

.title_td {
	height:100px;
	border:px solid #ccc;
	padding-left:30px;
}

.image_td {
	height:100px;
	border:px solid #ccc;
	padding-left:60px;
}

.prod_image {
	width: 50px;
	height: 50px;
}

.product_td {
	height:100px;
	border:px solid #ccc;
	padding-left:30px;
}
.checkbox_td {
	height:100px;
	border:px solid #ccc;
	padding-left:50px;
}

.button_td2 {
	text-align:center;
	padding-bottom: 20px;
}

</style>
<script>
	$(function(){
	    $('#btn_cancel').click(function(){
			
	    	let datas = "";
	    	let bseqid = $("#bseqid").val();
	    	let recode = $("input[name='recode']:checked").val();
	    	
	    	$("input[name='chk']:checked").each(function(){
				datas += $(this).val()+",";
			});
	    		
	    	 if (datas.length == 0) {
	             alert("취소할 상품을 선택하세요.");
	             return;
	         }

	         if (!recode) {
	             alert("취소 사유를 선택하세요.");
	             return;
	         }		
			
			 $.ajax({
				data : "bseqid="+bseqid+"&recode="+recode+"&datas="+datas,
				type : "post",
				url  : "/cancleEach",
				dataType : "text",
				success  : function(data){
					if(data == "ok") {
						alert("취소 신청 완료");
						location = "/fullList";
					} else {
						alert("취소 신청 실패");
					}
				},
				error	 : function(){}
			});
			
		});

	});
</script>
<body>
		<header id="header">
			<div class="flex_between header_wrap">

				<nav class="total_menu">
					<a href="#none" class="menu_btn">
						<span></span>
						<span></span>
						<span></span>
					</a>
					<a href="#none"><span class="blind">전체메뉴버튼</span></a>
				</nav>

				<h1 class="header_logo">
					<a href="">~로~고~</a>
					<span class="blind">쇼핑몰 로고</span>
				</h1>

				<ul class="snb flex_end">
					<li>
						<a href="#none">로그인</a>
					</li>
					<li>
						<a href="#none">가입</a>
					</li>
					<li>
						<a href="#none">검색</a>
					</li>
					<li>
						<a href="#none">찜</a>
					</li>
					<li>
						<a href="#none">장바구니</a>
					</li>
				</ul>

			</div>
		</header>


		<article class="contents wrap">
			<section>
				<h2 class="prod_h2">취소신청</h2>
				<div>
					<ul class="pord_category flex_center">
						<li><a href="/fullList">전체내역</a></li>
						<li><a href="/buyList">구매내역</a></li>
						<li><a href="/cancelList">취소내역</a></li>
					</ul>
				</div>
			</section>

			<section class="prod_new wrap">
				<h3 class="prod_h3">취소신청</h3>
				<div>
					<input type="hidden" id="bseqid" name="bseqid" value="${dbuyDto.bseqid}">
					<table class="pc_table">
					<colgroup>
					<col width="10%" />
					<col width="20%" />
					<col width="*" />
					<col width="20%" />
					<col width="15%" />
					</colgroup>
						<tr>
							<th colspan="6">주문상품</th>
						</tr>
						<c:forEach var="pdto" items="${pdtoList }">
						<tr>
							<td class="checkbox_td">
								<c:if test="${pdto.state == 1 || pdto.state == 2 || pdto.state == 3 || pdto.state == 4}">
    								<input type="checkbox" name="chk" value="${pdto.pseqid}">
								</c:if>
							</td>
							<td class="image_td"><img class="prod_image" src="/images/nyang.jpg"></td>
							<td class="product_td">${pdto.pname }</td>
							<td class="product_td">${pdto.color }</td>
							<td class="product_td">${pdto.price }</td>
							<td class="product_td">
								<c:if test="${pdto.state == 1}">결제완료</c:if>
								<c:if test="${pdto.state == 2}">배송준비</c:if>
								<c:if test="${pdto.state == 3}">배송중</c:if>
								<c:if test="${pdto.state == 4}">배송완료</c:if>
								<c:if test="${pdto.state == 5}">취소진행중</c:if>
								<c:if test="${pdto.state == 6}">취소완료</c:if>
								<c:if test="${pdto.state == 7}">교환진행중</c:if>
								<c:if test="${pdto.state == 8}">교환완료</c:if>
							</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<div>
					<table class="pc_table">
						<tr>
							<th>취소사유</th>
						</tr>
						<tr>
							<td class="title_td">
								<input type="radio" id="recode1" name="recode" value="1"> 단순변심 <br>
								<input type="radio" id="recode2" name="recode" value="2"> 불량 <br>
								<input type="radio" id="recode3" name="recode" value="3"> 교환
							</td>
						</tr>
						<tr>
							<td class="button_td2" colspan="2">
								<button type="button" id="btn_cancel">취소신청</button>
							</td>
						</tr>
					</table>
				</div>
				
				
			</section>

		</article>

		<footer id="footer">

		</footer>
</body>
</html>
