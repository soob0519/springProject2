<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	<!-- JSTL 연결 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
	<head>
		<title>EYE</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../css/style.css">
		
		<link rel="stylesheet" href="/css/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://kit.fontawesome.com/a7926a1c4d.js" crossorigin="anonymous"></script>
  		<script src="../js/jquery-3.7.1.js"></script>
  		<script src="../js/jquery-ui.js"></script>
  		
		<script src="../js/script.js"></script>
	</head>
	<body>
	
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		
		
		<!-- 페이지 이동시 갱신되는 방식 -->
		<div class="page_path wrap">
			<ul class="flex_end">
				<li>
					<a href="/home_page">home</a>
				</li>
				<li>
					<a href="/prodTotalList">shop</a>
				</li>
				<li>
					<strong><a href="/prodEyeList">eye</a></strong>
				</li>
			</ul>
		</div>


		
		
		
		<article class="contents wrap">
			<section>
				<h2 class="prod_h2"><a href="/prodTotalList">SHOP</a></h2>
				<div>
					<ul class="prod_category flex_center">
						<li><a href="/prodLipList">LIP</a></li>
						<li><strong><a href="prodEyeList">EYE</a></strong></li>
						<li><a href="/prodFaceList">FACE</a></li>
					</ul>
				</div>
			</section>
		</article>


		<article class="contents_items wrap">

			<section class="prod_total">
				<h3 class="prod_h3">전체상품</h3>
				<ul class="prod_total_items flex_start">
					<!-- 전체상품 : 모든 상품 리스트.. -->
					<c:forEach var="eye" items="${eyeList }">
					<li>
						<a href="/prodDetail/${eye.RSEQID }" class="prod_total_item1">
							<img src="../images/prod_thumbnail/${eye.FILE1 }">
							<div class="flex_between">
								<span class="prod_name">${eye.PNAME }</span>
								<span class="prod_price">${eye.PRICE }</span>
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