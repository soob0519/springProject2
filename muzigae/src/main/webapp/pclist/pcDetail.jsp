<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes" />
	<title>상세내역</title>
	<link rel="stylesheet" href="css/style.css">
	<script src="js/jquery-1.10.2.min.js"></script>
	<script src="js/script.js"></script>
</head>

<script>


</script>

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

.button_td {
  position: relative;
  padding: 3px;
}

.button_td button {
  position: absolute;
  top: 20px;
  right: 20px;
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

</style>
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
				<h2 class="prod_h2">구매상세내역</h2>
				<div>
					<ul class="pord_category flex_center">
						<li><a href="#none">전체내역</a></li>
						<li><a href="#none">구매내역</a></li>
						<li><a href="#none">취소내역</a></li>
					</ul>
				</div>
			</section>

			<section class="prod_new wrap">
				<h3 class="prod_h3">구매내역</h3>
				<div>
					<table class="pc_table">
						<tr>
							<th>구매</th>
							<td class="button_td">
							<button type="button" id="btn_cancle">취소신청</button>
							</td>
						</tr>
						
					</table>
				</div>
				<div>
					<table class="pc_table">
					<colgroup>
					<col width="40%" />
					<col width="35%" />
					<col width="*" />
					</colgroup>
						<tr>
							<th colspan="3">주문상품</th>
						</tr>
						<tr>
							<td class="image_td"><img class="prod_image" src="/images/nyang.jpg"></td>
							<td class="product_td">슬릭매트쿠션</td>
							<td class="product_td">N19</td>
						</tr>
						<tr>
							<td class="image_td"><img class="prod_image" src="/images/nyang2.jpg"></td>
							<td class="product_td">오브제워터틴트</td>
							<td class="product_td">002 Spicy</td>
						</tr>
						<tr>
							<td class="image_td"><img class="prod_image" src="/images/nyang3.jpg"></td>
							<td class="product_td">원앤온리 섀도우</td>
							<td class="product_td">멜팅제로 실크슬립</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="pc_table">
						<tr>
							<th>배송지</th>
							<td class="button_td"><button type="button">배송지변경</button></td>
						</tr>
						<tr>
							<td class="title_td">12345</td>
							<td class="title_td">경기도 남양주시 화도읍 구리하이미디어 305호</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="pc_table">
					<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="*" />
					<col width="15%" />
					</colgroup>
						<tr>
							<th colspan="4">결제정보</th>
						</tr>
						<tr>
							<td class="title_td">주문금액</td>
							<td class="title_td"></td>
							<td class="title_td"></td>
							<td>60,000</td>
						</tr>
						<tr>
							<td class="title_td">카드 간편결제</td>
							<td class="title_td">하나카드 8888 **** **** 8888</td>
							<td class="title_td">일시불</td>
							<td>60,000</td>
						</tr>
					</table>
				</div>
			</section>

		</article>

		<footer id="footer">

		</footer>
</body>
</html>
