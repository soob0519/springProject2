<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.5, minimum-scale=1.0, user-scalable=yes" />
	<title>구매내역목록</title>
	<link rel="stylesheet" href="css/style.css">
	<script src="/js/jquery-1.10.2.min.js"></script>
	<script src="/js/script.js"></script>
</head>

<script>
	
</script>

<style>
	.prod_new_items {width: 100%;}
	.prod_new_items li {width: 100%; border-top: 1px solid #333; border-bottom: 1px solid #333; margin-bottom: 20px;}
	.list {gap: 50px; height: 30px; line-height: 30px; border-bottom: 1px solid #d1d1d1;}
	.list p {width: 80px;}
	.list2 {gap: 600px; height: 70px; line-height: 70px;}
	.list2 .prod_image {width: 50px; height: 50px; transform: translateY(-50%); position: relative; top: 50%;}
</style>
<body>
<%@include file="/include/header.jsp" %>

		<article class="contents wrap">
			<section>
				<h2 class="prod_h2">구매내역</h2>
				<div>
					<ul class="pord_category flex_center">
						<li><a href="/fullList">전체내역</a></li>
						<li><a href="/buyList">구매내역</a></li>
						<li><a href="/cancelList">취소내역</a></li>
					</ul>
				</div>
			</section>

			<section class="prod_new1 wrap">
				<h3 class="prod_h3">구매내역</h3>
				<c:forEach var="buy" items="${buyList}">
					<a href="/pcDetail/${buy.BSEQID}">
					<ul class="prod_new_items">
						<li>
							<div class="list flex_start">
								<p>
									<c:if test="${buy.STATE == 1}">결제 완료</c:if>
									<c:if test="${buy.STATE == 2}">구매</c:if>
								</p>
								<span>주문번호 ${buy.BSEQID}</span>
							</div>
							<div class="list2 flex_start">
								<img class="prod_image" src="/images/nyang.jpg">
								<span>구매날짜 ${buy.PDATE}</span>
								<span>총가격 ${buy.PRICE}</span>
							</div>
						</li>
					</ul>
					</a>
					<div>
					<br>
					<br>
					</div>
				</c:forEach>
			</section>

		</article>

		<footer id="footer">

		</footer>
</body>
</html>
