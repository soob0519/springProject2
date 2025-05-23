<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 화면</title>
	<link rel="stylesheet" href="../css/style.css" />
  	<script src="../js/jquery-3.7.1.js"></script>

  	<script>
 	$( function() {

   		$("#btn_submit").click( function(){
   			
   			if ( $("#user_id").val() == "" ) {
				alert("아이디를 입력하세요.");
   				$("#user_id").focus();
   				return false;
   			}
   			if ( $("#pass").val() == "" ) {
				alert("암호를 입력하세요.");
   				$("#pass").focus();
   				return false;
   			}
   			
   			let form = $("#frm").serialize();  // serialize() : 폼을 인식하는 함수
   			$.ajax({
				type:"post",		// 전송 타입
				url:"/loginConfirm2",// 전송 장소
				data:form,   		// 전송 데이터
				datatype:"text", 	// 받는 데이터 타입
   				success:function(data) {  
					if( data == "1" ) {   
						alert($("#user_id").val() + "님 로그인 성공!");
						location="/dproductsList";
					} else {
						alert("잘못된 정보를 입력했습니다.!");
					} 
   				},
   				error:function(){	
					alert("로그인 실패!");
   				}
   			});
   		});
  	});
  	</script>
</head>

<script>

</script>

<body>

 <div class="div_title">
    로그인
 </div>
 
<form name="frm" >

	<table class="table2">
		<colgroup>
			<col width="20%" />
			<col width="*" />
		</colgroup>
		
		<tr>
			<td><input type="text" id="user_id" name="user_id" class="input4" placeholder="아이디"></td>
		</tr>
		<tr>
			<td><input type="password" id="pass" name="pass" class="input4" placeholder="Password"></td>
		</tr>
	
	</table>

	<div class="div_button_area">
	   <button type="submit" id="btn_submit" class="btn_submit" onclick="return false;">로그인</button>
	</div>

	<div class="div1">
		<a href="https://muzigae-mansion.com/member/id/find_id.html">아이디 찾기</a>
		 | 
		<a href="https://muzigae-mansion.com/member/passwd/find_passwd_info.html">비밀번호 찾기</a>
		&nbsp;&nbsp;
		<div class="div2">	
			<a href="dmemberWrite.jsp" >회원가입</a>
		</div>
	</div>	
	
</form>

</body>
</html>