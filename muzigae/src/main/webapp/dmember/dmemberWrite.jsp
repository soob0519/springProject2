<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원가입</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../js/jquery-3.7.1.js"></script>
  	<script src="../js/jquery-ui.js"></script>
 </head>
 
	<script>
		
	$( function() {
		$("#text_userid").html("<font color='red'>아이디를 입력해주세요.</font>");
		
	    $("#user_id").keyup(function(){
			let id = $.trim($("#user_id").val());
			let len = id.length;
			let msg = "";
			
			$("#useridBox").val("N");
			
			if(len > 16) { // 16
				 id = id.substring(0,16);
				 $("#user_id").val(id);
				 len = 16;
			}
			
			if( len <= 4 || len >= 16 ) {
				msg = "아이디는 영문소문자 또는 숫자 4~16자 사이로 입력해주세요.";
			} else {
				// 중복체크 - ajax로 세팅
				let sendData = "user_id="+id;
				let sendUrl  = "/useridCheck";
				
				
				let data = fn_ajax(sendUrl,sendData);
				
				if(data == "1") {
					msg = "<font color='blue'>사용 가능한 아이디입니다.</font>";
					$("#useridBox").val("Y");
				} else if(data == "2") {
					msg = "<font color='#cccccc'>형식에 맞지 않습니다.</font>";
				} else if(data == "3") {
					msg = "<font color='pink'>이미 사용중인 아이디 입니다.</font>";
				}
				
				$("#text_userid").html(msg);		
			}
			$("#text_userid").html(msg);
	    });
	    
	    $("#pass").keyup(function(){
			let pass = $.trim($("#pass").val());
			let pass1 = $.trim($("#pass1").val());
			let msg = "";
			if( pass != pass1 ) msg = "<font color='red'>비밀번호가 일치하지 않습니다.</font>";
			else msg = "";
			
			$("#text_pass").html(msg);
	    });

	    $("#btn_submit").click(function(){
	    	/**
	    	 * 입력 데이터 값 가져오기 / 앞뒤 공백 제거 설정
	    	 */
	    	let userid = $.trim($("#user_id").val());
	    	let pass   = $.trim($("#pass").val());

	    	let name   = $.trim($("#name").val());
	    	let phone  = $.trim($("#mobile").val());
	    	let mail  = $.trim($("#birth").val());
	    		
			if( mail == "" ) {
				alert("이메일을 입력해주세요.");
				$("#mail").focus();
			}	
	    	
	    	let sendData = $("#frm").serialize();
	    	let sendUrl = "/memberInsert";

	    	let result = fn_ajax(sendUrl,sendData);
	    	if( result == "1" ) {
	    		alert("저장완료!!");
	    		location = "/dloginWrite";
	    	} else if( result == "2" ) {
	    		alert("이미 사용중인 아이디입니다.");
	    	} else if( result == "3" ) {
	    		alert("저장실패!!");
	    	} else {
	    		alert("오류!! \n관리자에게 연락바랍니다. (02-7777-5555)");
	    	}
	    	
	    	
	    	let form = new FormData(document.getElementById("dmemberFrm"));
	    	
	    	$.ajax({
    			type : "post",
    			url  : "/dmemberInsert",
    			data : form,
    			dataType : "text",
    			async : false,    // 비동기 방식을 동기로 바꿈
    			success  : function(data){
    				msg = data;
    			},
    			error    : function(){ msg = "4"; }
    		});
	    	
	    	let form = new FormData(document.getElementById("goodsFrm"));
			//let form = $("#goodsFrm").serialize();
			$.ajax({
				type : "post",
				url  : "/goodsInput",
				data : form,
				
				processData: false, // 전송데이터의 인식을 위한 세팅
				contentType: false, // 전송데이터의 인식을 위한 세팅
				
				dataType : "text",
				success  : function(data){
					if(data == "ok") {
						alert("저장완료");
						location = "/goodsAdminList";
					} else {
						alert("저장실패");
					}
				},
				error    : function(){
					alert("오류발생!!");
				}
			});
	    });
	} );
	</script>

 <body>
 
 	<header>
	</header>
	
	<nav>
	</nav>
	
	<section>

	<div class="div_title" style="margin-left:100px;">
	    회원가입 화면
	</div>
		<span style="margin-left:400px;color:#e7e7e7;">
			1. 약관동의  >  
		</span>
		<span style="margin-left:30px;">
			2. 정보입력 
		</span>
		<span style="margin-left:30px;color:#e7e7e7;">
			>  3. 가입완료
		</span>
		<br>
		
		<span style="margin-left:100px;">
			기본정보
		</span>
		
		<span style="font-size:12px;margin-left:760px;">
			*필수입력사항
		</span>
	</div>
	 
	<form name="dmemberFrm" >
	
	<input type="hidden" id="useridBox" value="N">
	
	<table class="table1">
		<colgroup>
			<col width="15%" />
			<col width="*" />
		</colgroup>
		
		
		<tr>
			<td style="background-color: #e7e7e7;">아이디*</td>
			<td>
				<input type="text" id="user_id" name="user_id" class="input1">
				<span style="font-size:12px; margin-left:10px;"> 영문소문자/숫자(4~16자)</span> <br>
				 &nbsp;&nbsp; <span id="text_userid"></span>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;">비밀번호*</td>
			<td>
				<input type="password" id="pass" name="pass" class="input1">
				<span style="font-size:12px; margin-left:10px;"> 영문 대소문자/숫자특수문자 중 2가지 이상 조합, 10~16자</span>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;">비밀번호 확인*</td>
			<td>
				<input type="password" id="pass1" name="pass1" class="input1"> <br>
				 &nbsp;&nbsp; <span id="text_pass"></span>
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;">휴대전화*</td>
			<td>
				<select id="mobile1" name="mobile1" class="input3" >
					<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="017" >017</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
				- <input type="text" id="mobile2" name="mobile2" class="input3">
				- <input type="text" id="mobile3" name="mobile3" class="input3">
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;">이름*</td>
			<td>
				<input type="text" id="name" name="name" class="input1">
			</td>
		</tr>
		
		<tr>
			<td style="background-color: #e7e7e7;">주소*</td>
			<td>
				<input type="text" id="addr" name="addr" class="input2" value="" placeholder="우편번호"> 
				<button type="button" class="button1" onclick="sample6_execDaumPostcode()">주소검색</button> <br>
			</td>
		</tr>
	
		<tr>
			<td style="background-color: #e7e7e7;">이메일*</td>
			<td>
				<input type="text" id="mail" name="mail" class="input1">
			</td>
		</tr>
		
				
	
		
	</table>
	
	 <div class="div_button_area">
	 
	 	<input type="hidden" id="hcode" value="1">
	 	
	 	<button type="submit" class="button2" onclick="fn_submit()">회원가입</button>
	 </div>
	 
	</form>		
	
	<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
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

 </section>
 
 <footer>
 </footer>
 
 </body>
</html>