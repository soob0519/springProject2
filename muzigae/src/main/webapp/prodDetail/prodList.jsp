<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	<!-- JSTL 연결 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
	<head>
		<title>제품 상세</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../css/style.css">
		
		<link rel="stylesheet" href="/css/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://kit.fontawesome.com/a7926a1c4d.js" crossorigin="anonymous"></script>
		<script src="../js/jquery-1.10.2.min.js"></script>
  		<script src="../js/jquery-3.7.1.js"></script>
  		<script src="../js/jquery-ui.js"></script>
  		
		<script src="../js/script.js"></script>
		
		<script>
			
		</script>
	</head>
	<body>
	
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		
		
		<!-- 페이지 이동시 갱신되는 방식 -->
		<div class="page_path wrap">
			<ul class="flex_end">
				<li>
					<a href="#none">home</a>
				</li>
				<li>
					<a href="/prodList">shop</a>
				</li>
				<li>
					<a href="/prodList">face</a>
				</li>
			</ul>
			<span class="blind">현재페이지</span>
		</div>


		
		
		
		<article class="contents wrap">
			<section>
				<h2 class="prod_h2">FACE</h2>
				<div>
					<ul class="prod_category flex_center">
						<li><a href="#none">LIP</a></li>
						<li><a href="#none">EYE</a></li>
						<li><a href="#none">FACE</a></li>
					</ul>
				</div>
			</section>
		</article>


		<article class="contents_items wrap">
			<section class="prod_new">
				<h3 class="prod_h3">신상품</h3>
				<ul class="prod_new_items flex_start">
					<!-- 신상품 : 업로드(RDATE) 기준 일정 기간동안 떠 있게... -->
					<c:forEach var="li_new" items="${resultList }">
					<li>
						<a href="/prodDetail/${li_new.RSEQID }" class="prod_new_item1">
							<img src="../images/prod_thumbnail/${li_new.FILE1 }">
							<div class="flex_between">
								<span class="prod_name">${li_new.PNAME }</span>
								<span class="prod_price">${li_new.PRICE }</span>
							</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</section>

			<section class="prod_total">
				<h3 class="prod_h3">전체상품</h3>
				<ul class="prod_total_items flex_start">
					<!-- 전체상품 : 모든 상품 리스트.. -->
					<c:forEach var="li_tot" items="${resultList }">
					<li>
						<a href="/prodDetail/${li_tot.RSEQID }" class="prod_total_item1">
							<img src="../images/prod_thumbnail/${li_tot.FILE1 }">
							<div class="flex_between">
								<span class="prod_name">${li_tot.PNAME }</span>
								<span class="prod_price">${li_tot.PRICE }</span>
							</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</section>

		</article>

		<footer id="footer">

		</footer>
	</body>
</html>