<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 관리 화면</title>
	<link rel="stylesheet" href="../css/style.css" />
	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../js/jquery-3.7.1.js"></script>
  	<script src="../js/jquery-ui.js"></script>
</head>
	
	<script>
	
	function fn_delete(code,ord) {
		
		if( confirm("정말 삭제 하시겠습니까?") ) {

			// json 설정
			let sendData = "code="+code+"&ord="+ord;
			$.ajax({ 
				type : "post",
				data : sendData,
				url  : "/categoryDelete",
				dataType: "text",
				success:function(data) {
					if(data == "1") {
						alert("삭제완료");
						location.reload();
					} else {
						alert("삭제실패");
					}
				},
				error:function() { }
			});
			
		}
	}
	
	function fn_modal(code,ord,name,use) {
		
		// 현재의 이름 (히든, 변경안됨)
		$("#cate_old_name").val(name);
		// 현재의 순번 (히든, 변경안됨)
		$("#cate_old_ord").val(ord);
		// 현재의 코드 (히든, 변경안됨)
		$("#cate_code").val(code);
		
		// 현재의 순번 (일반, 변경가능)
		$("#cate_ord").val(ord);
		// 현재의 이름 (일반, 변경가능)
		$("#cate_name").val(name);
		
		let uu = 0;  // 사용
		if(use == "N") uu = 1;
		
		$("#cate_use option:eq("+uu+")").prop("selected",true);
		$("#div_modal").css('display','block'); //view
	}
	
	$(function(){
		$("#btn_close").click(function(){
			$("#div_modal").css('display','none'); // 숨김
		});
		
		$("#btn_modify").click(function(){
			
			let cate_old_name  = $.trim($("#cate_old_name").val());
			let cate_name  = $.trim($("#cate_name").val());
			let cate_ord   = $.trim($("#cate_ord").val());
			let cate_use   = $.trim($("#cate_use").val());
			
			// 출력된 카테고리이름(들)을 누적한 변수값을 가져옴
			let names = $.trim($("#names").val());
			
			if( cate_name == "" ) {
				alert("카테고리명을 입력해주세요.");
				$("#cate_name").focus();
				return false;
			}
			if( cate_ord == "" ) {
				alert("배치순서를 입력해주세요.");
				$("#cate_ord").focus();
				return false;
			}
			// 동일한 카테고리이름이 있는지 확인
			//  aa,bb,cc,dd,ee->(old)aa/(new)aa::변경하지 않은 경우 중복 검사 안함
			//  aa,bb,cc,dd,ee->(old)aa/(new)bb::변경한 경우 중복 검사 실행
			if( cate_old_name != cate_name ) {
				if( names.indexOf(cate_name+',') > -1 ) {
					alert("동일한 이름이 있습니다.");
					return false;
				}
			}
			
			// 폼전송
			let sendData = $("#frm_modal").serialize();
			$.ajax({ 
				type : "post",
				data : sendData,
				url  : "/categoryUpdate",
				dataType: "text",
				success:function(data) {
					if(data == "1") {
						alert("수정완료");
						location.reload();
					} else {
						alert("수정실패");
					}
				},
				error:function() { }
			});

		});
		
		$("#btn_submit").click(function(){
			let name  = $.trim($("#name").val());
			let ord   = $.trim($("#ord").val());
			let names = $.trim($("#names").val());
			let lastord = $.trim($("#lastord").val());
			let allowOrd = Number(lastord)+1;  
			
			if( name == "" ) {
				alert("카테고리명을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if( names.indexOf(name+',') > -1 ) {
				alert("동일한 이름이 있습니다.");
				return false;
			}
			if( ord > allowOrd ) {   // 예)1 ~ 5 ,, if(7 > (5+1))
				alert( allowOrd + "번을 초과할 수 없습니다." );
				$("#ord").focus();
				return false;
			}

			if( ord == "" ) ord = "1000";

			// json 설정
			let sendData = "name="+name+"&ord="+ord;
			$.ajax({ 
				type : "post",
				data : sendData,
				url  : "/categoryInput",
				dataType: "text",
				success:function(data) {
					if(data == "1") {
						alert("등록완료");
						location.reload();
					} else if(data == "2") {
						alert("이미 등록된 이름입니다.");
					} else {
						alert("저장실패");
					}
				},
				error:function() { }
			});
		});
	});
	</script>

<body>

 <div class="div_title">
    카테고리 관리화면
 </div>
 
 <div style="margin-left:100px;">
 	카테고리명 <input type="text" id="name" name="name"> 
 	&nbsp;&nbsp;
 	배치순서  <input type="text" id="ord" name="ord">
 	<button type="button" id="btn_submit">등록</button>
 	<br>
 	Total : ${total}
 </div>
	<table class="table1">
    	<colgroup>
    		<col width="10%"/>
    		<col width="*"/>
    		<col width="15%"/>
    		<col width="15%"/>
    		<col width="15%"/>
    	</colgroup>
    	<tr>
    		<th>순번</th>
    		<th>이름</th>
    		<th>사용</th>
    		<th>수정</th>
    		<th>삭제</th>
    	</tr>

		<c:set var="names" value="" />
		<c:set var="lastord" value="" />

    	<c:forEach var="list" items="${resultList }" >
    	<tr>
    		<td>${list.ORD}</td>
	    	<td style="text-align:left;"> ${list.NAME}</td>
	    	<td>${list.USE}</td>
	    	<td><a href="#" onClick="fn_modal('${list.CODE}','${list.ORD}','${list.NAME}','${list.USE}')">mod</a></td>
	    	<td><a href="#" onClick="fn_delete('${list.CODE}','${list.ORD}')">del</a></td>
    	</tr>
    	<c:set var="names" value="${names}${list.NAME}," />
    	<c:set var="lastord" value="${list.ORD}" />
    	</c:forEach>

    </table>

    <div class="div_button_area">
		<input type="hidden" id="names" value="${names }">
		<input type="hidden" id="lastord" value="${lastord }">
    </div>
    
  	<!-- Modal START -->
  	<form id="frm_modal">
  	
  	<input type="hidden" id="cate_code" name="cate_code">
  	<input type="hidden" id="cate_old_ord" name="cate_old_ord">
  	<input type="hidden" id="cate_old_name" name="cate_old_name">
    
    <div id="div_modal" style="position:relative;
				    		    left:30%;
				    		    top:-170px;
				    			background-color:skyblue;
				    			width:300px;
				    			padding:10px;
				    			display:none;">
    	<table>
    		<tr>
    			<th>카테고리명</th>
    			<td><input type="text" id="cate_name" name="cate_name"> </td>
    		</tr>
    		<tr>
    			<th>배치순서</th>
    			<td><input type="text" id="cate_ord" name="cate_ord"> </td>
    		</tr>
    		<tr>
    			<th>사용여부</th>
    			<td><select id="cate_use" name="cate_use">
		    			<option value="Y">사용</option>
		    		    <option value="N">미사용</option>
		    	    </select> 
		   		</td>
    		</tr>
    	 </table>
    	 <div style="width:300px; text-align:center;">
    	 	<button type="button" id="btn_modify">수정</button>
    	 	<button type="reset">취소</button>
    	 	<button type="button" id="btn_close">닫기</button>
    	 </div>
    </div>
    </form>
    <!-- Modal END -->
    
</body>
</html> 


