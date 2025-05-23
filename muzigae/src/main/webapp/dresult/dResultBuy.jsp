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

<div class="container">
  <h2>주문이 완료되었습니다 🎉</h2>
  <p>고객님의 주문이 정상적으로 접수되었습니다.</p>
  <p>감사합니다!</p>

  <div class="order-info">
    <h3>주문 요약</h3>
    <ul>
      <li><strong>주문번호:</strong> 202405230001</li>
      <li><strong>주문자명:</strong> 홍길동</li>
      <li><strong>상품:</strong> 상품 A (1개), 상품 B (2개)</li>
      <li><strong>총 결제금액:</strong> 30,000원</li>
      <li><strong>결제수단:</strong> 신용카드</li>
    </ul>
  </div>

  <a href="/" class="btn-home">홈으로 이동</a>
</div>

</body>
</html>