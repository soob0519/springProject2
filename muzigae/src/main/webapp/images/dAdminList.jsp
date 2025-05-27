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
			location = "/dproductsWrite";
		});
		
		$("#btn_delete").click(function(){
			
			let datas = "";
			$("input[name='chk']:checked").each(function(){
				
				datas += $(this).val()+",";
			});
			
			$.ajax({
					data : "datas="+datas,
					type : "post",
					url  : "/dproductsDeleteEach",
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
	
	
	
	
	function fn_delete(rseqid) {
		
		if( confirm("정말 삭제 하시겠습니까?") ) {

			// json 설정
			let sendData = "rseqid="+rseqid;
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
	
	function fn_modal(item,rseqid,pname,color,price) {
		
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
    관리자 상품 목록
 </div>
 
 <div style="margin:10px;"> 	
 	<button type="button" id="btn_delete" class="button1" style="margin-left:90px;">선택삭제</button>
 	
 </div>
	<table class="table1">
    	<colgroup>
    		<col width="5%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="10%"/>
    		<col width="11%"/>
    		<col width="11%"/>
    		<col width="11%"/>
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
    		<td>${result.ITEM}</td>
    		<td><input type="checkbox" id="chk" name="chk" value="${result.RSEQID}"></td>
    		<td>${status.count }</td>
	    	<td style="text-align:left;"> 
	   <a href="/dProductsModify/${result.RSEQID}">${result.PNAME} </a> 
	   		</td>
	    	<td>${result.COLOR}</td>
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
	    		
	    		<%
	    		if(img2_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.FILE2 }" width="<%=img2_wd %>" height="40">
	    		<%
	    		}
	    		%>
	    		
	    		<%
	    		if(img3_h > -1) {
	    		%>
	    		<img src="/upload/goods/${result.FILE3 }" width="<%=img3_wd %>" height="40">
	    		<%
	    		}
	    		%>
	    	
	    	</td>
	    	
	    	<td><a href="#" onClick="fn_modal('${list.ITEM}','${list.RESQID}','${list.PNAME}','${list.COLOR}','${list.PRICE}','${list.FILE1}','${list.FILE2}','${list.FILE3}')">수정</a></td>
	    	<td><a href="#" onClick="fn_delete('${list.RSEQID}')">삭제</a></td>
    	</tr>
    	
    	</c:forEach>

    </table>
    
    <div class="div_button_area">
    	
    </div>
    
    <div>
    	<button type="button" id="btn_write" class="button2">글쓰기</button>
    </div>
    
    
</body>
</html> 






	
    	



