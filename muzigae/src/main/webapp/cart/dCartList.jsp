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

	<h1>장바구니</h1>
	<form id="cartForm" method="post" action="/cart/insert">
		<table id="cartTable">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>번호</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="item" items="${list}" varStatus="status">
					<tr>
						<td><input type="checkbox" onchange="updateCart()" name="selectedItems"
							value="${item.RSEQID}" class="rowCheck item-check" /></td>
						<td>${status.index + 1}</td>
						<td>${item.PNAME}</td>
						<td class='quantity'>${item.QUAN}</td>
						<td class='price'>${item.PRICE}</td>
						<td><button onclick="removeItem(this)">삭제</button></td>
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
	      updateCart();
	    });

	    // 결제하기 클릭 전 선택값 체크
	    $("#cartForm").on("submit", function (e) {
	      if ($(".rowCheck:checked").length === 0) {
	        alert("결제할 상품을 선택하세요.");
	        e.preventDefault();
	      }
	    });
	
    function updateCart() {
    	  
      const rows = document.querySelectorAll('#cartTable tbody tr');
      let grandTotal = 0;

      
      
      /*rows.forEach(row => {
        const quantity = row.querySelector('.quantity').innerText;
        const price = row.querySelector('.price').innerText;
        
        
        
        const total = quantity * price;
        
        //console.log(total)
        //row.querySelector('.total').innerText = total;
        grandTotal += total;
      });*/
      
      rows.forEach(row => {
    	    const checkbox = row.querySelector('.item-check');
    	    if (checkbox && checkbox.checked) {
    	      const quantity = parseFloat(row.querySelector('.quantity').innerText);
    	      const price = parseFloat(row.querySelector('.price').innerText);
    	      const total = quantity * price;
    	      grandTotal += total;
    	    }
    	  });

      
      console.log(grandTotal)
      
      
      
     
      document.getElementById('grandTotal').innerText = grandTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
    
    }

    function removeItem(button) {
      const row = button.closest('tr');
      row.remove();
      updateCart();
    }

    // 초기 계산
    updateCart();
  </script>

</body>
</html>