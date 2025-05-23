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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<%@include file="/include/header.jsp" %>


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
					<input type="hidden" id="bseqid" name="bseqid" value="${dbuyDto.bseqid}">
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
							<td class="button_td"><button type="button" id="btn_addr">배송지변경</button></td>
						</tr>
						<tr>
							<td colspan="2" class="title_td" id="bfAddr">${dcustomerDto.addr }</td>
						</tr>
						<!-- 주소 변경 입력 영역 (처음엔 숨김) -->
						<tr id="inputAddr" style="display: none;">
						    <td colspan="2" class="title_td">
						        <input type="text" id="addr" style="width: 400px;" placeholder="주소 검색 버튼을 눌러주세요." readonly />
						        <button type="button" onClick="sample6_execDaumPostcode()">주소검색</button>
						        <button type="button" onClick="updateAddr()">적용</button>
						    </td>
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
<script>
	
	$(function() {
	    $("#btn_addr").click(function() {
	        $("#inputAddr").toggle(); // 주소 입력창 토글
	    });
	});
	
	function updateAddr() {
	    let newAddr = $("#addr").val();
	    let bseqid = $("#bseqid").val();
	    if (!newAddr) {
	        alert("주소를 먼저 검색해주세요.");
	        return;
	    }
		
	    $.ajax({
			data : "bseqid="+bseqid+"&newAddr="+newAddr,
			type : "post",
			url  : "/updateAddr",
			dataType : "text",
			success  : function(data){
				if(data == "ok") {
					alert("배송지변경완료");
					$("#bfAddr").text(newAddr);
				    $("#inputAddr").hide();
				} else {
					alert("배송지변경실패");
				}
			},
			error	 : function(){}
		});	    
	}
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    //document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode;
                //document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
                
                document.getElementById('addr').value = data.zonecode + ' ' + addr;
                
            }
        }).open();
    }
</script>
</html>
