<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/payment.css">
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
    
     <c:forEach var="prod" items="${productList}">
  <li>상품명: ${prod.PNAME}</li>
  <li>색상: ${prod.COLOR}</li>
  <li>가격: ${prod.PRICE}</li>
  <hr/>
</c:forEach>
 
    </ul>
    <li><strong>총 결제 금액:</strong> ${totalPrice}원</li>
  </div>

 

  <!-- 결제 정보 입력 폼 -->     
  <form action="/payment/insert" method="post">
    
                               
    <input type="hidden" id="price" name="price" value="${totalPrice}">
    
<c:forEach var="prod" items="${productList}" varStatus="i">
  <input type="hidden" name="dproductList[${i.index}].rseqid" value="${prod.RSEQID}" />
  <input type="hidden" name="dproductList[${i.index}].item" value="${prod.ITEM}" />
  <input type="hidden" name="dproductList[${i.index}].color" value="${prod.COLOR}" />
  <input type="hidden" name="dproductList[${i.index}].price" value="${prod.PRICE}" />
  <input type="hidden" name="dproductList[${i.index}].quan" value="${prod.QUAN}" />
  <input type="hidden" name="dproductList[${i.index}].pname" value="${prod.PNAME}" />
</c:forEach>
  
    <label for="name">이름</label>
    <input type="text" id="name" name="name" required>

    <label for="phone">연락처</label>
    <input type="tel" id="phone" name="phone" required>

    <label for="address">배송 주소</label>
    <textarea id="address" name="addr" rows="3" required></textarea>

    <label for="payment">결제 수단</label>
    <select id="payment" name="payment" required>
      <option value="">-- 선택 --</option>
      <option value="1">신용카드</option>
    </select>

    <button type="submit">결제하기</button>
  </form>
</div>
<%@include file="/include/footer.jsp" %>
</body>
<script>
  document.querySelector("form").addEventListener("submit", function (e) {
    const payment = document.getElementById("payment").value;

    if (!payment) {
      alert("결제 수단을 선택하세요.");
      e.preventDefault();
    }
  });
</script>

</html>