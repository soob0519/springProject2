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
  <title>주문 / 결제</title>
 
</head>
<body>

<div class="container">
  <h2>주문 / 결제</h2>

  <!-- 주문 요약 -->
  <div class="section order-summary">
    <h3>주문 내역</h3>
    <table>
      <tr>
        <th>상품명</th>
        <th>수량</th>
        <th>금액</th>
      </tr>
      <tr>
        <td>상품 A</td>
        <td>1</td>
        <td>10,000원</td>
      </tr>
      <tr>
        <td>상품 B</td>
        <td>2</td>
        <td>20,000원</td>
      </tr>

      
    </table>
    <div class="total">총 합계:
    	<span>30,000원</span>
   </div>
  </div>

  <!-- 결제 수단 -->
  <div class="section payment-method">
    <h3>결제 수단 선택</h3>
    <label><input type="radio" name="pay" checked> 계좌이체</label>
  </div>

  <!-- 결제 버튼 -->
  <button class="btn-pay">결제하기</button>
</div>

</body>

<script>
	
	$(".btn-pay").click(function () {
	    location.href='/dResultBuy'
	  });
 
  </script>
  
</html>
