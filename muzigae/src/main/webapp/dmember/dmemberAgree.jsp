<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 등록 화면</title>
		<link rel="stylesheet" href="../css/style.css" />
		<link rel="stylesheet" href="../css/jquery-ui.css">
	  	<script src="../js/jquery-3.7.1.js"></script>
	  	<script src="../js/jquery-ui.js"></script>
	</head>
	
 <script>
	$(function(){
		 $("#btn_submit").click(function(){
			 if( $("input[name='chk']:checked").length == 0 ) {
					alert("약관에 동의해주세요.");
					return false;
			}
			
			let len = $("input[name='chk']:checked").length;  // 요소 전체 개수

			if( len == 1 ) {
				alert("약관 동의");
				location = "dmemberWrite";
			}
		 });
	 });
 </script>

 <body>
 
 <div class="div_title">
	    회원가입 화면
	</div>
		<span style="margin-left:30%;">
			1. 약관동의  >  
		</span>
		<span style="margin-left:30px;color:#e7e7e7;">
			2. 정보입력 
		</span>
		<span style="margin-left:30px;color:#e7e7e7;">
			>  3. 가입완료
		</span>
		<br>
		
<form name="frm" >

	<input type="hidden" id="useridBox" value="N">

<table class="table1">
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	
	
	<tr>
		<td>
			개인정보처리방침 동의(필수)
			<div style="width:98%; height:200px;margin-top:10px;">
				1. 개인정보 수집목적 및 이용목적 <br><br>
				
				가. 서비스 제공에 관한 계약 이행 및 서브시 제공에 따른 요금정산 <br><br>
				
				콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스 <br><br>
				
				나. 회원 관리 <br><br>
				
				회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, <br> 
				연령 확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리, 고지사항 전달 <br>
				
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="chk">
			개인정보수집 및 이용약관에 동의합니다.
		</td>
	</tr>
	</table>

 <div class="div_button_area" style="margin-left:50px;">
    <button type="button" class="button3" style="margin-right:-90px;" >취소</button>
    <button type="submit" id="btn_submit" class="button2" onClick="return false;">다음</button>
 </div>
 
</form>

</body>
</html>