<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	<!-- JSTL 연결 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="ko">
	<head>
		<title>HOME</title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="../css/style.css">
		
		<link rel="stylesheet" href="/css/jquery-ui.css">
  		<link rel="stylesheet" href="/resources/demos/style.css">
		<script src="https://kit.fontawesome.com/a7926a1c4d.js" crossorigin="anonymous"></script>
  		<script src="../js/jquery-3.7.1.js"></script>
  		<script src="../js/jquery-ui.js"></script>
  		
		<script src="../js/script.js"></script>
		
		<style>
			#header {background: none; border: none;}
			.main_visual {width: 100%; height: 100vh;}
		</style>
		
	</head>
	<body>
	
		<!-- header -->
		<%@ include file="../include/header.jsp" %>
		
		<div class="main_visual">
			<img src="../images/main.png">
		</div>
		
		<footer id="footer">

		</footer>
	</body>
</html>