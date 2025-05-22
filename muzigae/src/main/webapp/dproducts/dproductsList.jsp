<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 상품 목록 화면</title>
	<link rel="stylesheet" href="../css/style.css" />

	<link rel="stylesheet" href="../css/jquery-ui.css">
  	<script src="../js/jquery-3.7.1.js"></script>
  	<script src="../js/jquery-ui.js"></script>
</head>
	
	<script>
	// jquery
	$(function(){
		
		$("#btn_write").click(function(){
			location = "/goodsWrite";
		});
		
		$("#btn_delete").click(function(){
			
			// 체크된 항목들의 value값을 가져옴
			// 반복함수인 each()함수를 사용 -> 배열에 주로 사용됨
			/* let scores = [50,80,70];
			
			let datas = "";
			// $.each(배열변수,function(자리번호,배열값){})
			$.each(scores,function(i,v){
				datas += v+"/"; 
			});*/
			//alert( datas );
	
			let datas = "";
			// "chk"라는 이름의 요소(객체)들 중에 checked 속성을 부여받은 요소들만 ..
			$("input[name='chk']:checked").each(function(){
				// $(this) :: 현 (실행객체)를 의미
				datas += $(this).val()+",";
			});
			
			// datas = "1001,1002,1003,";
			$.ajax({
					data : "datas="+datas,
					type : "post",
					url  : "/goodsDeleteEach",
				    dataType : "text",
				    success : function(data){ 
				    	if( data == "ok" ) {
				    		alert("삭제완료");
				    		location.reload();
				    	} else {
				    		alert("삭제실행");
				    	}
				    },
				    error : function() { }
			});	
		});

		$("#btn_confirm").click(function(){
			
			let len1 = $("input[name='chk']").length;  // 요소 전체 개수
			let len2 = $("input[name='chk']:checked").length; // 체크 상태 개수

			if( len1 != len2 ) {
				alert("전체 선택 해주세요.");
			} else {
				location = "memberWrite";
			}
			
		});
		
		$("#allchk").click(function(){
			//let bb = document.getElementById('allchk').checked;
			// is() 함수 : 상태제공
			let bool = $("#allchk").is(":checked");
			
			//let len = document.getElementsByName('chk').length;
			//for(var i=0; i<len; i++) {
			//	document.getElementsByName('chk')[i].checked = bool;
			//}

			// prop() 함수 : 상태적용
			$("input[name='chk']").prop("checked",bool);
			
		});
		
	});
	</script>

<body>


 <div class="div_title">
    관리자 상품 목록
 </div>
 
 <div style="margin:10px;">
 	<button type="button" onClick="location='write'">등록</button>
 	
 	<button type="button" id="btn_confirm">선택확인</button>
 	<button type="button" id="btn_delete">선택삭제</button>
 	
 </div>
	<table class="table1">
    	<colgroup>
    		<col width="5%"/>
    		<col width="5%"/>
    		<col width="*"/>
    		<col width="10%"/>
    		<col width="7%"/>
    		<col width="12%"/>
    		<col width="15%"/>
    	</colgroup>
    	<tr>
    		<th><input type="checkbox" id="allchk"></th>
    		<th>번호</th>
    		<th>상품제목</th>
    		<th>옵션</th>
    		<th>추천</th>
    		<th>인기</th>
    		<th>이미지</th>
    	</tr>

    	<c:forEach var="result" items="${resultList}"  varStatus="status">
    	<tr>
    		<td><input type="checkbox" id="chk" name="chk" value="${result.GCODE}"></td>
    		<td>${status.count }</td>
	    	<td style="text-align:left;"> 
	   <a href="/goodsDetail/${result.GCODE}">${result.TITLE} </a> 
	   		</td>
	    	<td>${result.OPT}</td>
	    	<td>
	    	   <input type="checkbox" 
	    	    <c:if test="${result.REC=='Y'}">checked</c:if> >
	    	</td>
	    	<td>
	    		<input type="checkbox" 
	    	       <c:if test="${result.POP=='Y'}">checked</c:if> >
	    	</td>
	    	
	    	<c:set var="img1" value="${result.GSIMG1}" />
	    	<c:set var="img2" value="${result.GSIMG2}" />
	    	<% 
	    	String dirPath2 = "C:/Users/hi_guri/git/springProject1/src/main/webapp/upload/goods";
	    	
	    	String file1 = (String)pageContext.getAttribute("img1");
	    	String file2 = (String)pageContext.getAttribute("img2");
	    	
	    	Image  img1 = new ImageIcon(dirPath2+"/"+file1).getImage();
	    	Image  img2 = new ImageIcon(dirPath2+"/"+file2).getImage();
	    	
	    	int img1_h = img1.getHeight(null);
	    	int img1_w = img1.getWidth(null);
	    	int img1_hg = 40;
	    	int img1_wd = (img1_w*40)/img1_h;
	    	
	    	int img2_h = img2.getHeight(null);
	    	int img2_w = img2.getWidth(null);
	    	int img2_hg = 40;
	    	int img2_wd = (img2_w*40)/img2_h;
	    	%>
	    	
	    	<td style="text-align:left;">
	    	
	    		<%
	    		if(img1_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.GSIMG1 }" width="<%=img1_wd %>" height="40">
	    		<%
	    		}
	    		%>
	    		
	    		<%
	    		if(img2_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.GSIMG2 }" width="<%=img2_wd %>" height="40">
	    		<%
	    		}
	    		%>
	    	
	    	</td>
    	</tr>
    	
    	</c:forEach>

    </table>
    
    <div class="div_button_area">
    	
    </div>
    
    <div>
    	<button type="button" id="btn_write">글쓰기</button>
    </div>
    
    
</body>
</html> 






	
    	



