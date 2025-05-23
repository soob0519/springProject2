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
	<link rel="stylesheet" href="/css/style.css">
	<script src="/js/jquery-1.10.2.min.js"></script>
	<script src="/js/script.js"></script>
</head>

<script>
	$(function(){
		$("#btn_cancel").click(function(){
			location = "/canRequest/${dbuyDto.bseqid}";
		});
	});
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
<!-- include file="/include/header.jsp" -->


		<article class="contents wrap">
			<section>
				<h2 class="prod_h2">구매상세내역</h2>
				<div>
					<ul class="pord_category flex_center">
						<li><a href="/fullList">전체내역</a></li>
						<li><a href="/buyList">구매내역</a></li>
						<li><a href="/cancelList">취소내역</a></li>
					</ul>
				</div>
			</section>

			<section class="prod_new wrap">
				<h3 class="prod_h3">구매상세내역</h3>
				<div>
					<table class="pc_table">
						<tr>
							<th>
						    <c:if test="${dbuyDto.state == 1}">결제 완료</c:if>
						    <c:if test="${dbuyDto.state == 2}">구매</c:if>
						    <c:if test="${dbuyDto.state == 3}">취소</c:if>
						    <c:if test="${dbuyDto.state == 4}">부분취소</c:if>
						    <c:if test="${dbuyDto.state == 5}">취소진행중</c:if>
							</th>
						</tr>
					</table>
				</div>
				<div>
					<table class="pc_table">
					<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
					<col width="*" />
					</colgroup>
						<tr>
							<th colspan="4">주문상품</th>
							<td class="button_td">
								<c:if test="${dbuyDto.state == 1}">
									<button type="button" id="btn_cancel">취소신청</button>
								</c:if>
						    	<c:if test="${dbuyDto.state == 2}">
						    		<button type="button" id="btn_cancel">취소신청</button>
						    	</c:if>
						    	<c:if test="${dbuyDto.state == 4}">
						    		<button type="button" id="btn_cancel">취소신청</button>
						    	</c:if>
						    	<c:if test="${dbuyDto.state == 5}">
						    		<button type="button" id="btn_cancel">취소신청</button>
						    	</c:if>
							</td>
						</tr>
						<tr>
							<th></th>
							<th class="product_td">제품</th>
							<th class="product_td">색상</th>
							<th class="product_td">가격</th>
							<th class="product_td">상태</th>
						</tr>
						
						<c:forEach var="pdto" items="${pdtoList }">
						<tr>
							<td class="image_td"><img class="prod_image" src="/images/nyang.jpg"></td>
							<td class="product_td">${pdto.pname }</td>
							<td class="product_td">${pdto.price }</td>
							<td class="product_td">${pdto.color }</td>
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
							<th>배송지</th>
							<td class="button_td"><button type="button">배송지변경</button></td>
						</tr>
						<tr>
							<td colspan="2" class="title_td">${dcustomerDto.addr }</td>
						</tr>
					</table>
				</div>
				<div>
					<table class="pc_table">
					<colgroup>
					<col width="20%" />
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					</colgroup>
						<tr>
							<th colspan="3">결제정보</th>
						</tr>
						<tr>
							<td class="title_td">
							<c:if test="${dpaymentDto.paymet == 1}">계좌이체</c:if>
							<c:if test="${dpaymentDto.paymet == 2}">신용카드</c:if>
							<c:if test="${dpaymentDto.paymet == 3}">무통장입금</c:if>
							</td>
							<td class="title_td">${dcustomerDto.bank }</td>
							<td class="title_td">${dcustomerDto.bnum }</td>
							<td>${dbuyDto.price}</td>
						</tr>
					</table>
				</div>
			</section>

		</article>

		<footer id="footer">

		</footer>
</body>
</html>
