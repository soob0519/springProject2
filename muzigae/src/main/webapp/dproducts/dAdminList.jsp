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
</head>
	
	<script>
	$( function() {
		$("#btn_write").click(function(){
			location = "/dproductsWrite";
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
		
		$("#btn_delete").click(function(){
	         
	         let datas = "";
	         
	         $("input[name='chk']:checked").each(function(){
	            datas += $(this).val()+",";
	         });
	         
	         alert(datas);
	         
	         $.ajax({
	            data : "datas="+datas,
	            type : "post",
	            url  : "/dproductsDeleteEach",
	            dataType : "text",
	            success  : function(data){
	               if(data == "ok") {
	                  alert("삭제완료");
	                  location.reload();
	               } else {
	                  alert("삭제실패");
	               }
	            },
	            error    : function(){}
	         });
	         
	      });
		
	});	
	</script>

<body>

	<%@include file="/include/header.jsp" %>
	
	<section>

 <div class="div_title">
    관리자 상품 목록
 </div>
 
 <div style="margin:10px;"> 	
 	<button type="button" id="btn_delete" class="button1" style="margin-left:90px;">선택삭제</button>
 	
 </div>
	<table class="table1">
    	<colgroup>
    		<col width="*%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    		<col width="8%"/>
    	</colgroup>
    	<tr>
    		<th><input type="checkbox" id="allchk"></th>
    		<th>물품종류</th>
    		<th>제품코드</th>
    		<th>제품이름</th>
    		<th>색상이름</th>
    		<th>가격</th>
    		<th>출시일</th>
    		<th>제품이미지1</th>
    		<th>제품이미지2</th>
    		<th>제품이미지3</th>
    	</tr>

    	<c:forEach var="result" items="${resultList}"  varStatus="status">
    	<tr>
    		<td><input type="checkbox" name="chk" value="${result.RSEQID}"></td>
    		<td>${result.ITEM}</td>
    		<td>${result.RSEQID}</td>
    		<td style="text-align:left;"> 
	  			<a href="/dProductsModify/${result.RSEQID}">${result.PNAME} </a> 
	   		</td>
	    	<td>${result.COLOR}</td>
	    	<td>${result.PRICE}</td>
	    	<td>${result.RDATE}</td>
	    	
	    	<c:set var="img1" value="${result.FILE1}" />
	    	<c:set var="img2" value="${result.FILE2}" />
	    	<c:set var="img3" value="${result.FILE3}" />
	    	<% 
	    	String dirPath2 = "C:/Users/hi_guri/git/springProject1/src/main/webapp/upload/goods";
	    	
	    	String file1 = (String)pageContext.getAttribute("img1");
	    	String file2 = (String)pageContext.getAttribute("img2");
	    	String file3 = (String)pageContext.getAttribute("img3");
	    	
	    	Image  img1 = new ImageIcon(dirPath2+"/"+file1).getImage();
	    	Image  img2 = new ImageIcon(dirPath2+"/"+file2).getImage();
	    	Image  img3 = new ImageIcon(dirPath2+"/"+file3).getImage();
	    	
	    	int img1_h = img1.getHeight(null);
	    	int img1_w = img1.getWidth(null);
	    	int img1_hg = 40;
	    	int img1_wd = (img1_w*40)/img1_h;
	    	
	    	int img2_h = img2.getHeight(null);
	    	int img2_w = img2.getWidth(null);
	    	int img2_hg = 40;
	    	int img2_wd = (img2_w*40)/img2_h;
	    	
	    	int img3_h = img3.getHeight(null);
	    	int img3_w = img3.getWidth(null);
	    	int img3_hg = 40;
	    	int img3_wd = (img3_w*40)/img3_h;
	    	%>
	    	
	    	<td style="text-align:left;">
	    	
	    		<%
	    		if(img1_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.FILE1 }" width="<%=img1_wd %>" height="40">
	    		<%
	    		}
	    		%>
	    	</td>
	    	<td style="text-align:left;">
	    		<%
	    		if(img2_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.FILE2 }" width="<%=img2_wd %>" height="40">
	    		<%
	    		}
	    		%>
	    	</td>
	    	<td style="text-align:left;">	
	    		<%
	    		if(img3_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.FILE3 }" width="<%=img3_wd %>" height="40">
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
    	<button type="button" id="btn_write" class="button2">글쓰기</button>
    </div>
   
	</section>
    
	<%@include file="/include/footer.jsp" %>
	
</body>

</html> 






	
    	



