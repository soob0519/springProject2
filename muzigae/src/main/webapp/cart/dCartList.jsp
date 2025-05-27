<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/dCartList.css">
<script src="https://kit.fontawesome.com/a7926a1c4d.js"
	crossorigin="anonymous"></script>
<script src="/js/juqery-latest.min.js"></script>
<script src="/js/script.js"></script>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>장바구니</title>

</head>
<body>
<%@include file="/include/header.jsp" %>
	<h1>장바구니</h1>
	<form id="cartForm" method="post" action="/payment">
		<table id="cartTable">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>번호</th>
					<th>상품명</th>
					<th>색상</th>
					<th>수량</th>
					<th>가격</th>
				<!-- 	<th>삭제</th> -->
				</tr>
			</thead>
			<tbody>

				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="selectedItems"
							value="${item.RSEQID}" class="rowCheck" /></td>
						<td>${status.index + 1}</td>
						<td>${item.PNAME}</td>
						<td>${item.COLOR}</td>
						<td class='quantity'>${item.QUAN}</td>
						<td class='price'>${item.PRICE}</td>
						<!-- <td><button onclick="removeItem(this)">삭제</button></td> -->
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="total-container">
      총 합계: <span id="grandTotal">0</span>원
    </div>

		<button type="submit">결제하기</button>
	</form>
	<script>
	
	$(".checkout").click(function () {
	    location.href='/buy'
	  });
	
	
 
	
	 $("#checkAll").on("change", function () {
		    $(".rowCheck").prop("checked", this.checked);
		    updateCart(); // 체크 전체 선택 시 합계 재계산
		  });

	    // 결제하기 클릭 전 선택값 체크
	    $("#cartForm").on("submit", function (e) {
	      if ($(".rowCheck:checked").length === 0) {
	        alert("결제할 상품을 선택하세요.");
	        e.preventDefault();
	      }
	    });
	    
	    $(".rowCheck").on("change", function () {
	        updateCart();
	      });
	
	    function updateCart() {
	        let grandTotal = 0;

	        $(".rowCheck:checked").each(function () {
	          const row = $(this).closest("tr");
	          const quantity = parseInt(row.find(".quantity").text());
	          const price = parseInt(row.find(".price").text());

	          grandTotal += quantity * price;
	        });

	        $("#grandTotal").text(grandTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	      }

    function removeItem(button) {
      const row = button.closest('tr');
      row.remove();
      updateCart();
    }

    // 초기 계산
    $(document).ready(function () {
    updateCart();

    // 동적 이벤트 연결 (forEach 내부에 생성되었을 경우 대비)
    $(document).on("change", ".rowCheck", function () {
      updateCart();
    });
  });
    
    $("#cartForm").on("submit", function (e) {
        if ($(".rowCheck:checked").length === 0) {
          alert("결제할 상품을 선택하세요.");
          e.preventDefault();
        }
      });
    
  </script>
<%@include file="/include/footer.jsp" %>
</body>
</html>