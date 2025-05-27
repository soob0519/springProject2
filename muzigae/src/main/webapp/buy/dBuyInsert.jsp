<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/dBuyInsert.css">
<script src="https://kit.fontawesome.com/a7926a1c4d.js"
	crossorigin="anonymous"></script>
<script src="/js/juqery-latest.min.js"></script>
<script src="/js/script.js"></script>
 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 정보 입력</title>
 
</head>
<body>
<%@include file="/include/header.jsp" %>
<div class="container">
  <h2>결제 정보 입력</h2>

  <!-- 장바구니에 담긴 상품 요약 -->
  <div class="product-list">
    <h3>주문 상품</h3>
    <ul>
      <li>상품 A - 수량: 2개 - 20,000원</li>
      <li>상품 B - 수량: 1개 - 10,000원</li>
    </ul>
    <p><strong>총 결제 금액:</strong> 30,000원</p>
  </div>

  <!-- 결제 정보 입력 폼 -->
  <form action="/order/submit" method="post">
    <label for="name">이름</label>
    <input type="text" id="name" name="name" required>

    <label for="email">이메일</label>
    <input type="email" id="email" name="email" required>

    <label for="phone">연락처</label>
    <input type="tel" id="phone" name="phone" required>

    <label for="address">배송 주소</label>
    <textarea id="address" name="address" rows="3" required></textarea>

    <label for="payment">결제 수단</label>
    <select id="payment" name="payment" required>
      <option value="">-- 선택 --</option>
      <option value="CARD">신용카드</option>
      <option value="BANK">무통장입금</option>
      <option value="KAKAOPAY">카카오페이</option>
    </select>

    <button type="submit">결제하기</button>
  </form>
</div>
<%@include file="/include/footer.jsp" %>
</body>
</html>