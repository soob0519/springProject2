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
  	<script src="../js/jquery-3.7.1.js"></script>
 </head>
 
	<style>
	
	</style>

	<script>
 	$( function() {
 		
 		$("#btn_list").click( function(){
 			location = "/dAdminList";
 		});
 		
   		$("#btn_submit").click( function(){

			let item = $("#item").val();
			let pname = $.trim( $("#pname").val() );
			let price = $.trim( $("#price").val() );
			
			$("#pname").val(pname);
			$("#price").val(price);

			
   			if( $("#seqid").val() == "" ) {
				alert("제품코드를 입력하세요.");
				$("#seqid").focus();
				return false;
   			}
   			
			if( pname == "" ) {
				alert("제품이름을 입력해주세요.");
				$("#pname").focus();
				return false;
			}
			
   			if( $("#color").val() == "" ) {
				alert("색상이름을 입력하세요.");
				$("#color").focus();
				return false;
   			}
   			
			if( price == "" ) {
				alert("가격을 입력해주세요.");
				$("#price").focus();
				return false;
			}
			
			let form = new FormData(document.getElementById("frm"));
			$.ajax({
				type:"post",		// 전송 타입
				url:"/dproductsInput",// 전송 장소
				data:form,   		// 전송 데이터

				processData: false, // 전송데이터의 인식을 위한 세팅
				contentType: false, // 전송데이터의 인식을 위한 세팅
				
   				dataType:"text", 	     
   				success:function(data) { 
					if( data == "ok" ) { 
						alert("저장완료!");
						location="/dAdminList";
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
 
	<%@include file="/include/header.jsp" %>
	
	<section>

	<div class="div_title">
	    상품정보 등록 화면
	</div>
	 
	<form id="frm" name="frm">

	<table class="table1">
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		
		<tr>
		<td style="background-color: #e7e7e7;"><label for="item">제품종류</label></td>
		<td><select id="item" name="item" style="margin-left:10px;">
				<option value="">-----</option>
	
		<c:forEach var="list" items="${resultList }">
			<option value="${list.NAME }">${list.NAME }</option>
		</c:forEach>
		
			</select>
		</td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="pname">제품이름</label></td>
			<td><input type="text" id="pname" name="pname" class="input1"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="color">색상이름</label></td>
			<td><input type="text" id="color" name="color" class="input1"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="price">가격</label></td>
			<td><input type="text" id="price" name="price" class="input1"></td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;"><label for="file1">사진</label></td>
			<td style="text-align:left;">
			&nbsp;
			<input type="file" id="file1" name="filea1"> <br>
			&nbsp;
			<input type="file" name="fileb1"> <br>
			&nbsp;
			<input type="file" name="filec1">
			</td>
		</tr>
		
	</table>
	
	 <div class="div_button_area" style="margin-left:100px;">
	    <button type="reset" class="button1">취소</button>
	    <button type="button" id="btn_submit" class="button3" >저장</button>
	    <button type="button" id="btn_list" class="button2">목록</button>
	 </div>
	 
	</form>		
 </section>
 
 	<%@include file="/include/footer.jsp" %>
 
 </body>
 
 
</html>