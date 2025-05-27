<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/dBuyIndex.css">
<script src="https://kit.fontawesome.com/a7926a1c4d.js"
	crossorigin="anonymous"></script>
<script src="/js/juqery-latest.min.js"></script>
<script src="/js/script.js"></script>
 
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>주문 내역 조회</title>
 
</head>
<body>
<%@include file="/include/header.jsp" %>
  <h1>주문 내역 조회</h1>

  <table>
    <thead>
      <tr>
        <th>주문번호</th>
        <th>상품명</th>
        <th>수량</th>
        <th>색상</th>
        <th>가격</th>
        <th>결제수단</th>
        <th>주문일자</th>
      </tr>
    </thead>
    <tbody>
    
    <c:forEach var="item" items="${list}">
  <tr>
 
 
    <td>${item.BSEQID}</td>
    <td>${item.PNAME}</td>
    <td>${item.QUAN}</td>
    <td>${item.COLOR}</td>
    <td>${item.PRICE * item.QUAN}원</td>
    <td>
		<c:choose>
			<c:when test="${item.PAYMET eq 1}">신용카드</c:when>
			<c:when test="${item.PAYMET eq 2}">무통장입금</c:when>
			<c:when test="${item.PAYMET eq 3}">카카오페이</c:when>
			<c:otherwise>기타</c:otherwise>
		</c:choose>
    <td>${item.PDATE}</td>
  </tr>
</c:forEach>

      <!-- 예시 데이터 -->
   <!--    <tr>
        <td>20240523001</td>
        <td>상품 A</td>
        <td>2</td>
        <td>20,000원</td>
        <td>신용카드</td>
        <td>2025-05-23</td>
      </tr>
      <tr>
        <td>20240522002</td>
        <td>상품 B</td>
        <td>1</td>
        <td>10,000원</td>
        <td>카카오페이</td>
        <td>2025-05-22</td>
      </tr> -->
      <!-- 데이터 없을 경우 -->
      <!--
      <tr>
        <td colspan="6" class="no-orders">주문 내역이 없습니다.</td>
      </tr>
      -->
    </tbody>
  </table>
<%@include file="/include/footer.jsp" %>
</body>
</html>