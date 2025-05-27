<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/dResultBuy.css">
<script src="https://kit.fontawesome.com/a7926a1c4d.js"
	crossorigin="anonymous"></script>
<script src="/js/juqery-latest.min.js"></script>
<script src="/js/script.js"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문 완료</title>

</head>
<body>
<%@include file="/include/header.jsp" %>
	<div class="container">
		<h2>주문이 완료되었습니다 🎉</h2>
		<p>고객님의 주문이 정상적으로 접수되었습니다.</p>
		<p>감사합니다!</p>

		<div class="order-info">
			<h3>주문 요약</h3>   
			<ul>  
				<li><strong>주문번호:</strong> ${data.bseqid}</li>
				<li><strong>주문자명:</strong> ${data.username}</li>
				<li><strong>상품:</strong>${data.product_names}(${data.product_colors})       </li>  
				<li><strong>총 결제금액:</strong> ${data.total_price}원</li>
				<li><strong>결제수단:</strong> <c:choose>
						<c:when test="${data.paymet eq 1}">신용카드</c:when>
						<c:when test="${data.paymet eq 2}">무통장입금</c:when>
						<c:when test="${data.paymet eq 3}">카카오페이</c:when>
						<c:otherwise>기타</c:otherwise>
					</c:choose></li>
			</ul>
		</div>

		<a href="/buy/list" class="btn-home">결제내역으로 이동</a>
	</div>
	<%@include file="/include/footer.jsp" %>
</body>
</html>