<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>상품정보 등록화면</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../js/jquery-3.7.1.js"></script>
  	<script src="../js/jquery-ui.js"></script>
 </head>
 
	<style>
	
	</style>

	<script>
 	$( function() {
 		
 		$("#btn_list").click( function(){
 			location = "/dproductList";
 		});
 		
   		$("#btn_submit").click( function(){
   			
   			if( $("#item").val() == "" ) {
				alert("제품 종류을 입력하세요.");
				$("#item").focus();
				return false;
   			}
   			
   			if( $("#seqid").val() == "" ) {
				alert("제품코드를 입력하세요.");
				$("#seqid").focus();
				return false;
   			}
   			
   			if( $("#pname").val() == "" ) {
				alert("제품이름을 입력하세요.");
				$("#pname").focus();
				return false;
   			}
   			
   			if( $("#color").val() == "" ) {
				alert("색상이름을 입력하세요.");
				$("#color").focus();
				return false;
   			}
   			
   			if( $("#price").val() == "" ) {
				alert("가격을 입력하세요.");
				$("#price").focus();
				return false;
   			}
   			<!-- ajax() : {비동기}전송 -->
   			let form = $("#frm").serialize();  // serialize() : 폼을 인식하는 함수
			$.ajax({
				type:"post",		// 전송 타입
				url:"/dproductsList",// 전송 장소
				data:form,   		// 전송 데이터

   				datatype:"text", 	      // 받는 데이터 타입
   				// success : 전송에 성공한 경우
   				// let data = "ok";
   				success:function(data) {  // data변수 : 실제 받은 데이터 값
					if( data == "ok" ) {  // data변수 값이 "ok" 라면 저장 성공으로 판단함
						alert("저장완료!");
						location="/dproductsList";
					} else {
						alert("저장실패!");
					}
   				},
   				// error : 전송에 실패한 경우
   				error:function(){	
					alert("전송실패!");
   				}
   			});
   		});
  	});
  	</script>

 <body>
 
 	<header>
	</header>
	
	<nav>
	</nav>
	
	<section>

	<div class="div_title">
	    상품정보 등록 화면
	</div>
	 
	<form name="frm">

	<table class="table1">
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		<tr>
			<td style="background-color: #e7e7e7;"><label for="item">물품 종류</label></td>
			<td><input type="text" id="item" name="item" class="input1" value="${dto.item }"></td>
		</tr>
		<tr>
			<td style="background-color: #e7e7e7;"><label for="seqid">제품코드</label></td>
			<td><input type="text" id="seqid" name="seqid" class="input1" value="${dto.seqid }"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="pname">제품이름</label></td>
			<td><input type="text" id="pname" name="pname" class="input1" value="${dto.pname }"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="color">색상이름</label></td>
			<td><input type="text" id="color" name="color" class="input1" value="${dto.color }"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="price">가격</label></td>
			<td><input type="text" id="price" name="price" class="input1" value="${dto.price }"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="rdate">출시일</label></td>
			<td><input type="text" id="rdate" name="rdate" class="input1" value="${dto.rdate }"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="quan">재고량</label></td>
			<td><input type="text" id="quan" name="quan" class="input1" value="${dto.quan }"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="file">사진</label></td>
			<td style="text-align:left;">
			&nbsp;
			<input type="file" id="file1" name="file1" value="${dto.file1 }"> <br>
			&nbsp;
			<input type="file" id="file2" name="file2" value="${dto.file2 }"> <br>
			&nbsp;
			<input type="file" id="file3" name="file3" value="${dto.file3 }">
			</td>
		</tr>
		
	</table>
	
	 <div class="div_button_area">
	    <button type="submit" id="btn_submit" onClick="return false;">저장</button>
	    <button type="reset">취소</button>
	    <button type="button" id="btn_list">목록</button>
	 </div>
	 
	</form>		
 </section>
 
 <footer>
 </footer>
 
 </body>
</html>